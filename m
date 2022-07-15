Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D80FCCA480
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xahxNMPqfOKHyPoqRDBKi49wM50fDPhjt2s1BRD1Q24=; b=ZbTSYF6SySo5HgdADX2gs8ZbcG
	ZCooB7CwL/MF5M5d5HDw7RiUGl4MEBFSxQwbyKubqKZhtSEApgBX5GqOsNotwPYvalMiUS9VPqOoz
	55k8+aIKqIsXhEhRNrrRp29hpiHA8E8Em47YfTBQHqrr47TSKLt9GLQQgsnl1qGhwQJC18uq5FXc9
	LVYVkqigIk9IID3a95BsxNSk9C0LVFP6Y6Kkct1d6FhW+K3+eOGHDtfXWcFtCrzTNHKrJF58PiV2x
	MJ2gT4XUcKEPNEriZI/ZQsHus5mwWj9QRDFM2dy9D3prTVagYe048vqnJcIF2vCPINozC3GgMoUxV
	qcJv0Bfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRTP-009zvX-0o; Fri, 15 Jul 2022 19:59:39 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRTM-009ztu-DK
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 19:59:37 +0000
Received: by mail-pf1-f174.google.com with SMTP id y9so5479799pff.12
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 12:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xahxNMPqfOKHyPoqRDBKi49wM50fDPhjt2s1BRD1Q24=;
        b=SxPcDk7diHz9LHkfsKccJmb4+fD0/9dw9NR2hHilfIBwvWOLru5oAvJEVqvbwL0/7z
         4iH5GBziDggH8KgVZTA03TzN5R0HD4LBy4viHaD+zLfwtZYAQYg+Y7RvTC4LFVJb7FmB
         hILHyCB8IEy+lBWq9yQYe53Oqx+RzeRnR3ezVu8kiuVBgirT7WOBT7+0kpwWHW+cnmH9
         0fo9aKOT92pV8WvV4yYNt3WlCJsII+9Y5Xsx7wPD8PoLWGK+Dxz9aRInRZgd8XWdDJoS
         anQem+DDiRyt5wV9jYiMSNgMrvaCOe51jsd+sgr8/2B90SNhuwzFJJtLsKs1SOwhSQ/D
         ZNKg==
X-Gm-Message-State: AJIora9+y2bRK6zUZlHS9vCKl3iRQJKgS9vO1Y2o7V+RkAt8hQYtF/da
	Mb+RnpJG2oVISSwbCq0kEbY=
X-Google-Smtp-Source: AGRyM1uGmmDzLtiPfFgGlWXXd027UjjkTsg5pmXVIrXri+qBKN4v/5G55jMLM8lkTV8QayyFU9hqtw==
X-Received: by 2002:a65:6398:0:b0:415:7d00:c1de with SMTP id h24-20020a656398000000b004157d00c1demr13818142pgv.610.1657915173046;
        Fri, 15 Jul 2022 12:59:33 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan (c-73-71-21-1.hsd1.ca.comcast.net. [73.71.21.1])
        by smtp.gmail.com with ESMTPSA id y1-20020a62ce01000000b00528bc6d8939sm4224629pfg.157.2022.07.15.12.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 12:59:32 -0700 (PDT)
From: sean.wang@kernel.org
To: stable@vger.kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 5.15 1/5] Revert "mt76: mt7921: Fix the error handling path of mt7921_pci_probe()"
Date: Fri, 15 Jul 2022 12:59:22 -0700
Message-Id: <27b8ccd411f2c51e2b8193a4eb1fa7e6f416a2f0.1657915079.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_125936_474407_0382B0A5 
X-CRM114-Status: GOOD (  13.32  )
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

This reverts commit 663457f421d41e9d2fcb1e84baf43d1433f80c08 that is the
commit 44c4237cf3436bda2b185ff728123651ad133f69 upstream.

Because there was mistake in
'649178c0493e ("mt76: mt7921e: fix possible probe failure after reboot")'
that caused WiFi reset cannot work well as the reported issue
"PROBLEM: [Stable v5.15.42+] [mt7921] Wake after suspend locks up system
when mt7921-driver is used on a Lenovo ThinkPad E15 G3" described in
http://lists.infradead.org/pipermail/linux-mediatek/2022-June/042668.html
So we need to revert the patch first to avoid the conflict of reverting
'649178c0493e ("mt76: mt7921e: fix possible probe failure after reboot")'
and will be applied back later after fixing.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: update changelog text
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


