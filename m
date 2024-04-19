Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C8FC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XvL6Vqns5mJ/WcZDsCmbSuGjXG3mnpsrxpCNXocM/GE=; b=HDD5tBbPwFK1yiTyjcR+/fdSx+
	ZZPXMahhOFmH8BceEAOHmCa2Ox2nlVJWMcdbB2VAPe4W4pTfgAC1+DHCIis/JYu/trY3qLIdIKu+X
	8NZwUo3TrgsLmYDhPkZfPzcew93M6nF3RmwMuyglrOLU3n+K9e789HIF8SKO/kezsEAV8/LxjM9i7
	c6KfiNidSXhJowwkhOVIAEZPNrozry+cIfEg+A3I+dh69Y9diJRBzEWBNItiwtsWVhQdrlHaBpuVn
	wdpAKycyLvHSd/gY822gITDp0PS9RPJEvJWEdCJYQWS2PqmBpc4Ho8SmTAZfqaKK5EA2SVCj727Y9
	4k9g2OfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxraD-00000006TDw-12in;
	Fri, 19 Apr 2024 16:59:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxraA-00000006TCQ-0sc5;
	Fri, 19 Apr 2024 16:59:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1rxra0-000000007Nq-26mP;
	Fri, 19 Apr 2024 16:59:16 +0000
Date: Fri, 19 Apr 2024 17:59:07 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] cpufreq: mediatek: Add support for MT7988A
Message-ID: <acf4fb446aacfbf6ce7b6e94bf3aad303e0ad4d1.1713545923.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_095926_340480_4B77A883 
X-CRM114-Status: GOOD (  10.82  )
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

From: Sam Shih <sam.shih@mediatek.com>

This add cpufreq support for mediatek MT7988A SoC.

The platform data of MT7988A is different from previous MediaTek SoCs,
so we add a new compatible and platform data for it.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index a0a61919bc4c..518606adf14e 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -707,6 +707,15 @@ static const struct mtk_cpufreq_platform_data mt7623_platform_data = {
 	.ccifreq_supported = false,
 };
 
+static const struct mtk_cpufreq_platform_data mt7988_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 200000,
+	.proc_max_volt = 900000,
+	.sram_min_volt = 0,
+	.sram_max_volt = 1150000,
+	.ccifreq_supported = true,
+};
+
 static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
 	.min_volt_shift = 100000,
 	.max_volt_shift = 200000,
@@ -740,6 +749,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
 	{ .compatible = "mediatek,mt7623", .data = &mt7623_platform_data },
+	{ .compatible = "mediatek,mt7988a", .data = &mt7988_platform_data },
 	{ .compatible = "mediatek,mt8167", .data = &mt8516_platform_data },
 	{ .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },
-- 
2.44.0


