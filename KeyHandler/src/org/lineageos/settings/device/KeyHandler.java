/*
 * Copyright (C) 2023 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.device;

import android.content.Context;
import android.media.AudioManager;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.os.SystemClock;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.KeyEvent;
import android.util.Log;

import com.android.internal.os.DeviceKeyHandler;

public class KeyHandler implements DeviceKeyHandler {
    private static final String TAG = KeyHandler.class.getSimpleName();

    private static final int KEY_GAMESWITCH_ON = 250;
    private static final int KEY_GAMESWITCH_OFF = 251;
    private static final int SWITCH_WAKELOCK_DURATION = 3000;

    private final Context mContext;
    private final AudioManager mAudioManager;
    private final PowerManager mPowerManager;
    private final WakeLock mSwitchWakeLock;
    private final Vibrator mVibrator;

    public KeyHandler(Context context) {
        mContext = context;

        mAudioManager = mContext.getSystemService(AudioManager.class);
        mPowerManager = (PowerManager) mContext.getSystemService(Context.POWER_SERVICE);
        mSwitchWakeLock = mPowerManager.newWakeLock(
                PowerManager.PARTIAL_WAKE_LOCK, "SwitchWakeLock");
        mVibrator = mContext.getSystemService(Vibrator.class);
    }

    public KeyEvent handleKeyEvent(KeyEvent event) {
        int scanCode = event.getScanCode();

        switch(scanCode) {
            case KEY_GAMESWITCH_ON:
                Log.e(TAG, "KEY_GAMESWITCH_ON");
                mAudioManager.setRingerModeInternal(AudioManager.RINGER_MODE_SILENT);
                //wakeup display on silent mode
                mSwitchWakeLock.acquire(SWITCH_WAKELOCK_DURATION);
                mPowerManager.wakeUp(SystemClock.uptimeMillis(), "switch-wakeup");
                break;
            case KEY_GAMESWITCH_OFF:
                Log.e(TAG, "KEY_GAMESWITCH_OFF");
                mAudioManager.setRingerModeInternal(AudioManager.RINGER_MODE_NORMAL);
                break;
            default:
                return event;
        }

        doHapticFeedback();

        return null;
    }

    private void doHapticFeedback() {
        if (mVibrator != null && mVibrator.hasVibrator()) {
            mVibrator.vibrate(VibrationEffect.createOneShot(50,
                    VibrationEffect.DEFAULT_AMPLITUDE));
        }
    }
}
 
