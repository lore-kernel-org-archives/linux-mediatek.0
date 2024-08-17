Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62701C52D7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Aug 2024 07:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oDxP565M3e/1/ATaMhgsl2oGGX16jXdrhb9ibx6pOK8=; b=IskuziU/YDnwrs/u4qZYZv+pv6
	FHR7K7KgyHCyPTnuAKGRSJv2YrVOQ4wUvoapGenbtnT+DaJBx/rDTYlYC6O3JZfJeFejANjXfoI2R
	K8cN+HskpqjXkpq5QGJA/QJKqgyG1Q4iyE0WOrmNl+a0h2MAx4QjCOWKY1rBtJq2bhVFr5h0isb6a
	u5AbwwusB7MUwpmDLDEG+vry0ITVP5Wte9fJ1q6JKXkwIihiioM27Qq6MKuxdkpGW0pLSaqEweHZf
	bKPHBDGsfgxAPotjbplksSnJenDiTGQW2XMmu1nnMHOXeYdCb+EON/69s7C4p1t13gYnjYGS1Ab3n
	Z2ujLFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfDy7-0000000Eqvb-1oNY;
	Sat, 17 Aug 2024 07:35:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfDy4-0000000Equf-263f;
	Sat, 17 Aug 2024 07:35:21 +0000
X-UUID: 3b1698445c6b11efb3adad29d29602c1-20240817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oDxP565M3e/1/ATaMhgsl2oGGX16jXdrhb9ibx6pOK8=;
	b=PYCTwhFiTcPigEHwtY04nvBNAaq6uTdHIbLvJJExzeXdFr7Xffz8HwGeJVOB7UJir497OeAEtAhs6vbFZPar6MC0yUDQx96YyUoXjpH/DgyG+GSX5Xe7+sqO4K0lHLJtBz8gWonjL3OUNNYta3Pe5RjkqMSCTrB/+rQF1mRCABg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1bb46120-b763-4c09-8274-8c5c550f6278,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:3d227fbe-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3b1698445c6b11efb3adad29d29602c1-20240817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 607625372; Sat, 17 Aug 2024 00:35:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 17 Aug 2024 15:35:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 17 Aug 2024 15:35:04 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>, Zhi Mao
	<zhi.mao@mediatek.com>
Subject: [PATCH] media: i2c: improve suspend/resume switch performance for GT9769 VCM driver
Date: Sat, 17 Aug 2024 15:34:02 +0800
Message-ID: <20240817073452.21627-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.895800-8.000000
X-TMASE-MatchedRID: Oc3lNZcRIY7R/1qlpYxoUlVN8laWo90MWjWsWQUWzVpcKZwALwMGs8CS
	2AMm1nQCXj+G1I2Cld9RCqldf11uXwClEgKLW3itBDoR8w7C9OZWjiXAsVR2K0+OfsT6fdpn+Vi
	hXqn9xLFMJgsbV0+Bf+pAvk4T8Agrbn83JMqUbr0MH4SsGvRsA7zWODqZvEk5ol3uZzZ1GLfXvK
	BONfUNb+krhuwxhcex326LyHbpKCPsIv/PxUkglXV7tdtvoibaMVx/3ZYby79fXk0kfCOnbt5NR
	zJ0gz5HsNV8m2Omj9WAMuqetGVetnyef22ep6XYymsk/wUE4hqfigt155p8oY9tUqB3K1zQw//t
	taiU0fabfUda0wkrLX3dHoIymspUwL6SxPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.895800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 19799DA5C2E152BDCCA6451577318065D2A4DDD1ED7AB9367165EB13BC04EB7D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_003520_557244_F1CFBB0E 
X-CRM114-Status: GOOD (  16.49  )
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

