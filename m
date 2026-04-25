Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59513FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZVhJi8Une3Tz7psy9kzkLO8wUTe2QsM/r5CE8L6bO0=; b=QX0eG1Xs+i1pv73qEhUY5rDWXb
	BDXEX3/XesUNJUMiiul+DEUAiZE1VBv7VHmiS0YIYim0TQcC8Z3DGynEnc1ONOqcn9DPQndIJjYoZ
	GrPVuiocnEVE7aE+zzK5W+CrKn5nnOcgI8+f0TX3FDD9P5mwUj+a5cFdccumgv/5+eGjAzb+FHI51
	fPLPeAm1CaggfsT+HwanNDTLiwI75tjmq3U0KOBEVHTDrQCCrB9VH7q28IvcsXKyX5v/XPpjstEaP
	0NCNXK/o5LjvOYU5JQKpA7dSxgfMdK0STHDA+P/tcphtY9H5xlJ24kMRq6dq5gU1BWoELSOr4Cif7
	Pnr77a7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2p-0000000Emck-1vjU;
	Sat, 25 Apr 2026 19:52:03 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2m-0000000Embi-3M8p
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:52:01 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dcdd1b492eso4790387a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146720; x=1777751520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hZVhJi8Une3Tz7psy9kzkLO8wUTe2QsM/r5CE8L6bO0=;
        b=Auz9+MLSSkodRh9gFKuJwhx7Pez1ri1OGI1B/jhLTWHzpO2ZID09WSeZC8sVODJc0n
         Hcsqsys99jFdF+wS4OqvXJtFobhQhTliavJrCNjEXqEnQxFh+Vk/0mGloPPZ4Vhe01GK
         0zsLfUsd/Rx0qHdE+6ZNDdB83mCNqdHm3g/00DRbNIqKKUixaIweSbg1GQCWSH0H5wrV
         V4tR+wNbY5G28dB8hOj1maEqimyGz6jGf7q/8fQAcZVOyckQbTKxKju5dduWyG2KVhEs
         hV2P17ariifIbe0HNIezNd/tEok44OZI3FJDbZuO1it9yuVJGltAkTnDzVvZBqE3M3xQ
         v9gA==
X-Forwarded-Encrypted: i=1; AFNElJ/5a/fIFfczHkBVdD+V+HozEFd4l3orMCBl4Zy4NAzQpoeHvuXSZ0kAQbw0SGuTMi2OUTkrIHlsHCgVeHNkXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAcnKZ8shY01JA9hSnewF1UwfR14Hc7WkfLtCG0IooxRrmhpFK
	usaq82vbCLfir+chnyWJb/qnDZz1zEQ3+4RcE332IKlynVvhdG+197it
X-Gm-Gg: AeBDievOU8mbwvrTENljb4QwBbB6VVeGzfMglN8t2spuO4jnnhyujAd3YL7nMM9H35C
	k66Cd4zvWLoWEqPyiVwiMK9t/1DnwTanzPefTE9lx7AglQMbWGvIIsguK1QQywwwLxW1yL4p2F9
	RWkYPnOEh+NjfbeaB8liU2J7+vAuARHr5OBDHuNK7i1eG1PAavOrpf3HtYKX79OR74ThYGh6f17
	XCpAEOWelKjpt5jH3RhtmQq4PqPVQezhCL6Tc+Mjq1vL6rxxZEcacDa+NwvICpu/dPh4YVBPrEd
	tzypl2MB593usFhtlbudZ0DyNaSdu+jDkPSeB7PglYjDf92t3+It4rVI2YHmF/3wA7WjoZ1N1U3
	6wDih203T9O3zyeCQU5WA4QGjidkXOcEpLRtgslEt+U7gxj4noUTMa5c2Mru8kq34hnTnOoKQoP
	rXp4vwjVgOHsWTOiw8mIreaMPLAK89dA3Fbft7TXhmghMrl3c505WceIz2IF0bYJaWG7SDb4Owj
	g==
X-Received: by 2002:a05:6830:910:b0:7d7:ec47:79f6 with SMTP id 46e09a7af769-7dc956d9a71mr20139924a34.13.1777146719977;
        Sat, 25 Apr 2026 12:51:59 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:59 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Javier Tia <floss@jetm.me>
Subject: [PATCH v5 20/21] wifi: mt76: mt7925: add MT7927 PCIe support
Date: Sat, 25 Apr 2026 14:50:10 -0500
Message-ID: <20260425195011.790265-21-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125200_868824_EA1A6A1E 
X-CRM114-Status: GOOD (  12.05  )
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

Add the missing MT7927 device support in the mt7925 PCI path.
This ensures MT7927 is identified correctly and uses the proper
initialization flow.

Co-developed-by: Javier Tia <floss@jetm.me>
Signed-off-by: Javier Tia <floss@jetm.me>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 7455cf7eddc5..41e6ec9223e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -16,6 +16,12 @@ static const struct pci_device_id mt7925_pci_device_table[] = {
 		.driver_data = (kernel_ulong_t)MT7925_FIRMWARE_WM },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0717),
 		.driver_data = (kernel_ulong_t)MT7925_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7927),
+		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x6639),
+		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0738),
+		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
 	{ },
 };
 
@@ -376,7 +382,8 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_pci_vec;
 
-	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
+	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927 ||
+			pdev->device == 0x0738);
 
 	/* MT7927: ASPM L1 causes unreliable WFDMA register access */
 	if (mt7925_disable_aspm || is_mt7927_hw)
@@ -436,6 +443,13 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 
 	dev_info(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
 
+	if (is_mt7927_hw && mt76_chip(mdev) != 0x7927) {
+		dev_info(mdev->dev,
+			 "MT7927 raw CHIPID=0x%04x, forcing chip=0x7927\n",
+			 mt76_chip(mdev));
+		mdev->rev = (0x7927 << 16) | (mdev->rev & 0xff);
+	}
+
 	mt76_rmw_field(dev, MT_HW_EMI_CTL, MT_HW_EMI_CTL_SLPPROT_EN, 1);
 
 	ret = mt792x_wfsys_reset(dev);
-- 
2.43.0


