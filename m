Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3423C3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8m9SM9nZXlVbomYKwQeVZ4oijHG7IQFO5C4MpI1C0z0=; b=CCG4ydt6g6iSCHpSXz6jmoSWHl
	lkQD5/5dampu8qvPli9KvPk70pwymDIcOiEOUGatIOxICUp0jTdMSxminGrQP7LI9IxYkHmLcIoem
	Q6pzFANPHdF+GfrMiMN7Kjti0AXFisdpFk/8+YMzpi6XMHzN+Kpa4Vj/JEjdP3HdnmHIrznXVzDpo
	gI6Ts++PK7m1hHfSi+tUuLY3moe69l2KoJlD1IRyW60G7ARlQqyqR519RKYVKVxx4qvKyDTpHllDu
	O1Ka1j/0R7AGXvSSZuLj2kzrANkfJBgapHQNzDyiN/skn3TOXLLZ+7879CNLBmsq75olT2AZvRixS
	i9YDFlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYrH-005h1a-1c;
	Fri, 25 Aug 2023 15:36:23 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYrE-005h10-0M;
	Fri, 25 Aug 2023 15:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1692977768; x=1693582568; i=frank-w@public-files.de;
 bh=VdrUkzAPLFRLGC4qVYhEGfYBGe1g2ruEZDgeplhbi88=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=nHkhHILK2J/MqzgRe84029JDk0X/iHDH1aU5wu5PbMc+PwfcTRh4U0S4P6xA0dSzIeWH9Vk
 SGtabHoZxe/AsDzptN9QWaodPbBZpMn/ZrCJ+wYq4BPpsN6NnJm88e5OognriPl1ZAJc8bLJb
 YAamrVR9oi2Yat0MwBnCuUmCEHCwhyYnNFks4wYighb4jd3F+3Sh26b3ERBfcbWW/ZUmN00dx
 0c5czRaLidA/QYIIOdqRvaE5rJQE+NA9tQlQ/in+pl7ZI4UEOCoTOQecIjze2sbwsQHja7LwN
 acSq1RhLTddzbGdxh51uVVNKXEyjx2zDSaXdCOK/EmYbZO7gC9gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.17] ([157.180.224.17]) by web-mail.gmx.net
 (3c-app-gmx-bs20.server.lan [172.19.170.72]) (via HTTP); Fri, 25 Aug 2023
 17:36:08 +0200
MIME-Version: 1.0
Message-ID: <trinity-06c31f89-2833-402f-9451-2270a14a5d71-1692977768615@3c-app-gmx-bs20>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Eric
 Woudstra <ericwouds@gmail.com>, stable@vger.kernel.org
Subject: Aw: [PATCH v2 2/2] arm64: dts: mt7986: fix emmc hs400 mode without
 uboot initialization
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Aug 2023 17:36:08 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20230629184318.551317-3-linux@fw-web.de>
References: <20230629184318.551317-1-linux@fw-web.de>
 <20230629184318.551317-3-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:jLmgX2xrUWmxLoyc5GosYJEGAAy+M/UfobOHavCkZCsfSMXYLEVuTuL7eyL7A/81kf9dO
 3EVOYUOaCBIrmfLQNtf94f4TbqYZ6fC3P9MR6P+HFceuiP2uyOVIBMKxQoySqSOYCp2MYRkrktxN
 lcuClMK4/ayXmRMyc8yvJddgktK6jasBC0GDdnh4iQQFApClBwBeda9h9gtLeJsnPsB8hf4u7gAy
 0wy7nzoyv1zef8p2KBYi/b9i1a1SfmBZCEEhQrcSdjZ35d1/7/0wBhGOfIknCE09Q0Qpanvl2N8v
 CQ=
