Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18BEC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 06:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y+5KYJiUtormz/jrT3bvfPhN0fTpLqDXBrS1X7+kgf8=; b=pqkaPYRkIaQvC8fociSyl5ld3o
	HDP5XVxKOro+F9XGz0Z3q7t//ra7N8HFlEmAlTJZyUPcBGbpAovMkN8U2Jadcr3w0qzxINO0ziML9
	CP/PZ6UChItCntgx2Mdd9aEZbDQdmK2hZa6C2wjV81llCY/7zX5O8h9/4Sl6SAdOvwFv3W3EleVdi
	K8ehs7QIxK8O5GYWhctOGEkSRSSjcaw4Q9u1Yy7IPDzN9eSLyzwFBprQbj6xz1BagyPTuD+mLlb1+
	8Ss69YwJIod7Mfn4+qRpi4QH3t7/+wdvXLrVkEWrg380Y9kpgbIpzvB1fiDJGN7A/ERq6MY9o0fM0
	uH5bEcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ4JZ-00BW3V-HS; Mon, 06 Mar 2023 06:27:17 +0000
Received: from m12.mail.163.com ([220.181.12.198])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ4JO-00BW1N-3n; Mon, 06 Mar 2023 06:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=y+5KY
	JiUtormz/jrT3bvfPhN0fTpLqDXBrS1X7+kgf8=; b=QRs+RFmtFj29262cuJfm3
	qnUZvbSvRH5p6riP5bN+xrPl5/Efefk8ywOtw3yP/shz+JFzx8TE0l5IMN0biQWP
	nZ0/AsSiiMaWawwXCZA5n+Rnl/rsVmZf9/O3Jp1DaBa85YLdVaa7MBHtWcEBLg51
	drWq+xyBTDn5UEEEL2ADkA=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
	by zwqz-smtp-mta-g0-1 (Coremail) with SMTP id _____wBHf_OahwVk540ZCQ--.40472S2;
	Mon, 06 Mar 2023 14:26:34 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: mchehab@kernel.org
Cc: bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	hackerzheng666@gmail.com,
	1395428693sheep@gmail.com,
	alex000young@gmail.com,
	Zheng Wang <zyytlz.wz@163.com>
Subject: [RESEND PATCH] media: mtk-jpeg: Fix use after free bug due to uncanceled work
Date: Mon,  6 Mar 2023 14:26:33 +0800
Message-Id: <20230306062633.200427-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHf_OahwVk540ZCQ--.40472S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF17uw15Jr4xtw4xCFy7trb_yoW8Xry7pr
	ZxK3yDCrWUWrs0qr1UJ3WUAF1rCw1rKa1xWr17uw4Iv3y3Jrs7JryFya48tFWIyF92k3Wr
	Jr10q3s7GrWDZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi-6pkUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbBzgIqU2I0Xi19SAAAsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_222706_619878_77C7051D 
X-CRM114-Status: GOOD (  11.71  )
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

In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
and mtk_jpeg_enc_device_run may be called to start the
work.
If we remove the module which will call mtk_jpeg_remove
to make cleanup, there may be a unfinished work. The
possible sequence is as follows, which will cause a
typical UAF bug.

Fix it by canceling the work before cleanup in the mtk_jpeg_remove

CPU0                  CPU1

                    |mtk_jpeg_job_timeout_work
mtk_jpeg_remove     |
  v4l2_m2m_release  |
    kfree(m2m_dev); |
                    |
                    | v4l2_m2m_get_curr_priv
                    |   m2m_dev->curr_ctx //use

Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 969516a940ba..364513e7897e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1793,7 +1793,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 static int mtk_jpeg_remove(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
-
+	cancel_delayed_work(&jpeg->job_timeout_work);
 	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
-- 
2.25.1


