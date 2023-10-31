Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE866C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJWU5tnjso1vDAK736GkMoFEm3BXg8uhBy9G73LcJvU=; b=SQuKV6vHrNVJbfjVXR1qqPmbTh
	n0oMYsvy1eFX5+iIDFKYr96Ro9wyOjXI8CaoZdyQ5bue2vV76tLgyO9N/+0c8o5vKZZnVlljpqXTL
	Pc3wi6p+pD2lRjGUj9ae9Vvs7BWg4pWf9u3TFobOEaaiuzQGk4xQhTl+JtlfXq4hNWVJr0zuM3rv6
	gvj4vxXTSLBoOyQ6ssQ4qrRVmuqdi0dfnanYdxAl5Pt/ed3ibiAH/6slv+DlB5PqcAD4P6n7ccZWU
	DSoM8TldVYs5XMJGs4+oKJxRUT3Fpm8EjXlMyC/Ufg0NcK1I76GHheJmv70vUr/4d48humx038tte
	k3UcYP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj0L-004ft4-2q;
	Tue, 31 Oct 2023 07:17:37 +0000
Received: from m12.mail.163.com ([220.181.12.198])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj0H-004fr7-2N;
	Tue, 31 Oct 2023 07:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=SJWU5
	tnjso1vDAK736GkMoFEm3BXg8uhBy9G73LcJvU=; b=atXhhDwUyy89XVbCFZ8ia
	BSGTaJeLg4Fst7Xvz07DcCB3s2IveiCSNDwyx6ET5JKTU/mIL4uV1VdQNGgeu2uA
	ZwlUCsopSlc4U0e2wor87qqHUaR+9p3uJ22Hnln5J28XI8ZGlNmIQ60EbhDwijYQ
	OIA8q5oU/DwWKnhc1Od4f8=
Received: from leanderwang-LC4.localdomain (unknown [111.206.145.21])
	by zwqz-smtp-mta-g3-3 (Coremail) with SMTP id _____wBn3ojfqUBlwMj4AQ--.51864S3;
	Tue, 31 Oct 2023 15:16:49 +0800 (CST)
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
Subject: [PATCH v2 1/3] media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to  avoid the crash of multi-core JPEG devices
Date: Tue, 31 Oct 2023 15:16:42 +0800
Message-Id: <20231031071644.20086-2-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031071644.20086-1-zyytlz.wz@163.com>
References: <20231031071644.20086-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBn3ojfqUBlwMj4AQ--.51864S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4rtF48tF1UJF4fZr4xWFg_yoW8Gr45pF
	WfK348CrWUGF4qgryDAa47ZFy5Gwnaya40gr47uwn2q393XF47t34jya4FqFWxXF9rCFy3
	tF1FvryfWF4jvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziqQ6QUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiXB8aU1Xl78YxZAAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_001734_167568_3EEC8983 
X-CRM114-Status: GOOD (  10.93  )
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
v2:
- put the patches into a single series suggested by Dmitry
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


