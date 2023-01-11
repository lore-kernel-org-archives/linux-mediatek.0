Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9D3C5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7yNvUj+1iWfdSzh60OgaeHK/98sY0UhtMzQV5RG5IE=; b=Si0S+YDy9RKDU782DmD4dWbIk3
	rFuhhKkmr6grWFBydzzn1dlLlpc9QwZxwCOfRgihz2tVnaA2usLLr4/xu6EuqArncfjCHmjXWwop+
	w1LmiWg6kk/QhwkKr1wjhrwNq1ukFR00eLT6d+ge+dQoTXmpjQUJ4dcl36aEDHuEHE6eDbvkbEjtQ
	3ES8SrvmyYrKq503HfgtmmDYkTDgtbA9uXmJ3PmeNoSuuAH+ARkxnmiF7kAqgdj4y04s63RBDcKPk
	YkxUbLV/AZdp4M7JP/+l5yODhwujw2fNJA8Nuo8mu0ATTJiIRdqmCuqXLJC6OQQIRjn1EE9lMwzUn
	fLRH0u6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVq1-00A7mG-R0; Wed, 11 Jan 2023 07:47:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVoK-00A6do-5m; Wed, 11 Jan 2023 07:46:15 +0000
X-UUID: ff909d78918311eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b7yNvUj+1iWfdSzh60OgaeHK/98sY0UhtMzQV5RG5IE=;
	b=VHbWunAZ/lHLCYHSkp0yG6DBHSCDAzgM/k5moPOX+2dNVmArRNiSwET9OqwAQF0cmRkq85LZ2aRtIAx7RhjHisM6j3dVfr52p9I1ip/kSN6eyfrosq/KLo5SxHN+vPnwZa0whCrasxTmb5Gf7pHx33fL4jG+kmNyk0mRFnQxyF4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:86ae921f-3098-4ca3-8ad8-67bc7a982650,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:2ab15354-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: ff909d78918311eda08d4d6090ec5a5c-20230111
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1778187566; Wed, 11 Jan 2023 00:46:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 15:45:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 15:45:30 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 05/14] soc: mediatek: mtk-svs: use svs clk control APIs
Date: Wed, 11 Jan 2023 15:45:19 +0800
Message-ID: <20230111074528.29354-6-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111074528.29354-1-roger.lu@mediatek.com>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_234612_272024_2957C777 
X-CRM114-Status: GOOD (  18.69  )
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

In MediaTek HW design, svs and thermal both use the same clk source.
It means that svs clk reference count from CCF includes thermal control
counts. That makes svs driver confuse whether it disabled svs's main clk
or not from CCF's perspective and lead to turn off their shared clk
unexpectedly. Therefore, we add svs clk control APIs to make sure svs's
main clk is controlled well by svs driver itself.

Here is a NG example. Rely on CCF's reference count and cause problem.

thermal probe (clk ref = 1)
-> svs probe (clk ref = 2)
   -> svs suspend (clk ref = 1)
      -> thermal suspend (clk ref = 0)
      -> thermal resume (clk ref = 1)
   -> svs resume (encounter error, clk ref = 1)
   -> svs suspend (clk ref = 0)
      -> thermal suspend (Fail here, thermal HW control w/o clk)

Fixes: a825d72f74a3 ("soc: mediatek: fix missing clk_disable_unprepare() on err in svs_resume()")
Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 57 ++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 9575aa645643..830263bad81e 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -326,6 +326,7 @@ static const u32 svs_regs_v2[] = {
  * @bank_max: total number of svs banks
  * @efuse: svs efuse data received from NVMEM framework
  * @tefuse: thermal efuse data received from NVMEM framework
+ * @clk_cnt: clock count shows the clk enable/disable times by svs driver
  */
 struct svs_platform {
 	char *name;
@@ -343,6 +344,7 @@ struct svs_platform {
 	u32 bank_max;
 	u32 *efuse;
 	u32 *tefuse;
+	s32 clk_cnt;
 };
 
 struct svs_platform_data {
@@ -502,6 +504,32 @@ static void svs_switch_bank(struct svs_platform *svsp)
 	svs_writel_relaxed(svsp, svsb->core_sel, CORESEL);
 }
 
+static bool svs_is_clk_enabled(struct svs_platform *svsp)
+{
+	return svsp->clk_cnt > 0 ? true : false;
+}
+
+static int svs_clk_enable(struct svs_platform *svsp)
+{
+	int ret;
+
+	ret = clk_prepare_enable(svsp->main_clk);
+	if (ret) {
+		dev_err(svsp->dev, "cannot enable main_clk: %d\n", ret);
+		return ret;
+	}
+
+	svsp->clk_cnt++;
+
+	return 0;
+}
+
+static void svs_clk_disable(struct svs_platform *svsp)
+{
+	clk_disable_unprepare(svsp->main_clk);
+	svsp->clk_cnt--;
+}
+
 static u32 svs_bank_volt_to_opp_volt(u32 svsb_volt, u32 svsb_volt_step,
 				     u32 svsb_volt_base)
 {
@@ -1569,6 +1597,12 @@ static int svs_suspend(struct device *dev)
 	int ret;
 	u32 idx;
 
+	if (!svs_is_clk_enabled(svsp)) {
+		dev_err(svsp->dev, "svs clk is disabled already (%d)\n",
+			svsp->clk_cnt);
+		return 0;
+	}
+
 	for (idx = 0; idx < svsp->bank_max; idx++) {
 		svsb = &svsp->banks[idx];
 
@@ -1590,7 +1624,7 @@ static int svs_suspend(struct device *dev)
 		return ret;
 	}
 
-	clk_disable_unprepare(svsp->main_clk);
+	svs_clk_disable(svsp);
 
 	return 0;
 }
@@ -1600,16 +1634,14 @@ static int svs_resume(struct device *dev)
 	struct svs_platform *svsp = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(svsp->main_clk);
-	if (ret) {
-		dev_err(svsp->dev, "cannot enable main_clk, disable svs\n");
+	ret = svs_clk_enable(svsp);
+	if (ret)
 		return ret;
-	}
 
 	ret = reset_control_deassert(svsp->rst);
 	if (ret) {
 		dev_err(svsp->dev, "cannot deassert reset %d\n", ret);
-		goto out_of_resume;
+		goto svs_resume_clk_disable;
 	}
 
 	ret = svs_init02(svsp);
@@ -1624,8 +1656,9 @@ static int svs_resume(struct device *dev)
 	dev_err(svsp->dev, "assert reset: %d\n",
 		reset_control_assert(svsp->rst));
 
-out_of_resume:
-	clk_disable_unprepare(svsp->main_clk);
+svs_resume_clk_disable:
+	svs_clk_disable(svsp);
+
 	return ret;
 }
 
@@ -2411,11 +2444,9 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_free_resource;
 	}
 
-	ret = clk_prepare_enable(svsp->main_clk);
-	if (ret) {
-		dev_err(svsp->dev, "cannot enable main clk: %d\n", ret);
+	ret = svs_clk_enable(svsp);
+	if (ret)
 		goto svs_probe_free_resource;
-	}
 
 	svsp->base = of_iomap(svsp->dev->of_node, 0);
 	if (IS_ERR_OR_NULL(svsp->base)) {
@@ -2456,7 +2487,7 @@ static int svs_probe(struct platform_device *pdev)
 	iounmap(svsp->base);
 
 svs_probe_clk_disable:
-	clk_disable_unprepare(svsp->main_clk);
+	svs_clk_disable(svsp);
 
 svs_probe_free_resource:
 	if (!IS_ERR_OR_NULL(svsp->efuse))
-- 
2.18.0


