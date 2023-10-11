Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C315CCDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=szUp3IgWTq4iCJ08BNtxTyUlyqhJt469/BAgPtCRvbI=; b=nK3iAbfmutl8u2xj7MQuCSj9cr
	4EfE2v4skaZR5q57aK5V866VmcRF+ywFa3Wr/buGX5mWt6L5ORWb//JK/mI1TpXlpEESvOdsyE+Jg
	zlGu9mT+KVVCyxv2HMSb/DeZU5Gg03DgMzste4oBe04BMnZhD3yxdUHd9ZoVgYY8YtNl0F0pILcuj
	YBr1Rc8/WCLnDU3IKXUlQPF95HhYn1YN670GH0qhYNUy9n/WdzBSds1fprgc4KWCR90NSDfSYk8YV
	tnclk+PbmB56vV/K1WnoFB0vrQLocg0KRP5o8GkiNaQ368WSe+OlFBODZmPIA3ELPS0IE9PoMsAPC
	H497ugmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqhrg-00Gr0O-13;
	Wed, 11 Oct 2023 22:39:40 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqhre-00GqzX-0m
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Oct 2023 22:39:39 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a21c283542so5379127b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Oct 2023 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697063974; x=1697668774; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=szUp3IgWTq4iCJ08BNtxTyUlyqhJt469/BAgPtCRvbI=;
        b=3GrTrIgFVMW1bhmN14ZAam8Ut1jMnlnXdVTZcyrRSbusl7n/WFlfAYavEloIOFc2kd
         cr6DVqPSSWLtMmgzG6MEzPWMdM/fHwjb0PUMhbqU+YikwFtDTg4MXg0b3UoSvIyAGIJJ
         CCHdFmhS2Mi4EYoPvqYSI2+eF9fF6rMBhGdqB85xFZiWo+iUdK+DvDG/QjmwYU2HdgsW
         Nv63taopr7nCEg0/8siP0ZRFvtfy3K89GGD+R2H4G6B6SRdK+RpG7DdP2pGopWnhh1bW
         VOfp7YdACqvp7SpNrrQvIPsB9pYNFNqhQ5v0HJE7+ctU2o8dlaKXkIgz3qPPC4/k/rN+
         JwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697063974; x=1697668774;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szUp3IgWTq4iCJ08BNtxTyUlyqhJt469/BAgPtCRvbI=;
        b=jf5dTvEbSKwSv/Mu+xUQ8/VXHaynfDwO5ZLRcTHnbvReay7yDMyYCmjR50UsxzOn4G
         UzJ0oCveO/MxDYGefloaHEOnEyC+gTcdsEs538rvaqtw05kbOXSl/raznDdqx53S6d8h
         AeK++FZJI8zZcLaY+sHnl0wJBaftuaQ1V4EsF2Up0fBAWEgsQpmsuROrDROTag4ZLb31
         u2t6oHA+o0xKK+xuDtBK2SLlgrgExDGe4hzm+RuItL2RzzfQvuFBAhpFakUsmJIuPOPX
         U0JG2vPUFm9Xwq4gfW/WHA/fgTtSy5JV1M2Yq5actSaypi1ZTXZDRCv648DsUFYhYmoB
         o9sQ==
X-Gm-Message-State: AOJu0YzCgQYM5u6JH0pQkzEoWhSBWz5sTqnYomQdeew2+8OpUcesk9E9
	hyLcpJF8335AuqiBVJfhITmp8U7Ah2Qz
X-Google-Smtp-Source: AGHT+IHm0+BwtpxvlDs0EJwWZDp2C+XyFuA9xw6fgoMpcHbgvM2/ri5l0LiHHVPLimN54DRYZEolelves5tp
X-Received: from jiangzp-glinux-dev.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:38e4])
 (user=jiangzp job=sendgmr) by 2002:a81:aa4d:0:b0:59f:3cde:b33a with SMTP id
 z13-20020a81aa4d000000b0059f3cdeb33amr416465ywk.6.1697063974245; Wed, 11 Oct
 2023 15:39:34 -0700 (PDT)
Date: Wed, 11 Oct 2023 15:39:28 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231011153928.kernel.v2.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc@changeid>
Subject: [kernel PATCH v2] Bluetooth: btmtksdio: enable bluetooth wakeup in
 system suspend
From: Zhengping Jiang <jiangzp@google.com>
To: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com
Cc: chromeos-bluetooth-upstreaming@chromium.org, 
	Zhengping Jiang <jiangzp@google.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_153938_304133_7422D5B6 
