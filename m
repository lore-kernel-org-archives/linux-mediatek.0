Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB99C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 23:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTMfRM6aRrDzjp5fMoefwX+W/Dk2uJRLN6BW9gf4NoA=; b=bo1468ijn+OHR2pRBbP80RDW4Q
	EGcHiTQVfrEUnMUDfpauQh4IircqOAKydyeYPqRKIsAyZ5n0cplDqgHdV5LK1vHzFjn9/twMP6bXr
	1HrP/IeO8eWjOUCJlp5NOCR5SAeqALAwFE/ve5PUxFM4PBuPX0Kc7oDGsfiOe4Dqan/s4b688eb+m
	0i25Q+jnO+N/FqHGfdcUEOSdsCP66csmFTk4pHREncJ93YawILCvIEDon2GxHIiqrvPwiYdiGp92N
	D4ZaDmamf3nk1dIpRVlLxCoptvHwv2CkXiKuLXxnbOzXTEGhUM9qu9WoBAzVub8gN0HcH2LmqYXTY
	8UVY8LUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3ZU-0000000FT3t-31zp;
	Mon, 22 Apr 2024 23:59:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3ZQ-0000000FT10-1Ccc;
	Mon, 22 Apr 2024 23:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 619F3CE0EB9;
	Mon, 22 Apr 2024 23:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27049C4AF0A;
	Mon, 22 Apr 2024 23:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713830372;
	bh=h1CmKPJ1Sae/CFF9eC+XbaOrI2RMfb8SzeJvTVCkKG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eWKfYzqPH46fKf9bM+TB3ZDCUy9602NXtm2u+5AaqsDu6D6YBMOpwM5Wuw/9LStPx
	 uv1OKU3JmIKH5laPyoOrxXJtoZDIW+5PEvVsOUHpnh5fjCHGKxt8/e6Sddlw7Qwsjw
	 Yygc7TvKFKwniaPBnhXXTNBEU2mETW3Avx9ErMMPLGoxd7F6cUfVGbdKgOEMNQmtFp
	 3NU1M0CtEzQmRdctiekyKExVT1+3a7/3pc1zrlMqeIbmdxgL0hRciPR3QLP3T87YH+
	 r2AAF1Cs/Q2iupYhR/9U+6VhTxXiEFPWMbuTbloe/hOC7KbmQtvDKCIS3FHFJ6Ep8t
	 zw0TvQ6+LH9Aw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Joerg Roedel <jroedel@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	yong.wu@mediatek.com,
	joro@8bytes.org,
	will@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 7/7] iommu: mtk: fix module autoloading
Date: Mon, 22 Apr 2024 19:20:39 -0400
Message-ID: <20240422232040.1616527-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422232040.1616527-1-sashal@kernel.org>
References: <20240422232040.1616527-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.312
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_165936_594072_4299BCF6 
X-CRM114-Status: GOOD (  10.22  )
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

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit 7537e31df80cb58c27f3b6fef702534ea87a5957 ]

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/20240410164109.233308-1-krzk@kernel.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/mtk_iommu.c    | 1 +
 drivers/iommu/mtk_iommu_v1.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 7304ad88f1263..93a47302d6cfc 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -761,6 +761,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8173-m4u", .data = (void *)M4U_MT8173},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_of_ids);
 
 static struct platform_driver mtk_iommu_driver = {
 	.probe	= mtk_iommu_probe,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 94b16cacb80fc..709a2ab1d4cf7 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -541,6 +541,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-m4u", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_v1_of_ids);
 
 static const struct component_master_ops mtk_iommu_com_ops = {
 	.bind		= mtk_iommu_bind,
-- 
2.43.0


