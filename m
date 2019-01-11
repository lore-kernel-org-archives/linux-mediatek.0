From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re: Re: [PATCH] drm/mediatek: Add MTK Framebuffer-Device
 (mt7623)
Date: Fri, 11 Jan 2019 19:23:42 +0100
Message-ID: <trinity-c852a1ec-38d2-41d2-aefd-9cd385e8f772-1547231022924@3c-app-gmx-bs19>
References: <20190102084917.4049-1-frank-w@public-files.de>
 <20190107103640.GH21184@phenom.ffwll.local>
 <CAKMK7uEqxz4TAt_iwEC+dMWboVxCeCduyABsSwD0Ns7k=Z_UWA@mail.gmail.com>
 <trinity-0da588a3-1277-4421-ad6b-1f6aeb129dd6-1547146897687@3c-app-gmx-bs35>
 <20190110200225.GN21184@phenom.ffwll.local>
 <1547176809.12054.11.camel@mtksdaap41>
 <20190111092042.GP21184@phenom.ffwll.local>
 <1547200155.4209.4.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547200155.4209.4.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?=22Noralf_Tr=C3=B8nnes=22?= <noralf@tronnes.org>, David Airlie <airlied@linux.ie>, Alexander Ryabchenko <d3adme4t@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

like Daniel guessed, fb-console does not work with this Patch.

i tried your Patch (additional patch for headerfile): https://github.com/frank-w/BPI-R2-4.14/commits/4.20-fbdev

and R2 hangs  (no crash and no further boot)

[    5.435075] mediatek-drm 14000000.dispsys: bound 14012000.rdma (ops mtk_disp)
[    5.435134] mediatek-drm 14000000.dispsys: bound 14014000.dpi (ops mtk_dpi_c)
[    5.459277] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).      
[    5.465863] [drm] No driver support for vblank timestamp query.              
[    5.472331] [drm] Initialized mediatek 1.0.0 20150513 for 14000000.dispsys o0

my monitor is switched on, but no output....we had added fbdev-driver to get FB-console over hdmi, so it's currently useless

regards Frank
