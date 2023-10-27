Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10269C25B67
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYvJWf+GN8rYbJBn1IFT3mrdYzrKe6A0aYWfjBjhd6E=; b=k9yeJ+Y13qWtpJu/ZMFLAJdhmY
	OCdBtUW1GNWbVtCZVVvQLtrtT+OftG/PuA76eFxA+ZuY94r31j2C8P79Sto2jUEMRBvWu+fiVU6Qo
	ZBOiZuhh8CQSIY8lPfXYAWeG7Fdk6IZEp432iqvSLc0iDI+FRgwAsqa6dr4iLQrEblgh5PsmEek3T
	v21LWrDfI5+ZHxlUtQyFTg+ei/0ee8aSDCsAtGVK4lpnGEGsm5yJABDZfQOpqTwXT4r0h3n+5pk4T
	nhk7zXcFuUNbb4XWbWhvkSyFIeIoE9rlL8b1RAZFIBZ0J+HLIn8R4eAfk5mJZvLGXcuizEA2Szz36
	jkHjXlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIyG-00G0gt-0V;
	Fri, 27 Oct 2023 09:17:36 +0000
Received: from m12.mail.163.com ([220.181.12.217])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIyC-00G0fn-2u;
	Fri, 27 Oct 2023 09:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZYvJW
	f+GN8rYbJBn1IFT3mrdYzrKe6A0aYWfjBjhd6E=; b=ckiM1oDvdwLrdawG2pc3M
	j9aLlD88UlfOYVRWSjhZpCCSWen0Y/Gdi/4cuyznANpvX3tHCIdQLdQ3zAlfQvHf
	ghzCLUPbQ7RZ4CkqeS41XbVAsM1Cz39zbLSc4k7BHTcDhNw3xhDYb2irI2texiHq
	OLQrhy/Jjs+krEm/NqNhQA=
Received: from leanderwang-LC4.localdomain (unknown [111.206.145.21])
	by zwqz-smtp-mta-g4-2 (Coremail) with SMTP id _____wDXnzDefztlgV6KBg--.4819S2;
	Fri, 27 Oct 2023 17:16:15 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: dmitry.osipenko@collabora.com
Cc: Kyrie.Wu@mediatek.com,
	bin.liu@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Irui.Wang@mediatek.com,
	security@kernel.org,
	hackerzheng666@gmail.com,
	1395428693sheep@gmail.com,
	alex000young@gmail.com,
	amergnat@baylibre.com,
	wenst@chromium.org,
	Zheng Wang <zyytlz.wz@163.com>
Subject: [PATCH 0/2] media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to avoid the crash of multi-core JPEG devices
Date: Fri, 27 Oct 2023 17:16:12 +0800
Message-Id: <20231027091612.38896-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXnzDefztlgV6KBg--.4819S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4rtF48tF1UJF4fZr4xWFg_yoW8JF4Dpr
	WfK348CrWUWF4qgw4DJa47ZFyrGwnaya40gr47uwn2q393XFsrt34jya4FqFWxZF9FkFW3
	tF1FvryfWF4jvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR1rWrUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiXRAWU1WBq4ptKAAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_021733_355557_35EB3A56 
X-CRM114-Status: UNSURE (   9.51  )
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

This patch reverts commit c677d7ae8314
("media: mtk-jpeg: Fix use after free bug due to uncanceled work").
The job_timeout_work is initialized only for
the single-core JPEG device so it will cause the crash for multi-core
JPEG devices.

Fix it by removing the cancel_delayed_work_sync function.

Fixes: c677d7ae8314 ("media: mtk-jpeg: Fix use after free bug due to uncanceled work")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 7194f88edc0f..60425c99a2b8 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1403,7 +1403,6 @@ static void mtk_jpeg_remove(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
 
-	cancel_delayed_work_sync(&jpeg->job_timeout_work);
 	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
-- 
2.25.1