UI-OutboundReport: notjunk:1;M01:P0:YvFxJiBsRc0=;VYvrekVB2wysNxvT6zZABSQfKDJ
 Umw3aV1ismrOon8ZSBRcD1QrrqeU60hqGFXuZsQNKQTRj9Xj27DwnDZgDsy9w0QyEm3k/aO4T
 pjhNp4xP1tNSi6NtnY3+9S7SxykZEzn4jTxl3IsXta/xFoOcNQpOBIlwPsDh0g+g9Z+2Ak5nd
 bKbbxa+tf3p79ZZe0G8zkF755pyPkcc5X9Ipgyxv29qTI8dqW3Fj8atmwvfcvT0dIRBMwX59E
 2L1MWf9gqJ583jl06irx8yl6jZvOFTIG3DHVhMSqdGiTDPM6nhfqK6M5RnoHhs44IKfQ138WB
 SEEHK3GI7SQ6g7Vdha20/+NY2ZCfRdTNspUBMFrIF04xbycuAgxlXYs/T3alP3rQSB1ksjheu
 Z4dksthaw0WWHEbCiAIfupDwkyAXPuYFnQweKhRqV97I0u0l7tW78gGfEi6PC0K1icSl3Udfg
 brQFjFQTfwrD1TOaRIFYA7FM47hjWKn6/KhV7F/ZBIhqBOwScz9i2/OrbQKgJKJ3xbZDbgs4B
 5ghXdKD123a9SOr7vJU9ca80L/Dbw7Lt2ZxYQGVF0qUrNsXUikHhwGiG6+Vph0J3twbIqEQ+V
 aL7HMX7+XFY9z3afSe+N8D8D9Bc06XvK89bgTNErrJJjxln4QNWELS9Fkb8yv1PmYi+YSJDmb
 P6g3jaFJMdk8kX2IK3x/9JK+v/FHkGkyiG3KkFPy1Nx+iBCWC9nlrL0aKPwhGWPe1K88nk0F6
 wAGcs8z1GM8FVXgKn0zTkXs39PI56FBPvrULeOSRoe4EniUG9sy8BpaNhmUtnu7ZPZ98goJ4e
 JJW+CisC5H+chmurcIzaAwaw==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_083620_535535_A5423AB0 
X-CRM114-Status: GOOD (  17.38  )
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

Hi,

just a friendly reminder, patch seems not applied to next.

dt-binding part is reported as applied

regards Frank


> Gesendet: Donnerstag, 29. Juni 2023 um 20:43 Uhr
> Von: "Frank Wunderlich" <linux@fw-web.de>
> An: linux-mediatek@lists.infradead.org
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Chaotian Jing" <chaot=
ian.jing@mediatek.com>, "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herri=
ng" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@li=
naro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias Brugger" <matth=
ias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregn=
o@collabora.com>, "Wenbin Mei" <wenbin.mei@mediatek.com>, "Sam Shih" <sam.=
shih@mediatek.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,=
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Eric=
 Woudstra" <ericwouds@gmail.com>, stable@vger.kernel.org
> Betreff: [PATCH v2 2/2] arm64: dts: mt7986: fix emmc hs400 mode without =
uboot initialization
>
> From: Eric Woudstra <ericwouds@gmail.com>
>
> Eric reports errors on emmc with hs400 mode when booting linux on bpi-r3
> without uboot [1]. Booting with uboot does not show this because clocks
> seem to be initialized by uboot.
>
> Fix this by adding assigned-clocks and assigned-clock-parents like it's
> done in uboot [2].
>
> [1] https://forum.banana-pi.org/t/bpi-r3-kernel-fails-setting-emmc-clock=
-to-416m-depends-on-u-boot/15170
> [2] https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/mt7986.dts=
i#L287
>
> Cc: stable@vger.kernel.org
> Fixes: 513b49d19b34 ("arm64: dts: mt7986: add mmc related device nodes")
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot=
/dts/mediatek/mt7986a.dtsi
> index 68539ea788df..207510abda89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -374,6 +374,10 @@ mmc0: mmc@11230000 {
>  			reg =3D <0 0x11230000 0 0x1000>,
>  			      <0 0x11c20000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +			assigned-clocks =3D <&topckgen CLK_TOP_EMMC_416M_SEL>,
> +					  <&topckgen CLK_TOP_EMMC_250M_SEL>;
> +			assigned-clock-parents =3D <&apmixedsys CLK_APMIXED_MPLL>,
> +						 <&topckgen CLK_TOP_NET1PLL_D5_D2>;
>  			clocks =3D <&topckgen CLK_TOP_EMMC_416M_SEL>,
>  				 <&infracfg CLK_INFRA_MSDC_HCK_CK>,
>  				 <&infracfg CLK_INFRA_MSDC_CK>,
> --
> 2.34.1
>
>

