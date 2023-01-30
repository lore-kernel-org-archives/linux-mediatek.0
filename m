Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB79C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcGSRz6yN0YvpPxM18cpcT5yuDciHrp+by6J8Z2HzPE=; b=UxJJErb45CUGew8EINtSkI3B87
	3pvSSfsoYET7sFjL1NnQ4A+yJ2VMtRc0iYiUvDjSsvmjN2sS8uHz8v9t97tdtKNJYe7ZgEbPJsVK0
	nBHgF7lUCCm7JFMaT3xBFuBgDFDG1j+I8HuV4cyR51HbOaHucJ3kDwGmg+9mfk57KnxYPtKzDTQMn
	NLaTPMFq3lqi8ULyp38SK0eY3nmbQkvRDbg0YZLgZR7iPFvIAzlc+TaJIcwxKq6fvO7UNjF/uB8m+
	IMUOCYDpnZiudhSnZoJf3CSr8Q5fOXdf+Dh13ti6e3+xn7to/V+j8RQ005pNQZ0gAgrNa+b65Ll9U
	zqED/ciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWmW-004BFe-QV; Mon, 30 Jan 2023 16:13:20 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWlA-004B3x-FG; Mon, 30 Jan 2023 16:11:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C7C31E0006;
	Mon, 30 Jan 2023 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675095112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcGSRz6yN0YvpPxM18cpcT5yuDciHrp+by6J8Z2HzPE=;
	b=fIHDEFlerl/8KMHwFWRVo5CKdbzBAOQCYrA3KdnXDHCfNYGJuNFd99PVt4nzl7eFv+eBa3
	IKyJnI6OQxAgrGls7DOs1ulfBQijUOU9YIATKPmq4pxufMyY3fnPi6tKLczdWg46ltBL6V
	7q1vGEghO57UcHuXti6woJd1zHgy5TMAqmd4I/x6ByVb13ulTwDgdVWg4yrRcJmLhBFs4l
	2xFvQE4KH0/3Iy2eiUEmPGtZFgxKgnQtcniNCnqkH8pQ51AA9zoB0yw5YMSHz8UNWOwUXA
	HzZH+rJ7sNEmjcEWvHMY+m4D1TttwKjzWhWdMNC/wufQ+dQRdHQ8bd3zJF2BZw==
Date: Mon, 30 Jan 2023 17:11:45 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo
 <gch981213@gmail.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <benliang.zhao@mediatek.com>,
 <bin.zhang@mediatek.com>
Subject: Re: [RESEND PATCH v5 00/10] Add MediaTek MT7986 SPI NAND and ECC
 support
Message-ID: <20230130171145.2c844d34@xps-13>
In-Reply-To: <20230130030656.12127-1-xiangsheng.hou@mediatek.com>
References: <20230130030656.12127-1-xiangsheng.hou@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_081156_791327_987D5496 
X-CRM114-Status: GOOD (  15.61  )
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

Hi Xiangsheng,

xiangsheng.hou@mediatek.com wrote on Mon, 30 Jan 2023 11:06:46 +0800:

> This patch series add MediaTek MT7986 SPI NAND and ECC controller
> support, split ECC engine with rawnand controller in bindings and
> change to YAML schema.

I would like to pick-up patches 3, 7 and 10 and apply them in the mtd
tree as they look completely orthogonal with all the other (spi/DT)
changes, am I right?

Mark, is it okay for you?

Thanks,
Miqu=C3=A8l

>=20
> Changes since V4:
>  - Split arm and arm64 dts patch for fix existing NAND controller node na=
me.
>=20
> Changes since V3:
>  - Correct mediatek,mtk-nfc.yaml dt-bindings.
>=20
> Changes since V2:
>  - Change ECC err_mask value with GENMASK macro.
>  - Change snfi mediatek,rx-latch-latency to mediatek,rx-latch-latency-ns.
>  - Add a separate patch for DTS change.
>  - Move common description to top-level pattern properties.
>  - Drop redundant parts in dt-bindings.
>=20
> Changes since V1:
>  - Use existing sample delay property.
>  - Add restricting for optional nfi_hclk.
>  - Improve and perfect dt-bindings documentation.
>  - Change existing node name to match NAND controller DT bingings.
>  - Fix issues reported by dt_binding_check.
>  - Fix issues reported by dtbs_check.
>=20
> Xiangsheng Hou (10):
>   spi: mtk-snfi: Change default page format to setup default setting
>   spi: mtk-snfi: Add optional nfi_hclk which is needed for MT7986
>   mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
>   dt-bindings: spi: mtk-snfi: Add compatible for MT7986
>   spi: mtk-snfi: Add snfi sample delay and read latency adjustment
>   dt-bindings: spi: mtk-snfi: Add read latch latency property
>   dt-bindings: mtd: Split ECC engine with rawnand controller
>   arm64: dts: mediatek: Fix existing NAND controller node name
>   arm: dts: mediatek: Fix existing NAND controller node name
>   dt-bindings: mtd: mediatek,nand-ecc-engine: Add compatible for MT7986
>=20
>  .../bindings/mtd/mediatek,mtk-nfc.yaml        | 155 +++++++++++++++
>  .../mtd/mediatek,nand-ecc-engine.yaml         |  63 +++++++
>  .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
>  .../bindings/spi/mediatek,spi-mtk-snfi.yaml   |  54 +++++-
>  arch/arm/boot/dts/mt2701.dtsi                 |   2 +-
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   2 +-
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   2 +-
>  drivers/mtd/nand/ecc-mtk.c                    |  28 ++-
>  drivers/spi/spi-mtk-snfi.c                    |  41 +++-
>  9 files changed, 330 insertions(+), 193 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-nf=
c.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand-e=
cc-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
>=20

