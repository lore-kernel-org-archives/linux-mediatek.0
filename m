From: CK Hu <ck.hu@mediatek.com>
Subject: Re: Aw: Re:  [PATCH 2/2] drm/mediatek: Add Mediatek framebuffer
 device
Date: Tue, 19 Mar 2019 11:12:09 +0800
Message-ID: <1552965129.7881.5.camel@mtksdaap41>
References: <20190116013924.11345-1-ck.hu@mediatek.com>
         <20190116013924.11345-2-ck.hu@mediatek.com>
         <trinity-1adab8be-573a-4816-9e9f-feddf07bdcd3-1547734452313@3c-app-gmx-bs28>
         <1547775975.4221.11.camel@mtksdaap41>
         <74eba84d-4686-698a-6100-d72dabd15a21@gmail.com>
         <trinity-1c369adc-b489-43dd-87c9-5b43d49561c5-1547991406711@3c-app-gmx-bs40>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <trinity-1c369adc-b489-43dd-87c9-5b43d49561c5-1547991406711@3c-app-gmx-bs40>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "\"Noralf =?UTF-8?Q?Tr=EF=BF=BDnnes=22?=" <noralf@tronnes.org>, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Frank:

My platform's fbcon works correctly, so I've applied this series to [1].
If you have another patch, I'd treat it as a bug-fix.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.1

Regards,
CK

On Sun, 2019-01-20 at 14:36 +0100, Frank Wunderlich wrote:
> Tested with mmsys-Patch, but same result, no fbcon, tft is switched on but i see no kernel-log
> 
> after boot is finished, i see X-server, until this point i see only black screen
> 
> regards Frank
> 
> 
> > Gesendet: Freitag, 18. Januar 2019 um 09:39 Uhr
> > Von: "Matthias Brugger" <matthias.bgg@gmail.com>
> > may it be the not yet fixed mmsys compatible problem?
> > Frank, did you test with my last series [1]?
> > [1] https://patchwork.kernel.org/cover/10686345/
