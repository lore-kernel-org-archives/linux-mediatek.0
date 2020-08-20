Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7C7C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:17:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02D952075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ssdvRanz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g930v2St"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02D952075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lf9luvXSMaL6rW7Vxs3wVCdlVd13YVPELl0NHFbsElg=; b=ssdvRanzgzO9Ep40OyZeFvY3I
	NQkBTobrMfSdRNvP/m/ZvkAF7YPhDt0XTidPCbZpb0+bGRCrJ3wL9uHU0rgCXdx1iSsLg0ZYwUdfN
	p1FPvF5HIojmxdGiZHi8wBqo7IP4SkcTg01YAbDzEZrBgYROBOfqqNZg+Evgh5ZpxWhh8BMlDa2hg
	9y4jOj194j6vHoSMpXV6//JV+Mf/gHM/zlBsEXxjRrT9Xcwo49CQfqUNAHas2orTCoQRkOe00q6wa
	5WHH3CmtW0Nru5/vFCv0I9bWJJiIWJ4zdt1nIoLyNaTX3uoEm7+1torXl86NMdIG85N9MTH74uJES
	Xf7ABXayw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dsk-0008Ph-Kz; Thu, 20 Aug 2020 06:17:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drW-0007vu-DB; Thu, 20 Aug 2020 06:15:50 +0000
X-UUID: e068162d86ca4f6397ac820adfc7576c-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Goa7JPmDFNuSu9rW6OSEL3atM2vBJYhtQ96kEWsc+t8=; 
 b=g930v2StxX016+LRUmHsqgby56aiy60LlS0uycQqjRTYErgiIbgdW3t5dWYUL95HORPZnfOvOmxJ2bGR0hM/MFjBawMvp4oAPKbycLsk1pcpBae8H2ioThrVVziiG4w253ERdg/nSlUrp7WKbxCEkB36XhpN29YrU8+f755nGVk=;
X-UUID: e068162d86ca4f6397ac820adfc7576c-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 511621168; Wed, 19 Aug 2020 22:15:38 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:56 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:55 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 18/21] drm/mediatek: add dither bypass shadow register
 function
Date: Thu, 20 Aug 2020 14:04:15 +0800
Message-ID: <1597903458-8055-19-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021546_631070_DB8A9E6E 
X-CRM114-Status: GOOD (  14.82  )
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

add dither bypass shadow register function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 0c81253..315bd3a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -23,6 +23,9 @@
 #define DISP_OD_INTSTA				0x000c
 #define DISP_OD_CFG				0x0020
 #define DISP_OD_SIZE				0x0030
+
+#define DITHER_REG(idx)				(0x100 + (idx) * 4)
+#define DITHER_BYPASS_SHADOW				BIT(0)
 #define DISP_DITHER_5				0x0114
 #define DISP_DITHER_7				0x011c
 #define DISP_DITHER_15				0x013c
@@ -291,6 +294,13 @@ static void mtk_dither_stop(struct mtk_ddp_comp *comp)
 	writel_relaxed(0x0, comp->regs + DISP_DITHER_EN);
 }
 
+static void mtk_dither_bypass_shadow(struct mtk_ddp_comp *comp)
+{
+	mtk_ddp_write_mask(NULL, DITHER_BYPASS_SHADOW, comp,
+			   DITHER_REG(0),
+			   DITHER_BYPASS_SHADOW);
+}
+
 static void mtk_gamma_config(struct mtk_ddp_comp *comp, unsigned int w,
 			     unsigned int h, unsigned int vrefresh,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -368,6 +378,7 @@ static void mtk_postmask_stop(struct mtk_ddp_comp *comp)
 	.config = mtk_dither_config,
 	.start = mtk_dither_start,
 	.stop = mtk_dither_stop,
+	.bypass_shadow = mtk_dither_bypass_shadow,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
