Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEC2C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 15:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bh6sKOCRclsxDKMADlWPuMRe+UrA+2266i3mkC7SehE=; b=xwJvt/B46W0TmJmTW0um895Rtn
	9Im2I1Ax0Sh8wT7EkIZIWmqh8BCpqcW6HMt4d2SpAH9IotBUqmgP4SfAk3klwbbBFZrNfInZaxev5
	7V4hvWl0nMnKcnkD1dAGWx0iibQacmu10ZHsNxUBAdVe57xxB+Gh7HRFYfNHW6nYj1u5ahquzTbJN
	mUl3MfE8eite9CfL0zRUQ4x8JA0NvD5vVRi6xuyo0mY66zzy3AeynJQ9ptLGzBjQB6/pqc3CEmKh0
	saNNFduMlxdf8h8PKlV+1CMuIyCfEWpjwELx35OoMXCUI6gldaOCSlTzw8TOWqb+eQwwOACJpRqn5
	p+5legpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot99U-006cF3-8F; Thu, 10 Nov 2022 15:07:36 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot99P-006c53-Lm
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 15:07:34 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N7Q8x50lhzJn3h;
	Thu, 10 Nov 2022 23:04:17 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 23:07:20 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 10 Nov
 2022 23:07:19 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
CC: <bin.liu@mediatek.com>, <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<kyrie.wu@mediatek.com>, <irui.wang@mediatek.com>,
	<hverkuil-cisco@xs4all.nl>, <yangyingliang@huawei.com>
Subject: [PATCH -next] media: mtk-jpegdec: add missing destroy_workqueue()
Date: Thu, 10 Nov 2022 23:05:59 +0800
Message-ID: <20221110150559.390448-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_070731_929338_824EB685 
X-CRM114-Status: UNSURE (   8.39  )
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

destroy_workqueue() needs be called to when driver is
unloading, fix it by using devm_add_action_or_reset()
to make workqueuedevice-managed.

Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index d98f4cdfeea9..8c07fa02fd9a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -580,6 +580,11 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
 	return 0;
 }
 
+static void mtk_jpegdec_destroy_workqueue(void *data)
+{
+	destroy_workqueue(data);
+}
+
 static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegdec_clk *jpegdec_clk;
@@ -614,6 +619,11 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 								| WQ_FREEZABLE);
 		if (!master_dev->workqueue)
 			return -EINVAL;
+
+		ret = devm_add_action_or_reset(&pdev->dev, mtk_jpegdec_destroy_workqueue,
+					       master_dev->workqueue);
+		if (ret)
+			return ret;
 	}
 
 	atomic_set(&master_dev->dechw_rdy, MTK_JPEGDEC_HW_MAX);
-- 
2.25.1


