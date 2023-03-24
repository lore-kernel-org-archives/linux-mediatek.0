Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFFAC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 10:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW6ABnA/9iNxlsaAPY40PDlJ9esE1i7kxcX4ksYizg4=; b=Oh6Iky5Odnoga/NWAjf8IeqQXM
	CrqZ0kf0wyHT6tRSNDH2wt2dcGn1xxXRUfgsyJ1B6RVrKGVzNMeeqEJEie6whpSyLxankLJUH/bNc
	oNypI6aSkwwneoHy8wbzkdGT/Vo8odvBHtt4TOoRcooWpwLlIQukOk5qPD1KjAL6KDieoikT9QkSb
	ccsB8D2brPXnFGgsv9qA6Lvz+N6qEUEGb6c4kfmn7ESqrESMRY+2X6eHypK4wWs/UgYgTXEtsnIyU
	xDgAB3P1p/X+vU8BkylkVtC5G6bsK2zNwhykWqFA6Njw9gS4Y/I5u59YU+x7JoQj7270Xlas6asox
	7Zrg0XJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfePE-0047Yu-06;
	Fri, 24 Mar 2023 10:12:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfePA-0047XG-2r;
	Fri, 24 Mar 2023 10:12:18 +0000
X-UUID: 57d223eaca2c11edb7d8d11f642b8e78-20230324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CW6ABnA/9iNxlsaAPY40PDlJ9esE1i7kxcX4ksYizg4=;
	b=GzwuRpJ95PDrTcRm03+D8TqN2wGu+mODefZdxPVOuaBEGvwqzNtaHVDzdPpMIIuES3JE5/LCTvM0UnW7xekne9I2R6ARThYcgfGGTvuSwMXLZ63IFSfRylAZmnUV5nIVGiSLpH4CJglv46ag1ynvY7LgeQ4kvCquZ7HFMW5qOO0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:dd797878-7f7b-477f-bc47-05555800728e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:039643b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 57d223eaca2c11edb7d8d11f642b8e78-20230324
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1087893261; Fri, 24 Mar 2023 03:12:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 24 Mar 2023 18:11:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 18:11:37 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kevin
 Hilman <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
	Nick Hainke <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2 1/4] cpufreq: mediatek: fix passing zero to 'PTR_ERR'
Date: Fri, 24 Mar 2023 18:11:27 +0800
Message-ID: <20230324101130.14053-2-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
References: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_031216_937727_0E152E96 
X-CRM114-Status: GOOD (  13.65  )
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

From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>

In order to prevent passing zero to 'PTR_ERR' in
mtk_cpu_dvfs_info_init(), we fix the return value of of_get_cci() using
error pointer by explicitly casting error number.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Fixes: 0daa47325bae ("cpufreq: mediatek: Link CCI device to CPU")
Reported-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 7f2680bc9a0f..01d949707c37 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -373,13 +373,13 @@ static struct device *of_get_cci(struct device *cpu_dev)
 	struct platform_device *pdev;
 
 	np = of_parse_phandle(cpu_dev->of_node, "mediatek,cci", 0);
-	if (IS_ERR_OR_NULL(np))
-		return NULL;
+	if (!np)
+		return ERR_PTR(-ENODEV);
 
 	pdev = of_find_device_by_node(np);
 	of_node_put(np);
-	if (IS_ERR_OR_NULL(pdev))
-		return NULL;
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
 
 	return &pdev->dev;
 }
@@ -401,7 +401,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	info->ccifreq_bound = false;
 	if (info->soc_data->ccifreq_supported) {
 		info->cci_dev = of_get_cci(info->cpu_dev);
-		if (IS_ERR_OR_NULL(info->cci_dev)) {
+		if (IS_ERR(info->cci_dev)) {
 			ret = PTR_ERR(info->cci_dev);
 			dev_err(cpu_dev, "cpu%d: failed to get cci device\n", cpu);
 			return -ENODEV;
-- 
2.18.0


