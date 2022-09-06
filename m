Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F84ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXNrNuT55qB4UEKn0dm1EhQ6AW108Y1kOKA357cPY9Y=; b=BTlaYhbHwHmi+geVluIqBJYmf8
	d+BOSkJSkb5hQ8mmvPtHX3pKmShiAOA1re1u0gD96hPDkIydgUxM5V+38A6AxSdBbblyxIFB7supP
	pvLMwKK77PkQCQPQ809Twe8McOOKwe9N5cRMgyfIZxFhh4Z3hiVkQ3uMO0CSB+/eE2dI6Ijaclz1c
	beMUmh5zy+2MNcNazfvRdgyG4Phgx+yC+B1MUPFljUwDvouRyKqGQolrMxqcdOFMkznZMOa1qtXzL
	5A1tlKwCib3UDNTNHMk9oZBxEa4HQGvERnUpCWfG9zgT+in36YflD8+T8h2Gw5qVRfVH+lnijQrrD
	PG1QLiaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVV0A-00BujO-BJ; Tue, 06 Sep 2022 09:36:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVV04-00BuaS-99; Tue, 06 Sep 2022 09:36:11 +0000
X-UUID: 8db9a2fbf0024335a14e03fee1822126-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iXNrNuT55qB4UEKn0dm1EhQ6AW108Y1kOKA357cPY9Y=;
	b=e1fhNF4kfa/U7ZwVk9QWr8gi+fn8qm+fpj5cXm0B0cF7+Vbs6IOtOiYu1jfMXNhzEn+40Ed9K2ICAxntQ4ZH4ML4Fl6eDanKUXNFFniYpIrNbTyavgkDYOg813HzyjWpzbnpoZ4J7c+fErlOLSW8KXH4o9R2N2MUcJU/FpKqI7M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:96ed65ad-5f73-4d31-b60e-83635c403119,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:dbfbd056-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8db9a2fbf0024335a14e03fee1822126-20220906
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 588875315; Tue, 06 Sep 2022 02:36:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 6 Sep 2022 16:45:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Sep 2022 16:45:21 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<lancelot.wu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, amy zhang
	<Amy.Zhang@mediatek.com>
Subject: [PATCH v2 6/6] drm/mediatek: add mediatek-drm of vdosys0 support for mt8188
Date: Tue, 6 Sep 2022 16:44:49 +0800
Message-ID: <20220906084449.20124-7-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220906084449.20124-1-nathan.lu@mediatek.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_023608_488650_4E567172 
X-CRM114-Status: GOOD (  10.88  )
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

add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.

Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d72263c8a621..649f22ac8cab 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -178,6 +178,18 @@ static const unsigned int mt8186_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const unsigned int mt8188_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_POSTMASK0,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DP_INTF0,
+};
+
 static const unsigned int mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
@@ -323,6 +335,19 @@ static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
 	},
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
+	.main_path = mt8188_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
+	.mmsys_dev_num = 1,
+};
+
+static const struct mtk_mmsys_match_data mt8188_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8188_vdosys0_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -376,6 +401,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8183_mmsys_match_data},
 	{ .compatible = "mediatek,mt8186-mmsys",
 	  .data = &mt8186_mmsys_match_data},
+	{ .compatible = "mediatek,mt8188-mmsys",
+	  .data = &mt8188_mmsys_match_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_match_data},
 	{ .compatible = "mediatek,mt8195-mmsys",
@@ -734,6 +761,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8186-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8188-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
-- 
2.18.0


