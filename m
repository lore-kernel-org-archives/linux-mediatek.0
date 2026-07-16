Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630CAC44512
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 18:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJktQKwDINGWhgoCZrW13rzuESCYOEOcpy7Vb2JHQ8M=; b=m5lxEJ5wzpktW2taIa6o8meuO5
	XG4LEcOfEq8+prAjnxDSH8A5YAwFs9dxfSsj/4wR+aPEC+R+JahbO/fRZRPieDf43sfezSyGmD657
	YDbkB8WPUjYpYVPktrWpFS1dDpryrzN9vf0YUSgSuoY+lifQy0TOrxI/+AAJOq52R70u2He0iZjle
	k43i9+5WGpFh2mGKocMFtd72hklCArCgE07UmDPebf2Xomm+KBeV/1sZ/o36MAZetEI1zyfQmjB8h
	NkV2D2ZiXL901KYYBkHx0d0faKBNCbOO6NLfmADbdDiw0IGVJXwegSWl+7C8x5dgghjdkkH1ugfY3
	r3JNCMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQvd-00000000P7T-3LxP;
	Thu, 16 Jul 2026 18:35:25 +0000
Received: from mail-10696.protonmail.ch ([79.135.106.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQvb-00000000P6G-2RW9
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 18:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784226919; x=1784486119;
	bh=UJktQKwDINGWhgoCZrW13rzuESCYOEOcpy7Vb2JHQ8M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Bto5Xw4NMOSoVu7Klhcpu7jiy5R5ZJO4/gClmbLW+F3q+imQ7KMvR5Xs66IlVZZw7
	 dArHX+iq55Yy5/QmEXBNK66asyqKaOsbvYd0Cg60VpJobgWJ9DZMMrqAsmE70uxmu/
	 /G46OQ/5vQAfm1bu/VdYroQmZziKD2219agDu/o98gZr5s7xHxvHF4QIxEA1FRcxj7
	 bMdYCOQjx1hIvIz0w/8/H+3sd+atWIQ8nbuaddVgOz2IR6Rb54tmf66L1oijWzfrhp
	 khvt7Oed07SBDMsJq6Eshz8lkZv9//kNgEMFEQROQ2WayJR2d6OuxraPz4JlmFl8cY
	 U1KSSKYfJZ1Pg==
Date: Thu, 16 Jul 2026 18:35:11 +0000
To: Akari Tsuyukusa <akkun11.open@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/7] arm/arm64: dts: mediatek: drop mt6589 fallback from watchdog
Message-ID: <W7fWZU3pu6akI_HMTAWPGnnErv60QtTz-LaPb6OtGvU5Bx0Iekl4SxWB6mxBPx8cBo9q9Lg7t8dDzcyfti-5fTirEACcwCLhNAh8e5xoHus=@protonmail.com>
In-Reply-To: <20260716161923.266315-4-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com> <20260716161923.266315-4-akkun11.open@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 73c7f91ec5bf7bbb8e204416070046f2990eb4d0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_113523_787942_F39A9BD3 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On Thursday, July 16th, 2026 at 7:19 PM, Akari Tsuyukusa <akkun11.open@gmai=
l.com> wrote:

> Remove the "mediatek,mt6589-wdt" fallback string from all in-tree
> device trees. Use only the SoC-specific compatible.
>
> No functional change.
> Affected SoCs: mt2701, mt6572, mt6582, mt6797, mt7622, mt7623,
> mt7629, mt8173, mt8365, mt8516.
>=20
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

...

> diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/m=
ediatek/mt6572.dtsi
> index ac70f266d698..5a6c9763bd6c 100644
> --- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> @@ -53,7 +53,7 @@ soc {
>  =09=09ranges;
>=20
>  =09=09watchdog: watchdog@10007000 {
> -=09=09=09compatible =3D "mediatek,mt6572-wdt", "mediatek,mt6589-wdt";
> +=09=09=09compatible =3D "mediatek,mt6572-wdt";
>  =09=09=09reg =3D <0x10007000 0x100>;
>  =09=09=09interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
>  =09=09=09timeout-sec =3D <15>;

mt6572 downstream kernel shows the same layout as 6589, but only
pwrap, md lite and md are explicitly referenced and used.

I tried poking some unused bits like DDR PHY or INFRA AO, though
that appears to be no-op. Only MMSYS and APMIXED resets from
the 6589 worked for me so far.

=3D> mw.l 0x10007018 0x88000001 # infra
=3D> mw.l 0x10007018 0x88000002 # mm
* display died *=20
=3D> mw.l 0x10007018 0x88000004 # mfg
=3D> mw.l 0x10007018 0x88000040 # ddrphy
=3D> mw.l 0x10007018 0x88000100 # infra_ao
=3D> mw.l 0x10007018 0x88000400 # apmixed
* hang *

I assume others are reserved on mt6572, so

Acked-by: Roman Vivchar <rva333@protonmail.com> # for mt6572

Best regards,
Roman

