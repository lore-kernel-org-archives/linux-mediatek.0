Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA2FCDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AkMbkjU0vEq64RoxC9mx2kutRLIWzBPilt+kMErOBXk=; b=Li08vnArtJ98jJKpttqBkqk+4W
	MYlm+APdMriXVdn9jvNtfU0Co8a2/gav21cr+XujjJiJoxa+qGogjnNxF3W8MRBqN4yjef7uYikW3
	yDba/zXYKP8EfMU9fUthwmekzUl33RIg0SbLs7PEIkosXXoJxvDwjpKJrvOT0e3TvbuyZL/ulVmW0
	gd8RHAezbxsm0MrS9/0VUjNFUob3yj22gGSO5uOQVO1bcWYfbNBJ9Z5Q5fjA0EaupA/VmN68f8SJH
	WFr99aaBSLza3TBUcw6qcO/3MbptZODNvvWj2p+CM0d7JRsjAWEvVjWxmfFBAGrOfU1bZzsjFB4dO
	qWJYyQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqgZR-00Gj6M-37;
	Wed, 11 Oct 2023 21:16:45 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqgZO-00Gj54-06
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Oct 2023 21:16:43 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d86dac81f8fso374278276.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Oct 2023 14:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697058998; x=1697663798; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AkMbkjU0vEq64RoxC9mx2kutRLIWzBPilt+kMErOBXk=;
        b=VfQ7w6OrbDxH7Q2oUV/f28B23etzfifbH4z3UJ+hIFLrA+QzZLRjKTPmqjRQ6k48HV
         q//KpTOSDNIf/vreUaBpR36xLEWo8AhJvng+YuQu2DtMJf4zOFzncPQJ4h8YvLrugHG2
         jocI99GuTayGKm506AFsaf5KKDvtbSfof0Wec5EK2n/avHQ5nnEc5OAoFBWRv8U1syTS
         CUWJ5gyFsQsZKaWGgiSpfRbU+hFNCtzeuKifJBgsrZVP2evTHK9Cti3U0L2wje1JSTF0
         gj7cATnlNIN2vwRLthEbRqDuceQX30IMyN8+69eitSzzkgjexmFaz7aumDfvr/MFzwc/
         oAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697058998; x=1697663798;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkMbkjU0vEq64RoxC9mx2kutRLIWzBPilt+kMErOBXk=;
        b=j5B0esZTKWYAHgknyYYhZtMih16qEMJCrKO4dytu2QboxAtqfDjbpd4ZpDuCc00uUk
         bMuBMNCVPhG5TmF8mUrob3EaHVBMI+RwnZVniDdc4V4mNtQh3uafndvvHjAY4fH0CiOD
         /4Xel0eSkVZpEGXZg08aosGtaIA9ZiPvk7WGsKgbIDrkUQ8H5JSSOK8dGJK4ReJXQ7SY
         L+4nr/didnAtFP8aoV56p5i7OGUwL1Ni44K6XvwEQGPWiknYjnWWpOeMV6L5CWyUHA0I
         DgMh7gsxKNHpKQR/5fP2/gZn8Vf7awzAd8GjQLh3gejnoHmVAFDhdbSPpwh4Mx0TSxQ/
         LI5w==
X-Gm-Message-State: AOJu0YznaSjDv0xNd3yITeQpIZHhxVEsvonTd/X51xVGx0xDc3QJfyNZ
	RFECm0jBPpLa0WSzu6XhIhQiROkxWCnq
X-Google-Smtp-Source: AGHT+IGAzhuTPA8xuaGd0/MIYrNSNCXikipR4gkbaclFwt1ULUI/01TDo30ZPmFJEvB4ZjHJwjhJuCAIPgXw
X-Received: from jiangzp-glinux-dev.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:38e4])
 (user=jiangzp job=sendgmr) by 2002:a25:828c:0:b0:d9a:bc5a:737c with SMTP id
 r12-20020a25828c000000b00d9abc5a737cmr10169ybk.4.1697058998406; Wed, 11 Oct
 2023 14:16:38 -0700 (PDT)
Date: Wed, 11 Oct 2023 14:16:31 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231011141631.kernel.v1.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc@changeid>
Subject: [kernel PATCH v1] btmtksdio: enable bluetooth wakeup in system suspend
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
X-CRM114-CacheID: sfid-20231011_141642_085759_8A49420B 
X-CRM114-Status: GOOD (  11.40  )
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

Changes in v1:
- Add BTMTKSDIO_BT_WAKE_ENABLED flag
- Call pm_wakeup_event in btmtksdio_interrupt

 drivers/bluetooth/btmtksdio.c | 36 +++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index f9a3444753c2..ddc04ce5c6d4 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -118,6 +118,7 @@ MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
 #define BTMTKSDIO_FUNC_ENABLED		3
 #define BTMTKSDIO_PATCH_ENABLED		4
 #define BTMTKSDIO_HW_RESET_ACTIVE	5
+#define BTMTKSDIO_BT_WAKE_ENABLED	6
 
 struct mtkbtsdio_hdr {
 	__le16	len;
@@ -620,6 +621,12 @@ static void btmtksdio_interrupt(struct sdio_func *func)
 {
 	struct btmtksdio_dev *bdev = sdio_get_drvdata(func);
 
+	if (test_bit(BTMTKSDIO_BT_WAKE_ENABLED, &bdev->tx_state)) {
+		if (bdev->hdev->suspended)
+			pm_wakeup_event(bdev->dev, 0);
+		clear_bit(BTMTKSDIO_BT_WAKE_ENABLED, &bdev->tx_state);
+	}
+
 	/* Disable interrupt */
 	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, 0);
 
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
+const struct dev_pm_ops __maybe_unused btmtksdio_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(btmtksdio_system_suspend, btmtksdio_system_resume)
+	SET_RUNTIME_PM_OPS(btmtksdio_runtime_suspend, btmtksdio_runtime_resume, NULL)
+};
+
 #define BTMTKSDIO_PM_OPS (&btmtksdio_pm_ops)
 #else	/* CONFIG_PM */
 #define BTMTKSDIO_PM_OPS NULL
-- 
2.42.0.609.gbb76f46606-goog


