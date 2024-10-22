Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3352D1CDCB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ABaYLL7EBSznBRnb3+vEGirPHzL20pXotqnemHm9NQ=; b=xI1l5ZandDh+WL9Lxa1Fwn92W5
	nTwUfHbz3+2pQqfsAVXFPoNsQL8aRbh+D3Y4B3Vird58SmtVYcQtr66/oX3FRnOvlweUQSpDTXNgd
	fpdpO8DH5gLnyz10BcmtH3VmxNo6UyWyQ3juM5PYg9Gp5BfBM5vv/0U1hq42hrNm6XgfGQt5jiVvS
	gTrp+rZ2mx9Z+BUBWikAfT0T0YtOboRHL1ZIka4h0OLgJKB1ORTyd8+KE+/do+2H5tLUWyH8z5Pg4
	QrBq5ZHP+wnssMPKHtCaMwJzBjU6bblm4zDnKVThTtibyJatFQY4NgFsMyUmcg1+w8MLTacCExJQM
	Wb2iAmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BTK-0000000APj4-44Pg;
	Tue, 22 Oct 2024 09:46:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BJQ-0000000AN73-01Ne;
	Tue, 22 Oct 2024 09:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729589781;
	bh=rYYlihFu8PwLnQ37fCubpAZgvwlduc501eQg14BRZc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RyS8qpAUyS0IdeSFrKR+nTTgfdVJnszWGypO/0WWgWeZwMX8CoQ37F9+M/7Bw80OR
	 0sqyi88RHtBkm3cdWfmnO2tHE3Qs5cDGvgSyIDXyh209dLhb60yeKeb+kefkhDvlYR
	 HVe1W2pVbiT7CAIRpljRIkG21YOq1TGlJ3ObLDO22ACz5XxAiuKG+t65REIRzit7r/
	 e1QQDtH8gfLvZwsXLbZmg9GZh0ojE05UZNaPYstj/bmazndwJ0yllZZRSqBH+Mwmg5
	 NRIgE4oOJS8SLtCoi891uVpndk3Spgonx8BogTkf4JZM0VoItXMnoXuyITB22tXLNW
	 0LY7srv+LFoIQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C65A17E137F;
	Tue, 22 Oct 2024 11:36:21 +0200 (CEST)
Message-ID: <78f4da13-cbff-415b-a8eb-ec16108b5c00@collabora.com>
Date: Tue, 22 Oct 2024 11:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: Add bindings for MT6735
 syscon clock and reset controllers
To: Conor Dooley <conor@kernel.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241021121618.151079-1-y.oudjana@protonmail.com>
 <20241021121618.151079-2-y.oudjana@protonmail.com>
 <20241021-goatskin-wafer-7582dbcfe1d1@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241021-goatskin-wafer-7582dbcfe1d1@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_023624_385656_9A293E0A 
X-CRM114-Status: GOOD (  17.66  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/10/24 18:56, Conor Dooley ha scritto:
> On Mon, Oct 21, 2024 at 03:16:15PM +0300, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Add device tree bindings for syscon clock and reset controllers (IMGSYS,
>> MFGCFG, VDECSYS and VENCSYS).
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   .../bindings/clock/mediatek,syscon.yaml           |  4 ++++
>>   MAINTAINERS                                       |  6 ++++++
>>   .../dt-bindings/clock/mediatek,mt6735-imgsys.h    | 15 +++++++++++++++
>>   .../dt-bindings/clock/mediatek,mt6735-mfgcfg.h    |  8 ++++++++
>>   .../dt-bindings/clock/mediatek,mt6735-vdecsys.h   |  9 +++++++++
>>   .../dt-bindings/clock/mediatek,mt6735-vencsys.h   | 11 +++++++++++
>>   .../dt-bindings/reset/mediatek,mt6735-mfgcfg.h    |  9 +++++++++
>>   .../dt-bindings/reset/mediatek,mt6735-vdecsys.h   | 10 ++++++++++
> 
> Is it really necessary to have individual files foe each of these? Seems
> a bit extra, no?
> 

It's only good for including smaller headers in each driver (and/or DT, but
then the SoC DT will anyway include them all).

I'm fine with that, but I'm also fine with one header for clock and one for reset.

So.. Conor, it's however you prefer :-)

Cheers,
Angelo

