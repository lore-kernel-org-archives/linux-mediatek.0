Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47208C5320E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 01:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lmv4uiN3qZvU6/NgG4L5k3mc5szxVQmfiLjQ/I/duo4=; b=eFlMRiZTWgKhMtXzWK316KvOG6
	YVOFqR4M5FwzD2Vpln/TQzMleWM7CvS2b58GyzN4MrRU1B6QFsmlLzUWjUMnYtn/B2HnSVkYZhAyE
	rgMVkwt23R3zVVdHbJrV8oYa/9HtYXbaGL3K+INAXXj0bTVEPGhcZHE5kJKAjRgIkVV7LHbf59Ua0
	keUATGFR5AS2Bj3OkMcOJwjlhCb1ZejoCMoQt/6ojXqkTl3sRmkjU1BiKvJLumpT7drzTfP6Rhgc2
	a1LS+JlFtUmdb/YDHNmy7J0+THeTSDYb+D1eEHtztTrxRBEq7gQVeW4IvhbZ0T5/ix26IsHhfiQES
	pG2/CpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOnN-00000005Sxf-17Ge;
	Mon, 26 Aug 2024 01:45:25 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOmZ-00000005Sti-34Jl;
	Mon, 26 Aug 2024 01:44:37 +0000
Received: from laptop.lan (unknown [125.33.218.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 150733F20C;
	Mon, 26 Aug 2024 01:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1724636672;
	bh=Lmv4uiN3qZvU6/NgG4L5k3mc5szxVQmfiLjQ/I/duo4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=tym4uvgG9Udo5WNioWWSdBBcT46ciJcwfgAjFbHHnhfpyinKDvA0D1qk4ohr3Om9t
	 zkGJz7dNXG+zXKk/7tZqmizIkLOyycxGD9/57TqOdHNsUphMd+BVqRnD33WXdLoJ8H
	 NbhuYkoJqUT57do3uDvH+XYwiyXWdlaWPP6Ad3TyivT3GEsyHoQXsEXPNlqwR6LFQx
	 FLpLWsB0Sigd6KbtVR0TvjCujBf8cdPXIfQBQtDw3CTJt3ZA/HyDBQTTWyaviPTODc
	 nK3lqcMEjNpU2deoeEGfwCbJzml9QYy289HeBPeZE6nqyjoKtBDBVqlaGKq+eeON/I
	 m93QssRd3z0Fg==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: sean.wang@mediatek.com,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] hwrng: mtk - Add remove function
Date: Mon, 26 Aug 2024 09:44:19 +0800
Message-Id: <20240826014419.5151-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_184436_173734_BDA86C62 
X-CRM114-Status: GOOD (  10.63  )
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

Add mtk_rng_remove function which calles pm_runtime relevant funcs
and unregister hwrng to paired with mtk_rng_probe.

And without remove function, pm_runtime complains below when reload
the driver.

mtk_rng 1020f000.rng: Unbalanced pm_runtime_enable!

Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 drivers/char/hw_random/mtk-rng.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 302e201b51c2..1b6aa9406b11 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -149,6 +149,15 @@ static int mtk_rng_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void mtk_rng_remove(struct platform_device *pdev)
+{
+        struct mtk_rng *priv = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	devm_hwrng_unregister(&pdev->dev, &priv->rng);
+}
+
 #ifdef CONFIG_PM
 static int mtk_rng_runtime_suspend(struct device *dev)
 {
@@ -186,6 +195,7 @@ MODULE_DEVICE_TABLE(of, mtk_rng_match);
 
 static struct platform_driver mtk_rng_driver = {
 	.probe          = mtk_rng_probe,
+	.remove_new	= mtk_rng_remove,
 	.driver = {
 		.name = MTK_RNG_DEV,
 		.pm = MTK_RNG_PM_OPS,
-- 
2.34.1


