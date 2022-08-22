Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DD3C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 04:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRNC4y74aF3mEu7ju5V00m/RqYpw3jn/drXJqvLxXxs=; b=AOoDvudBaLCKjm7TRf6JUuFTdg
	PzZ3U96LCx6NTmbpB4BiAjtWU9fc09f+7iT01oRP+ShT7V9IQrTtrGhwBFGOIfeSWntBzGYdyrbsl
	aBNtYzrajGg/bQveACRnmdy2Oa79ivuDb/32eulmfLnhzGUAOMB5sgyGt2Ms4U7ffbcyJdeI5xIO9
	6lNQQWeLfmYLESVCd7725jhqA42SSVJnQ6rstKXH72HURl8HSkAkACREFgyR37uoeUEDF4sYkrfem
	WYLmiCRthsQgeBAVjOeggcKhAQrhZ70Yk3rl/ufSDWbN8/WoSNtSmH8vpcZEHfwQ7tC0gBNgFTdh9
	x9b13mnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPyzL-004iZI-VX; Mon, 22 Aug 2022 04:24:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPyzI-004iXD-Jv; Mon, 22 Aug 2022 04:24:34 +0000
X-UUID: fecd86cf628046f79f1ec5c877cf85d1-20220821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RRNC4y74aF3mEu7ju5V00m/RqYpw3jn/drXJqvLxXxs=;
	b=uwUIPWN1i14PzwPeaSk6qd3fuusAniCqIvDtcL745ev7RQPQjQv0B8IGSZz96SOqzMVh+SvJktf2lxvujWOvJl/d+7R3/9NkpEEX99AT9FmzL6j0mwLdtsnIB2L/BLaN5tSSQz4JifRvvN/20Gq03JAyHxqiMOvA+pH6HAK8yG4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:a608aa50-01e8-4d06-b3b6-1ec2f77a47bd,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:ee7e2fcf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fecd86cf628046f79f1ec5c877cf85d1-20220821
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1567345828; Sun, 21 Aug 2022 21:24:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 11:33:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 22 Aug 2022 11:33:24 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>, Nathan Lu <nathan.lu@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<wsd_upstream@mediatek.com>, <lancelot.wu@mediatek.com>, amy zhang
	<Amy.Zhang@mediatek.com>
Subject: [PATCH v1 3/4] soc: mediatek: add mtk-mutex support for mt8188 vdosys0
Date: Mon, 22 Aug 2022 11:32:12 +0800
Message-ID: <20220822033213.15769-4-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220822033213.15769-1-nathan.lu@mediatek.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_212432_756840_702FA4DD 
X-CRM114-Status: GOOD (  12.11  )
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

From: Nathan Lu <nathan.lu@mediatek.com>

add mtk-mutex support for mt8188 vdosys0.

Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 51 ++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 4fb746f6010e..a01d00a38a19 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -107,6 +107,21 @@
 #define MT8173_MUTEX_MOD_DISP_PWM1		24
 #define MT8173_MUTEX_MOD_DISP_OD		25
 
+#define MT8188_MUTEX_MOD_DISP_OVL0		0
+#define MT8188_MUTEX_MOD_DISP_WDMA0		1
+#define MT8188_MUTEX_MOD_DISP_RDMA0		2
+#define MT8188_MUTEX_MOD_DISP_COLOR0		3
+#define MT8188_MUTEX_MOD_DISP_CCORR0		4
+#define MT8188_MUTEX_MOD_DISP_AAL0		5
+#define MT8188_MUTEX_MOD_DISP_GAMMA0		6
+#define MT8188_MUTEX_MOD_DISP_DITHER0		7
+#define MT8188_MUTEX_MOD_DISP_DSI0		8
+#define MT8188_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
+#define MT8188_MUTEX_MOD_DISP_VPP_MERGE		20
+#define MT8188_MUTEX_MOD_DISP_DP_INTF0		21
+#define MT8188_MUTEX_MOD_DISP_POSTMASK0		24
+#define MT8188_MUTEX_MOD2_DISP_PWM0		33
+
 #define MT8195_MUTEX_MOD_DISP_OVL0		0
 #define MT8195_MUTEX_MOD_DISP_WDMA0		1
 #define MT8195_MUTEX_MOD_DISP_RDMA0		2