X-CRM114-Status: GOOD (  12.54  )
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

The BTMTKSDIO_BT_WAKE_ENABLED flag is set for bluetooth interrupt
during system suspend and increases wakeup count for bluetooth event.

Signed-off-by: Zhengping Jiang <jiangzp@google.com>
---

Changes in v2:
- Add Bluetooth prefix to patch subject
- Fix warnings regarding using plain integer as NULL
- Add static to btmtksdio_pm_ops

Changes in v1:
- Add BTMTKSDIO_BT_WAKE_ENABLED flag
- Call pm_wakeup_event in btmtksdio_interrupt

 drivers/bluetooth/btmtksdio.c | 44 ++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index f9a3444753c2..404105e69c67 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -118,6 +118,7 @@ MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
 #define BTMTKSDIO_FUNC_ENABLED		3
 #define BTMTKSDIO_PATCH_ENABLED		4
 #define BTMTKSDIO_HW_RESET_ACTIVE	5
+#define BTMTKSDIO_BT_WAKE_ENABLED	6
 
 struct mtkbtsdio_hdr {
 	__le16	len;
@@ -554,7 +555,7 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	sdio_claim_host(bdev->func);
 
 	/* Disable interrupt */
-	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, 0);
+	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
 
 	txrx_timeout = jiffies + 5 * HZ;
 
@@ -576,7 +577,7 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 		if ((int_status & FW_MAILBOX_INT) &&
 		    bdev->data->chipid == 0x7921) {
 			sdio_writel(bdev->func, PH2DSM0R_DRIVER_OWN,
-				    MTK_REG_PH2DSM0R, 0);
+				    MTK_REG_PH2DSM0R, NULL);
 		}
 
 		if (int_status & FW_OWN_BACK_INT)
@@ -608,7 +609,7 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	} while (int_status || time_is_before_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
-	sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, 0);
+	sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
 
 	sdio_release_host(bdev->func);
 
@@ -620,8 +621,14 @@ static void btmtksdio_interrupt(struct sdio_func *func)
 {
 	struct btmtksdio_dev *bdev = sdio_get_drvdata(func);
 
+	if (test_bit(BTMTKSDIO_BT_WAKE_ENABLED, &bdev->tx_state)) {
+		if (bdev->hdev->suspended)
+			pm_wakeup_event(bdev->dev, 0);
+		clear_bit(BTMTKSDIO_BT_WAKE_ENABLED, &bdev->tx_state);
+	}
+
 	/* Disable interrupt */
-	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, 0);
+	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
 
 	schedule_work(&bdev->txrx_work);
 }
@@ -1454,6 +1461,23 @@ static int btmtksdio_runtime_suspend(struct device *dev)
 	return err;
 }
 
+static int btmtksdio_system_suspend(struct device *dev)
+{
+	struct sdio_func *func = dev_to_sdio_func(dev);
+	struct btmtksdio_dev *bdev;
+
+	bdev = sdio_get_drvdata(func);
+	if (!bdev)
+		return 0;
+
+	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
+		return 0;
+
+	set_bit(BTMTKSDIO_BT_WAKE_ENABLED, &bdev->tx_state);
+
+	return btmtksdio_runtime_suspend(dev);
+}
+
 static int btmtksdio_runtime_resume(struct device *dev)
 {
 	struct sdio_func *func = dev_to_sdio_func(dev);
@@ -1474,8 +1498,16 @@ static int btmtksdio_runtime_resume(struct device *dev)
 	return err;
 }
 
-static UNIVERSAL_DEV_PM_OPS(btmtksdio_pm_ops, btmtksdio_runtime_suspend,
-			    btmtksdio_runtime_resume, NULL);
+static int btmtksdio_system_resume(struct device *dev)
+{
+	return btmtksdio_runtime_resume(dev);
+}
+
+static const struct dev_pm_ops __maybe_unused btmtksdio_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(btmtksdio_system_suspend, btmtksdio_system_resume)
+	SET_RUNTIME_PM_OPS(btmtksdio_runtime_suspend, btmtksdio_runtime_resume, NULL)
+};
+
 #define BTMTKSDIO_PM_OPS (&btmtksdio_pm_ops)
 #else	/* CONFIG_PM */
 #define BTMTKSDIO_PM_OPS NULL
-- 
2.42.0.609.gbb76f46606-goog


