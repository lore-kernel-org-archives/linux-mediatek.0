Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C827AEE6426
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 02:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CVqoeT0mnTI+LqeX7nHVPmR3flruHUYeZhjUTZwdBqI=; b=JjUKdQxf43R/dGeyzpgYWgnVlr
	fxEnUA+rAAakfwSiGI7oxlW1zvzlBo+DO/LgwVtoDweKe47cGZ4pm4J8pey8HXbX5znwTbFcaDtWg
	MsTalabagQlUk7xDd2ni5OHqUrr4BWyB6VZfDFPzt4W8a/MWVN36v32lSEqF3tKPZrdopLHtYGzcN
	KAkIWEQODlFVP/hVc4RQEVZ2f7BnMcQdj6W21csIl6+qUlMw8sn/DVbcKxpI/PIzl8aFVDGQai0QP
	QDj0CVBi6knN3Cue/Oc2VzPTwO11aAGpwECCnswcLT33VIgWTD4QAF9wFFsV6/OzrPxiDP+4kxoRz
	MKMh83bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soZtk-0000000Beaa-2fqg;
	Thu, 12 Sep 2024 02:49:32 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soZse-0000000BePV-1kTT;
	Thu, 12 Sep 2024 02:48:26 +0000
Received: from laptop.lan (unknown [123.123.40.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 5E1E640F8D;
	Thu, 12 Sep 2024 02:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1726109299;
	bh=CVqoeT0mnTI+LqeX7nHVPmR3flruHUYeZhjUTZwdBqI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=rZ50K7SY+zqczPTxHxVQRQdgPqUSyyLWXDwszPhh6uG55DP68QjO//gk4IlNHw+nI
	 sd7GhjLx65XXjdhPBKSfePt9Bjq1bJUZcDv30zsqezUexSy7xgl8LxUe+D4HoVhCjQ
	 Ml3YgP78mYpTv7CsittFcWR+Lua13LjKOBfpRxjbL7X7g7EtIONuZnucAnXTcnVbwH
	 05H7u+Fg5PtQvuHd5xXfkXHpajhPDIeWcsEoj0j13/oLnecpE2O9ohrH0/o1gJwt1u
	 gyOu0IBi2vdVSzElsIJ54OkwEvoy9eAvjA4FkuMaM+FNuhD34WfbEWV/fCRSnH+NwI
	 FSdATTCxFXAIA==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: bin.liu@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	irui.wang@mediatek.com,
	hverkuil-cisco@xs4all.nl,
	kyrie.wu@mediatek.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mtk-jpeg: Fix null-ptr-deref during unload module
Date: Thu, 12 Sep 2024 10:48:01 +0800
Message-Id: <20240912024801.6904-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_194824_749855_CD9167F3 
X-CRM114-Status: GOOD (  11.51  )
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

The workqueue should be destroyed in mtk_jpeg_core.c since commit
09aea13ecf6f ("media: mtk-jpeg: refactor some variables"), otherwise
the below calltrace can be easily triggered.

[  677.862514] Unable to handle kernel paging request at virtual address dfff800000000023
[  677.863633] KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
...
[  677.879654] CPU: 6 PID: 1071 Comm: modprobe Tainted: G           O       6.8.12-mtk+gfa1a78e5d24b+ #17
...
[  677.882838] pc : destroy_workqueue+0x3c/0x770
[  677.883413] lr : mtk_jpegdec_destroy_workqueue+0x70/0x88 [mtk_jpeg_dec_hw]
[  677.884314] sp : ffff80008ad974f0
[  677.884744] x29: ffff80008ad974f0 x28: ffff0000d7115580 x27: ffff0000dd691070
[  677.885669] x26: ffff0000dd691408 x25: ffff8000844af3e0 x24: ffff80008ad97690
[  677.886592] x23: ffff0000e051d400 x22: ffff0000dd691010 x21: dfff800000000000
[  677.887515] x20: 0000000000000000 x19: 0000000000000000 x18: ffff800085397ac0
[  677.888438] x17: 0000000000000000 x16: ffff8000801b87c8 x15: 1ffff000115b2e10
[  677.889361] x14: 00000000f1f1f1f1 x13: 0000000000000000 x12: ffff7000115b2e4d
[  677.890285] x11: 1ffff000115b2e4c x10: ffff7000115b2e4c x9 : ffff80000aa43e90
[  677.891208] x8 : 00008fffeea4d1b4 x7 : ffff80008ad97267 x6 : 0000000000000001
[  677.892131] x5 : ffff80008ad97260 x4 : ffff7000115b2e4d x3 : 0000000000000000
[  677.893054] x2 : 0000000000000023 x1 : dfff800000000000 x0 : 0000000000000118
[  677.893977] Call trace:
[  677.894297]  destroy_workqueue+0x3c/0x770
[  677.894826]  mtk_jpegdec_destroy_workqueue+0x70/0x88 [mtk_jpeg_dec_hw]
[  677.895677]  devm_action_release+0x50/0x90
[  677.896211]  release_nodes+0xe8/0x170
[  677.896688]  devres_release_all+0xf8/0x178
[  677.897219]  device_unbind_cleanup+0x24/0x170
[  677.897785]  device_release_driver_internal+0x35c/0x480
[  677.898461]  device_release_driver+0x20/0x38
...
[  677.912665] ---[ end trace 0000000000000000 ]---

Fixes: 09aea13ecf6f ("media: mtk-jpeg: refactor some variables")
Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c  | 10 ++++++++++
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c    | 11 -----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index ac48658e2de4..ff2694676355 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1293,6 +1293,11 @@ static int mtk_jpeg_single_core_init(struct platform_device *pdev,
 	return 0;
 }
 
+static void mtk_jpeg_destroy_workqueue(void *data)
+{
+	destroy_workqueue(data);
+}
+
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
@@ -1337,6 +1342,11 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 							  | WQ_FREEZABLE);
 		if (!jpeg->workqueue)
 			return -EINVAL;
+		ret = devm_add_action_or_reset(&pdev->dev,
+					       mtk_jpeg_destroy_workqueue,
+					       jpeg->workqueue);
+		if (ret)
+			return ret;
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 4a6ee211e18f..2c5d74939d0a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -578,11 +578,6 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
 	return 0;
 }
 
-static void mtk_jpegdec_destroy_workqueue(void *data)
-{
-	destroy_workqueue(data);
-}
-
 static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegdec_clk *jpegdec_clk;
@@ -606,12 +601,6 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	dev->plat_dev = pdev;
 	dev->dev = &pdev->dev;
 
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       mtk_jpegdec_destroy_workqueue,
-				       master_dev->workqueue);
-	if (ret)
-		return ret;
-
 	spin_lock_init(&dev->hw_lock);
 	dev->hw_state = MTK_JPEG_HW_IDLE;
 
-- 
2.34.1


