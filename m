Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B918C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=E3Fv5JrTBnAcsbjTZZqHU1PmQsQwCfWoJEZy6pMQ22I=; b=CJi
	7Z+DLojua8snOZrmEbNt/W19aN2gZLVlvB0b5B+JuCPh0HC6s0RISjpx5Pi8NR0beTbh3+ZmOse2Z
	05KMkHQCFh4jXz4byhqmyHZOjXGP2n3mC5Z/qo7lieMbWTj4NSXYC2WpmbmHA3shTjND84izwGomE
	3jBMHzryD1RUOyXkO1N8zIBhXHSMX33Sdw3BIuZb0wcYXJuHBpZMBXRVM6Z1Go0wXNXRlTshqfvL/
	waVD8QOsVW/y4wL6Jf6ue6MnDdTO90zHtJlbaX27zXos82/QdBeMejCCRUtlw9OUzaHEeyKJxUjS4
	MRG9dHjrKyHgGyz8WeHFAbV8+2EVZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvbBm-001BV5-K6; Fri, 10 Dec 2021 08:23:34 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvbBX-001BOC-F6
 for linux-mediatek@lists.infradead.org; Fri, 10 Dec 2021 08:23:20 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 g36-20020a25ae64000000b005c1f46f7ee6so15557518ybe.8
 for <linux-mediatek@lists.infradead.org>; Fri, 10 Dec 2021 00:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=m5w0obK8XpECrHwe6XhlaqtvTKCo56VwLWe/17hHP5w=;
 b=W2QIjE051FGvUPlbVzwu8+TDwsJbys+QyI7+4v6rmg6eVwix7RJ16f3U2l9pmWuwQ2
 aEZGD0N+3hRv0WHx/zbKkXAE+xye/J2o4/rn9q+EH/6Oa57nmqY68aLpHFMwdX6tfQd6
 m8iEusC9qG2WeaDl6u8Rz7IXkZOlOfig5fXMe8EDDXpTBpKi/lFokdIEDrZEMk50kkB+
 MyzSqWF4zYYMrY05e5P3bVwQ+8PSQdK6pSVGqg3hPRGB7b9flBvLMxa9eMzjQUAc3ICm
 Cki1vxFHUgVBtrB9GNZM+AAYeRJfM098gY/qmM0OzQpf4+OR/KcgIFCAHIEf98ufnbxc
 2jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=m5w0obK8XpECrHwe6XhlaqtvTKCo56VwLWe/17hHP5w=;
 b=NjPQfZv7sg4EsMIR4oOukje7z7cXgpjZEYUf4zpo4hB7AzrzwELPnF70yV85AlEyWO
 pfKEvQlF0LCAJZtwEyFLFl/jfvL1jAD37lnznCyx7YpwtFKpmJYkKwfUjc2rEFA4AV5x
 9nrC6hfCwAFZu+Xg4gSYePntsjx14XD6Hkrd0cIE+poR5OOrjxB8Zfp+RyQEKWJFN6Ys
 ckmWU5c3A18PtjCoxE2UgX9mw7LtUwwOI007hm6sXCTouoArp6nzOJfcGjl0e/X6NWuS
 g9Q38rrzzTe8lXXK/nA0KDhG7lH7OFtL3Awpf6NvAmERD9dIbMIngH6R75yvct/UgBZM
 Fnxg==
X-Gm-Message-State: AOAM530FOy1OWhqDAvuQgbesfl9el0S3dIa4We54nLpe/2iGu0bYp3D5
 zCNynhc3lKytF0/MpXczpYIXlhkD4e/F
X-Google-Smtp-Source: ABdhPJyhHAlYo0oWl5X+SXK54pI4d0XJ6M2S1VMZI3ZARevg8tX4lMUeQSC9jKmmfqK3xCmTy0NfgUpKe9pS
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7fdb:7edf:3c09:a8eb])
 (user=tzungbi job=sendgmr) by 2002:a25:ade0:: with SMTP id
 d32mr12483108ybe.510.1639124595078; Fri, 10 Dec 2021 00:23:15 -0800 (PST)
Date: Fri, 10 Dec 2021 16:22:47 +0800
Message-Id: <20211210082247.977043-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH] mt76: mt7921: reduce log severity levels for informative
 messages
From: Tzung-Bi Shih <tzungbi@google.com>
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, 
 kvalo@codeaurora.org
Cc: shayne.chen@mediatek.com, sean.wang@mediatek.com, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_002319_517949_28D80F4C 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

"ASIC revision" and "Firmware init done" shouldn't be error messages.
Reduces the severity level to info.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 6ada1ebe7d68..99b144fd8db5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -882,7 +882,7 @@ static int mt7921_load_firmware(struct mt7921_dev *dev)
 	dev->mt76.hw->wiphy->wowlan = &mt76_connac_wowlan_support;
 #endif /* CONFIG_PM */
 
-	dev_err(dev->mt76.dev, "Firmware init done\n");
+	dev_info(dev->mt76.dev, "Firmware init done\n");
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 305b63fa1a8a..8c53e376aa4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -188,7 +188,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	tasklet_init(&dev->irq_tasklet, mt7921_irq_tasklet, (unsigned long)dev);
 	mdev->rev = (mt7921_l1_rr(dev, MT_HW_CHIPID) << 16) |
 		    (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);
-	dev_err(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
+	dev_info(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
 
 	mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA, 0);
 
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
