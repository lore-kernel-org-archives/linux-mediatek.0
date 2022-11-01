Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0160EFA373D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 06:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKVQ5xUvwJLnVjPZU5c5Gw7oruotfGjxaq+qal/96R4=; b=ujyqy1tJRDMAnJ3fgQE87rTbdt
	MgvMecHVe0QSFHVfyawKe2Gq7Pg61nCtGDNzp7XotefWaTeegJgbj3pKqwEhPVS9dzM18RQvC3IqY
	LUxy06EIR+iOEbU1VSeWIh+jy7G23vWGp2yXrNoC5Gegw4NrHPGXh9hF20ffeDxB/GGorjwwWruXU
	E1ViYGVJjIDyyV13EwFoK4LHJMKAATb4aDXhcHagxeqSS+wGOwkkB17wykFsGXaePygWni8gwlnca
	0eWfst+V8pVVAEdyqzwS0PvHrqOX+TOeRZorRr56unHiY/X2SDt6EXkPv42H6/g0wVfl1kZLNXaGs
	BX/4sQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opket-002P4O-6A; Tue, 01 Nov 2022 06:21:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opkeg-002P1a-Ui; Tue, 01 Nov 2022 06:21:48 +0000
X-UUID: 365ecabf187e429e81787c62b2504301-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qKVQ5xUvwJLnVjPZU5c5Gw7oruotfGjxaq+qal/96R4=;
	b=GuUVMsDwkmDD7i5cWGFB/69htQfxwCVbR0tMncQU5xKaAHKhq6yFOuc7pscmKfUXtFN5G2HBslg3Cv/T8sS5Krjj1ZCyWPuyKXid8lWw7xrsZImXvY059WXCroPJEKpYYCk0Eo82McZrAq1WHYyDu0C3ejglmq7rv3eEPvNsTSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:eb488bdd-b2c4-46f6-bfed-8bd2cee1b305,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:70993590-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 365ecabf187e429e81787c62b2504301-20221031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 49598375; Mon, 31 Oct 2022 23:21:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 14:11:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 14:11:39 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Yaochun Hung
	<yc.hung@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 2/2] ASoC: SOF: mediatek: Revise mt8186 ADSP clock driver
Date: Tue, 1 Nov 2022 14:11:37 +0800
Message-ID: <20221101061137.25731-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221101061137.25731-1-tinghan.shen@mediatek.com>
References: <20221101061137.25731-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_232147_006021_583D3908 
X-CRM114-Status: GOOD (  13.97  )
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

Initialize the required clocks for mt8186 ADSP. The ADSP core is
expected booting with 26M clock, and using the mainpll_d2_d2 clock
for ADSP bus.

The enable/disable order of clocks is also revised. The clock should
be enabled as mainpll_d2_d2 -> adsp bus -> adsp, and disabled in the
reversed order.

Fixes: 210b3ab932f7 ("ASoC: SOF: mediatek: Add mt8186 dsp clock support")
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c | 35 +++++++++++++++++-----
 sound/soc/sof/mediatek/mt8186/mt8186-clk.h |  2 ++
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
index 2df3b7ae1c6f..c86391aa7948 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
@@ -20,6 +20,8 @@
 static const char *adsp_clks[ADSP_CLK_MAX] = {
 	[CLK_TOP_AUDIODSP] = "audiodsp",
 	[CLK_TOP_ADSP_BUS] = "adsp_bus",
+	[CLK_TOP_MAINPLL_D2_D2] = "mainpll_d2_d2",
+	[CLK_TOP_CLK26M] = "clk26m",
 };
 
 int mt8186_adsp_init_clock(struct snd_sof_dev *sdev)
@@ -48,18 +50,36 @@ static int adsp_enable_all_clock(struct snd_sof_dev *sdev)
 	struct device *dev = sdev->dev;
 	int ret;
 
-	ret = clk_prepare_enable(priv->clk[CLK_TOP_AUDIODSP]);
+	ret = clk_set_parent(priv->clk[CLK_TOP_AUDIODSP], priv->clk[CLK_TOP_CLK26M]);
+	if (ret) {
+		dev_err(dev, "set audiodsp clock fail %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_set_parent(priv->clk[CLK_TOP_ADSP_BUS], priv->clk[CLK_TOP_MAINPLL_D2_D2]);
+	if (ret) {
+		dev_err(dev, "set adsp bus clock fail %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_MAINPLL_D2_D2]);
 	if (ret) {
-		dev_err(dev, "%s clk_prepare_enable(audiodsp) fail %d\n",
-			__func__, ret);
+		dev_err(dev, "clk_prepare_enable(mainpll_d2_d2) fail %d\n", ret);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(priv->clk[CLK_TOP_ADSP_BUS]);
 	if (ret) {
-		dev_err(dev, "%s clk_prepare_enable(adsp_bus) fail %d\n",
-			__func__, ret);
-		clk_disable_unprepare(priv->clk[CLK_TOP_AUDIODSP]);
+		dev_err(dev, "clk_prepare_enable(adsp_bus) fail %d\n", ret);
+		clk_disable_unprepare(priv->clk[CLK_TOP_MAINPLL_D2_D2]);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_AUDIODSP]);
+	if (ret) {
+		dev_err(dev, "clk_prepare_enable(audiodsp) fail %d\n", ret);
+		clk_disable_unprepare(priv->clk[CLK_TOP_MAINPLL_D2_D2]);
+		clk_disable_unprepare(priv->clk[CLK_TOP_ADSP_BUS]);
 		return ret;
 	}
 
@@ -70,8 +90,9 @@ static void adsp_disable_all_clock(struct snd_sof_dev *sdev)
 {
 	struct adsp_priv *priv = sdev->pdata->hw_pdata;
 
-	clk_disable_unprepare(priv->clk[CLK_TOP_ADSP_BUS]);
 	clk_disable_unprepare(priv->clk[CLK_TOP_AUDIODSP]);
+	clk_disable_unprepare(priv->clk[CLK_TOP_ADSP_BUS]);
+	clk_disable_unprepare(priv->clk[CLK_TOP_MAINPLL_D2_D2]);
 }
 
 int mt8186_adsp_clock_on(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.h b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
index 89c23caf0fee..37f5cfa2b230 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
@@ -15,6 +15,8 @@ struct snd_sof_dev;
 enum adsp_clk_id {
 	CLK_TOP_AUDIODSP,
 	CLK_TOP_ADSP_BUS,
+	CLK_TOP_MAINPLL_D2_D2,
+	CLK_TOP_CLK26M,
 	ADSP_CLK_MAX
 };
 
-- 
2.18.0


