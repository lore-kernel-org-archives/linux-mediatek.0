From: CK Hu <ck.hu@mediatek.com>
Subject: Re: Aw: [PATCH v2] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
Date: Thu, 21 Mar 2019 09:36:13 +0800
Message-ID: <1553132173.18216.16.camel@mtksdaap41>
References: <20190320071825.20268-1-hsinyi@chromium.org>
         <trinity-60833541-df5b-44b8-82c7-1ed844f9ab51-1553104864025@3c-app-gmx-bs13>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <trinity-60833541-df5b-44b8-82c7-1ed844f9ab51-1553104864025@3c-app-gmx-bs13>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
List-Id: linux-mediatek@lists.infradead.org

Hi, Frank:

On Wed, 2019-03-20 at 19:01 +0100, Frank Wunderlich wrote:
> Hi,
> 
> i hoped this fixes my warning (maybe have similar cause) on bananapi-r2/mt7623

This patch fix the problem of dsi driver. Your case is hdmi output which
does not go through dsi hardware. So your problem is another cause.

Regards,
CK

> 
> [    6.872034] WARNING: CPU: 2 PID: 160 at drivers/gpu/drm/drm_atomic_helper.c:1
> 430 drm_atomic_helper_wait_for_vblanks.part.1+0x2a4/0x2a8
> [    6.872038] [CRTC:36:crtc-0] vblank wait timed out
> 
> ...
> 
> [    6.872127] [<c0126e4c>] (__warn) from [<c0126fac>] (warn_slowpath_fmt+0x58/0
> x74)
> [    6.872136]  r9:00000000 r8:00000001 r7:00000000 r6:00000001 r5:c0d7da9c r4:c
> 1008c48
> [    6.872145] [<c0126f58>] (warn_slowpath_fmt) from [<c05ce65c>] (drm_atomic_helper_wait_for_vblanks.part.1+0x2a4/0x2a8)
> [    6.872150]  r3:00000024 r2:c0d7da9c
> [    6.872154]  r5:00000000 r4:d991f440
> [    6.872164] [<c05ce3b8>] (drm_atomic_helper_wait_for_vblanks.part.1) from [<c05ce684>] (drm_atomic_helper_wait_for_vblanks+0x24/0x28)
> [    6.872172]  r10:dae68f28 r9:dae68f38 r8:00000000 r7:d9f759c0 r6:d991ec00 r5:d9f759c0
> [    6.872175]  r4:00000005
> [    6.872185] [<c05ce660>] (drm_atomic_helper_wait_for_vblanks) from [<c060af04>] (mtk_atomic_complete+0x98/0xc0)
> [    6.872194] [<c060ae6c>] (mtk_atomic_complete) from [<c060aff4>] (mtk_atomic_commit+0xc8/0xcc)
> [    6.872201]  r7:d9f759c0 r6:dae68e40 r5:d991ec00 r4:00000000
> [    6.872211] [<c060af2c>] (mtk_atomic_commit) from [<c05efed0>] (drm_atomic_commit+0x54/0x60)
> [    6.872219]  r10:00000002 r9:d9f74eac r8:00000001 r7:d98d5700 r6:d991ec00 r5:d9f759c0
> [    6.872223]  r4:00000000 r3:c060af2c
> [    6.872234] [<c05efe7c>] (drm_atomic_commit) from [<c05d33b8>] (restore_fbdev_mode_atomic+0x1d4/0x1e4)
> [    6.872241]  r7:d98d5700 r6:00000001 r5:d991edb0 r4:d9f759c0
> [    6.872251] [<c05d31e4>] (restore_fbdev_mode_atomic) from [<c05d5598>] (restore_fbdev_mode+0x5c/0x194)
> [    6.872260]  r10:00000000 r9:d991ecdc r8:d98d57b4 r7:00000000 r6:d98d5700 r5:d98d5700
> [    6.872263]  r4:00000000
> [    6.872274] [<c05d553c>] (restore_fbdev_mode) from [<c05d7054>] (drm_fb_helper_restore_fbdev_mode_unlocked+0x64/0xb0)
> [    6.872282]  r10:00000000 r9:d991ecdc r8:d98d57b4 r7:00000000 r6:c10824c8 r5:d98d5700
> [    6.872285]  r4:00000000
> [    6.872296] [<c05d6ff0>] (drm_fb_helper_restore_fbdev_mode_unlocked) from [<c05d70e0>] (drm_fb_helper_set_par+0x40/0x64)
> [    6.872304]  r9:d991ecdc r8:d991ec8c r7:c0d82d88 r6:d98d57b4 r5:00000000 r4:00000000
> [    6.872315] [<c05d70a0>] (drm_fb_helper_set_par) from [<c05d6fa4>] (drm_fb_helper_hotplug_event.part.11+0xb0/0xb8)
> [    6.872319]  r5:00000000 r4:d98d5700
> [    6.872330] [<c05d6ef4>] (drm_fb_helper_hotplug_event.part.11) from [<c05d72c8>] (drm_fbdev_client_hotplug+0x13c/0x1d8)
> [    6.872337]  r7:c0d82d88 r6:d991eca0 r5:d991ec00 r4:d98d5700
> [    6.872348] [<c05d718c>] (drm_fbdev_client_hotplug) from [<c0601640>] (drm_client_dev_hotplug+0x84/0xc0)
> 
> this crash also happens without fbdev-patch
> 
> my codebase: https://github.com/frank-w/BPI-R2-4.14/commits/5.1-hdmi
> 
> regards Frank
