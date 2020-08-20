Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1F2C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:05:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77C09207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w7QcjR9E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tZisOrLY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77C09207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P7x9XwqwmvBfTKydFAXJiYt85jPRseiqoLbZ9aQYgF0=; b=w7QcjR9EMOrOytIrwrYGVRRLq
	A393oMvZTxKX2c8Ihv+JR1PWgeG1UyDd79FGMW3wPNRnOsxzka7l26gV7yzM3VakHUrqkuSo3/jDM
	dGYCl+6DVG0ddtejF3CnmZYUJO8mtVwhpOemLkYte9DN/lnE+bRxieRqtLV6nB/5TO4NFDXQXzEcc
	meTIWbHSO4bIMOisVR79GUeIuIJaKKq32rqmRp3Y3X1+0/b3DQkVr7aVOrEwmIw+bSRvGBmzVBwE+
	9LLfEdhs3OUWphQgeZEaaZC158a1NCs+ATFvcwfIlxvtNq6naFwThrxllvNveZ69e30OkDjpDNzLj
	tcb/nHVEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dhp-0004zB-EJ; Thu, 20 Aug 2020 06:05:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8dhm-0004vl-HB; Thu, 20 Aug 2020 06:05:43 +0000
X-UUID: 56f2c38856e5484e868213cc52a6f21b-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bwYl3rcHgTIQ25qpI38KvxgwPkB5MaFcy5ozufwMs3c=; 
 b=tZisOrLY/RP6d158eAu8WZFlJu2ogRjpthiBctRBBOxmxgnlle7QpbxG8Qap52qBKptWbTnVS2t7DAKiWYpfQqBO2KP8Fx9ilYYi6UVXlcSIoYA2mKJGzavDag8+TMRWu+8HyweCDlVpGYbiZHB4kJ2tuhKYNYimaX+qnlcWNOg=;
X-UUID: 56f2c38856e5484e868213cc52a6f21b-20200819
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 332597887; Wed, 19 Aug 2020 22:05:37 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:32 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 02/21] drm/mediatek: add component POSTMASK
Date: Thu, 20 Aug 2020 14:03:59 +0800
Message-ID: <1597903458-8055-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_020542_718058_BF37B6B3 
X-CRM114-Status: GOOD (  16.83  )
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

This patch add component POSTMASK

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 31 +++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 include/linux/soc/mediatek/mtk-mmsys.h      |  1 +
 3 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 5e97ca5..8b9fb5e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -58,6 +58,10 @@
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_LUT				0x0700
 
+#define DISP_POSTMASK_EN			0x0000
+#define DISP_POSTMASK_CFG			0x0020
+#define DISP_POSTMASK_SIZE			0x0030
+
 #define LUT_10BIT_MASK				0x03ff
 
 #define OD_RELAYMODE				BIT(0)
@@ -319,6 +323,24 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 	}
 }
 
+static void mtk_postmask_config(struct mtk_ddp_comp *comp, unsigned int w,
+			      unsigned int h, unsigned int vrefresh,
+			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_POSTMASK_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, comp, DISP_POSTMASK_CFG);
+}
+
+static void mtk_postmask_start(struct mtk_ddp_comp *comp)
+{
+	writel(DITHER_EN, comp->regs + DISP_POSTMASK_EN);
+}
+
+static void mtk_postmask_stop(struct mtk_ddp_comp *comp)
+{
+	writel_relaxed(0x0, comp->regs + DISP_POSTMASK_EN);
+}
+
 static const struct mtk_ddp_comp_funcs ddp_aal = {
 	.gamma_set = mtk_gamma_set,
 	.config = mtk_aal_config,
@@ -346,6 +368,12 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 	.stop = mtk_gamma_stop,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_postmask = {
+	.config = mtk_postmask_config,
+	.start = mtk_postmask_start,
+	.stop = mtk_postmask_stop,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_od = {
 	.config = mtk_od_config,
 	.start = mtk_od_start,
@@ -372,6 +400,7 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_POSTMASK] = "postmask",
 };
 
 struct mtk_ddp_comp_match {
@@ -402,6 +431,8 @@ struct mtk_ddp_comp_match {
 	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, NULL },
 	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, NULL },
 	[DDP_COMPONENT_OVL_2L2]	= { MTK_DISP_OVL_2L,	2, NULL },
+	[DDP_COMPONENT_POSTMASK0]
+				= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 161201f..ae11b46 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -29,6 +29,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_UFOE,
 	MTK_DSI,
 	MTK_DPI,
+	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 268d95a..cc22c3e 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -31,6 +31,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_OVL_2L1,
 	DDP_COMPONENT_OVL_2L2,
 	DDP_COMPONENT_OVL1,
+	DDP_COMPONENT_POSTMASK0,
 	DDP_COMPONENT_PWM0,
 	DDP_COMPONENT_PWM1,
 	DDP_COMPONENT_PWM2,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
