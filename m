Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82312CA0EED
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 17:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDaqq8dNgAjqw8Urynd4ZHZ1ObaUUmBl/jazIJqboxM=; b=RwKk1WmyMPQG/cVERFOJJHJiE2
	tke3C2fu3vT2X1mAvXzN0TGY1ha83jViUDGd+Q+u7noyk/Vn9LFcFKdRbQ8QK/fzALPI8dSJTMr0r
	7tzX6RKlbKkVAQnBuCyenrn+AaVN00wDq0vPsQqyey6lu07PfpLxnDrTebBGAAsLb4ghwE+PMNfc8
	qnUlrcznUw+GyzqhPy5DH3j0AmcRTdBczHMj1krfiRYD8ToNmG+kAvktkge7lruuyrfreOzoDBB4I
	34KpWhAKJgMdmk6PK6YYGXr3IA3jVBTnf3IBWVCKD/AW9ZIBZ6xZoHiXo//91ohtu2zc/L55lhGvJ
	5ypIU8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgOu-00000002U2h-2y8A;
	Thu, 28 Aug 2025 17:27:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urchw-00000001kMz-2KwD;
	Thu, 28 Aug 2025 13:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4000D434A7;
	Thu, 28 Aug 2025 13:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0467BC4CEEB;
	Thu, 28 Aug 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756387827;
	bh=Pp+mUIl9DaMYLcizWDp98QlTF7nc4qrOwFHsc6v7+TQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TwweZqITjVRYZRGj/vPSwPYU+UtXXfCd7962Xofky57MrVDYEefi6ytNHNM/1pMAr
	 gS91QN2ZgTy1WqjajoriR9lBkyVMZhy5B1qonweQHmhRxQJTCh4uINMC6WjdGy2h5G
	 yuQqN1G1TpGQwjg6Rj1krDl1hHHMBncEzOzu20RzOJJoQHvzZam5AERan/IwNloBsJ
	 DSORi/1S7rGER8QbPP7/KkrRLJ54G5t4n9iklDI9tLBfhW4nWkeMn0ShjrhvaIVM8t
	 ZWKB+pjIT2PBGMkhZ984seK9kn+1q8MfFSousLJm5EvZYwt2Te0Yy1hpX/aCn9V/l6
	 LSDmscGzpEqoA==
Date: Thu, 28 Aug 2025 08:30:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Chen <paul-pl.chen@mediatek.com>
In-Reply-To: <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
Message-Id: <175638709894.1370676.14730988453056252892.robh@kernel.org>
Subject: Re: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA
 yaml for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_063028_615649_DA1C74D9 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, xiandong.wang@mediatek.com, chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, singo.chang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, treapking@chromium.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, sunny.shen@mediatek.com, p.zabel@pengutronix.de, sirius.wang@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 28 Aug 2025 16:06:58 +0800, Paul Chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> The MediaTek display overlap extended DMA engine, namely
> OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> for reading data from DRAM with various DRAM footprints
> and data formats.
> 
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250828080855.3502514-4-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


