Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD01AC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 896BE2075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A+bxFhb1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D4AcxFwp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 896BE2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+CTVaiEamtc4OC0rXvureBf+OFryvEFyLnfNjBIVNDk=; b=A+bxFhb1Q9YButuyyAMhERXfn
	AHrNpJxKKQhM5wz3mEamPWZ7DPB29zezABaMA8gxJ6MLzChrb7PC3YJutSj5y8ygRXolibnZWzUDU
	zmdVdyEvjejXggsVxgMB1v6659gG2tqJjwsBlXZ7xdFgcq+44RSqOmXTjxhRZFxCbb+L9+BVBZrZN
	bXSm9UKWPyfCMt2Po8oBjLN+9Iqhf0DHMObF0HEGsZ4uCf/w7/oDyPUaORUfeTubdCPz5qTpkXNx8
	0TJMufd6+FgnAxGtX19NrgmQTuoqi3XOuv+sSe1n98Zv1p4/WwxyLqa052fNzISE0WeHxeqiie0Va
	YWGDBgSWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dts-0000ha-35; Thu, 20 Aug 2020 06:18:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drh-0007vu-E3; Thu, 20 Aug 2020 06:16:13 +0000
X-UUID: 35c44c5e32a1449e855a59aa917378b2-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=36fnnR2AlgsNKVC8MFiMN1gZFhEDJZxQGNPYhMhVoAE=; 
 b=D4AcxFwp9mvM+XgO5IrAOMA7UhQtmuIXCYXHIdYkEfUosz+4O8hWzF1YCnqL0Ba9AEDjftPJWcqMTvtDqCjOBGlyhADyxy/H2XfL26idby4epFa55wHf9fDxcTIcx+Xt0oXbK1xiYNj1bWkkGQR5g8DkvBjytac6PetKOpYv7so=;
X-UUID: 35c44c5e32a1449e855a59aa917378b2-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1824673275; Wed, 19 Aug 2020 22:15:44 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:48 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:47 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 16/21] drm/mediatek: add ovl bypass shadow register function
Date: Thu, 20 Aug 2020 14:04:13 +0800
Message-ID: <1597903458-8055-17-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021557_667015_6D855A5C 
X-CRM114-Status: GOOD (  15.33  )
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

add ovl bypass shadow register function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 03eaadb..fb0fe59 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -19,6 +19,9 @@
 #define DISP_REG_OVL_INTEN			0x0004
 #define OVL_FME_CPL_INT					BIT(1)
 #define DISP_REG_OVL_INTSTA			0x0008
+#define OVL_EN						BIT(0)
+#define OVL_READ_WORK_REG				BIT(20)
+#define OVL_BYPASS_SHADOW				BIT(22)
 #define DISP_REG_OVL_EN				0x000c
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
@@ -62,6 +65,7 @@ struct mtk_disp_ovl_data {
 	unsigned int gmc_bits;
 	unsigned int layer_nr;
 	bool fmt_rgb565_is_0;
+	bool has_shadow;
 };
 
 /**
@@ -126,6 +130,17 @@ static void mtk_ovl_stop(struct mtk_ddp_comp *comp)
 	writel_relaxed(0x0, comp->regs + DISP_REG_OVL_EN);
 }
 
+static void mtk_ovl_bypass_shadow(struct mtk_ddp_comp *comp)
+{
+	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+
+	if (ovl->data->has_shadow) {
+		mtk_ddp_write_mask(NULL, OVL_BYPASS_SHADOW, comp,
+				   DISP_REG_OVL_EN,
+				   OVL_BYPASS_SHADOW);
+	}
+}
+
 static void mtk_ovl_config(struct mtk_ddp_comp *comp, unsigned int w,
 			   unsigned int h, unsigned int vrefresh,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -318,6 +333,7 @@ static void mtk_ovl_bgclr_in_off(struct mtk_ddp_comp *comp)
 	.config = mtk_ovl_config,
 	.start = mtk_ovl_start,
 	.stop = mtk_ovl_stop,
+	.bypass_shadow = mtk_ovl_bypass_shadow,
 	.enable_vblank = mtk_ovl_enable_vblank,
 	.disable_vblank = mtk_ovl_disable_vblank,
 	.supported_rotations = mtk_ovl_supported_rotations,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
