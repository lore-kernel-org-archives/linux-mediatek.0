Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857F6C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxbhxVSPArW8H0UeN3MSPaLPtNHeatXCyNa9lzOCLY4=; b=GOM7WQjFxGRujXduuybMwrsiNA
	QN7sf4nst27ePDc2RI4Fjw72XsimBnSYDPLiRzdMorehBfxasfUVLDNOSfYkSHf4gJ9TFwHI/CoaY
	5nYqQyuupBeK45Ejv0MI7hGmBGQmtiAou1wt1V6FLY3yinU+sfJhTiaTDd24HHGSVF66V+xADrU88
	GwX5E8wUCEnz5TxqeWmdHdajjbRMozSufxo/YYlomgg3B5sp323CCU55RFThTCOrebQHhAsozRSUQ
	w9ovPNil4nyU1RP9hNqFf6tALjE4fHRAPXB2clkNM3NfYCW43nkaKCm+GF0jdkHWv3QEIUjtI17SD
	mkqkCSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cCY-0054dD-65; Tue, 21 Jun 2022 11:37:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cCV-0054bx-GZ; Tue, 21 Jun 2022 11:37:45 +0000
X-UUID: 3538e027e3a44b1d9be4bc302130b371-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:012a0693-b3f1-49bc-afbd-bdae736917a2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:27bb1238-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3538e027e3a44b1d9be4bc302130b371-20220621
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 619912069; Tue, 21 Jun 2022 04:37:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 04:37:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 21 Jun 2022 19:37:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 21 Jun 2022 19:37:33 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v13 02/14] drm/mediatek: dpi: Add kernel document for struct mtk_dpi_conf
Date: Tue, 21 Jun 2022 19:37:20 +0800
Message-ID: <20220621113732.11595-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_043743_632039_67F9A257 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

This driver will support dp_intf and there are many configs between dpi
and dp_intf. Therefore, we will add many configs in "struct mtk_dpi_conf".
To let this structure more readable, we add this kernel doc.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index e61cd67b978f..f66a121ba0c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -118,6 +118,15 @@ struct mtk_dpi_yc_limit {
 	u16 c_bottom;
 };
 
+/**
+ * struct mtk_dpi_conf - Configuration of mediatek dpi.
+ * @cal_factor: Callback function to calculate factor value.
+ * @reg_h_fre_con: Register address of frequency control.
+ * @max_clock_khz: Max clock frequency supported for this SoCs in khz units.
+ * @edge_sel_en: Enable of edge selection.
+ * @output_fmts: Array of supported output formats.
+ * @num_output_fmts: Quantity of supported output formats.
+ */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
 	u32 reg_h_fre_con;
-- 
2.18.0


