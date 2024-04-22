Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93515C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 23:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI0W2sFYYeoECwl13B0pgmcBTSdkSej67tsuIx+B8Rs=; b=f98M0Yuyxn7n1hKBiIJYKPpTU4
	miI8sC6+TyzERqja5IM4QgjlzmikMcIWA3KZaxKdX63PZ+wGjT9+/rdaHqYLbeuFlVIDSILMU5TWe
	s2q1MOZGQt3NAPBB2Y8fO43Wjg6g/+KceugXggVug6UEbe6DeSshIJjnPms9Od2EIoiKcZUy2mg9e
	aDvJFgQFrBzpJPJ92Dx6s89KKRPB5cnY+fCNSMuII49NvMpS2HtKStkyUHKTnvVpbkP6tixBurQcq
	5PTAUQmISSwXt+H9Zrz6Rl1d/GunFldbfUFTlg3Rqr6TejO77k9SQDVYEXjh5/nXZFDvewlxQBqVR
	/ZVY+LBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3YT-0000000FSfy-0yB6;
	Mon, 22 Apr 2024 23:58:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3YP-0000000FSdN-0Bg3;
	Mon, 22 Apr 2024 23:58:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03D17CE0E16;
	Mon, 22 Apr 2024 23:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BCCC113CC;
	Mon, 22 Apr 2024 23:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713830310;
	bh=i1qI41SgWsD0p/gzHp7ffpMwE2vMBIHK3+jdxiiH38I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZeHeSjQc/RpBM4+bh0g4KoS/KAESqVX62B04WYj9toEBx2jgiv3vPUq0JgDQsLIW
	 83kOvCEgzPQDf44WPepTt/pLM3GY9QDj1Fsx3iVYBSm9a1ZONjcb+G4mZg+MpJks/W
	 2FcpYbWzqsI5j36Jn01eyBCwF/DFa4gntLZAZlgXZc9wm6uW5db9LsH7m+/eqZbbWk
	 L6tBTxCJAjC7RxyXjKgahGUp4bA0cu1urjp7bNnk9H8dYhZNO66ji8Rld6VNOqNz+i
	 qGacrPQvyP+o12EC02U8vzF7bJ6NsbWovFbpNFicRs80LPFZTv60F3XIngpHDuVUmU
	 4HkTmz5g/q57g==
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
Subject: [PATCH AUTOSEL 5.15 10/10] iommu: mtk: fix module autoloading
Date: Mon, 22 Apr 2024 19:19:23 -0400
Message-ID: <20240422231929.1611680-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231929.1611680-1-sashal@kernel.org>
References: <20240422231929.1611680-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.156
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_165833_285647_B8343FF7 
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
index 2ae46fa6b3dee..04ac40d11fdff 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1101,6 +1101,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_of_ids);
 
 static struct platform_driver mtk_iommu_driver = {
 	.probe	= mtk_iommu_probe,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index fe1c3123a7e77..3a52f6a6ecb32 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -576,6 +576,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-m4u", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_v1_of_ids);
 
 static const struct component_master_ops mtk_iommu_com_ops = {
 	.bind		= mtk_iommu_bind,
-- 
2.43.0


