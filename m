Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6602C2A09B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oYD8vxjOHGuQyZYPR9PahIsl2VjFcOZPUXc7tvdpKVw=; b=oa8tYYSybkC5o/NJj0lvKbUZeQ
	bqG2hnl0kqMEzytuetqMZ9eXCUObTkPk1Dcc1EfoyQtByaq1ufuidAcVWTxv5da4bkS8kcW9VRa+N
	X+SXWPulySc5R9/07MFtJmUgLF2QONIKbGdchnedYMoH1tveh+ts2vFOLsAzNqCE7ABG+rhKvGhNO
	HqW8aRM96fNk2ynwyFH36qe4NrGxbjVrzRqyDnm9q7Ks9H2GWq42jDzHE6/kMpH3GeqgMAHSnbV/e
	O2G18TtbVKJqejgGiau5G8YSay+ZzYCmqmBu8Lyv6NEwAam/96MiadRVyz8cfpfgCA1Q6OuqA/EdJ
	gX4MVj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMHy-00000008K5r-2JxD;
	Fri, 07 Aug 2026 15:15:14 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMHv-00000008K4P-2inz
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 15:15:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ce7d2adef4so52269755ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 08:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786115710; x=1786720510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYD8vxjOHGuQyZYPR9PahIsl2VjFcOZPUXc7tvdpKVw=;
        b=bsq2klDf1qmqeL/uMdpn9LS0c/0atSF0Wwd3HlqeE18PDf+Csam2zEFFgacw+htXia
         jSYGm1Rtx8btnaCqZ1whLF+SLLldWYt/frIn/77/JEuha+NGajiYqfT4kPTbr4Vq+GI0
         3XnaqqUhIgfeuJkjYIithhrvFY7kBlfBz5MrIDKKhybSOv9Ly8UaPV2e3/HC4dBv2YpA
         Qvc9oDPjNsXO/g1xRDfCkJCKJMqYUsW0hsxVx+8erMvL2QVqYs7n4hp4YUVDaV5ZE+E8
         QF2lelZHTDGqv8WwVAoDMUdV1OBZHq1KbOACP8DWHYnZ10TlycrVyRKSTJeVm189dc9P
         2Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786115710; x=1786720510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYD8vxjOHGuQyZYPR9PahIsl2VjFcOZPUXc7tvdpKVw=;
        b=OdX8Q85vSevcBxsdxSc684H4gtaAnOZR/M7jCEzq8fXcCk6+WSnvWhKkdU9W8dfuxn
         lW9FPfm32P9WY4azq+mL15/6QUX4V4iH0lZ/BFTIZOXCnyh8lQImXc1Qsv+YfhRKyiST
         71PVPCYK1Hm+gs/bwImce3zcxCUlTqeYNTEPFF3cfINIdrwgqcq57dv+DzQe28a862/n
         PW0mACFk5PZv3Y8A70zwgpue55/phQw/D4j8D2JcEyHD8koxyKTjjfEHv4SpfEcbcO98
         1Acv6UwlkQL7uLmVecOEwGSfQM9kpczFma/syylSZYW0cenSiMRV6xnZdpXTDwb4RQC9
         MyuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjhRlItcXZGwGHeJhUOU2QylDcrSsJhTZ8kOFHpB8nbxN4ofXCjTaBtNmvFkfntrMNYehQCwgSu8qheBFoZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAM57+63u4adEgUKASpAbCe8sJmZkMpq+ffuCZMfYANc932Nn5
	YxG4JZHks/bq2XU+AUIPk6BFz/i5w8B+jVneUxoAL0fvpAjlQtX/Hf49
X-Gm-Gg: AR+sD13oH4qrRSgaUwnRfO6YPmnEkurKw8K5RnA0uvQOegrgXQNr5yhJQtQga4bcwHL
	eLL5yjy5ES+oQHXn8zGY2qquG7gArVvIbU3XxihyZBkl5X456eYUfrvuNNfgO9GqOAa8yzwfC6z
	Lgu4YMC1vAtUlWjgEiCN5OEEKupYUUNJzMEAxvr8WhlBnzM9v0eWde1oVRfISQJ9gnR4fZqxyhH
	fiDmsNCjQeDJL4k9O0GBmQKTvDZkL3gfomuLo7trSuQcMLDv8SiBlXxBvD418YxbT2e+PhE51MJ
	cMyWnkgLhfnosdK0Xmi+KOT+Mq3E8yTmxPa2+fnV0VY/xbuUJF8U6+uc6qgcbAogjurRdcPgyWP
	SsNNzfIu83KYYssRyDZPGaA/irh3UQBj6leOXA2bsn0Rx8u2UB0ItRg3sUU82sDrx/ZyC5AFYX6
	eWZXArxxK4t0a3LYMZwSYT+ueT85ypDLHPFpld/WvNtzOHsxHAWufiK0vGbA==
X-Received: by 2002:a17:902:ce0e:b0:2d0:cc92:f7b2 with SMTP id d9443c01a7336-2d294b293d0mr61010985ad.1.1786115710098;
        Fri, 07 Aug 2026 08:15:10 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccabdf5sm10829965ad.14.2026.08.07.08.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:15:09 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] Bluetooth: btmtksdio: fix usage_count leak when autosuspend_delay is negative
Date: Fri,  7 Aug 2026 23:14:47 +0800
Message-ID: <20260807151447.2530075-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_081511_684374_EEDD22C9 
X-CRM114-Status: GOOD (  11.06  )
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

btmtksdio_setup() calls pm_runtime_use_autosuspend() when runtime PM
is supported, but btmtksdio_remove() does not call the matching
pm_runtime_dont_use_autosuspend() when removing the device.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during driver teardown, this reference is not dropped and usage_count
remains unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call in the remove
path before restoring the runtime PM usage reference.

This issue was found by manual code inspection.

Fixes: 7f3c563c575e ("Bluetooth: btmtksdio: Add runtime PM support to SDIO based Bluetooth")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/bluetooth/btmtksdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c6f80c419e90..4e1012e90979 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1480,6 +1480,9 @@ static void btmtksdio_remove(struct sdio_func *func)
 	if (test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
 		btmtksdio_close(hdev);
 
+	if (bdev->data->pm_runtime_supported)
+		pm_runtime_dont_use_autosuspend(bdev->dev);
+
 	/* Be consistent the state in btmtksdio_probe */
 	pm_runtime_get_noresume(bdev->dev);
 
-- 
2.43.0


