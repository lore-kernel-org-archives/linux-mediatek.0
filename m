Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EF8C44536
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jan 2026 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecA15Vx12iOuabOvm7sXXldy4x2qXzfYEVChnCDQANI=; b=nbadjlxBqFqICZFu55736pudAT
	/d265DtMs6d7qSiphXOu+TwVDiF4wg8FZFzF+xF8i1fo6Pd+eRz0xDDsdQXHrAXZADf2yWWj0c6co
	nllwzQK6FwpZ0DLtSPF1npsQwaHn2QdUudJ+BaXlddn6+EmBr9PgBuN5bhNyr3Uize7PsN0PBFLAr
	JazvN/mkzwlDewgh1L2TGCVco7M4UTTe7CZtM1m3fp0zjF08cpMYeI/c+ZUsuo3XNhn8K6hyM3VNl
	d2xwgqhSyDjMVHLbqxbeMttmMQr+M8ukbn/FKmgHyLTHXlK9OMqkp6dHpWuXMzBirUDpauMZ22VME
	TbzVwi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqzS-00000006k0k-41OX;
	Thu, 22 Jan 2026 09:28:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqzP-00000006jzx-496F
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Jan 2026 09:28:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 18D6FC21A9C;
	Thu, 22 Jan 2026 09:28:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47871606B6;
	Thu, 22 Jan 2026 09:28:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 149B8119B24FC;
	Thu, 22 Jan 2026 10:28:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769074088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ecA15Vx12iOuabOvm7sXXldy4x2qXzfYEVChnCDQANI=;
	b=XYwxPmQ+wJnQzV+UMPulA9KosXrbNo/2ixYwHVUorsDLTSG8nCW/N5wo3Y+QoCzLj/7QHW
	++jGUmLig/U/drgmo3BxwZwVe3i9IYL+9/qZV1hPqrmGU9CRpPheBgyIQxPGYMotGN35Mb
	lEYQ0olAOmXMz59n7zaOGQ5a0gwNU4gdsXnzWYiOQAxqBJtVs5ZhDefOcf0DvWv7egh0VH
	D1Ppe5+IfUuf/ze55YYjH4nEKkNEvmEPJhg2GWqrsUXCJmZ+biMHAFBKm+L1Tv1QIJ5i+g
	xzN4Dntb/TMrSW8ffq97pIA0q8LLuvf3+21iw7HpE+b+T4QOvazSa70eU8sZJg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 atenart@kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 3/4] arm64: dts: marvell: Add SoC specific
 compatibles to SafeXcel crypto
In-Reply-To: <20260112145558.54644-4-angelogioacchino.delregno@collabora.com>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
 <20260112145558.54644-4-angelogioacchino.delregno@collabora.com>
Date: Thu, 22 Jan 2026 10:28:01 +0100
Message-ID: <87ikcukndq.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_012832_162616_0A02428E 
X-CRM114-Status: GOOD (  11.81  )
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
writes:

> Following the changes in the binding for the SafeXcel crypto
> engine, add SoC specific compatibles to the existing nodes in
> Armada 37xx and CP11x.
>

Applied on mvebu/dt64

Thanks,

Gregory

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi  | 3 ++-
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-37xx.dtsi
> index c612317043ea..87f9367aec12 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -427,7 +427,8 @@ xor11 {
>  			};
>=20=20
>  			crypto: crypto@90000 {
> -				compatible =3D "inside-secure,safexcel-eip97ies";
> +				compatible =3D "marvell,armada-3700-crypto",
> +					     "inside-secure,safexcel-eip97ies";
>  				reg =3D <0x90000 0x20000>;
>  				interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/b=
oot/dts/marvell/armada-cp11x.dtsi
> index d9d409eac259..39599171d51b 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> @@ -512,7 +512,8 @@ CP11X_LABEL(sdhci0): mmc@780000 {
>  		};
>=20=20
>  		CP11X_LABEL(crypto): crypto@800000 {
> -			compatible =3D "inside-secure,safexcel-eip197b";
> +			compatible =3D "marvell,armada-cp110-crypto",
> +				     "inside-secure,safexcel-eip197b";
>  			reg =3D <0x800000 0x200000>;
>  			interrupts =3D <88 IRQ_TYPE_LEVEL_HIGH>,
>  				<89 IRQ_TYPE_LEVEL_HIGH>,
> --=20
> 2.52.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

