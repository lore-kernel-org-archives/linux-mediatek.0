Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C93BFF8863
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTztHk/94U1DhMDW7lcOWTq/ciqorsxjY2G0pZWTPC8=; b=Rl/7Bq85t9rUPUHBn/PoJZ94xJ
	VTAqhKObtFZhd49tQ9cG4zNWd20o/Ce/F5CgoB3K6AfAupP74XZOWGVhlzSDGl+bVKdhmr9k9nAby
	pAlZd7M6AyMu1SoznT59mzFE04aeVygPFAnCqvCNZV0Qe9SuRMlMhul6J/3cbPe5WgcSX4L857XQD
	8mcAgQxpKQWiIMdZooydRSuiPcVPzVgp8/XO4T5XRDMno9FijA//rPwT3PfTdHAgnNxwfXeL6jsR2
	jYCJZUeZT2qlZGCSbYJwzrJn8xSmKWLkjkFRm/fySy9oHyzC8vb3VBYIs0jmx8DiX1MAyJkvNKknf
	FK19JgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2B-0000000EmM8-0xm2;
	Sat, 25 Apr 2026 19:51:23 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj29-0000000EmL2-1DEX
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:22 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso2896143a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146680; x=1777751480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTztHk/94U1DhMDW7lcOWTq/ciqorsxjY2G0pZWTPC8=;
        b=RbkXo+YuyUt6RVNhEiKSmS1z9yFmcoFAmcNOA60gJeJZLcErNdv7UNhG4vf4sxuF8x
         9/QwC5Xzp8OqBMoKGbI+1DoSGN6usXtxqdL/KNlGFQxfdB4VEY7e0KHrU7oEK388w3l6
         AknounsnG0KiWMtJkGv27sRJM4Dn4DVRKS+0QmCSQ68y8YnUcsEtkL+44FJ5B8mwyAON
         USQFue0cZK2zo8OqewCNJcQUAwXqm9tvgFOZ/Kwik0T9nTegO5dg/MKRjlm5zxvzxEC8
         amZejWzQTDd2XkCBrfpMYSmCx65Na4WOxQs939fR3kkXx951vu5FXiExkzEKU9yzbEny
         25kg==
X-Forwarded-Encrypted: i=1; AFNElJ9SPeLy5mw4I4j2R3oyLm6jZkB5vYmkupIQ5Jz/Nc7/cFCTcO4AfP5iWvrOkcWFHbHqqc8qrBbxiF61FIN/Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+eMphkciSrGO5Q9gzeTuqE/BeBw441Jiyip3/GUAze/QaeThf
	/AO7sPpKnuZNHKKX3G/Y8WFb7o0+MBYMqhcFD2Z2lvQaBGOs90lHLkpF
X-Gm-Gg: AeBDiev0tYXydwFMgYDu0uHz70uwHqlHUhmtWJ3C8RA+zKSr8tVqcKwa5L8wBHSJqZ8
	U2c7SEYjHhYMtdZW8Y0rgvViItCGm71VOSjRrSNCAyRmQ1oarPqI1dQMZgR7ZBZa+W4ct8wyb+A
	wKPo9ju+OYgH/wVY0+1CiPr7lH9bMEiYMJCFnGLt3icz/dKZFBJ6fB7Uq5MRrqgACXGD48UaDI5
	/WIAN6MvgfoEEMz4uss0VPO9B1U7RuvEzcjiiQTIP/4Fpz3wXSRVT/zgYE64ldzBq04ALtPbelP
	NISlTkcA+kB2p0dmzqbB/udaUcGqIBfpylYmFnPoZI6G5JQA3nNDCreoV+IxHQmnqXIAYvotpnb
	3eJNG8jjbXHojgQ5lQsqOoJb4+vYknjf+hkfAf79UcceVEcrXQm1jqyme61I7yHFKoA6tsHtb5p
	FggZa0IFsL56Ofeuh3BuJIJlw5rja8VasQHgx2HAHMDOLze7X82lFJhm583jAK5Vbir/G5x+mrR
	iRBq+Nx+kc9
X-Received: by 2002:a05:6830:264a:b0:7d9:ad90:5670 with SMTP id 46e09a7af769-7dc9518c0f3mr25019360a34.18.1777146680311;
        Sat, 25 Apr 2026 12:51:20 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:19 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Javier Tia <floss@jetm.me>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 09/21] wifi: mt76: mt7925: disable ASPM and runtime PM for MT7927
Date: Sat, 25 Apr 2026 14:49:59 -0500
Message-ID: <20260425195011.790265-10-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125121_350454_B367F37C 
X-CRM114-Status: GOOD (  11.13  )
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

From: Javier Tia <floss@jetm.me>

Disable PCIe ASPM unconditionally for MT7927. The CONNINFRA power
domain and WFDMA register access are unreliable with PCIe L1 active,
causing throughput to drop from 1+ Gbps to ~200 Mbps.

Disable runtime PM and deep sleep for MT7927. The combo chip shares
a CONNINFRA power domain between WiFi (PCIe) and BT (USB).
SET_OWN/CLR_OWN transitions on the LPCTL register crash the BT
firmware, requiring a full power cycle to recover. PM enablement will
be addressed in a follow-up once safe power state transitions are
determined.

Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index c0c5cb9aff75..a8c2ca7c0efc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -232,7 +232,8 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	dev->pm.idle_timeout = MT792x_PM_TIMEOUT;
 	dev->pm.stats.last_wake_event = jiffies;
 	dev->pm.stats.last_doze_event = jiffies;
-	if (!mt76_is_usb(&dev->mt76)) {
+	/* MT7927: runtime PM crashes BT firmware on the shared CONNINFRA domain */
+	if (!mt76_is_usb(&dev->mt76) && !is_mt7927(&dev->mt76)) {
 		dev->pm.enable_user = true;
 		dev->pm.enable = true;
 		dev->pm.ds_enable_user = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 604c0e9ae7ba..1f05c212be02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -350,7 +350,10 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_pci_vec;
 
-	if (mt7925_disable_aspm)
+	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
+
+	/* MT7927: ASPM L1 causes unreliable WFDMA register access */
+	if (mt7925_disable_aspm || is_mt7927_hw)
 		mt76_pci_disable_aspm(pdev);
 
 	ops = mt792x_get_mac80211_ops(&pdev->dev, &mt7925_ops,
@@ -371,7 +374,6 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &mt7925_pcie_ops;
-	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
 	dev->irq_map = is_mt7927_hw ? &mt7927_irq_map : &irq_map;
 	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
-- 
2.43.0


