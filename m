Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A594106ACD6
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5etVeL98LZEHyzHQa37h7AqJhMn11WQ1wIdnDqMKIY=; b=hW0zrB3xDnwMX3SlrB0pd0m1S2
	ob5Gouj66WyC98KfeKpJpG3+1ZTh7JHGWljzY5YWF6UCQVdZ1v6oh7s209KbVQYr9c9LaKImPho5j
	BV/cHEr6LQIqqGbPO11VfuraoK98vvx2cwpJM8gMEHDaOFwAByu/hhLKOuAdF+X2vpL5flHe3C56j
	Nh87egSTgNl6NBam7vWpL5oHVxkJSyN6HGscVYN0ybHo7xljBSMKQw81UT+1fsXavQZv9gxu8oFpE
	UELcy2pqpybnXgf6jqUjsSZ8kf+nx2p+BKerfUow5IVdLscdnW3XiBZ1P0G+iQ2E0RooCz4AAS2tP
	QM+jzGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0koJ-0000000Etol-1gSS;
	Thu, 12 Mar 2026 18:31:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0koI-0000000EtoO-0Igs
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 18:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 808C460054;
	Thu, 12 Mar 2026 18:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C81C116C6;
	Thu, 12 Mar 2026 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773340261;
	bh=PqviWeqBkV89c2EnIpZbKL1eDclZ3wMLXwzqVGaqFZ0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jHBxBoKY5+vOt2hEzIWlSjiH3mlSZWjGaY5rMOBL6UWlK4uXXdrxC1/5HFVl8ie08
	 ea4VGIcydBwZrp2Gkpvx7dd+mo4PFgdgw0UR56+/Nq9q5WTkOmufB23fLnX1qZbuwD
	 WoWYoYPQ2J/U9+rpNZt3w1x6ZRtZ7ZbFr0YkVlp4+iA7bC7cOT1TXSepWcjFl2F1Ca
	 711+UyvKAWZw18bUPcUEq19kKaVxBRXJtOfptKGCT2CK0fL4KEj9yVKGKnaSvWmGv/
	 m2Kp2gzUym6Qb5zOSL7bKkZB7D7c55ZQg+J5ZIEkBVMkUrjo9fEC8h1T9k5+D+HY8f
	 OvEXztfeNaQpQ==
Date: Thu, 12 Mar 2026 13:31:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mani@kernel.org, linux-mediatek@lists.infradead.org, 
 kwilczynski@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, 
 naseefkm@gmail.com, lpieralisi@kernel.org, bhelgaas@google.com, 
 conor+dt@kernel.org, ryder.lee@mediatek.com, linux-kernel@vger.kernel.org, 
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, 
 linux-pci@vger.kernel.org, ansuelsmth@gmail.com, linux-mips@vger.kernel.org
To: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260312165332.569772-2-cjd@cjdns.fr>
References: <20260312165332.569772-1-cjd@cjdns.fr>
 <20260312165332.569772-2-cjd@cjdns.fr>
Message-Id: <177334026016.3889069.9474337544951486443.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: PCI: mediatek: Add support for EcoNet
 EN7528
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


On Thu, 12 Mar 2026 16:53:30 +0000, Caleb James DeLisle wrote:
> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
> binding.
> 
> EcoNet PCIe controller has the same configuration model as
> Mediatek v2 but is initiallized more similarly to an MT7621
> PCIe.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/pci/mediatek-pcie.yaml           | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek-pcie.example.dtb: pcie@0,0: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260312165332.569772-2-cjd@cjdns.fr

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


