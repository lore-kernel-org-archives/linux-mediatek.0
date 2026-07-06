Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7F4C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 06:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2hQHBwjnlwqn6dPE3I0HghH4cOLWxdH4aGvpuK1BKR8=; b=xLruEdJ554TEZIC/WJF6a1lWuI
	gCxacvcBWGas/Tx6Cja78DN2ty4DcTzSW+N2d1Nop7wkm372BCjMbwUuzwpQQNOPpZoUkyiM1YwhL
	MhR8VooUg0+4PwNUELofsZaRaGKBQGI+pKTZV3MWvbeuNOzTISFFKy/RRdtzwTRO8vq6DPa76tUfC
	ZymThyW9spSfWlgmQPkLAG3AnEKRMGrYvsA9Egt4b8hA7ClcfaGLWQmUclBra/Rzi1zDQjGHm0Xlv
	o9YEdSoJmesoJELVnVcPFNSgJM0TpAOtgEqQp8wZuaCra4QZBRXUJH2tWpdMrfHDEc0cDREiZKamV
	Q+XRQFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdFm-0000000BfiN-3KzA;
	Mon, 06 Jul 2026 06:56:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdFl-0000000Bfhl-19Ii
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 06:56:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D8EC61879;
	Mon,  6 Jul 2026 06:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E671F00A3D;
	Mon,  6 Jul 2026 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320987;
	bh=2hQHBwjnlwqn6dPE3I0HghH4cOLWxdH4aGvpuK1BKR8=;
	h=From:To:Cc:Subject:Date;
	b=ltJQNxvtZQBcF3ikQATIetZQg6U+kzmKWAhm2jQXrLiArEMvh9MU6FDW770gd4aSL
	 1bR4GYUi7viobCEyvuK2bq4A+66F6rOUUCA3FLmDoggz8rUrIDql1t5nrwaWgyXEA9
	 mr7JM1v1wuGvVTEcuE3BrnNkFqnIwll/qJKdsbxXLbXPcvXv1QFasZDl2CvZfWESt+
	 4zzjGY83KUFRzBHahMmPcucXwjqKSen+Qt9ukjVxcQ4FDtQLRhkgv/Kd51sd9dowyu
	 7MpIeLF/8G31QkMHzoriRi5z7YBKfzaLK/VaKFKJfTNst9zyrs0a4UQdb+I29XQ905
	 Po0C/kRgStXOA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wgdFg-00000001dJ7-37Da;
	Mon, 06 Jul 2026 08:56:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Erin Lo <erin.lo@mediatek.com>
Subject: [PATCH] remoteproc: scp: fix device reference leak on failed lookup
Date: Mon,  6 Jul 2026 08:56:14 +0200
Message-ID: <20260706065614.389412-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make sure to drop the reference taken to the SCP device when attempting
to look up its driver data before the driver has been bound.

Note that holding a reference to a device does not prevent its driver
data from going away.

Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
Cc: stable@vger.kernel.org	# 5.6
Cc: Erin Lo <erin.lo@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/remoteproc/mtk_scp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 85a74c9ec521..436656bdfa8b 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -36,6 +36,7 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *scp_node;
 	struct platform_device *scp_pdev;
+	struct mtk_scp *scp;
 
 	scp_node = of_parse_phandle(dev->of_node, "mediatek,scp", 0);
 	if (!scp_node) {
@@ -51,7 +52,13 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
 		return NULL;
 	}
 
-	return platform_get_drvdata(scp_pdev);
+	scp = platform_get_drvdata(scp_pdev);
+	if (!scp) {
+		put_device(&scp_pdev->dev);
+		return NULL;
+	}
+
+	return scp;
 }
 EXPORT_SYMBOL_GPL(scp_get);
 
-- 
2.54.0