> Cheers,
> Conor.
> 
>>   8 files changed, 72 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/mediatek,mt6735-imgsys.h
>>   create mode 100644 include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
>>   create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
>>   create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vencsys.h
>>   create mode 100644 include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
>>   create mode 100644 include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
>> index 10483e26878fb..a86a64893c675 100644
>> --- a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
>> +++ b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
>> @@ -28,6 +28,10 @@ properties:
>>                 - mediatek,mt2712-mfgcfg
>>                 - mediatek,mt2712-vdecsys
>>                 - mediatek,mt2712-vencsys
>> +              - mediatek,mt6735-imgsys
>> +              - mediatek,mt6735-mfgcfg
>> +              - mediatek,mt6735-vdecsys
>> +              - mediatek,mt6735-vencsys
>>                 - mediatek,mt6765-camsys
>>                 - mediatek,mt6765-imgsys
>>                 - mediatek,mt6765-mipi0a
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2ce38c6c0e6ff..25484783f6a0b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14537,11 +14537,17 @@ F:	drivers/clk/mediatek/clk-mt6735-infracfg.c
>>   F:	drivers/clk/mediatek/clk-mt6735-pericfg.c
>>   F:	drivers/clk/mediatek/clk-mt6735-topckgen.c
>>   F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
>> +F:	include/dt-bindings/clock/mediatek,mt6735-imgsys.h
>>   F:	include/dt-bindings/clock/mediatek,mt6735-infracfg.h
>> +F:	include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
>>   F:	include/dt-bindings/clock/mediatek,mt6735-pericfg.h
>>   F:	include/dt-bindings/clock/mediatek,mt6735-topckgen.h
>> +F:	include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
>> +F:	include/dt-bindings/clock/mediatek,mt6735-vencsys.h
>>   F:	include/dt-bindings/reset/mediatek,mt6735-infracfg.h
>> +F:	include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
>>   F:	include/dt-bindings/reset/mediatek,mt6735-pericfg.h
>> +F:	include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
>>   
>>   MEDIATEK MT76 WIRELESS LAN DRIVER
>>   M:	Felix Fietkau <nbd@nbd.name>
>> diff --git a/include/dt-bindings/clock/mediatek,mt6735-imgsys.h b/include/dt-bindings/clock/mediatek,mt6735-imgsys.h
>> new file mode 100644
>> index 0000000000000..f250c26c5eb4d
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/mediatek,mt6735-imgsys.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +#ifndef _DT_BINDINGS_CLK_MT6735_IMGSYS_H
>> +#define _DT_BINDINGS_CLK_MT6735_IMGSYS_H
>> +
>> +#define CLK_IMG_SMI_LARB2		0
>> +#define CLK_IMG_CAM_SMI			1
>> +#define CLK_IMG_CAM_CAM			2
>> +#define CLK_IMG_SEN_TG			3
>> +#define CLK_IMG_SEN_CAM			4
>> +#define CLK_IMG_CAM_SV			5
>> +#define CLK_IMG_SUFOD			6
>> +#define CLK_IMG_FD			7
>> +
>> +#endif /* _DT_BINDINGS_CLK_MT6735_IMGSYS_H */
>> diff --git a/include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h b/include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
>> new file mode 100644
>> index 0000000000000..d2d99a48348a0
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
>> @@ -0,0 +1,8 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +#ifndef _DT_BINDINGS_CLK_MT6735_MFGCFG_H
>> +#define _DT_BINDINGS_CLK_MT6735_MFGCFG_H
>> +
>> +#define CLK_MFG_BG3D			0
>> +
>> +#endif /* _DT_BINDINGS_CLK_MT6735_MFGCFG_H */
>> diff --git a/include/dt-bindings/clock/mediatek,mt6735-vdecsys.h b/include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
>> new file mode 100644
>> index 0000000000000..f94cec10c89ff
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
>> @@ -0,0 +1,9 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +#ifndef _DT_BINDINGS_CLK_MT6735_VDECSYS_H
>> +#define _DT_BINDINGS_CLK_MT6735_VDECSYS_H
>> +
>> +#define CLK_VDEC_VDEC			0
>> +#define CLK_VDEC_SMI_LARB1		1
>> +
>> +#endif /* _DT_BINDINGS_CLK_MT6735_VDECSYS_H */
>> diff --git a/include/dt-bindings/clock/mediatek,mt6735-vencsys.h b/include/dt-bindings/clock/mediatek,mt6735-vencsys.h
>> new file mode 100644
>> index 0000000000000..e5a9cb4f269ff
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/mediatek,mt6735-vencsys.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +#ifndef _DT_BINDINGS_CLK_MT6735_VENCSYS_H
>> +#define _DT_BINDINGS_CLK_MT6735_VENCSYS_H
>> +
>> +#define CLK_VENC_SMI_LARB3			0
>> +#define CLK_VENC_VENC			1
>> +#define CLK_VENC_JPGENC			2
>> +#define CLK_VENC_JPGDEC			3
>> +
>> +#endif /* _DT_BINDINGS_CLK_MT6735_VENCSYS_H */
>> diff --git a/include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h b/include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
>> new file mode 100644
>> index 0000000000000..c489242b226e2
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
>> @@ -0,0 +1,9 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +#ifndef _DT_BINDINGS_RESET_MT6735_MFGCFG_H
>> +#define _DT_BINDINGS_RESET_MT6735_MFGCFG_H
>> +
>> +#define MT6735_MFG_RST0_AXI		0
>> +#define MT6735_MFG_RST0_G3D		1
>> +
>> +#endif /* _DT_BINDINGS_RESET_MT6735_MFGCFG_H */
>> diff --git a/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h b/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
>> new file mode 100644
>> index 0000000000000..90ad73af50a3f
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
>> @@ -0,0 +1,10 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +#ifndef _DT_BINDINGS_RESET_MT6735_VDECSYS_H
>> +#define _DT_BINDINGS_RESET_MT6735_VDECSYS_H
>> +
>> +#define MT6735_VDEC_RST0_VDEC			0
>> +
>> +#define MT6735_VDEC_RST1_SMI_LARB1		1
>> +
>> +#endif /* _DT_BINDINGS_RESET_MT6735_VDECSYS_H */
>> -- 
>> 2.47.0
>>




