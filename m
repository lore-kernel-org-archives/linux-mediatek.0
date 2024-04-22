Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD625C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 23:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXIt6ZUyKhjfLtel9MlSIEH6UJcGicxjI+obkBKkprQ=; b=qaT3+IaHBj80pgb+SLVu/8YwTG
	t187ONJ2qjuD2aH6UMtc2dnHoPE0pkWbMD20bWLWz3cRz/+nKCmYjchubyNtYM2rVQaGuD7dMMwlH
	8sW8scboIY6Tuv3PjmBLMp3q6GAE5r6uIbP4pNA5BGc7rFk/jiVGb2/+ms8PJpxLCo9cT/YqdEMow
	2hW7k1vU8ape/K6rxsAY2GHF8V9NTRaNcgWu0iDxaothOCLzf51slSHYiLF10BQq5+TnbdKaPekHf
	ICOOybB3WK3hdHgTCFPzVY4F6yGQdU9o2dlCi4kEFCw7pGPuR9wWozG2JDYLSlaipE5EaCbWBRFZn
	b/Cykbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3Y0-0000000FSUC-19eM;
	Mon, 22 Apr 2024 23:58:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3Xw-0000000FSSe-3p9w;
	Mon, 22 Apr 2024 23:58:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29DD3611FC;
	Mon, 22 Apr 2024 23:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CFDC3277B;
	Mon, 22 Apr 2024 23:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713830283;
	bh=ej6Ld74lMeOwzNfWedf8EsdWgF5p/GNnWO/zfutqak8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRt9Mb0DapG9hVyP+QR3Dfe9cArOqt5zujGDN/NSI73SLM2+2DhT+ByNmO+LClQ1q
	 xHKnYCX2C/lUAETTnnTcGUD5o0NWUsusOHaReZCMXnTxkjq1egJxZe5W0PBMb89xau
	 CsyKwXFlIaMgUliOegu1PLgRkOJ12ldm874K+LUEjieICAJDcQEHSgbw5SRGQg8me2
	 oypqN5bpsTlEU+mwFjq8Bzc5BBrHfVZtKDRymxL5h6yY0p7ANRsyQ40kilwlRbmVdT
	 TP75XnRJ+kzZrB9yx1RSxeAMdhgmrP/4tz6IRkxaZRydSBJCcR6EDV9jUuAh082pIj
	 oJL9vG4usgcfA==
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
Subject: [PATCH AUTOSEL 6.1 19/19] iommu: mtk: fix module autoloading
Date: Mon, 22 Apr 2024 19:18:33 -0400
Message-ID: <20240422231845.1607921-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231845.1607921-1-sashal@kernel.org>
References: <20240422231845.1607921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.87
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_165805_027643_8A7693AD 
X-CRM114-Status: GOOD (  10.32  )
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
index 0ba2a63a9538a..576163f88a4a5 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1570,6 +1570,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8195-iommu-vpp",   .data = &mt8195_data_vpp},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_of_ids);
 
 static struct platform_driver mtk_iommu_driver = {
 	.probe	= mtk_iommu_probe,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index a978220eb620e..5dd06bcb507f6 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -602,6 +602,7 @@ static const struct of_device_id mtk_iommu_v1_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-m4u", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_v1_of_ids);
 
 static const struct component_master_ops mtk_iommu_v1_com_ops = {
 	.bind		= mtk_iommu_v1_bind,
-- 
2.43.0


