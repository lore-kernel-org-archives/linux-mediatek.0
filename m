Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8598C3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 02:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Z2wzmI8dgxrpulUWgeoh6/Sd2+6AGOoVETN0WTE9p8=; b=q2H0kYf0tN4w9dcCRFNJqT2rBM
	XqyVFPfRX8R1HelQPoHr2UfNVkWv0CwYG6MmMfRDtCw6gTpK4FQBSD50rkVt/YcgzAw6PZVNGmEXD
	Siv7gkO/AHEc3xBbDnp4ibqbe2IoqCxQt16hER1ZkYos06f4wirXnfHcwDAJ4D8uu+FZVOj7VfHbj
	2r5+ZtZBs0Aoss2W7qOVXkcGZUOM0h/3NBbLWdv2gaq0thZ5p0oe7cytglB1MBjcw8C8W3jXxpGh9
	F5UpNd2Jq1Akzy8by4iN/EkAMsSwT5PacCCk+/j2DekLnOhCTT+mfuU7IoBXmOU1xyHp6kIEO1Rq4
	Rlh6NaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWp59-007Wzs-2e;
	Fri, 18 Aug 2023 02:19:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWp55-007Wyi-0q;
	Fri, 18 Aug 2023 02:19:21 +0000
X-UUID: 7e0e791e3d6d11ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2Z2wzmI8dgxrpulUWgeoh6/Sd2+6AGOoVETN0WTE9p8=;
	b=sneZgkzYS0MAm93o2qcyOIC/zR6QZVmHLs06UH1e9g5Ket936tHNTtDhxU4qeRnUFlsiOfzqfUI+ycmR9qsLGZSr9DHO1+IslyQuueSw8Swdy9Xi0U1Ikyz2gwRsmzmby97eqtdHg4O5OtJgMdfhokPVyAlcDl9pJm3JUGKifig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:ab4228c5-c158-465f-b37e-361d25e77460,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:eff4fcc1-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7e0e791e3d6d11ee83ed1395ce914268-20230817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1504617665; Thu, 17 Aug 2023 19:18:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 18 Aug 2023 10:17:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 18 Aug 2023 10:17:44 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH] PM / devfreq: mediatek: protect oop in critical session
Date: Fri, 18 Aug 2023 10:17:41 +0800
Message-ID: <20230818021741.6173-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_191919_308172_C1A76469 
X-CRM114-Status: GOOD (  13.18  )
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

mtk_ccifreq_opp_notifier is reenter function when policy0 / policy6
change freq, so metex_lock should protect all OPP event.

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/devfreq/mtk-cci-devfreq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 83a73f0ccd80..b0ed25e33f2b 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -137,6 +137,8 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 	if (drv->pre_freq == *freq)
 		return 0;
 
+	mutex_lock(&drv->reg_lock);
+
 	inter_voltage = drv->inter_voltage;
 	cci_pll = clk_get_parent(drv->cci_clk);
 
@@ -147,8 +149,6 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 		return PTR_ERR(opp);
 	}
 
-	mutex_lock(&drv->reg_lock);
-
 	voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
 
@@ -227,9 +227,9 @@ static int mtk_ccifreq_opp_notifier(struct notifier_block *nb,
 	drv = container_of(nb, struct mtk_ccifreq_drv, opp_nb);
 
 	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
+		mutex_lock(&drv->reg_lock);
 		freq = dev_pm_opp_get_freq(opp);
 
-		mutex_lock(&drv->reg_lock);
 		/* current opp item is changed */
 		if (freq == drv->pre_freq) {
 			volt = dev_pm_opp_get_voltage(opp);
-- 
2.18.0


