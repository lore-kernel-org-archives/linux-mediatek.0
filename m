Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D95CAC597
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Sep 2025 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmf0OIsGMiE8P3J1F3N/Fn2ucYiqGWZO/N1K1kd83tw=; b=xzqs3Xci/6PxRgondvK2gIsKkO
	P46fIIptMSPYB9mKNvmPF6qflL6F92yZ7qFIrK24JlxuaLmj85HpPxpbi2uUMghmnMg1lx5/nSCyh
	+5OzSZXi4Vl/HBrw9n6NqQ974jxEcN4bvbXpZm9FaFLpVKswXF4sQzgugGUZuHvmkx0RyyBue/8aN
	C4rkA2zOp9UvsrhGX8WTcb7nSMlWBmOUCFV4Ine2Dxy9dMIuTwxZV6Wzxw4v8sP9jmxWwGJyYYe7k
	mYVvr/jt0XQG9BGd5+x9igiHm5R4s2ll5nujsQVwTEl/Lh2/Z79BOBqg5chmKSOCTxp6l61J1dDuI
	qpzvLVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8i7-00000004DEa-0io6;
	Mon, 15 Sep 2025 12:53:35 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8i4-00000004DCz-0Cpo;
	Mon, 15 Sep 2025 12:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fm
	f0OIsGMiE8P3J1F3N/Fn2ucYiqGWZO/N1K1kd83tw=; b=QQbqExzp1A7pb9QAsX
	IpzD3pqilcPrF125S81aF2DegBmtDgZM+rCIkBlYjExAMpOt3Ky2GkedRs2Kq8s8
	k76g0Ltwfdo9EiT4qlMaaFg+E4z+KTUzWJ/6gjr9Rc9pq0HBdL3Pjt1SeKuYEtIa
	IK02Cowx4OULX2ALe26hu2nKw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCHOtEhDMhoJPeJCw--.8722S4;
	Mon, 15 Sep 2025 20:52:51 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: minghsiu.tsai@mediatek.com,
	houlong.wei@mediatek.com,
	andrew-ct.chen@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hverkuil@kernel.org,
	eballetbo@kernel.org,
	eizan@chromium.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mtk-mdp: Fix a reference leak in mtk_mdp_probe()
Date: Mon, 15 Sep 2025 20:52:48 +0800
Message-Id: <20250915125248.181608-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgCHOtEhDMhoJPeJCw--.8722S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww15tryfJry8Jr1UtrWfGrg_yoW8Wr1rpF
	WDWayFkrWUuF4jgr4UGa1UZa45Aw1S9w48Wa1xAw4xu345WrWDJr10qFyIqrW8JF97Ca43
	Jr1IqFWxuFWrZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_MKuUUUUUU=
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiMwLJbmjIBhvCbwAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_055332_405119_5FFE0EB3 
X-CRM114-Status: UNSURE (   9.15  )
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

vpu_get_plat_device() increases the reference count of the returned
platform device. Add platform_device_put() to prevent reference leak.

Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors during probe")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0..6aedb6033010 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -198,7 +198,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 				  VPU_RST_MDP);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_m2m_register;
+		goto err_vpu_get_dev;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -206,7 +206,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_m2m_register;
+		goto err_vpu_get_dev;
 	}
 
 	pm_runtime_enable(dev);
@@ -214,6 +214,9 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_vpu_get_dev:
+	platform_device_put(mdp->vpu_dev);
+
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.25.1


