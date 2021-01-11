Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820EAC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:54:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181BA22482
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 181BA22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IE9Bl+9PcuxnwmPyILm9jQfUcslyJzFc3e+/CNWIMhc=; b=qFEaKpja6pVmFMuwW52Qxw3zk
	s5f/cmgoimxosg3tNFX4+2aL796Gs2vowvnqQVzf4WcO8tL7ohmw8Gu4tmCk/1fnGoSKj8R2lP5DA
	1ZUQS6K2U58O6TGZtZfTbC5gI0aMVnsYe8/lC+uKvRUvFaFA9KpTHnK5ypqIVtwiAzRk5TH9u25Et
	xO5WMnikgw+h6yuanEi0pzqVR/JO/8dVlWp+QIcanLbXPmfOUyPKU/4iwE7tFNLOSeuYOPOhEkXAm
	gJeQsVCZn+EPrm9A09Bo8RMprRYxEY74SJeK079kwwnN1emqcCavNrXyXKjS93gImcHkn1H1iFsPC
	eqB2pvfug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kys1r-0006GF-HT; Mon, 11 Jan 2021 07:54:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kys1m-0006D5-6N; Mon, 11 Jan 2021 07:54:15 +0000
X-UUID: 59828f52461b4cd392d9dbe09613f30f-20210110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=r8XPrDWZfqe8SKxxqs5Kjw10tX+uHMezTIaLXjpSOBQ=; 
 b=Th02fxAj1sHCzA80ZmqE0kChzFn8NiXiGNT0vnXei9lE5uD9DywPllf0Su26Xew7P0xoOFO/OlfM4jwiKmToFaTyGPDDm7VqnhdNsl9I7AKcMf6M2GGy+NfOGZf93bCR4XzREsNrHNr3IZ2PKu08hdG5Dmo4O3DG7qKb/NdyeA4=;
X-UUID: 59828f52461b4cd392d9dbe09613f30f-20210110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1673125498; Sun, 10 Jan 2021 23:54:11 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Jan 2021 23:44:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 15:44:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 15:44:06 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 13/15] drm/mediatek: add matrix bits private data for ccorr
Date: Mon, 11 Jan 2021 15:43:49 +0800
Message-ID: <1610351031-21133-14-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_025414_452541_2D7CB7AD 
X-CRM114-Status: GOOD (  15.96  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

matrix bits of mt8183 is 12
matrix bits of mt8192 is 13

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 63b3ef6..755e75b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -30,8 +30,10 @@
 #define DISP_CCORR_COEF_3			0x008C
 #define DISP_CCORR_COEF_4			0x0090
 
+#define CCORR_MATRIX_BITS			12
+
 struct mtk_disp_ccorr_data {
-	u32 reserved;
+	u32 matrix_bits;
 };
 
 /**
@@ -96,6 +98,8 @@ static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
 	uint16_t coeffs[9] = { 0 };
 	int i;
 	struct cmdq_pkt *cmdq_pkt = NULL;
+	struct mtk_disp_ccorr *ccorr = comp_to_ccorr(comp);
+	u32 matrix_bits;
 
 	if (!blob)
 		return;
@@ -103,8 +107,16 @@ static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
 	ctm = (struct drm_color_ctm *)blob->data;
 	input = ctm->matrix;
 
-	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
+	if (ccorr->data)
+		matrix_bits = ccorr->data->matrix_bits;
+	else
+		matrix_bits = CCORR_MATRIX_BITS;
+
+	for (i = 0; i < ARRAY_SIZE(coeffs); i++) {
 		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
+		if (matrix_bits > CCORR_MATRIX_BITS)
+			coeffs[i] <<= (matrix_bits - CCORR_MATRIX_BITS);
+	}
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
 		      comp, DISP_CCORR_COEF_0);
@@ -205,8 +217,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
+	.matrix_bits = CCORR_MATRIX_BITS,
+};
+
 static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8183-disp-ccorr"},
+	{ .compatible = "mediatek,mt8183-disp-ccorr",
+	  .data = &mt8183_ccorr_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
