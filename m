From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re:  [PATCH 2/2] drm/mediatek: Add Mediatek framebuffer device
Date: Sun, 20 Jan 2019 14:36:46 +0100
Message-ID: <trinity-1c369adc-b489-43dd-87c9-5b43d49561c5-1547991406711@3c-app-gmx-bs40>
References: <20190116013924.11345-1-ck.hu@mediatek.com>
 <20190116013924.11345-2-ck.hu@mediatek.com>
 <trinity-1adab8be-573a-4816-9e9f-feddf07bdcd3-1547734452313@3c-app-gmx-bs28>
 <1547775975.4221.11.camel@mtksdaap41>
 <74eba84d-4686-698a-6100-d72dabd15a21@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <74eba84d-4686-698a-6100-d72dabd15a21@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?Q?=22Noralf_Tr=EF=BF=BDnnes=22?= <noralf@tronnes.org>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Tested with mmsys-Patch, but same result, no fbcon, tft is switched on but i see no kernel-log

after boot is finished, i see X-server, until this point i see only black screen

regards Frank


> Gesendet: Freitag, 18. Januar 2019 um 09:39 Uhr
> Von: "Matthias Brugger" <matthias.bgg@gmail.com>
> may it be the not yet fixed mmsys compatible problem?
> Frank, did you test with my last series [1]?
> [1] https://patchwork.kernel.org/cover/10686345/
