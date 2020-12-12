Return-Path: <SRS0=F1mA=FQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6118C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:22:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FAEF2313F
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FAEF2313F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zLBTLbSoANq7kHLd1AepUcpOwLoLGaj9mck5uXfbuT8=; b=CKC22aZpQquTp1i0ROZoS9gE2
	lSOug15cgeMqWo5cKzG/J8TztXNhBs4RdNPgwlyCkfkv7SN7YUCkWAeVYvVA8j/x5MNeRENuDrVC+
	cQ1JAiuyK7v3jg1fuHlt1icPiTaLld5p3EMQgKMC3qHbgULie260AAbtAhpE3RB5JZ4Q5FeVPvYcV
	8jnm/R1U0XbGNtzrnDE3caItoeYO5KanIOyvAcJBI7KNv41/6JYRYa9YpkvQZ2p5Wh1ZhK5sHeEBO
	5SQGB2TUJJFqirCG17U51OBf1ho1klrO3dWBeODCEhpL+90h7jXlLYjtap1Lw81uF383Ebmqh/tGb
	hAQoqs2hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knwQL-0005mg-GA; Sat, 12 Dec 2020 04:22:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwQB-0005hI-9l; Sat, 12 Dec 2020 04:22:16 +0000
X-UUID: 8bd24c197bae4704b219eb5cc167eedb-20201211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=K+zGnSD3jQVuD9syEjncCJosvBTaXBpSZRUIUOASmyI=; 
 b=omXfnTE+N5TwE3D/PWrpif2MxcKCub894WQ8KZ6Fgx2d/RqwgpLBVz7vAUMUraqJNxz/OxxyOoQRkJqMfKr58RbP5m4c9RGrz9RtFPODLakMgfL1XOXoZTjuVnWNSbFzfcyOyrR7pEPTAP0ODsh7JFoWimdDxSBCsNFqgbacIuA=;
X-UUID: 8bd24c197bae4704b219eb5cc167eedb-20201211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 986297053; Fri, 11 Dec 2020 20:22:10 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Dec 2020 20:12:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:06 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2,
 08/17] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer
 usecase
Date: Sat, 12 Dec 2020 12:11:48 +0800
Message-ID: <1607746317-4696-9-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_232215_541345_DF380D6D 
X-CRM114-Status: GOOD (  13.97  )
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
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

enable OVL_LAYER_SMI_ID_EN for multi-layer usecase

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8cf9f3b..97f8380 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -23,6 +23,7 @@
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
 #define DISP_REG_OVL_DATAPATH_CON		0x0024
+#define OVL_LAYER_SMI_ID_EN				BIT(0)
 #define OVL_BGCLR_SEL_IN				BIT(2)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
@@ -61,6 +62,7 @@ struct mtk_disp_ovl_data {
 	unsigned int gmc_bits;
 	unsigned int layer_nr;
 	bool fmt_rgb565_is_0;
+	bool smi_id_en;
 };
 
 /**
@@ -115,7 +117,17 @@ static void mtk_ovl_disable_vblank(struct mtk_ddp_comp *comp)
 
 static void mtk_ovl_start(struct mtk_ddp_comp *comp)
 {
+	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+
 	writel_relaxed(0x1, comp->regs + DISP_REG_OVL_EN);
+
+	if(ovl->data->smi_id_en) {
+		unsigned int reg;
+
+		reg = readl(comp->regs + DISP_REG_OVL_DATAPATH_CON);
+		reg = reg | OVL_LAYER_SMI_ID_EN;
+		writel_relaxed(reg, comp->regs + DISP_REG_OVL_DATAPATH_CON);
+	}
 }
 
 static void mtk_ovl_stop(struct mtk_ddp_comp *comp)
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
