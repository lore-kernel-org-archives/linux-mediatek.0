Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D1DC88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gTLwRHwiUe7+GvIFtClrzL61I2xfkUvMQEXH2OCtR3Y=; b=FdAsd/5AYU6prHf0h8utsFECbd
	z8KThcznAR+1AU1eVbrAatuGOIEiY7jZC/mC524oucMiR8evt+r3YDEYvobvQTEFTwe5tlC3q+W3r
	f8p2sBAwIC5zs5Ob5AOjZ6ypxNwl+p7do7hHch7J5KpOjJwAVxxiSZSyg3IpN38J6VP/fHCx1LdD2
	yVnL72ywd1EPXaNsC4PYu0xaXyJkxpiTOes5CPGmuy90djUipJFcSGlVywOjrIG8NzzlIh0LhnQ/m
	GUzsDGCVChq5EqYm4L3L6yHKu5ibQLgByBovz+/ecG3UdKZi1W5HSiClkZ2PgTsXx19pIzhVPK6o3
	QDb9SGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63I4-000000031H5-0pxW;
	Mon, 14 Sep 2026 09:47:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63I3-000000031Gu-2MQY
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 09:47:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BE6A406C2;
	Mon, 14 Sep 2026 09:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912511F000FF;
	Mon, 14 Sep 2026 09:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379275;
	bh=gTLwRHwiUe7+GvIFtClrzL61I2xfkUvMQEXH2OCtR3Y=;
	h=From:To:Cc:Subject:Date;
	b=Qu6RkjLLZ+IgAX/zpNZO3mSIF/XxeqsnBsMgLi66Op5TRLV1ejriB9fdDnb7na3Qk
	 P0rTVsLTrZedZ0e39Eis2dEsv8Nzvasl9CZgYs7h5AW9JkkT0MiJyU2efqVZJ0uRS/
	 Fy1z1+us365hzB3w7uVSXIRxa305zBUXO+Suozw20H69lCHzm6pwfp19xTlfdpO/Z+
	 javBuNhCVt0qm2QkbFvv8Xd3Fnws0+1lADHwdcjxBsnk3tmGRXkjN9qXhd3Nd+gR1D
	 7wkRYzhPt+HHvcvYv1b52uvPHbwbpAHf0LcsGtOg10ySCw4I6JjQm2Ex8q23W5teZY
	 EaBJGJ/yeJY2w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	tzungbi@kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] Bluetooth: btmtksdio: Fix PM runtime reference leak in shutdown
Date: Mon, 14 Sep 2026 09:47:29 +0000
Message-ID: <20260914094729.3222624-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
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

In btmtksdio_shutdown(), pm_runtime_get_sync() is called at the
beginning of the function.  However, if sending the WMT function
control command fails later, the driver returns early.

It bypasses the corresponding pm_runtime_put_noidle() and
pm_runtime_disable() calls, leaking the PM usage counter and leaving PM
runtime enabled indefinitely.

Fall through to execute the PM runtime cleanup block even if WMT errors.

Fixes: 7f3c563c575e ("Bluetooth: btmtksdio: Add runtime PM support to SDIO based Bluetooth")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/bluetooth/btmtksdio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index fe4ca9395aa3..b7db15268904 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1249,10 +1249,8 @@ static int btmtksdio_shutdown(struct hci_dev *hdev)
 	wmt_params.status = NULL;
 
 	err = mtk_hci_wmt_sync(hdev, &wmt_params);
-	if (err < 0) {
+	if (err < 0)
 		bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
-		return err;
-	}
 
 ignore_wmt_cmd:
 	pm_runtime_put_noidle(bdev->dev);
-- 
2.55.0.1007.g17ff1f9808-goog