@@ -189,6 +204,8 @@
 #define MT8167_MUTEX_SOF_DPI1			3
 #define MT8183_MUTEX_SOF_DSI0			1
 #define MT8183_MUTEX_SOF_DPI0			2
+#define MT8188_MUTEX_SOF_DSI0			1
+#define MT8188_MUTEX_SOF_DP_INTF0		3
 #define MT8195_MUTEX_SOF_DSI0			1
 #define MT8195_MUTEX_SOF_DSI1			2
 #define MT8195_MUTEX_SOF_DP_INTF0		3
@@ -198,6 +215,8 @@
 
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
+#define MT8188_MUTEX_EOF_DSI0			(MT8188_MUTEX_SOF_DSI0 << 7)
+#define MT8188_MUTEX_EOF_DP_INTF0		(MT8188_MUTEX_SOF_DP_INTF0 << 7)
 #define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_SOF_DSI0 << 7)
 #define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_SOF_DSI1 << 7)
 #define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_INTF0 << 7)
@@ -342,6 +361,23 @@ static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA1] = MT8186_MUTEX_MOD_DISP_RDMA1,
 };
 
+static const unsigned int mt8188_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_OVL0] = MT8188_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_WDMA0] = MT8188_MUTEX_MOD_DISP_WDMA0,
+	[DDP_COMPONENT_RDMA0] = MT8188_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_COLOR0] = MT8188_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_CCORR] = MT8188_MUTEX_MOD_DISP_CCORR0,
+	[DDP_COMPONENT_AAL0] = MT8188_MUTEX_MOD_DISP_AAL0,
+	[DDP_COMPONENT_GAMMA] = MT8188_MUTEX_MOD_DISP_GAMMA0,
+	[DDP_COMPONENT_POSTMASK0] = MT8188_MUTEX_MOD_DISP_POSTMASK0,
+	[DDP_COMPONENT_DITHER0] = MT8188_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_MERGE0] = MT8188_MUTEX_MOD_DISP_VPP_MERGE,
+	[DDP_COMPONENT_DSC0] = MT8188_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
+	[DDP_COMPONENT_DSI0] = MT8188_MUTEX_MOD_DISP_DSI0,
+	[DDP_COMPONENT_PWM0] = MT8188_MUTEX_MOD2_DISP_PWM0,
+	[DDP_COMPONENT_DP_INTF0] = MT8188_MUTEX_MOD_DISP_DP_INTF0,
+};
+
 static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
@@ -441,6 +477,12 @@ static const unsigned int mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
  * but also detect the error at end of frame(EAEOF) when EOF signal
  * arrives.
  */
+static const unsigned int mt8188_mutex_sof[DDP_MUTEX_SOF_MAX] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DP_INTF0] =
+		MT8188_MUTEX_SOF_DP_INTF0 | MT8188_MUTEX_EOF_DP_INTF0,
+};
+
 static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 | MT8195_MUTEX_EOF_DSI0,
@@ -498,6 +540,13 @@ static const struct mtk_mutex_data mt8186_mutex_driver_data = {
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt8188_mutex_driver_data = {
+	.mutex_mod = mt8188_mutex_mod,
+	.mutex_sof = mt8188_mutex_sof,
+	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+};
+
 static const struct mtk_mutex_data mt8192_mutex_driver_data = {
 	.mutex_mod = mt8192_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
@@ -847,6 +896,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8183_mutex_driver_data},
 	{ .compatible = "mediatek,mt8186-disp-mutex",
 	  .data = &mt8186_mutex_driver_data},
+	{ .compatible = "mediatek,mt8188-disp-mutex",
+	  .data = &mt8188_mutex_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = &mt8192_mutex_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-mutex",
-- 
2.18.0


