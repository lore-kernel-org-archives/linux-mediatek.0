Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCF7CA5FFF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N+kBx4QcKLVaWXaktso4/8lWc1DclQv7nA4KvLYpveo=; b=TZmJodCVNsVygRdbTPRAqjPSzI
	PyZ7G9FkXAkKHGT3J3sR/RAy6lmnXZhV1hFLWdZEFR4tTVGqwuq2nAbLat988tn19pF550UOKHVzo
	dPnVWpQ4ERt1N6d0VXdfdOY9ZiXkwFW3oU98bn/kdm4LFA54Z3GLBu5RU+q0RGl2cvSJU1W0WTXRb
	cS+BvvLFyKUvcvw3kZHq3xg2hriYqR2OxbD7T7TLvDEhsNuofQpiIUq5+UHRFZ+ST6ZbC3I3vgUdZ
	W0nK1se0A5HRNJxzqQuLKEkue2jqFTRsHbH9J5XstMMrPzZAcE/yETbjar0HFD9UiwTBoMy/MUnbo
	I+tG5dSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjp2-00000001VgR-1HEA;
	Mon, 19 Jan 2026 07:37:12 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjoz-00000001Vfm-2K7q
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 07:37:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c54f700b5b1so2467041a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Jan 2026 23:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808228; x=1769413028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+kBx4QcKLVaWXaktso4/8lWc1DclQv7nA4KvLYpveo=;
        b=Isfr0oI9qigeEUPY7+r3WX1u3VtRgj8rQMDBBKH0RWqtod0wkG4mZDW7MIpyP88ee4
         dOTF2ChBJFbRtem30r2ZJWtG4bKhKAQCMc0oURWJiXjkTosP5z37nKIiFC/wwu7Ojk/0
         Xmrz9Sx6kM72CdWBxzbv7qeFt9OOMBMNnMsJ59NMRtxXpUgqL5/nn0SYfYlfe/IFkm1u
         RoNdUZ4ThbQxOvbKXC2mLUI4TDY3txr10NmcqJ9tehBBRYICDmr/VkeMh2pI+w+gwsY2
         DLC0o7Kquf4WOS9bS0tHrA/K/A4Y2fCNL/RtngIjV8iNDUPPojNcsgCxWrDsmmdUhwKu
         KSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808228; x=1769413028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+kBx4QcKLVaWXaktso4/8lWc1DclQv7nA4KvLYpveo=;
        b=peGkAfc60fP2cxwPP2MqzoGMaxDlKoEqv7N8vhS+DgpvYW5HY8CyFT8G08a9+Pzngf
         EoQdz8Y6nX4ZoIH/g/m5LpctgRMLpBiCQkYR9VPUC4Z2FUJguX9UW2wAD3SzysTKt50V
         Rv+c900V2gLBwQuKnakkotfbIED6YlttBGRIGw7dbhYz8MGHMvbzMZDEJpMDrYHq6FPW
         LHiyJp2jYPXHfY7lA1YJEF8owCg06/lDzPMX6T2YI6wOKpOk1uUkv40UddHRKQQCglKA
         GIexRFi7zKGBbZtptgZbOH+sxEkMxdoFPA/pOklbcaelKR6tJAgYQmGynXTN4myoo4S+
         pnGw==
X-Forwarded-Encrypted: i=1; AJvYcCUIud8bJPMm2s3WzS/o4xTzC6xWW74tj+lXzffK2LQVSg0ERFDgOJ7ys1tQLOxShOvZHWoKCt427ebDEWcLtw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf5prjZYHTIa5Ey73vh0827l6MPcqj/mPJKvfreH4hVYgl6s+N
	HCK8SiTrI1Cvv9XOP5ozrJN1CDMXaMB8rEb6FeCy5+6vkvazOGckG6an
X-Gm-Gg: AY/fxX4w5TM9tkx09qQQZIGtXlf7UDxtfLk8nG23t7pxkbXM/oLJKRRIoz7hjiLKV/9
	wqnrGjNUJY8CO9+nXMaj4qu3YYnYL8m53nBEfp4Nlb18HSOeJl1jseUwkJgMATBuJ4vnfLxhyVw
	Y9URJXcOukxkyvyGlzyrM9k+wgMLm0EeEVDt/froav2POUsBirqsCY6Er8t2jsieeZocxCnuAG3
	mY/IxgtgS39CfAcUfMig/hjZq0fsP6jDRt7H3tRqK5a8f7zRiZztmK9FkPfxTvq+mMNHWg1RdJu
	FFqKfSggHB0xXcDd1A+mIiPQwwBcUkCsy6+PMctMZSGDLhmcqafROK93oaz6DDsDrzCJiXyubht
	5KwP3Y5nTZrwXn1IaHQJKtBdi9stgb2IFDQz2WoDRTxznvIN+7gag5zCvgeeyzOBkexuZb4NYx+
	MW+4zjcVplQ41DZpaOCCDS/ro=
X-Received: by 2002:a05:6a20:3945:b0:38b:ebaa:c167 with SMTP id adf61e73a8af0-38e00c2ef84mr8843037637.20.1768808228293;
        Sun, 18 Jan 2026 23:37:08 -0800 (PST)
Received: from nbai25050028.lan ([2409:4090:807d:4601:b49b:a111:92a3:e6d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d1f1sm8170540a12.22.2026.01.18.23.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:37:07 -0800 (PST)
From: Sayantan Nandy <sayantann11@gmail.com>
To: lorenzo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	sayantan.nandy@airoha.com,
	bread.hsu@airoha.com,
	kuldeep.malik@airoha.com,
	aniket.negi@airoha.com,
	brown.huang@airoha.com,
	Sayantan Nandy <sayantann11@gmail.com>
Subject: [PATCH net-next v3] net: airoha_eth: increase max MTU to 9220 for DSA jumbo frames
Date: Mon, 19 Jan 2026 13:06:58 +0530
Message-ID: <20260119073658.6216-1-sayantann11@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233709_613777_EE6EE96F 
X-CRM114-Status: GOOD (  10.31  )
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


The industry standard jumbo frame MTU is 9216 bytes. When using the DSA
subsystem, a 4-byte tag is added to each Ethernet frame.

Increase AIROHA_MAX_MTU to 9220 bytes (9216 + 4) so that users can set a
standard 9216-byte MTU on DSA ports.

The underlying hardware supports significantly larger frame sizes
(approximately 16K). However, the maximum MTU is limited to 9220 bytes
for now, as this is sufficient to support standard jumbo frames and does
not incur additional memory allocation overhead.


Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>
---
v3:
- Document that hardware supports larger MTU (~16K), but limit to 9220 for now
- Target net-next (netdev/main) as this is a feature enhancement
- No functional changes

v2:
- Clarified commit message regarding DSA tag overhead

 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fbbc58133364..20e602d61e61 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -21,7 +21,7 @@
 #define AIROHA_MAX_NUM_IRQ_BANKS	4
 #define AIROHA_MAX_DSA_PORTS		7
 #define AIROHA_MAX_NUM_RSTS		3
-#define AIROHA_MAX_MTU			9216
+#define AIROHA_MAX_MTU			9220
 #define AIROHA_MAX_PACKET_SIZE		2048
 #define AIROHA_NUM_QOS_CHANNELS		4
 #define AIROHA_NUM_QOS_QUEUES		8
-- 
2.43.0


