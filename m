Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400AECD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b9do+hAQBo6g1FHFQMl85AoAoOHv0BK3W42px3GoIXs=; b=NzuW/E2LqILi6PGE3IOfEcnCR5
	Yjk9fUjpk2LfO2uQU/cvtPDBbl0BcQxSlZ/f6eYj4R0aQ8KJYqjcT3pZX/EyRFbCgmOwDIniuZXv0
	71lfvqMgElz65Avvf6b1dc9/452omXqSsZ5+/aPl62uzOVKNxlVqtB2EhkMsCqA74XwmLUREbgoCu
	rkd5etBu+GghzQqpZKwF0kfOcqvlohemrvHVfzk03ScM2PW00+4ZWo9FlXwL58CVLgAo10nr3vW9L
	ed36hpc/CacL2V2RKwO4MILT6PAVARtuste4QTEBt3wRUTbOgJWxstGogRlG3S7GLqSSrbW4u86Cx
	ipJMJ7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rub0i-000000084FM-0HE2;
	Wed, 10 Apr 2024 16:41:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rub0e-000000084E1-2M9E;
	Wed, 10 Apr 2024 16:41:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D789361DE4;
	Wed, 10 Apr 2024 16:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A653C433F1;
	Wed, 10 Apr 2024 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712767275;
	bh=UaluD4a0SUmWueDVbNI4ShgReWWH+xE4Os/5Mmqe5rY=;
	h=From:To:Cc:Subject:Date:From;
	b=gRjlNMBWXV6EELqLlFpjjSSZiUkO+oNkOId39OpfP8dGNqAJJNkLaXL8GPCuCPnJo
	 rnkIJ4cjyHPzkMgk47yfHBeKrGFVXXMRT8Ab8AyEqiiU4aGI9ugWz4d7SprwyPZEo3
	 mTBfClS7dRuSFfIE5JqNssENrSF3hmII8SMM4xH0szzt8UZZS2oJqczbMb2uSZoK1x
	 3MhxoC+++yVt3AVP0/afD/alpHFJ61Jv67JUaRhMLLl/BIR+xugKzXgdXwIrThCN+F
	 PNuV5KVR5mHeNS6B+/kJKFtajePVkU7x31dGrudr0kxydBMuHxJBCWs9YUf0rLtYg5
	 Y+6so0qeFCcWQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] iommu: mtk: fix module autoloading
Date: Wed, 10 Apr 2024 18:41:09 +0200
Message-Id: <20240410164109.233308-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_094116_660741_2D346B2A 
X-CRM114-Status: GOOD (  10.10  )
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

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/mtk_iommu.c    | 1 +
 drivers/iommu/mtk_iommu_v1.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b8c47f18bc26..6a2707fe7a78 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1790,6 +1790,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8365-m4u", .data = &mt8365_data},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_of_ids);
 
 static struct platform_driver mtk_iommu_driver = {
 	.probe	= mtk_iommu_probe,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index a9fa2a54dc9b..d6e4002200bd 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -600,6 +600,7 @@ static const struct of_device_id mtk_iommu_v1_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-m4u", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_v1_of_ids);
 
 static const struct component_master_ops mtk_iommu_v1_com_ops = {
 	.bind		= mtk_iommu_v1_bind,
-- 
2.34.1


