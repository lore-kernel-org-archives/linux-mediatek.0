Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380E6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 04:05:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D22E46108F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 04:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D22E46108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKJVa26aw1vSCxk/9Zp/fh5bszrog1DADEvkZQ4/DyE=; b=qOM+t6sFGX7xXH
	h0LvoWNO5CIt83dAikYv2fpdYUtlXDw6LpHY0UhQ+n7oEhe1Ssrc477l0ESpJ//uWoasppSSv2L+R
	RfUjnH82YjtrwFB8mV4NCd0bLBXBrjHfJ2GhDyEdIMPC8eAvcNbxQXRiUcBVpYdZ9jy5+B8eP8Twx
	5cYCqQPLAjugH0T5M+AlkrMw1++A/Q67/u+rHqiSd9OhuKDXin4GppPxu3S4VWosR5HVnEIBwgpV7
	gi5lxLNcb1l9BEVNnHBNA8/W0c1WwwOBsLS4xpaPyVN93npV7rerbgL1mHNLeL1JVpEhTESixfauW
	7MVe11SmgyTvvvWQceRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgJ9B-009jd3-JV; Fri, 29 Oct 2021 04:05:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgJ99-009jba-3T; Fri, 29 Oct 2021 04:05:40 +0000
X-UUID: 435d6576498e4accb36403b4cccb7cb1-20211028
X-UUID: 435d6576498e4accb36403b4cccb7cb1-20211028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 710729707; Thu, 28 Oct 2021 21:05:34 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 20:55:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 11:55:36 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 29 Oct 2021 11:55:35 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8, 04/17] media: mtk-vcodec: Build decoder pm file as module
Date: Fri, 29 Oct 2021 11:55:14 +0800
Message-ID: <20211029035527.454-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029035527.454-1-yunfei.dong@mediatek.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_210539_162409_243DDE20 
X-CRM114-Status: GOOD (  12.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Need to build decoder pm file as module for master and comp
use the same pm interface.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v8: add new patch to build pm file as module
---
 drivers/media/platform/mtk-vcodec/Makefile            | 6 ++++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 9 +++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index ca8e9e7a9c4e..5d36e05535d7 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -2,7 +2,8 @@
 
 obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
 				       mtk-vcodec-enc.o \
-				       mtk-vcodec-common.o
+				       mtk-vcodec-common.o \
+				       mtk-vcodec-dec-common.o
 
 mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp8_if.o \
@@ -14,7 +15,8 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		mtk_vcodec_dec.o \
 		mtk_vcodec_dec_stateful.o \
 		mtk_vcodec_dec_stateless.o \
-		mtk_vcodec_dec_pm.o \
+
+mtk-vcodec-dec-common-y := mtk_vcodec_dec_pm.o
 
 mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		venc/venc_h264_if.o \
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 20bd157a855c..09a281e3065a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -77,12 +77,14 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
 	put_device(pm->larbvdec);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_pm);
 
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
 {
 	pm_runtime_disable(pm->dev);
 	put_device(pm->larbvdec);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
@@ -94,6 +96,7 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
 
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 {
@@ -103,6 +106,7 @@ void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 	if (ret)
 		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
 
 void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 {
@@ -129,6 +133,7 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 	for (i -= 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
 
 void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
 {
@@ -139,3 +144,7 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
 	for (i = dec_clk->clk_num - 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_off);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Mediatek video decoder driver");
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
