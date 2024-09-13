Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72822FA3743
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbFE54p5YQWTJB15O5Q9PNu5uByvL0/k1s8swtLuwZ8=; b=L1IRWu/Rz+GPOtSn5zOGRY3Fzz
	O4ss4zk60zkk0Ml48fUtGoqV0BWm2h1aChLVNBtkCFFd9zAij1x8sHGw8NeTSlnQaY6hhMIDzprE3
	oEpTbuWeW9JbN1WKWzT5AfU26HdeOk/sonHvD/K0DkWfujuwpODWLPsRg2pRooJI4xpT/RX7TAPkP
	SHTo0fFtjl1LWg3Rk3xvE3FeOITvWsMuZy94CbKNMBPQrhspUERfsdl3BHFKTUHMDSwpapte+NTJk
	pXPmMuN9lwqX1jSCLw5X70egztGMa1R/uSOTnIIY6A0Teh9/Ajj/fhfBklxk/ckyIKDs6si+tBwTk
	bPZ4sPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3ta-0000000Ffw1-0GUq;
	Fri, 13 Sep 2024 10:51:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3s0-0000000Ffcg-3cgt;
	Fri, 13 Sep 2024 10:49:46 +0000
X-UUID: e1f06ef871bd11efba0aef63c0775dbf-20240913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dbFE54p5YQWTJB15O5Q9PNu5uByvL0/k1s8swtLuwZ8=;
	b=XHy+qyJMcPvPp//VBBy0WH0mFbSx91oHXvyXzR5NTAdY8Wj/hIsCnoPN8qGHLM1X/gdVvuFLHcF3yN3jzMDs2TcyfWjyRFL1OMr7t4BbyGyrQb8k1DiYop6ur9gJOpg9MrJ2g2mMHIHGcr0s3g4XoC6H1DqqTIQJ2nu9wDclWRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2038894e-dc93-4e5c-957a-7a3b1383efaa,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:ed0decbf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e1f06ef871bd11efba0aef63c0775dbf-20240913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 912220900; Fri, 13 Sep 2024 03:49:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Sep 2024 18:39:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Sep 2024 18:39:37 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v1 1/2] PM / devfreq: mediatek: protect oop in critical session
Date: Fri, 13 Sep 2024 18:39:32 +0800
Message-ID: <20240913103933.30895-2-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240913103933.30895-1-chun-jen.tseng@mediatek.com>
References: <20240913103933.30895-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.484100-8.000000
X-TMASE-MatchedRID: LAlCrEnopVXUzvcPSorAlFz+axQLnAVBtGonEOW5g+agaf0+XUrNk3kk
	h754FS8n6DB7yJ7eUTP0VyIrxg+OJcZEoJx1HltluIwLnB3Aqp25+1figft3Lg5SzgJNSArLkVq
	DBn//HhImL4e5hLr+f0mZgncXR4mgGAdnzrnkM48URSScn+QSXt0H8LFZNFG7doMssNsUwYVV2Y
	FKivUXnovjZuoPNVwq7Ouc1TlJj0nz/pMg4hZ1PL27cYXrOln+oV7D15FntQdDvz+t8eVtJ0AAL
	As+DNqOStqwsbgFR/qAhOcaQrQ0U1GyRcoeF18qmKP0zzpTAeGwod8xOMKmvA1Aka/KIp/p
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.484100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FC2A249B0FAC5904A78B645CACC39F666E4A44308525607319F5BE191941A9442000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_034944_922413_279B7DD0 
X-CRM114-Status: GOOD (  15.07  )
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

mtk_ccifreq_target() & mtk_ccifreq_opp_notifier() is re-enter funtion
when cpufreq governor is more than one. It should add global mutex to
protect OPP , avoid get wrong frequency & voltage.

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/devfreq/mtk-cci-devfreq.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 7ad5225b0381..293cf81e53fe 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -29,13 +29,14 @@ struct mtk_ccifreq_drv {
 	struct clk *inter_clk;
 	int inter_voltage;
 	unsigned long pre_freq;
-	/* Avoid race condition for regulators between notify and policy */
-	struct mutex reg_lock;
 	struct notifier_block opp_nb;
 	const struct mtk_ccifreq_platform_data *soc_data;
 	int vtrack_max;
 };
 
+/* Avoid race condition for regulators between notify and policy */
+static DEFINE_MUTEX(reg_lock);
+
 static int mtk_ccifreq_set_voltage(struct mtk_ccifreq_drv *drv, int new_voltage)
 {
 	const struct mtk_ccifreq_platform_data *soc_data = drv->soc_data;
@@ -125,22 +126,20 @@ static int mtk_ccifreq_set_voltage(struct mtk_ccifreq_drv *drv, int new_voltage)
 static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 			      u32 flags)
 {
-	struct mtk_ccifreq_drv *drv = dev_get_drvdata(dev);
+	struct mtk_ccifreq_drv *drv;
 	struct clk *cci_pll;
 	struct dev_pm_opp *opp;
 	unsigned long opp_rate;
 	int voltage, pre_voltage, inter_voltage, target_voltage, ret;
 
+	mutex_lock(&reg_lock);
+
+	drv = dev_get_drvdata(dev);
 	if (!drv)
 		return -EINVAL;
 
-	if (drv->pre_freq == *freq)
-		return 0;
-
-	mutex_lock(&drv->reg_lock);
-
-	inter_voltage = drv->inter_voltage;
 	cci_pll = clk_get_parent(drv->cci_clk);
+	inter_voltage = drv->inter_voltage;
 
 	opp_rate = *freq;
 	opp = devfreq_recommended_opp(dev, &opp_rate, 1);
@@ -206,7 +205,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 	}
 
 	drv->pre_freq = *freq;
-	mutex_unlock(&drv->reg_lock);
+	mutex_unlock(&reg_lock);
 
 	return 0;
 
@@ -214,21 +213,23 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 	mtk_ccifreq_set_voltage(drv, pre_voltage);
 
 out_unlock:
-	mutex_unlock(&drv->reg_lock);
+	mutex_unlock(&reg_lock);
 	return ret;
 }
 
 static int mtk_ccifreq_opp_notifier(struct notifier_block *nb,
 				    unsigned long event, void *data)
 {
-	struct dev_pm_opp *opp = data;
+	struct dev_pm_opp *opp;
 	struct mtk_ccifreq_drv *drv;
 	unsigned long freq, volt;
 
+	mutex_lock(&reg_lock);
+
+	opp = data;
 	drv = container_of(nb, struct mtk_ccifreq_drv, opp_nb);
 
 	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
-		mutex_lock(&drv->reg_lock);
 		freq = dev_pm_opp_get_freq(opp);
 
 		/* current opp item is changed */
@@ -236,8 +237,8 @@ static int mtk_ccifreq_opp_notifier(struct notifier_block *nb,
 			volt = dev_pm_opp_get_voltage(opp);
 			mtk_ccifreq_set_voltage(drv, volt);
 		}
-		mutex_unlock(&drv->reg_lock);
 	}
+	mutex_unlock(&reg_lock);
 
 	return 0;
 }
@@ -262,7 +263,6 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 	drv->dev = dev;
 	drv->soc_data = (const struct mtk_ccifreq_platform_data *)
 				of_device_get_match_data(&pdev->dev);
-	mutex_init(&drv->reg_lock);
 	platform_set_drvdata(pdev, drv);
 
 	drv->cci_clk = devm_clk_get(dev, "cci");
-- 
2.45.2


