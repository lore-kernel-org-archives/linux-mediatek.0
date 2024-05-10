Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CA5C25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 11:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGYdTrBFfpb9eyzoW0iXytY9VmA09b1t9jreY07jxjA=; b=k1crIEORdknqRm/sL98ZNrVXze
	u44pW4Bwdpk05lSttvcNagvB/Z3e916Yko9l9R86VJeRoOupjB7U1xhZF4VzrlSXU7nt3Kf7+D3jz
	xLbkjuJ8DXRd9XCzDbIuPL3Vsr0KK5iFXaM+IzbiqL5puvZjddVT60Ea7JGy1nbr5eEeDVU0ECKkU
	7J4A1e9BU5J9bMVqkQrKtF3KFteROMp9Lt2oYde9sdPHPnFZ/5rw6GZp2TynFKkun1H/o+FTn5gHr
	p8dLC3Hun9jc3qSC+ptHPFqcwvNPoPYqLStxA+eQZvdOHbGu4G1R79fDr9LS1riPeKGO+qwJ+CU5c
	S8jG4AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5O4p-00000004xyx-2gTu;
	Fri, 10 May 2024 11:06:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5O4k-00000004xwJ-3QPV;
	Fri, 10 May 2024 11:06:08 +0000
X-UUID: 497cf8340ebd11ef9a78ddf43a9225dc-20240510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tGYdTrBFfpb9eyzoW0iXytY9VmA09b1t9jreY07jxjA=;
	b=SwirdxV2yb/ioStg0g2/gkoG5tfI425yf9jydDL8YcYMrxxVfrU+CcTA+ygdIcmsQDCkGd1JC+lHjG7fSf2yBHmsPxKMDavQ6RNDrCeRzlJcwuSHulEnCL0csVfZAShd+EpOpbECI3bI9ZUmSkAUDO2xms6koMASD/nP+oiraio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:b4ef3a19-0245-4ee4-bde2-523e103797d1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:82c5f88,CLOUDID:32cc3287-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 497cf8340ebd11ef9a78ddf43a9225dc-20240510
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2139134438; Fri, 10 May 2024 04:06:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 May 2024 04:05:30 -0700
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 May 2024 19:05:30 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<chunfeng.yun@mediatek.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<jitao.shi@mediatek.com>, <mac.shen@mediatek.com>,
	<liankun.yang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
Subject: [PATCH v2 1/2] Add write DP phyd register from parse dts
Date: Fri, 10 May 2024 19:04:14 +0800
Message-ID: <20240510110523.12524-2-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240510110523.12524-1-liankun.yang@mediatek.com>
References: <20240510110523.12524-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_040606_871736_395ACD47 
X-CRM114-Status: GOOD (  13.55  )
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

During the testing phase, screen flickering is observed when
using displayport for screen casting. Relevant SSC register parameters
are set in dts to address the screen flickering issue effectively and
improve compatibility with different devices by adjusting the SSC gear.

Obtaining the DPTX node, parsing the dts to obtain PHY register address
and value can adapt to settings of different manufacturers projects.

Changeds in v2:
- Optimized method of writing to DP PHY register
https://patchwork.kernel.org/project/linux-mediatek/patch/
20240403040517.3279-1-liankun.yang@mediatek.com/

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index d7024a144335..ce78112d5938 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -28,6 +28,10 @@
 #define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x38)
 #define DP_GLB_SW_RST_PHYD		BIT(0)
 
+#define MTK_DP_PHY_DIG_GLB_DA_REG_14	(PHY_OFFSET + 0xD8)
+#define XTP_GLB_TXPLL_SSC_DELTA_RBR_DEFAULT	GENMASK(15, 0)
+#define XTP_GLB_TXPLL_SSC_DELTA_HBR_DEFAULT	GENMASK(31, 16)
+
 #define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
 #define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
 #define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
@@ -78,10 +82,39 @@
 #define DRIVING_PARAM_8_DEFAULT	(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
 				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
 
+#define SSC_SETTING	"dp-ssc-setting"
+#define RG_XTP_GLB_TXPLL_SSC_DELTA_HBR	"ssc-delta-hbr"
+
 struct mtk_dp_phy {
 	struct regmap *regs;
+	struct device *dev;
 };
 
+static int mtk_dp_set_ssc_config(struct phy *phy, struct mtk_dp_phy *dp_phy)
+{
+	int ret;
+	u32 read_value = 0, reg_mask = 0;
+	struct device_node *ssc_node = NULL;
+
+	ssc_node = of_find_node_by_name(dp_phy->dev->of_node, SSC_SETTING);
+	if (!ssc_node) {
+		dev_err(&phy->dev, "SSC node is NULL\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(ssc_node, RG_XTP_GLB_TXPLL_SSC_DELTA_HBR, &read_value);
+	if (ret < 0 || !read_value) {
+		dev_err(&phy->dev, "Read SSC vlaue fail!\n");
+		return -EINVAL;
+	}
+	read_value |= read_value << 16;
+	reg_mask |= XTP_GLB_TXPLL_SSC_DELTA_HBR_DEFAULT;
+
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_GLB_DA_REG_14, reg_mask, read_value);
+
+	return 0;
+}
+
 static int mtk_dp_phy_init(struct phy *phy)
 {
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
@@ -137,6 +170,8 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
 			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
 
+	mtk_dp_set_ssc_config(phy, dp_phy);
+
 	return 0;
 }
 
@@ -186,6 +221,8 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 	if (!dev->of_node)
 		phy_create_lookup(phy, "dp", dev_name(dev));
 
+	dp_phy->dev = dev;
+
 	return 0;
 }
 
-- 
2.18.0


