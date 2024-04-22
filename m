Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14CBC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 23:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TyxNHgfgTvHggndMBCZDMTOEqFaH/idaLOitxFDxH0=; b=SB9omnCtIG+ybu3Xic62lVjnw5
	6uGNVyyQFfg/M3Ey5khfDMEOVc+B352QLV9Y0C1SvBTi5BywJQTPiIyTT3tk9rYajT3qLUhY0d0ke
	C1idv2+rX97t/k9/FIWSbGIePx2U6L5Gls7ZVFUkm5pdd0FzajTNLbYgeI4qH3L3trcpGBNsJSJbI
	2uMd2fF2qGopQlAZmXGGWeJ/rgwMWVP5u5ont3YhwHVHjfvBFD5+lFRse4RCxaL4DA2WKSiZId+cJ
	FKlQKS6CfVNClYSgp+yaSad7dkGBd8HfEVLtmMihHATYjevll9CM0SPSaOA1wLannAX9zkLzo8vbZ
	jSCSRXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3XC-0000000FSCy-1vEx;
	Mon, 22 Apr 2024 23:57:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz3X8-0000000FSAp-23qD;
	Mon, 22 Apr 2024 23:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B05C3611FA;
	Mon, 22 Apr 2024 23:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E5FC113CC;
	Mon, 22 Apr 2024 23:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713830233;
	bh=65ektcJxj9Rrw0TFcZac08x3l77hf5zTMlc2nDRY7HI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b8pyL2i11eKGlMtYagYvO8PDiHRcWMm40gXxz7HhjR7jCtfutzeB5WqQN3/nxftPw
	 jd076UXm0ONL7GjcaFbVeVhmSw9UuaMcAjftIltKWOjSSJIFlAAJeM5hPdoNiK9Qvh
	 LKYN9eNdHVDFGx7i2OAaweKj48wMVhgcP43G1qliiKAXyz0Kt9x9/6IqXuFk/TLaJM
	 ioHg9hCQIebOW6k20U6qfa/G5OnALbTmCV7lGwnTArHtnyZNb9IptQJBCrd+w9quOV
	 /mSBi5nfX4iMTfpE1LyHKdIlcnhOUKiDN+5vhnwSueLHLxgz8Eu/UFyBukjQ/Qj22u
	 EK0/Uk7lRhUdg==
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
Subject: [PATCH AUTOSEL 6.6 29/29] iommu: mtk: fix module autoloading
Date: Mon, 22 Apr 2024 19:17:10 -0400
Message-ID: <20240422231730.1601976-29-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231730.1601976-1-sashal@kernel.org>
References: <20240422231730.1601976-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.28
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_165715_084538_ADDA212A 
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
index fab6c347ce578..de698463e94ad 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1773,6 +1773,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8365-m4u", .data = &mt8365_data},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_iommu_of_ids);
 
 static struct platform_driver mtk_iommu_driver = {
 	.probe	= mtk_iommu_probe,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 8a0a5e5d049f4..f1754efcfe74e 100644
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
2.43.0


