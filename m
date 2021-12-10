Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D93CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DBbPL8SeU9G5whfB5/DaMFDczKBgqSAqg99Bk8TQgDE=; b=M9B
	Zk7yMd8z2rZ2nY/B/ll9ocBQlDlCEid3dRgv10PRIP5JLAiO3RYuTvTt16MHDXttH/NwLbRgF1Fid
	79KtU+faquglIq/g+a84qQe/rUZd7hl6846mpkX+KCGD0T/QzeHZtIrduHwrdpcLgRhQ33zLSLR8m
	lammanaP10m3tadQCWLJXnirbzlfQAQMjVi0qiRqMHJK4rWkPzk7osBat5z2nRwhrI2Ht9ERZc+DM
	LNDCMb3v5aPRo3yyUksmxPPfeF/wWEUnJZGu7/o5R2AAbynXhYUkgRFvUEJ4zVXgvLljXWJQBZ2Km
	qngkCnuf/mJgU9Jnl1qW7cq27N6/UKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvc2i-001JCx-Vx; Fri, 10 Dec 2021 09:18:17 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvc2R-001J8W-Dc
 for linux-mediatek@lists.infradead.org; Fri, 10 Dec 2021 09:18:00 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 t1-20020a5b03c1000000b005f6ee3e97easo15413209ybp.16
 for <linux-mediatek@lists.infradead.org>; Fri, 10 Dec 2021 01:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=9CJ4nkBMRuxK4SSkNM4ap1zouh60oyFPsU/ELuKKgck=;
 b=Ir9SzvbgbyXCoADDrhwtz+KS5nFpEppthfgfk1R2pL7UOrzEEup1fY3cN/KFYmf5lx
 GwoLZ+o8wdVQM1h7FBuYy5JBmXf5WF5eJGO3+Yro5iTFDxZtKNEsjh7Mr5FiIIx/P3ky
 6O0CFoY6CmcrYUwVQMQ/4atz/hD5g4dlUInq9GTooTPIEaEXhJfK1z191Q75c8ty2PUK
 EnHuTH8EgAvXUdDs6pRlogofebJZ4rg3Z6b/kevTQYrAQEDEvRCDQlKKEtPIsCnge58L
 2j6DYZUctmLUxkDfYa+EebCmMiINpQxJHO8ffYszvHnSft3wU9vNBMWkrs+FQWiXaj9n
 VpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=9CJ4nkBMRuxK4SSkNM4ap1zouh60oyFPsU/ELuKKgck=;
 b=lfNMGS547AV9yFDNbsG3CxnmxuSLKIbCPddWPMkCrRNaIUKw3zcytdobrZrJaLIzkd
 DUJajHr8KcJcf5x1eFXjqxlY1tzhdBgRnVumCWqM9bsv28Rz7ZNBiJYPUdxobEVPXw4O
 hdxFyZWv6ApMZ1bFhzv5XVXfiksNaV4oX9RD/KPsEaSN6OyIkEHsj3KMBDjrmIaaaVAB
 HGJY40FpDl7wzWlXkhK+1tl6cPnFIRkMQlpe3eM5kjMKwaeSvDMrzNiidwamou4gQzA6
 AZjcX3G6YkxkHBdKgTtp7/5sVekPX2/MCP6Zikq9gzoWo0MlPmO1LWt1zYzyJqod3goi
 z9tQ==
X-Gm-Message-State: AOAM5300+oyP5B3uG4n5xuyPeJjDgU9z43C5CI4yGVGkgNwhImerHkm3
 u65H/GExnxXF7iFNYqjkjDri+MkiLRqg
X-Google-Smtp-Source: ABdhPJzaXkHhrvQwQArRlKNxmjtyYtnhjBRqP0OwC9I8b5nWLvzMBUlpFM96pHvXuROD9qh2sVJg6TXl4xp6
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7fdb:7edf:3c09:a8eb])
 (user=tzungbi job=sendgmr) by 2002:a25:8e04:: with SMTP id
 p4mr14339827ybl.165.1639127877702; Fri, 10 Dec 2021 01:17:57 -0800 (PST)
Date: Fri, 10 Dec 2021 17:17:46 +0800
Message-Id: <20211210091746.1010113-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH v2] mt76: mt7921: reduce log severity levels for informative
 messages
From: Tzung-Bi Shih <tzungbi@google.com>
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, 
 kvalo@codeaurora.org
Cc: shayne.chen@mediatek.com, sean.wang@mediatek.com, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_011759_481636_DF30A61E 
X-CRM114-Status: UNSURE (   9.66  )
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
Reduces the severity levels.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1[1]:
- Use dbg level for "Firmware init done" message.
- Modify commit message accordingly.

[1]: https://patchwork.kernel.org/project/linux-wireless/patch/20211210082247.977043-1-tzungbi@google.com/

 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 6ada1ebe7d68..a57ca4ad8cab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -882,7 +882,7 @@ static int mt7921_load_firmware(struct mt7921_dev *dev)
 	dev->mt76.hw->wiphy->wowlan = &mt76_connac_wowlan_support;
 #endif /* CONFIG_PM */
 
-	dev_err(dev->mt76.dev, "Firmware init done\n");
+	dev_dbg(dev->mt76.dev, "Firmware init done\n");
 
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
