Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE453C44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZ8WB5K9zOpz8B7RVsBRvJMu8rjP/XfcLsCdxGxT4Qg=; b=WKdlwIJnnLR+oHV4uxNVQlBzBi
	Wz7aw2yR+WFblV1EAWr8tZS6gYkfMZttgdYL791hquP9bdzCzhcMmfapB/9hAZkVSeueFcXSctQFn
	z8gTAnbHAoEkenmPm9pWkuVoyszVKn1aMziP2yUVyPkhN19OhN7Q0b/m+LkHkqZbNF96bSvQsQSb0
	x+3sL6gMahonfVq4ULHF2N3WjVN9Zbz8rVW5dQBp9Q5MNrC9/NKfYSuzYwkgLjStm/U9T7mov5il1
	MerIK1aj76KInpNHUhkiuweA50aTrogVrKAjXo/kZyV/cd0aNcsHTJAE1YtrnI176X7ubzPRw95RE
	3ZB/55Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk03t-0000000F0NC-2VxK;
	Wed, 15 Jul 2026 13:54:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk03r-0000000F0ME-3qzX
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 13:54:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D4874118F;
	Wed, 15 Jul 2026 13:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260871F000E9;
	Wed, 15 Jul 2026 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123647;
	bh=PZ8WB5K9zOpz8B7RVsBRvJMu8rjP/XfcLsCdxGxT4Qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TOuoMKTi69l7MXLyrzm6JPIkVSMBxS6BsLzPWHT2TLhANOTbMtnK4Qca+EMMywJ7Q
	 FCg254trVDbgZcbjWDu3T/DsC0Zt+UI46tTiF1t84hbod+lagjJ+w8N6W4vC46Lhw6
	 aFB6D6YTTU3Rz/+m/wLjWUqimbwTms99C03NAQatt2jMmMz6m9raFbp2ZWSiB0DRZz
	 RuYbGpj1FbJCOQ8syk0o/es650gids9Iqklb7I0+GFBIr7/qpP7h2RZyWVxB5C4nnO
	 JAGWG6sZi5X1ENvxRAd5o6/Lij2TBldZRdtbMcFHBPBJSwFgT8+NgdQc7Ov8ad32jH
	 krE70R6dCBxQw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, ryder.lee@mediatek.com, 
 helgaas@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260702150704.265282-1-cjd@cjdns.fr>
References: <20260702150704.265282-1-cjd@cjdns.fr>
Subject: Re: [PATCH v11] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-Id: <178412364176.146277.15805522323299213700.b4-ty@b4>
Date: Wed, 15 Jul 2026 15:54:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Thu, 02 Jul 2026 15:07:04 +0000, Caleb James DeLisle wrote:
> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> 
> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> require re-training after startup.

Applied, thanks!

[1/1] PCI: mediatek: Add support for EcoNet EN7528 SoC
      commit: 2077ccb9baa2cbbbccf5f0d8c2196dd9d5e43399

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



