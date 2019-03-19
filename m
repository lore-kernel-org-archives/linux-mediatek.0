From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re:  Re:  [PATCH 2/2] drm/mediatek: Add Mediatek framebuffer
 device
Date: Tue, 19 Mar 2019 17:52:32 +0100
Message-ID: <trinity-2a241119-4398-49c4-bcb6-177d13530d31-1553014352943@3c-app-gmx-bs54>
References: <20190116013924.11345-1-ck.hu@mediatek.com>
 <20190116013924.11345-2-ck.hu@mediatek.com>
 <trinity-1adab8be-573a-4816-9e9f-feddf07bdcd3-1547734452313@3c-app-gmx-bs28>
 <1547775975.4221.11.camel@mtksdaap41>
 <74eba84d-4686-698a-6100-d72dabd15a21@gmail.com>
 <trinity-1c369adc-b489-43dd-87c9-5b43d49561c5-1547991406711@3c-app-gmx-bs40>
 <1552965129.7881.5.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552965129.7881.5.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?Q?=22Noralf_Tr=EF=BF=BDnnes=22?= <noralf@tronnes.org>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

i try to get hdmi running on bananapi-r2 with 5.1 but also without CK Hu's frambuffer-Patch i get no x-server working

my codebase: https://github.com/frank-w/BPI-R2-4.14/commits/5.1-hdmi
reused some Patches working on 5.0 (here X-server is working, but not fbcon)

WARNING: CPU: 2 PID: 895 at drivers/gpu/drm/drm_atomic_helper.c:1430 drm_atomic_helper_wait_for_vblanks.part.1+0x2a4/0x2a8

any hint how to fix this? if needed i can send full bootlog (with drm.debug=7)

regards Frank