GT9769 VCM power-on default setting is PD=0,
so it is not necessary to set again in dw9768_init function,
and it also has no requirement of setting PD=1
before power-off in dw9768_release function.
For GT9769 VCM, PD mode control will add extra time
when switching between suspend and resume.
e.g. chrome camera AP can switch between video and photo mode,
the behavior corresponding to VCM is suspend and resume,
it will cause camera preview is not smooth.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 drivers/media/i2c/dw9768.c | 65 ++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 18ef2b35c9aa..88d96165a805 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -97,12 +97,17 @@ static const char * const dw9768_supply_names[] = {
 	"vdd",	/* Digital core power */
 };
 
+struct dw9768_vcm_data {
+	bool pd_mode_ctrl;
+};
+
 /* dw9768 device structure */
 struct dw9768 {
 	struct regulator_bulk_data supplies[ARRAY_SIZE(dw9768_supply_names)];
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *focus;
 	struct v4l2_subdev sd;
+	const struct dw9768_vcm_data *data;
 
 	u32 aac_mode;
 	u32 aac_timing;
@@ -221,18 +226,20 @@ static int dw9768_init(struct dw9768 *dw9768)
 	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
 	int ret, val;
 
-	/* Reset DW9768_RING_PD_CONTROL_REG to default status 0x00 */
-	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
-					DW9768_PD_MODE_OFF);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * DW9769 requires waiting delay time of t_OPR
-	 * after PD reset takes place.
-	 */
-	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
+	if (dw9768->data->pd_mode_ctrl) {
+		/* Reset DW9768_RING_PD_CONTROL_REG to default status 0x00 */
+		ret = i2c_smbus_write_byte_data(client,
+						DW9768_RING_PD_CONTROL_REG,
+						DW9768_PD_MODE_OFF);
+		if (ret < 0)
+			return ret;
 
+		/*
+		 * DW9769 requires waiting delay time of t_OPR
+		 * after PD reset takes place.
+		 */
+		usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
+	}
 	/* Set DW9768_RING_PD_CONTROL_REG to DW9768_AAC_MODE_EN(0x01) */
 	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
 					DW9768_AAC_MODE_EN);
@@ -294,17 +301,19 @@ static int dw9768_release(struct dw9768 *dw9768)
 			     dw9768->move_delay_us + 1000);
 	}
 
-	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
-					DW9768_PD_MODE_EN);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * DW9769 requires waiting delay time of t_OPR
-	 * after PD reset takes place.
-	 */
-	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
+	if (dw9768->data->pd_mode_ctrl) {
+		ret = i2c_smbus_write_byte_data(client,
+						DW9768_RING_PD_CONTROL_REG,
+						DW9768_PD_MODE_EN);
+		if (ret < 0)
+			return ret;
 
+		/*
+		 * DW9769 requires waiting delay time of t_OPR
+		 * after PD reset takes place.
+		 */
+		usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
+	}
 	return 0;
 }
 
@@ -440,6 +449,8 @@ static int dw9768_probe(struct i2c_client *client)
 						      dw9768->clock_presc,
 						      dw9768->aac_timing);
 
+	dw9768->data = device_get_match_data(dev);
+
 	for (i = 0; i < ARRAY_SIZE(dw9768_supply_names); i++)
 		dw9768->supplies[i].supply = dw9768_supply_names[i];
 
@@ -525,9 +536,17 @@ static void dw9768_remove(struct i2c_client *client)
 	pm_runtime_disable(dev);
 }
 
+static const struct dw9768_vcm_data dw9768_data = {
+	.pd_mode_ctrl = true,
+};
+
+static const struct dw9768_vcm_data gt9769_data = {
+	.pd_mode_ctrl = false,
+};
+
 static const struct of_device_id dw9768_of_table[] = {
-	{ .compatible = "dongwoon,dw9768" },
-	{ .compatible = "giantec,gt9769" },
+	{ .compatible = "dongwoon,dw9768", .data = &dw9768_data },
+	{ .compatible = "giantec,gt9769", .data = &gt9769_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw9768_of_table);
-- 
2.46.0


