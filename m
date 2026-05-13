Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01A4CD37AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sF6+S2Iv5JZt+gnL7XEDQdrN49m6GSCIapIqeEA8Sdc=; b=ZODxC0LgeQ1ruq
	a7eaa6hL4Pj6kwxFzIHmdnGsr0rUV2GcxYgZVVjmqHASPge9F/HEOtFHafiK0G33CjmcX8QFn4rzx
	M7naqHNHFQ4t4NLnRikMNYGqwaMfgZ72fCo+GwnH1iOLA0Tss07qcB7ua7g4dHcpeAiSbeEKmSGVs
	du9Ai7FS3GeJuL/8S8AjZ/w9w/wr/iqBsHv5Ivr/09ULt2LfEHnfwrKIK7Z5oXkj0eQpHy4AvAip1
	RLOrUtQ2G6ANULd2vPWQ6tooy6W9xZw2r19UYPWEthr5ZmOcCsP0uDOYbOiDvEcVk4kPpng8I0I0c
	bryheBO5sP8/Thgn7y2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGoI-00000003n0e-0XQs;
	Wed, 13 May 2026 21:08:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGoE-00000003n02-2Aqu
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 21:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A52DF43F01;
	Wed, 13 May 2026 21:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C8AC19425;
	Wed, 13 May 2026 21:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778706480;
	bh=oZWjXoMfghGHXHjku6nYK8etJGovo5hAboXQRgBbDiA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tTJrOW8pBXpiXtwhfnE6UWwdLxO53d1pwvpe7uI7N4M7CX1Us1bPLq9hhLUtDSxAG
	 D+cZ6gVbRPfpAzHT6qorwXZlomfIKWPz2KMP0UDJXdly4bx5AG1orv4lolo3v3HT4Y
	 ryQU+fFjkkwZJ4qoISUSPRmvFuxNW2xu1pbIHs5+Hz6FqwEHYAZ8JuFB1eGAYXOt9m
	 3Js0oCfogVLgFCq7fjm8S8/UKFVpP1Rx2/y1DW9MKclsjbNYcl29PJZa53gRxVoP6T
	 IDATbx2MyIjaUp3bvIsI2TDVMfWPPWCu0PzMnHCmaLqwwJa4uHp25f9G4kRFuzetnM
	 /oDTdFgyJfpKw==
Date: Wed, 13 May 2026 16:07:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <20260513210759.GA331283@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513191652.3200607-3-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_140802_577341_40547028 
X-CRM114-Status: GOOD (  11.92  )
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

On Wed, May 13, 2026 at 07:16:52PM +0000, Caleb James DeLisle wrote:
> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> 
> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> require re-training after startup.

s/re-training/retraining/

> + * @MTK_PCIE_RETRAIN: Re-train link to bridge after startup because some
> + *                    Gen2-capable devices start as Gen1.

s/Re-train/Retrain/ to make this consistent and more greppable.
Also more instances below.

> + * as Gen1, and must be re-trained once after initial configuration in order to
> + * only Gen1 capable. Therefore it is most convenient to re-train every port

> +	return dev_err_probe(dev, ret, "root bridge not found\n");

"Root bridge" is not a term used by the specs, but in common usage it
refers to the host bridge, i.e., the RC.  In this case, you didn't
find a "Root Port".

> +found_port:
> +	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK)) {
> +		/* Let it go because the device will work as Gen1 */
> +		dev_warn(dev, "module must be built-in to retrain to Gen2\n");

I suppose this will cause a warning even in cases where Gen2 is
impossible, e.g., the endpoint only supports Gen1?

