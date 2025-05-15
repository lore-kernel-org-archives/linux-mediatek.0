Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D1C2D0CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0xZsxO2RMhKu6wMesyw510G51TrdtaJFm7j6ogn2X4=; b=2y7ny8y9DQPtltZq/y1bM5Xcbp
	U9EQ+Yd3pMO5enWncTGuiKwy0j+0mZSUjB2Rfv2b1e+FGnv2Igd8Hx59gAhnRIUFdd3JcGP25pCkI
	0scpuhO6a79usWCH1enzbWyLAcWgYCjLcB/uUfh3If+FElwpDuWT1awCcWz5AqfY96t5VpjGmw6ti
	Kh1QHR+6oRWLG2ReMfGHrCSFUIjKvmflTH1zjnfxL93ApK+iQx6JkBNYUGP5LhxT5xv9XuK7cMNYP
	3CIRkJmR3uD5ObZkQvjeHxLZ2dwmghqoIKjM0xl+UNtFHj+4aR4wUmJOohAzZJ0RBSwkokISuvgbt
	aaaxJcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWDa-00000000Lat-0Q3z;
	Thu, 15 May 2025 10:53:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFW8f-00000000Kml-1nvQ;
	Thu, 15 May 2025 10:48:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 557895C55AC;
	Thu, 15 May 2025 10:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2176DC4CEE7;
	Thu, 15 May 2025 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747306112;
	bh=adxalg7H3lV44b62vZBcg+BCmQflj5misd5wybzAhrk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=u7DeagEUEiexQGncuTRbIUiVohH0r9Yv/kmqm+EZaKWZsCoK4Cfh43a3y4gqdXWtx
	 lG6aDJSr5GlY/zwP4+xtCu2IF3yYaRcpqqFQ7pEP2YbEMl9tafTCc3Wbg1T3ZetDx+
	 S7Dr07ViBTwbdcoPp3xMI+BYPcipOz9cYhdVQzdlCZycbA4WVjGWgZVPctUru/smxt
	 rsHP4HksXSkcOoNoA5LazlUNOsY+b/bD3A1t5cctBTq/wTVSXxaS4xITr1QLGQBs+v
	 cD7aJmx+dm7h97l6Jlh/aeIifn55CJmfS8E2QMtqOB7wrnd21eRq0VP1ZOklrxxBgr
	 4Vy7hhIETPFYw==
Date: Thu, 15 May 2025 05:48:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250515093454.1729720-3-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-3-paul-pl.chen@mediatek.com>
Message-Id: <174730611044.164934.18396756831118218280.robh@kernel.org>
Subject: Re: [PATCH v3 02/17] dt-bindings: display: mediatek: add EXDMA
 yaml for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_034833_510858_EEF16598 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, xiandong.wang@mediatek.com, jason-jh.lin@mediatek.com, singo.chang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, treapking@chromium.org, chunkuang.hu@kernel.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, sunny.shen@mediatek.com, p.zabel@pengutronix.de, sirius.wang@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 15 May 2025 17:34:14 +0800, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> The MediaTek display overlap extended DMA engine, namely
> OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> for reading data from DRAM with various DRAM footprints
> and data formats.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/mediatek,exdma.example.dtb: dma-controller@32850000 (mediatek,mt8196-exdma): 'mediatek,larb' is a required property
	from schema $id: http://devicetree.org/schemas/dma/mediatek,exdma.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250515093454.1729720-3-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


