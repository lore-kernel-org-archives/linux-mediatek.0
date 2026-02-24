Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB5FEFB7F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 06:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXbMDu4NldZsQWzooZBGPLWKOu0HOKaZs77YpksnpCs=; b=B5mACEF4PwnnhTHEVFUFlLi0fF
	N3oJ+kDlUa19B49zUTp/mEc5aJIJOIXepsivxLBi8c6JEClN79RJZLWrJQpNku9yNqSmjVyiUrz7/
	+da8zh4no5KtB6WeIDS9Jb1nOTQ4yJ80NR/rNoWQXhh8hdnWSbsnRvp7EGADurOHiflENv3sKo1Ra
	LJwyWFEvehihTRH30F+erCUC4D9V11GOdDtpXFLUYRxIdh6XxoVL6dZ7H4Ld6k56DnUs17lrz8EQ5
	V7nvrU2STUH7zAaGjTZfDfTYy0O9UFVlYwNl3yCLPrJfmoDPcQldq/ioz57Wn6KovBXpHdDgS1p6T
	46jpJRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgH-00000001W1G-2HNe;
	Tue, 24 Feb 2026 06:14:01 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgF-00000001W0w-0Pnu
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 06:14:00 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d18f80b5c2so4446491a34.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913638; x=1772518438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXbMDu4NldZsQWzooZBGPLWKOu0HOKaZs77YpksnpCs=;
        b=E3wTji4ashDFWGOJnx+qHQQlJ7hAH+jIu528EBfHuByqFSR83NR1YSDkX63HaMXXhW
         lcpkQ5cSUj+bqqqqB9lqya5EYglTd0qXjjin+Qor5t0kt9H2J+APZD/aKpMs7R9oR7Aq
         NnULTwV9l/rQAygk/LMJ08gzddUkn2uiIdohdjUjtkGRPsQlOpDyzpTTzryxC/1Vs/Dk
         MkiB/RURCL8HJL9skWQpZs+1qX6N9aSReXzP1AMUNPIBRDmRojGE+IoSHKUwVqy8SEC0
         zVGHkAUnFG03loMGG9G7C1wmEBkIfGxnlmh6zdDMNqlDwXE8bQridJ1+Gq+ka7zBXA2k
         x4kw==
X-Forwarded-Encrypted: i=1; AJvYcCXFHsIvVDwTzKMl8kS+JWeoKrC4DOtmImHaBwHY1HJ++RhrLhiithM0DGx8JPVOWKWXZ+fn+OVEvmpHdO6dzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBFUG/EdoxjjmfQaZsN6aaSiZfFBBVFi2/zlf6y+SllyJWblOr
	YttJbIuEI0BTDFcZnrvR6Jcmzk3pCC4YYIASO8jJfsazK15PDfpUeqyt70DJ2w==
X-Gm-Gg: AZuq6aKKruLI4fGqPyy24A95dqO7xzSQ2gHp1/ha2v0UX6JYBEzhXjlfvHGM2tX/rni
	IopVZ0HnnTuHWhMVNb/+0di9WulKeMk9gEhfzHrqbJLX6FBRL3SxqN7GU4+5tHxZGaEhh8MG3+X
	Bi2dXDJNHa3+TEUO7xQ1SqPc3+qbvLrh3JrO2uFzYUZczyvTTXye0cO28qUCUDydr0cDG4MltTJ
	YtcJG3oWG/koUKX1ahLHyKKN/iAJRPC5TpdaBhPip91BfHzORLhCH6OaIurjTP3pO2PyVLa6zWw
	mBq3xPoswnycpBYWJFGLTjWJLN5dbSABUOnz1uLFK5TzgkTbjeYolcqyHqO3IAMfkdP1IFpT72p
	dnXgoiW7nhltT1f1VVgfI+rALfgXDcuoHhsP129qpXLQKZc5pBlAudMclJSmGdg+XBPt/B6JTen
	T7DfAqIxaCz2gvAxcGW6CfI9KRiQ+q9QwqfEc5aUMANHqzNMq1OjTPWGOag3JlsYU=
X-Received: by 2002:a05:6820:828:b0:674:2eda:cbe7 with SMTP id 006d021491bc7-679c450123amr6421042eaf.52.1771913637860;
        Mon, 23 Feb 2026 22:13:57 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:8ac2:4fdd:a742:61b8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm7895306eaf.11.2026.02.23.22.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:13:56 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 2/8] Bluetooth: btmtk: add MT7902 MCU support
Date: Tue, 24 Feb 2026 00:13:19 -0600
Message-ID: <20260224061325.20189-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224061325.20189-1-sean.wang@kernel.org>
References: <20260224061325.20189-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_221359_142136_664DEA4D 
X-CRM114-Status: UNSURE (   8.77  )
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

Add MT7902 device ID and firmware filename to enable MCU firmware
loading.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: no changes
---
 drivers/bluetooth/btmtk.c | 1 +
 drivers/bluetooth/btmtk.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 14e2f4100806..2507d587f28a 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1338,6 +1338,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 	case 0x7922:
 	case 0x7925:
 	case 0x7961:
+	case 0x7902:
 		btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), dev_id,
 				      fw_version, fw_flavor);
 
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index b9df2b8f0627..adaf385626ee 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -5,6 +5,7 @@
 #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 #define FIRMWARE_MT7922		"mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin"
+#define FIRMWARE_MT7902		"mediatek/BT_RAM_CODE_MT7902_1_1_hdr.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
 #define FIRMWARE_MT7925		"mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin"
 
-- 
2.43.0


