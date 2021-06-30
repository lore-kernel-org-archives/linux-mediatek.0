Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6F8C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5652A61CE4
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5652A61CE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xr8DHDtSD7kp93hagXD8JwqQ7KKUDGfAzg+ZAhYau0=; b=W5owgpGbQhfvfB
	P3dMHIP0hgWQPrQ+WHfp7cxM0vnFl3e48JDnAO5byAR4SqCyKZpmoRS5IjFh8bKnyjeIGv1Mh+rUH
	TymPl2wGlDQsgK4I1IjIhNgVc8S9rOop3PN49lhBoF7GSFb8mY0tbqawSrGZDcNPWsWdfgYPSJWFh
	1QNaOQzgh/LZLBiZJ+60chhbCY5UuBzsxxfpc7Z9nSMmrFt21sWtxASrVRblQKN2iA9Ms9zIYKJkp
	e/B+mK+wn81G7VMnuT+8dhsvTHkcPr1/4VuKfz2hAbRb33sDlaD0Fp9NjAo1CmgHNEuHwjPzfn8KD
	EGFj/Z8aHEgGqr85mTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUea-00D2x1-5b; Wed, 30 Jun 2021 07:29:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUdx-00D2i3-To; Wed, 30 Jun 2021 07:28:23 +0000
X-UUID: 8ce69a71b7b44caabc5ea586c7f7a34d-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+mCaUpaUO3TAcCYObWQUI86m46lQ5x16L9yJoHRjHro=; 
 b=ioEqs7UPdNOCEO7JuPkKjppWpQKEwGjZky56vmkl6+XuOT0QJ7YWVZUlXHgnwOmlamaHcw9atpSQZf0AXXDYgi3mf97cD6T2KWhuAem0R8JyQgjjIt6OOthldlQlXTchK38myALA1EuxG9rTX1y7yVsh2PpiqWSiZ8WC+hR2duA=;
X-UUID: 8ce69a71b7b44caabc5ea586c7f7a34d-20210630
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 354227374; Wed, 30 Jun 2021 00:28:15 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 00:28:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 15:28:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 15:28:11 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bin Liu
 <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2,4/9] media: mtk-jpegenc: Refactor jpeg clock interface
Date: Wed, 30 Jun 2021 15:27:54 +0800
Message-ID: <1625038079-25815-5-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_002822_034902_E5E83F74 
X-CRM114-Status: GOOD (  16.30  )
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

Using the needed param for lock on/off function.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 46 ++++++++++++++++++++++++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h | 28 +++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 24edd87..7c053e3 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1053,7 +1053,32 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 
 static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 {
-	int ret;
+	struct mtk_jpeg_dev *comp_dev;
+	struct mtk_jpegenc_pm *pm;
+	struct mtk_jpegenc_clk *jpegclk;
+	struct mtk_jpegenc_clk_info *clk_info;
+	int ret, i;
+
+	if (jpeg->variant->is_encoder) {
+		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+			comp_dev = jpeg->hw_dev[i];
+			if (!comp_dev) {
+				dev_err(jpeg->dev, "Failed to get hw dev\n");
+				return;
+			}
+
+			pm = &comp_dev->pm;
+			jpegclk = &pm->venc_clk;
+			clk_info = jpegclk->clk_info;
+			ret = clk_prepare_enable(clk_info->jpegenc_clk);
+			if (ret) {
+				dev_err(jpeg->dev, "jpegenc clk enable %d %s fail\n",
+				       i, jpegclk->clk_info->clk_name);
+				return;
+			}
+		}
+		return;
+	}
 
 	ret = mtk_smi_larb_get(jpeg->larb);
 	if (ret)
@@ -1067,6 +1092,25 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 
 static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 {
+	struct mtk_jpeg_dev *comp_dev;
+	struct mtk_jpegenc_pm *pm;
+	struct mtk_jpegenc_clk *jpegclk;
+	int i;
+
+	if (jpeg->variant->is_encoder) {
+		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+			comp_dev = jpeg->hw_dev[i];
+			if (!comp_dev) {
+				dev_err(jpeg->dev, "Failed to get hw dev\n");
+				return;
+			}
+
+			pm = &comp_dev->pm;
+			jpegclk = &pm->venc_clk;
+			clk_disable_unprepare(jpegclk->clk_info->jpegenc_clk);
+		}
+		return;
+	}
 	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
 				   jpeg->variant->clks);
 	mtk_smi_larb_put(jpeg->larb);
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index bdbd768..93ea71c 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -75,6 +75,31 @@ struct mtk_jpeg_variant {
 	u32 cap_q_default_fourcc;
 };
 
+enum mtk_jpegenc_hw_id {
+	MTK_JPEGENC_HW0,
+	MTK_JPEGENC_HW1,
+	MTK_JPEGENC_HW_MAX,
+};
+
+/** * struct mtk_jpegenc_clk_info - Structure used to store clock name */
+struct mtk_jpegenc_clk_info {
+	const char	*clk_name;
+	struct clk	*jpegenc_clk;
+};
+
+/* struct mtk_vcodec_clk - Structure used to store vcodec clock information */
+struct mtk_jpegenc_clk {
+	struct mtk_jpegenc_clk_info	*clk_info;
+	int	clk_num;
+};
+
+/** * struct mtk_vcodec_pm - Power management data structure */
+struct mtk_jpegenc_pm {
+	struct mtk_jpegenc_clk	venc_clk;
+	struct device	*dev;
+	struct mtk_jpeg_dev	*mtkdev;
+};
+
 /**
  * struct mtk_jpeg_dev - JPEG IP abstraction
  * @lock:		the mutex protecting this structure
@@ -103,6 +128,9 @@ struct mtk_jpeg_dev {
 	struct device		*larb;
 	struct delayed_work job_timeout_work;
 	const struct mtk_jpeg_variant *variant;
+
+	struct mtk_jpeg_dev *hw_dev[MTK_JPEGENC_HW_MAX];
+	struct mtk_jpegenc_pm pm;
 };
 
 /**
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
