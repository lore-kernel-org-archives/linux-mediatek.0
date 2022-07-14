Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070CBC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 02:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vtnkEvi5Udxd5BmGMWeYsoH6oqCqsLmq/xNGp+XW7xg=; b=y4u28CmZuthJ89VBu4ti65c+LZ
	o4NJSQYI7i0mNIk1C8TLdEtdPMLzNg9wfvtMNV4gZ73aYRmLklbOvbsxSdKKr2otNY0L1iFv56dWV
	b6LQz9XMZnAf6SOmTSX2CCl/NlwyvAGG/r+0FkhmzHIXqOIpdh6X3g7opkmxtrLsz05EP2ec4v6Ak
	ozxM1TNhXttFWAF+8jLzWM5G4a90mLyk/YXo/G0+OoCHpZziIiYL7GIsAZWgi0M60+oDEPae35EYy
	4jZOTlBYVbiWpGktvcktKypYz7dbxWImlVF9blrQ4ddFWvcssogWw2eIW8Z1N5W9KUFaO1vwDfxk4
	8AgO6llA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoGp-009wh6-E2; Thu, 14 Jul 2022 02:08:03 +0000
Received: from mail-qv1-f46.google.com ([209.85.219.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoGj-009waG-K4
	for linux-mediatek@lists.infradead.org; Thu, 14 Jul 2022 02:08:01 +0000
Received: by mail-qv1-f46.google.com with SMTP id l15so472953qvo.11
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Jul 2022 19:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vtnkEvi5Udxd5BmGMWeYsoH6oqCqsLmq/xNGp+XW7xg=;
        b=gh8G9cCjiCTOeBozU3VXkqYs0VYyS8Hn63BiIWAFQGpg0Yhuq3/UOmGzaRpa2gMRat
         woitL2fazmaQnxXBoot7Z5lmoooreSKje56knLTVSivLbo1AjgJSPg4LK6sDE7Lw3FAc
         IDHw3MUR1IWBURLkRhR2jkJDZFDos7E7hCImA6LaYqPROfd9CWNAwLI/9TT/BAKYO1gM
         sxRLOHjH+ZUC//y27s8ossXzUCz0Q67MVl0HFBQLSa+oXTWzG0z5ak/EV6I0veA9umHj
         5YF7kr7tmsQVYPnZTq18stYR8n6Jn0dKXhDawwqoDzpcLsqBzChBwGoqvA/CfZnGQvLm
         5jgQ==
X-Gm-Message-State: AJIora8p2ooCR3nKWwJIi28JwhYJnRUhYCinQ+asFV8XH8Uxc1ou6vzL
	cp9aKutKKfrcSwp0mDcpsdE=
X-Google-Smtp-Source: AGRyM1tCazHNvur5rHh8ujYARoZtxQC1HQ4MWJOSrle2hF2BraRfHeh6Yd3JzCfe0D37UB4VWVL8JA==
X-Received: by 2002:a05:6214:3002:b0:470:7273:bee5 with SMTP id ke2-20020a056214300200b004707273bee5mr5619185qvb.98.1657764465461;
        Wed, 13 Jul 2022 19:07:45 -0700 (PDT)
Received: from localhost.localdomain (107-199-63-251.lightspeed.sntcca.sbcglobal.net. [107.199.63.251])
        by smtp.gmail.com with ESMTPSA id d22-20020a05620a159600b006b5517da3casm308537qkk.22.2022.07.13.19.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 19:07:44 -0700 (PDT)
From: sean.wang@kernel.org
To: stable@vger.kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 5.15 1/5] Revert "mt76: mt7921: Fix the error handling path of mt7921_pci_probe()"
Date: Wed, 13 Jul 2022 19:07:37 -0700
Message-Id: <4bdcd29552ba78c87d8799181b9acddec465ad3c.1657764335.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_190757_681310_C210C985 
X-CRM114-Status: GOOD (  12.73  )
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

This reverts commit 663457f421d41e9d2fcb1e84baf43d1433f80c08.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
There was mistaken in
649178c0493e ("mt76: mt7921e: fix possible probe failure after reboot")
that caused WiFi reset cannot work well as the reported issue
"PROBLEM: [Stable v5.15.42+] [mt7921] Wake after suspend locks up system
when mt7921-driver is used on a Lenovo ThinkPad E15 G3"
in http://lists.infradead.org/pipermail/linux-mediatek/2022-June/042668.html
So we need to revert the patch first. Will be applied again later.
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 3d35838ef306..7d9b23a00238 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -254,10 +254,8 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	dev->bus_ops = dev->mt76.bus;
 	bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
 			       GFP_KERNEL);
-	if (!bus_ops) {
-		ret = -ENOMEM;
-		goto err_free_dev;
-	}
+	if (!bus_ops)
+		return -ENOMEM;
 
 	bus_ops->rr = mt7921_rr;
 	bus_ops->wr = mt7921_wr;
@@ -266,7 +264,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	ret = __mt7921_mcu_drv_pmctrl(dev);
 	if (ret)
-		goto err_free_dev;
+		return ret;
 
 	mdev->rev = (mt7921_l1_rr(dev, MT_HW_CHIPID) << 16) |
 		    (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);
-- 
2.25.1


