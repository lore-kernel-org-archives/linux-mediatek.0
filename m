Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3545CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 19:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mHGY1rNgdssEAkSd/6ZBfSHP677hALKRsWOmZt1w4io=; b=wIwJyeL2VWqDCHN1grm1kQGWTH
	jYqkl54y+MkafZDu9s77Ja+8vrgZAlUkiZrw+XDrpMv66LT5cHR4Pbvavho2ifzCV3ZyU5IhNMNLz
	NC+hJv4DaxCdCh0XudOBu3O/TSNAI6y6rbhr+VetoUW0dvtsMfaRyQz+TORKQRev9eiOG2zXUpaLD
	UCWei5/+MeyvOkkTCd+dtox4ngfRwgQ7MfreV1mo4fgKj2xY/oOKBXUVoZRFvDF4Dt95l/Ik2ZMra
	NIkVYMsnpjlFnowI6W4sdIB08zLI+48i6g1Rt9dJLE+1sjTOtunuKoChT+lr7JLC/cunjl6ZjxswP
	l18p0Ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrO7y-004A16-2j;
	Fri, 13 Oct 2023 19:47:18 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrO7w-0049zm-0L
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Oct 2023 19:47:17 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7bcbb95b2so38813107b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Oct 2023 12:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697226433; x=1697831233; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mHGY1rNgdssEAkSd/6ZBfSHP677hALKRsWOmZt1w4io=;
        b=wScbfybBySJu5Lf4WWrFUNA+9UL4ttuRmYFw0Z5pYw41mwDnn37yWiPYroGWnrFKZd
         hTn3q++Fy8FraDYGmq1P2VpuaFQe/ubKpPL8A22COJxgsCEA5yB9qlDEtoeJuAzgxpfo
         XTJqAFX4qTTuGOhKnuZbypMAhqYCQdcxsqisZle8pALVNibyHod72moKfW7e8a8tvqVX
         RqVfr5+2MvTfNyrvummtVNHZPcLooIIY7CfnEUlaVM6qbu09F1fhy6xWXp/ykfPxTfSM
         W1Ucwws5Lqo++yre+kikmS1/bz4i212wjn0t2MlABOs1U3NcPimtvbtwq0V6gn681M69
         hCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697226433; x=1697831233;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHGY1rNgdssEAkSd/6ZBfSHP677hALKRsWOmZt1w4io=;
        b=BTN2M64NpBl46tIIA29ci8zsOQcdRmmiCzis2aKQHicECOASYxd0E78KvvGp++ML8o
         aDxosL+Vn/ztLcaUwVPYwrewCZTJj8cZFAtPE2Mxz89XZ1bvYMhFZmzCJwnoXSadxCGv
         +7BTscChOhyE/gU+3J+PgodQv7ggrXuk6nypepJBYNQeHAi4P1bBqpUGBvOt9g7RRDkG
         xBlOYMjhVz+WsnU6W22JM7Dd/xYFuoqS6AVXyOeGbVV4Q3G349toOk82/hDuo/PBKlAn
         js8dcNuPMvY4vYZH+8pXY1urezbxAowildr/JVpt8GIJQWfkiWIhGSpH7J/z2JgHdfl4
         66pQ==
X-Gm-Message-State: AOJu0YxQPQtvrtu6Afbe9lPoSH6IJrLQR6VhC6a2WHvoEImIojE+xAGl
	PJOcQREvNV/0goAdATER2TlVYn0BL047
X-Google-Smtp-Source: AGHT+IHpmQg2Q8i1hn/xSsGU1Xlpm5F24a4h6RyCnX+WmtsHD+RkrppicP7DiSaF/ezg06qukkb3PlzMghkW
X-Received: from jiangzp-glinux-dev.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:38e4])
 (user=jiangzp job=sendgmr) by 2002:a81:a84a:0:b0:59b:e97e:f7df with SMTP id
 f71-20020a81a84a000000b0059be97ef7dfmr537451ywh.2.1697226432947; Fri, 13 Oct
 2023 12:47:12 -0700 (PDT)
Date: Fri, 13 Oct 2023 12:47:07 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231013124707.kernel.v3.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc@changeid>
Subject: [kernel PATCH v3] Bluetooth: btmtksdio: enable bluetooth wakeup in
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
X-CRM114-CacheID: sfid-20231013_124716_145722_D7C5CD9B 
X-CRM114-Status: GOOD (  13.06  )
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

Changes in v3:
- Replace deprecated macro.

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
index f9a3444753c2..ff4868c83cd8 100644
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
+static const struct dev_pm_ops btmtksdio_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(btmtksdio_system_suspend, btmtksdio_system_resume)
+	RUNTIME_PM_OPS(btmtksdio_runtime_suspend, btmtksdio_runtime_resume, NULL)
+};
+
 #define BTMTKSDIO_PM_OPS (&btmtksdio_pm_ops)
 #else	/* CONFIG_PM */
 #define BTMTKSDIO_PM_OPS NULL
-- 
2.42.0.655.g421f12c284-goog


