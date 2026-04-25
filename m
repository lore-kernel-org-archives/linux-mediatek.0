Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642EAFF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/5EfUHW/KaKsY8UZlwc43ngiZ2mWe3FR2S4/3mx4C2w=; b=EdUPyAuJzlb+UaE9XqrFMBRShO
	ZOQcz2fp8lZeICamAH++YKvLA3MMmDQQVm3omGWXUekVXCtMyBPEys5QlNJ7yTCP/Q4oVyEdvk61i
	828A/ThvCsG/6IJv2qWNsLlSD5vfOItnPvUpM7zJdZadMQE6d9ropQN+BuZBd9hCEDt6TXz4zU0af
	CQ+Q2vyHMFyC+NsHCL6HcQ8Xb5k+J6ynhq/qNlt89qViHmjXA1Uzd6lQD2Wpm4R7/0ADezPTy7ApK
	NYPPgG82VBkxv9zowPBKWzWAl+Oj2q1ks144807b8F1s4LPwpoFt68qSzW+ByzsHVhpFDwx8yXk0q
	q5wrGSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfZZ-0000000EZKn-0rLb;
	Sat, 25 Apr 2026 16:09:37 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfZX-0000000EZKU-2l15
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 16:09:36 +0000
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-479e7e88fb5so3629105b6e.3
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 09:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777133374; x=1777738174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5EfUHW/KaKsY8UZlwc43ngiZ2mWe3FR2S4/3mx4C2w=;
        b=M422Iw5134kvbmpv6/9cwdoZJr0SDk2U+N82nSXqzZsSW4VSZIdll18SU2d3x4XJLy
         fWC+0H7jWjdFN2QIHzTF0LPqrdpAwIeqbLQ76qvm5adUUEJSBLBTwo03Sc4oYamdI31z
         UluVc8oopKkWkKuDYm0Z400jEtY2aDO4LCigwXZs5smXvK77fCM4ebmaco8G47D9Ot5G
         mwGpURmcXAq1ckiaCxEq2rplL0uAXdBZ6Jr3UOS38c4IiZ9gsXKSXJGFhaiWaj9rs1Be
         qGtWCAkD+dlKv40U2Q0GgT7jOfT4nOqKXeLz7BlkVU5/VQ/oSPu+755WwA66MQXN01m3
         55ww==
X-Forwarded-Encrypted: i=1; AFNElJ8tuXRq+yPh/c/5i9gyoNCqdN4QRZPCvGpB3XR71hZqmq3bQ9/FivOWXrZsYmYaiyTYvgGCsD1pSMzCXzTgSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5N/cNjfEG9C2YUGzeBMQrrPGvHY4R5LPkaZEYxELl5+4HGF+y
	c8uAG6yWWvGwxzknLB6HIV7rDKQfllrMJ65m93/7XbRqRcOcJToG6XhA
X-Gm-Gg: AeBDiev3wWEE/ORDWoX/TOeqezMWqxtG/4GSvMds4FYa4n2C6PXPGK8XG19ARRoYGRZ
	0CRuzOTqZToOehYAP9/5f1veOt6v1ZgR8Y8IZR5OA8fY/BqNFIjdKVX6y6kMCPTbOZWY7jZmpfD
	9WeyhEDHD74yzrnRjph48yjREGy0m9qJeVS3DRnymUgkZWNi27XkGoCNN7FeVdUgkZsktfV/IJE
	mVPe/Z+Z1SRCWckwSjs9TvgI2UNE9urv1Z4sPbXbHNl2WWR+nJ4aS7y/B98vfFfMIzPmnivRAbm
	vwbWiHoYv4LSfWQO9Ttc720E2UqBKRKjzbxanfV0viu+mA2bdfWjNaIE3xb7PCJE6/s8qQ75AQd
	vHIAw9bA/lIq6K1BqXn1GVU7K5DUiSt4wRR0Vaf0qspFWfhiGmGYepw3gP/2T6RF0+TDehH5qlr
	UizciRVlBECKIjl+PmxrcKJLai0r3XB9luN1amuFpiEi9/AhGe+jPruQp1LQC9wIu/Km813G7PI
	A==
X-Received: by 2002:a05:6808:1919:b0:479:f9df:ab44 with SMTP id 5614622812f47-479f9dfb0a6mr11399113b6e.35.1777133374439;
        Sat, 25 Apr 2026 09:09:34 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:9f96:11d3:5f6c:5582])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-479ff935c40sm8099624b6e.17.2026.04.25.09.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:09:33 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921u: add MT7902 USB support
Date: Sat, 25 Apr 2026 11:09:30 -0500
Message-ID: <20260425160930.739237-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_090935_694973_F428D12F 
X-CRM114-Status: UNSURE (   9.29  )
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

Add the 0e8d:7902 USB ID and select the MT7902 WM firmware.  Use the
same USB queue mapping as mt7921/mt7925 so MT7902U can bind and probe
through mt7921u driver.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 2 ++
 drivers/net/wireless/mediatek/mt76/usb.c        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 17057e68bf21..d86969a096ac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -13,6 +13,8 @@
 #include "../mt76_connac2_mac.h"
 
 static const struct usb_device_id mt7921u_device_table[] = {
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7902, 0xff, 0xff, 0xff),
+		.driver_info = (kernel_ulong_t)MT7902_FIRMWARE_WM },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7961, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7921_FIRMWARE_WM },
 	/* Comfast CF-952AX */
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 632ae755c7a6..d16439416891 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -925,6 +925,7 @@ mt76u_ac_to_hwq(struct mt76_dev *dev, struct mt76_queue *q, u8 qid)
 		q->ep = q->hw_idx + 1;
 		break;
 	}
+	case 0x7902:
 	case 0x7961:
 	case 0x7925:
 		q->hw_idx = mt76_ac_to_hwq(ac);

base-commit: e8c819df02436f2c2379766946735e1f06a7c923
-- 
2.43.0


