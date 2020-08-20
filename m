Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA673C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:17:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA0B2075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M7TClWyi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UCa/DtgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA0B2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L0LMJaZuvS2nflm0pam2mVZz7QtzNQ9J1VwdA+WJYC0=; b=M7TClWyipAuQI1qSDHE8IJ1n/
	dCHZ+mdjGIaGgmRoq1AVxta909xyh81R4iz0+jaKM2gHGmFQMMqMWsPFejOAqqVpJZNixVzr0jk+8
	Idl4cdQ+koBG1WoCDZroX0txfut/DHYaN95xYsM5v9Ty1wedSWP8SGx961WxHZTN0b78OhOjEsRCR
	w1pxG6Am5sYtWJP8BbeO+mT5nMYpQ7xEjMU/e8zEtAkm2KCPeLRw70LjXkLuT78DYUBGRwiNIN116
	9Z128+v+KIHgM0PNBVwcLL5Ndsro05/lkrL5BnJNZZi/9B1GUFa937lEujbKCjZzafnwsWSgX6J2M
	dqqxFmdgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dtQ-0000Kv-9F; Thu, 20 Aug 2020 06:17:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8dra-0007vu-DT; Thu, 20 Aug 2020 06:15:57 +0000
X-UUID: 39b52ad618cf4dd787dedc3aae4e3557-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=o1GR/JP56KwhHadHVRRsgKjaM3oHmqygNovIP6VBnrY=; 
 b=UCa/DtgU+woNVwfC8cGtWJKkFsnu/mtutmtBXbF6WCywsW08hpk+xhBozHe0L7B1ZHbccL6gcJ78CEgdfDjbbREnHEOOIn5bbelxGxMjrE/n43Nn/N8yJkGJln8YwKgVQeAuTwm1Mia8DiN6dNATzsbmYA9Y/o281tRbQizbYu0=;
X-UUID: 39b52ad618cf4dd787dedc3aae4e3557-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1875070282; Wed, 19 Aug 2020 22:15:44 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:39 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 09/21] drm/mediatek: fix aal size config
Date: Thu, 20 Aug 2020 14:04:06 +0800
Message-ID: <1597903458-8055-10-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021550_653179_AF92E30F 
X-CRM114-Status: GOOD (  14.20  )
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

fix aal size config

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index c90d2ee..fe76387 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -31,8 +31,13 @@
 #define DISP_REG_UFO_START			0x0000
 
 #define DISP_AAL_EN				0x0000
+#define DISP_AAL_CFG				0x0020
+#define AAL_RELAY_MODE					BIT(0)
+#define AAL_ENGINE_EN					BIT(1)
 #define DISP_AAL_SIZE				0x0030
 
+#define DISP_AAL_OUTPUT_SIZE			0x04d8
+
 #define DISP_CCORR_EN				0x0000
 #define CCORR_EN				BIT(0)
 #define DISP_CCORR_CFG				0x0020
@@ -182,7 +187,11 @@ static void mtk_aal_config(struct mtk_ddp_comp *comp, unsigned int w,
 			   unsigned int h, unsigned int vrefresh,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_AAL_SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_AAL_SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_AAL_OUTPUT_SIZE);
+
+	mtk_ddp_write_mask(NULL, AAL_RELAY_MODE, comp, DISP_AAL_CFG,
+			   AAL_RELAY_MODE | AAL_ENGINE_EN);
 }
 
 static void mtk_aal_start(struct mtk_ddp_comp *comp)
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
