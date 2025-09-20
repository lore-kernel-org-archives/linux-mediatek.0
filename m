Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEBDCAC5A5
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Sep 2025 22:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTtZhruTVLF4GPNyBajpZdwiUP3tJkM+q78Hsw3okYw=; b=LJTfP+NfDAFPB3TcU3dywO1tVe
	U6zWq2xezWJ0hLKl2RH/H5HoBGbCm47va0fOglCUsDUUhHdzZOJkpJuycfzRvCcFtkd9kODqqDf2A
	9az2aBRdypGsc4vYCoIUF7427aTdzapyQSLsWUfx4SMAs7v7BjOotzmpvz/ZGhOksxxr43dKLrkjO
	YGvQAMjoLUbFt+g8D6+c9HxvF3k5wyPfm24lUbB4lrFxhEDhLwMUD4hcT6iUXzYimd0qmDvln8jq8
	5yEh08u0fEL+0CWdQylNufSKnYwmMQkX6A6A9bZrfJM31cp+FGjxcnOiFlZq11Q+rUfAybeYCzhep
	OWpxEsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06HN-000000061TY-1DsW;
	Sat, 20 Sep 2025 22:42:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06HK-000000061So-1oJP;
	Sat, 20 Sep 2025 22:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F30940961;
	Sat, 20 Sep 2025 22:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDD5C4CEEB;
	Sat, 20 Sep 2025 22:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758408121;
	bh=Dt8VKsI0bzzPWavc0PQi4CMaYsaPhVChPxt1pBUrkF4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=O2VD451vT9HNTTN9Ot+gYm+T7u5XS4TeGU3KNlq3MyYzbPc/WfKyJ5YsAal0YSqZa
	 xVtREVHKDSzLplyY10SBSdmsSkd8v5ip1Co82UnaMPTaNqgxCQbGA18E8DeWVBE2Zo
	 SPYF0+SvJAmBHV64T2e37DNfLhT5tv8ICq0uLqr/KChDAFAk3cxcyoFYaBYj8TEvYu
	 tFnngljlcAoDTqs1yknnMrQY7rGzRV3q8ZPQ4pR3BcK5CAvsPT0GYyQPXbCNhMKRpw
	 GIQRLcZwMYeIxTY63zUOhMNQchRVFai5QcRRjKXe54mpAmHWTldY9qzCM9oUtlMk28
	 Pmn+JiZra4uYA==
Date: Sat, 20 Sep 2025 17:41:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250920114103.16964-1-ansuelsmth@gmail.com>
References: <20250920114103.16964-1-ansuelsmth@gmail.com>
Message-Id: <175838993594.10832.1517003373145392481.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek: Convert to YAML schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_154202_511167_6D37FA2D 
X-CRM114-Status: GOOD (  11.77  )
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


On Sat, 20 Sep 2025 13:41:01 +0200, Christian Marangi wrote:
> Convert the PCI mediatek Documentation to YAML schema to enable
> validation of the supported GEN1/2 Mediatek PCIe controller.
> 
> While converting, lots of cleanup were done from the .txt with better
> specifying what is supported by the various PCIe controller variant and
> drop of redundant info that are part of the standard PCIe Host Bridge
> schema.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ---------
>  .../bindings/pci/mediatek-pcie.yaml           | 564 ++++++++++++++++++
>  2 files changed, 564 insertions(+), 289 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek-pcie.example.dtb: syscon@1a000000 (mediatek,mt7623-hifsys): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7623-hifsys', 'mediatek,mt2701-hifsys', 'syscon'] is too long
	'mediatek,mt7623-hifsys' is not one of ['mediatek,mt2701-hifsys', 'mediatek,mt7622-hifsys']
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt2701-hifsys.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek-pcie.example.dtb: pcie@0,0: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek-pcie.example.dtb: pcie@1,0: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek-pcie.example.dtb: pcie@2,0: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250920114103.16964-1-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


