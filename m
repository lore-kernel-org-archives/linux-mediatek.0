Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B284C4742C
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 12:39:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB962224E
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 12:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y59TCMWr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB962224E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=699o8ShxKDN+SeBPN4KBZ/2vKwsCJBoZV3kyYDGD41c=; b=y59TCMWrsH9umywSDLBWdFJsI
	Is25AmQavK3MlI577JCEMG3scG9wUrm5LTDKVkxZZS3m2OWvA+jUvRu04etrAcqPXgczhdfFeYwq0
	NRl+LzHKrGvWhvZSDnVs28irJFsTFwjM9WpTNg17mSJZfHJ1qJ+sax78thtjytUmyFUVtdGqAwnOq
	h+VcYHfP+3fMGQ5RT2tFPS4fms928SDJshD/QEWfFzXWGTaiCTo7Eroe4tWhhww0KJvimNGQWQS4T
	pt0XyaciE/e+BuEnT0M5yDEDg89y+ZF0Rdd+HdjP9IRq5Jwe4P37jXzbBllRyahAIgeoTniKy1r1j
	sgwfxkXaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaI3u-0001jU-B8; Wed, 04 Nov 2020 12:38:50 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaI3S-0001T8-KS; Wed, 04 Nov 2020 12:38:24 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CR5m1643Gzhgl5;
 Wed,  4 Nov 2020 20:38:09 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 4 Nov 2020
 20:38:03 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <rick.chang@mediatek.com>, <bin.liu@mediatek.com>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>, <tiffany.lin@mediatek.com>,
 <andrew-ct.chen@mediatek.com>, <xia.jiang@mediatek.com>,
 <hverkuil-cisco@xs4all.nl>, <tfiga@chromium.org>,
 <minghsiu.tsai@mediatek.com>, <jcliang@chromium.org>
Subject: [patch V3 2/6] media: platform: add missing put_device() call in
 mtk_jpeg_probe() and mtk_jpeg_remove()
Date: Wed, 4 Nov 2020 20:41:36 +0800
Message-ID: <20201104124140.3443309-3-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201104124140.3443309-1-yukuai3@huawei.com>
References: <20201104124140.3443309-1-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_073822_963800_662DAA15 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yukuai3@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

if mtk_jpeg_clk_init() succeed, mtk_jpeg_probe() and mtk_jpeg_remove()
doesn't have a corresponding put_device(). Thus add a new helper
mtk_jpeg_clk_release() to fix it.

Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 106543391c46..88a23bce569d 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1332,6 +1332,12 @@ static void mtk_jpeg_job_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
+
+static inline void mtk_jpeg_clk_release(struct mtk_jpeg_dev *jpeg)
+{
+	put_device(jpeg->larb);
+}
+
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
@@ -1436,6 +1442,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 
 err_dev_register:
+	mtk_jpeg_clk_release(jpeg);
 
 err_clk_init:
 
@@ -1453,6 +1460,7 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
 	video_device_release(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
+	mtk_jpeg_clk_release(jpeg);
 
 	return 0;
 }
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
