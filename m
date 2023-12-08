Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206CBC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 21:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=atKYixDgc1IYLIAixNFTtgRe8JLDt6J5MMwxSW6b7Pg=; b=TVOyk2TJ83OTsJ7eiqEdkfKSgI
	kSbKWgZbo/NsTY0I/lCgewfmQIf3tx3R2eYTwMQsEhMW84mKTAW54f3FpnuZQT0hXckW/DgCWLTyw
	0o4U5gmtXqmHacV3w2HtosC2hpWAc/Ak1U8nUPAGztg2hmLV5fbQoYkf66wklwLwIKMcGsszEPWDd
	dsr9C4L5Z49vxnuu9af4WafolqN8w/Jcz9XEo8TLOHaHnlUjYwStpzaddc3guPryOvILK+E+R6x35
	R3Zb/MssLuRlY3LcdEsgNeVlEQG/DpplZE/3Atxf2wmf7Xf+Fc0iKBLbedcPUAwj1kr2/iB9N2Rbx
	UDKnxVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBi48-00GZKW-0V;
	Fri, 08 Dec 2023 21:07:20 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBi45-00GZJT-0I
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Dec 2023 21:07:18 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dbc65c58e78so237868276.0
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Dec 2023 13:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702069634; x=1702674434; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=atKYixDgc1IYLIAixNFTtgRe8JLDt6J5MMwxSW6b7Pg=;
        b=4yzg+kA7SejhQIjLTJXi5UOGxu32sw9l9x7thsYk7Uv7VedNi6FH/kHjB1QQIJjReH
         PoIlfJmO1ffv2JgUWtABEMM68Nw/ruUo7fDFjoDAwT1LENGhN88Omqmcv/fn1rflCOeq
         KBZc4HIUX2x5g292dbQpwypWR0klhWV5XEfo/QOjgDOre8UenYLiqSXq/nduKx3vBqqv
         6rWrMVnFPx0e63KCeNbPVymwKpWMUnzLD1UQ8hFh5CcBZfj/87EJLrQyJ6IO2g8ryD73
         0n2tjKqwK4oDbFE8FXCTEXwB3V3VXiFmV5Ay+dWovXzqWuc5fgwrnD6NmoZAlGHBJdlb
         emBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069634; x=1702674434;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atKYixDgc1IYLIAixNFTtgRe8JLDt6J5MMwxSW6b7Pg=;
        b=Zs3UNnE++tGLCgR1/rUfyKYvzU2gsnbhouFp8z+D904AUjOgOTXfBSQTv0r92E61Uc
         Rx7FQWq4qVriEteTJU76JJq7DqiITJEApKwIhbsB0FJH/kKpNAnaRBR15whefcKWxFg5
         lTMl7IGwRUzcloKcpo8YSu44enKPwpPc5/pJY9pWGOwaVZ5ByO8n8nuNOr27a9AHOVrA
         XmteMusel70kCDNP3lP9MNw/EZpis/fjDRYPtyoe/6BLtk6kRFyQ8zZZZ7W/UOKHwKbu
         XNPzbDZsoZYcPkA1lM2o95UEL6j4iQSLssFJIqyPGSVAhORFpW2nJbCoJff7AeesBXTX
         tfyg==
X-Gm-Message-State: AOJu0YxNwFzj8M1su56PgVJmzoT0K9o3qHFPzLFU8vZ5YqrQB9oSWu/u
	XzYbv29rnD5LJno+V4bqB2i5/uHyAWMI
X-Google-Smtp-Source: AGHT+IHzeDvqNFdRZWKrYRWtX4T16qXBWuRFYuGxk14i3a32wrWAEXwhbb0Cto5r9VdTV4zgSQTlXO1gQzao
X-Received: from jiangzp-glinux-dev.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:38e4])
 (user=jiangzp job=sendgmr) by 2002:a25:ce4e:0:b0:d9a:61d2:38ca with SMTP id
 x75-20020a25ce4e000000b00d9a61d238camr7101ybe.10.1702069634325; Fri, 08 Dec
 2023 13:07:14 -0800 (PST)
Date: Fri,  8 Dec 2023 13:07:06 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231208130705.kernel.v1.1.Ic5024b3da99b11e39c247a5b8ba44876c18880a0@changeid>
Subject: [kernel PATCH v1] Bluetooth: btmtksdio: clear BTMTKSDIO_BT_WAKE_ENABLED
 after resume
From: Zhengping Jiang <jiangzp@google.com>
To: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com
Cc: chromeos-bluetooth-upstreaming@chromium.org, 
	Zhengping Jiang <jiangzp@google.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_130717_132385_7AFBB66E 
X-CRM114-Status: GOOD (  11.11  )
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

Always clear BTMTKSDIO_BT_WAKE_ENABLED bit after resume. When Bluetooth
does not generate interrupts, the bit will not be cleared and causes
premature wakeup.

Fixes: 4ed924fc122f ("Bluetooth: btmtksdio: enable bluetooth wakeup in system suspend")
Signed-off-by: Zhengping Jiang <jiangzp@google.com>
---

Changes in v1:
- Clear BTMTKSDIO_BT_WAKE_ENABLED flag on resume

 drivers/bluetooth/btmtksdio.c    | 10 ++++++++++
 include/net/bluetooth/hci_core.h |  1 +
 net/bluetooth/hci_sync.c         |  2 ++
 3 files changed, 13 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index ff4868c83cd8..8f00b71573c8 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1296,6 +1296,15 @@ static bool btmtksdio_sdio_inband_wakeup(struct hci_dev *hdev)
 	return device_may_wakeup(bdev->dev);
 }
 
+static void btmtksdio_disable_bt_wakeup(struct hci_dev *hdev)
+{
+	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
+
+	if (!bdev)
+		return;
+	clear_bit(BTMTKSDIO_BT_WAKE_ENABLED, &bdev->tx_state);
+}
+
 static bool btmtksdio_sdio_wakeup(struct hci_dev *hdev)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
@@ -1363,6 +1372,7 @@ static int btmtksdio_probe(struct sdio_func *func,
 	hdev->shutdown = btmtksdio_shutdown;
 	hdev->send     = btmtksdio_send_frame;
 	hdev->wakeup   = btmtksdio_sdio_wakeup;
+	hdev->clear_wakeup = btmtksdio_disable_bt_wakeup;
 	/*
 	 * If SDIO controller supports wake on Bluetooth, sending a wakeon
 	 * command is not necessary.
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 0c1754f416bd..4bbd55335269 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -672,6 +672,7 @@ struct hci_dev {
 	int (*get_codec_config_data)(struct hci_dev *hdev, __u8 type,
 				     struct bt_codec *codec, __u8 *vnd_len,
 				     __u8 **vnd_data);
+	void (*clear_wakeup)(struct hci_dev *hdev);
 };
 
 #define HCI_PHY_HANDLE(handle)	(handle & 0xff)
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 3563a90ed2ac..6c4d5ce40524 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5947,6 +5947,8 @@ int hci_resume_sync(struct hci_dev *hdev)
 		return 0;
 
 	hdev->suspended = false;
+	if (hdev->clear_wakeup)
+		hdev->clear_wakeup(hdev);
 
 	/* Restore event mask */
 	hci_set_event_mask_sync(hdev);
-- 
2.43.0.472.g3155946c3a-goog


