Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C8BCD98CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGAauM4goitFf+TF2tRvx0vwIDbDusIIWxEKPxj1h7U=; b=LUde41haGJJxq5MMLvKmppZa1X
	ZaE+ja4W0tuNRFo7h5uhAoxPMa+6C+/UQayyGvUp493LoNx92A2RD6CHF4CLGVL5BCkE97G2h0lCS
	NxXXckQAVpGSsKQOEU54zbOyt1BLufcPZtKm7uNR5S7kbW0DXY6GvGMhHdc2U3Gv++JamqQE6Ak7h
	MHYhQx+EoKkfQc80R8Ahmpo2xXbPZfPHpZSLvjt0hivBhSxh++bUKiT++DZivPvPEExu9DNwxVCIE
	gko0pwy2IHSm+KvYIWNVtzd6RHO4oYw+gEiQueez600BRF0ZIx7qTd2J5eRk8RXIvlFyDCdQtLa/d
	PrKtAxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3T-0000000Ca2P-1uwY;
	Sat, 13 Jun 2026 22:42:19 +0000
Received: from mail-dy1-f173.google.com ([74.125.82.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3O-0000000Ca1s-0WrG
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:42:18 +0000
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304e83724bfso3151025eec.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390533; x=1781995333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CGAauM4goitFf+TF2tRvx0vwIDbDusIIWxEKPxj1h7U=;
        b=c5qMEUwaN8Zp+6eeq+dkN1VhUGZKyr9PFkZdXCWVTmpGKCYMesOGFEWkrZ+vYJubIv
         awqAd0lDQznyc9J1RqLEhG/IQ7nkwL11YHy/Uj03hhnES3tYMgHWs3aNkdIWwViF2p9/
         LKh0vbL7AKqdWdTxaUjmoxlz55XuaHvIFb/lNLMKZWYEbp9S9p7umqufdUWznrArofXs
         Z1CLkbn2Ru0ZCOGlr2JbKjX5W5lNPsvg7KHzcUQRhDlrX5/CQvTNnOcqt4NmNNB/5K0A
         2sOJNTbJ8ByTKgtSlCZIBG5cxA8WEN5xxlWIFg047tM6nCODtlUcshJ7a7iNEYo+4xvJ
         fDuw==
X-Forwarded-Encrypted: i=1; AFNElJ/7HdFhRJUj7Gk6FDqJoTbpAnZKntOqrWM9slM4RVxemMdvIjb4wToEQOil44T1pzPEBuuo91cQRJPu88DO7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YykFErybMTWOtrgYLdiJtHlfJ1bMP/dOgSE6j/xEuk8xnH03gu9
	J/ESQGcrCBbKqNSF+LlNaGBJvs11Ur3v2AO8m8sEZIVxeyLp2w01RGIpQUIUXheX
X-Gm-Gg: Acq92OGtcnRIxO+SUZkk95MJW72FRVCGgca0RLhDdHTL4skVXBK0UhINfkIv+P3FZ0A
	VRZdT9gX7nUUkY/H15+D7lPhYBn7/d6Ip01VVnoba8+1T5gcU/rSRuuVbSteDLRL0NyVHoPyNe9
	R3QrbxBGD/UpaH+SnMBLmF9Xd78fCuyFF5Di3zzVX9lc4cxp9LB6+FDdBQqKKw0qSV5BN2QP/DX
	cKG0/a5MP7pr8vZRS+L/EZkDduIBHK3u9mbJy4uOM7TU6ZYM7jLjFvLpxI80aExaeUFDn88QkZ/
	YO8tS6Rx9ddivxzkbdODk7wNnmbSsgZZjXVbTBvRK+iXZkkM4clY2aOP+1DDT9vdliSUIp1NzYJ
	7pzkLihJ+fbQIu4VQNOADEsBp5LBL6CILPv85k6rWZNj6t/9l5Mx7CyqrsfEfDOtrOheegIWvbE
	4LoDP9fdasS+KJHDGinnde406DhBEcQ8mj0L/qCLDWhH6RdypThI8AokoC8SKSS0QVxFUKMUFXR
	wzqbyLaS8fj2j1yscFlwe4qSiLmsBtIa9l1RCfM
X-Received: by 2002:a05:693c:3b09:b0:304:819f:5029 with SMTP id 5a478bee46e88-3081ff3dc01mr4163594eec.2.1781390533196;
        Sat, 13 Jun 2026 15:42:13 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm11104825eec.28.2026.06.13.15.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:42:12 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/6] wifi: mt76: mt7925: skip reset work on hung bus
Date: Sat, 13 Jun 2026 17:41:27 -0500
Message-ID: <20260613224131.2396026-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224131.2396026-1-sean.wang@kernel.org>
References: <20260613224131.2396026-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154214_170718_07DF53EF 
X-CRM114-Status: UNSURE (   9.72  )
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

From: Sean Wang <sean.wang@mediatek.com>

Skip mt7925 reset handling once the bus is marked hung.

A hung bus cannot be recovered by issuing another device reset. Continuing
the reset path may only send more failing MCU or register accesses and
delay teardown. Return early from reset work and the USB reset path so the
failed device can be torn down quickly.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 0641a7131d7c..d7e4ebe92342 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1310,6 +1310,9 @@ void mt7925_mac_reset_work(struct work_struct *work)
 	struct mt76_connac_pm *pm = &dev->pm;
 	int i, ret;
 
+	if (atomic_read(&dev->mt76.bus_hung))
+		return;
+
 	dev_dbg(dev->mt76.dev, "chip reset\n");
 	dev->hw_full_reset = true;
 	ieee80211_stop_queues(hw);
@@ -1327,6 +1330,9 @@ void mt7925_mac_reset_work(struct work_struct *work)
 			break;
 	}
 
+	if (atomic_read(&dev->mt76.bus_hung))
+		return;
+
 	if (i == 10)
 		dev_err(dev->mt76.dev, "chip reset failed\n");
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index e9f58492bf7d..49ad4fe9eb1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -81,6 +81,13 @@ static int mt7925u_mac_reset(struct mt792x_dev *dev)
 {
 	int err;
 
+	if (atomic_read(&dev->mt76.bus_hung))
+		return 0;
+
+	mt792xu_reset_on_bus_error(dev);
+	if (atomic_read(&dev->mt76.bus_hung))
+		return 0;
+
 	mt76_txq_schedule_all(&dev->mphy);
 	mt76_worker_disable(&dev->mt76.tx_worker);
 
-- 
2.43.0


