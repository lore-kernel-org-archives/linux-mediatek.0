Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83766C71132
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 02:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y9wESq3yLX5gwIyFrtLmnOhsV7s06v0xZ8e8yqmasio=; b=F4xOnt9tMw+mkrb9jTMlpK4nDL
	5C8rSz1e4rtSZp15nuL6ATx5ShFfII7ZtWk3dZ+VZbGodvnviF/l/t2S7lhvGZ/c39kjViKmSzW3n
	fXaTgodFb2QdUWAni47++GlJmdoXzoXnMlQJMD47gVXAEh3UZT3ZnIbe+TkDSqpTNamaEzeR1vTby
	86rvn3ZrEOVLCPNgtxzQ+ZQ0a0131GxcAxt/QxQToz6P2E4Nz/kmna0I7BPUxQf+ZyC2XpGTvTdFl
	UNhmFxfZmJ4FBOppLFQuo/UMXldpmcORsvBqlGF9hJMuRg+00/lkfvO6jBCzonjDLpalfP4GD8kdD
	hL+jr+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWpCA-007XQd-0W;
	Fri, 18 Aug 2023 02:26:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWpC4-007XQ8-0t;
	Fri, 18 Aug 2023 02:26:36 +0000
X-UUID: 9ef9e3a63d6e11ee912e1518a6540028-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=y9wESq3yLX5gwIyFrtLmnOhsV7s06v0xZ8e8yqmasio=;
	b=k/TeQ7U4fWg0Nb/079F/2v9r8CZNSvkKqvvG5LJwzY9036+E4dUMLaRrHwbEO7y4veztTWW/ksfs5jsZth762hErcIPn0+D0XX15y3TOoAVEZ7ciQ6JVqsJM+MKdsun044ThqxYK256XNi3QoW1lmtHKnuGGnd92JCBTsBZj/Y0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:dbd4578a-5248-4c54-8c5e-fdae4a3810b2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:950dfdc1-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9ef9e3a63d6e11ee912e1518a6540028-20230817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1163468116; Thu, 17 Aug 2023 19:26:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 18 Aug 2023 10:06:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 18 Aug 2023 10:06:18 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <sumitg@nvidia.com>,
	<sanjayc@nvidia.com>
CC: <rafael.j.wysocki@intel.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH] cpufreq: mediatek: change transition delay for MT8186
Date: Fri, 18 Aug 2023 10:06:16 +0800
Message-ID: <20230818020616.4748-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_192633_471050_F799FCC2 
X-CRM114-Status: GOOD (  12.41  )
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

For MT8186, it has policy0 and policy6 by different governor thread,so
it may be call cpufreq->set_target_index() by different core. In general
case, it must check BCPU, LCPU and CCI together then take about 10ms.

Atfer 44295af5019f this patch, it may call cpufreq_out_of_sync() by
cpufreq_verify_current_freq() because current frequency is bigger
than clk_get_rate() ouver 1Mh. By the same time, it may call
cpufreq->set_target_index() again. So, the CCI freq may be too lower for
BCPU cause BCPU kernel panic.

So, it should change the default transition delay 1ms to 10ms. It can
promise the next freq setting then governor trigger new freq change.

Fixes: 44295af5019f ("cpufreq: use correct unit when verify cur freq")
Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index a0a61919bc4c..5633a5357e8f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -23,6 +23,7 @@ struct mtk_cpufreq_platform_data {
 	int sram_min_volt;
 	int sram_max_volt;
 	bool ccifreq_supported;
+	unsigned int transition_delay_us;
 };
 
 /*
@@ -595,6 +596,7 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->freq_table = freq_table;
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
+	policy->transition_delay_us = info->soc_data->transition_delay_us;
 
 	return 0;
 }
@@ -689,6 +691,7 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
 	.sram_min_volt = 0,
 	.sram_max_volt = 1150000,
 	.ccifreq_supported = false,
+	.transition_delay_us = 1000,
 };
 
 static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
@@ -698,6 +701,7 @@ static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
 	.sram_min_volt = 0,
 	.sram_max_volt = 1350000,
 	.ccifreq_supported = false,
+	.transition_delay_us = 1000,
 };
 
 static const struct mtk_cpufreq_platform_data mt7623_platform_data = {
@@ -705,6 +709,7 @@ static const struct mtk_cpufreq_platform_data mt7623_platform_data = {
 	.max_volt_shift = 200000,
 	.proc_max_volt = 1300000,
 	.ccifreq_supported = false,
+	.transition_delay_us = 1000,
 };
 
 static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
@@ -714,6 +719,7 @@ static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
 	.sram_min_volt = 0,
 	.sram_max_volt = 1150000,
 	.ccifreq_supported = true,
+	.transition_delay_us = 1000,
 };
 
 static const struct mtk_cpufreq_platform_data mt8186_platform_data = {
@@ -723,6 +729,7 @@ static const struct mtk_cpufreq_platform_data mt8186_platform_data = {
 	.sram_min_volt = 850000,
 	.sram_max_volt = 1118750,
 	.ccifreq_supported = true,
+	.transition_delay_us = 10000,
 };
 
 static const struct mtk_cpufreq_platform_data mt8516_platform_data = {
@@ -732,6 +739,7 @@ static const struct mtk_cpufreq_platform_data mt8516_platform_data = {
 	.sram_min_volt = 0,
 	.sram_max_volt = 1310000,
 	.ccifreq_supported = false,
+	.transition_delay_us = 1000,
 };
 
 /* List of machines supported by this driver */
-- 
2.18.0


