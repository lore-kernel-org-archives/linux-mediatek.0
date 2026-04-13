Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46596E9380E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 03:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jyXknkEQRieSm0PHmWno6BYuEQ3h0sr9KS+KjU9LA/o=; b=gDTBgD/IDt+g9q08eJrnWb+Ye8
	zu2m35QxCXaQx83GtAD4tPZcUxQ1KDHrijeGsUMYnPCU5aIvWxbbwnI5Q++0pMZsyERU0tWb7/Q1E
	t8bDPcpYHnwMaAMbML5+HY6/rqtaCB3XU0kFkZwiAiWePoCfbZ7jE3zU5YSKTfeZVRMlvvlVeX5YL
	KdkWkcOB4zMQdac3BfCAkya2f/uizHWUTqZyBghDJ+OpkIg5vJJmMHxUbQH+Ov7cq5JiAlE3lVHJC
	FYkd0fqyrtbmRuE2Jq9TMGN17r0pVONvZ6vmRUDwDx3YgmKfk6UtRo15BkBpOf2JPN5QVW9fJv69+
	R+NP2DHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC82z-0000000EweM-3oeE;
	Mon, 13 Apr 2026 03:33:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC82w-0000000Ewdz-2OpB
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Apr 2026 03:33:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso41530705e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Apr 2026 20:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776051188; x=1776655988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyXknkEQRieSm0PHmWno6BYuEQ3h0sr9KS+KjU9LA/o=;
        b=WxNyJmDan5MeR0wswbTYcNbSyutiK8GAvJqyHhx92HfBhsFjwsbCZH0kMJ0DY9ioOe
         7QtHbwWhT1wVvauurrbfPPfkNAfGPOQ0SuEVHp2Xq/dGFyOruVIjQ905ae6NMGVzKv1Z
         X5LDwPRsukoYp6u/f7wKlvGwj9x8k6uV3r+G5gETiazfSDO6iIIm6KNwxOe/t+5MRNSA
         v9k31C3yXK7nlqG8N90RRhEmhXPBcHxs5foRcElvGrRGCvDCB/oq3gXPPnJKW0BqIlAN
         WFgOP4K/O3S++C2NL4d2dzZuDei5NEXM2/xYW5ZpYB79TxdlPOtG4O6y80nF3FieOXst
         jGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776051188; x=1776655988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyXknkEQRieSm0PHmWno6BYuEQ3h0sr9KS+KjU9LA/o=;
        b=J2Bu17xMxMMSyt5N/w/MtRVWTBzgz6nusUd1A1ZW3KGrb/tKI2JrHlMnMBDqGUR5Qu
         vGQ71BnzXYymxtQA/Uji/RhCNUqx/P/7WL8EKAsp3OVKhBwskJRreQ87EoSEu+Kwl6uB
         0xl+tE0n37r0iBK28QPXOxjxf3bGWNXDLOBhefFbmj94z9rvo7gDuGxmBH0AE1OZt3+3
         PJW0zdBedJ3zBVuXT9ZmHlJLIuR89kSBqQID33AYt5yrszoOddpgwIe6gWD5HPytIao9
         Ztgc4UAgw5aeq8xcMq4CqFTx/XUU7vyMFZN+ashiZpKcEZRJaQYUi5485fzhitBthc90
         o0aw==
X-Gm-Message-State: AOJu0YzLk0pOx7MATj5KYSSOxwYzfIZT0V+OzE0hHZEUlQz4OYuBFu3T
	/AQcf0N4EOY6CWisoRUkuymYucZsJfFUZ9MNNIThMHaRM4ZpAdu4jmIV
X-Gm-Gg: AeBDieva7BsgvC16ambz1OcaRPoWK7khBjAWkC/p8Me0N9y49hrPdVJchFeC5OL797B
	sY8P/I/wYMUs4Lp2El/5Tzaeo2mvv8VuBFX04AGOpqZEHSZVJ4KhyfR6uG1IDSpLOCkGxRRea5G
	M2egPfBLzTj71rPtTbEKnCAUTBiypmRQKVvNPUsM7YCEb8KXWllQ3Rx2DE9Jmi9493aW/dnDUpm
	YRVAKfpfKoNuBBKAaQUgGVy1iw3p/YR0bzzClINXOoeJ2W6M57i7sjm1Sr/4AmwCQ4JNuHWy0Bl
	N0MUlYvZNT433wUKfhLY8H6W3dlRA5DqAOh2JuEnZcUdTr6ru/dI/YQpIoYuQvYkr6ulFzk89Gb
	Ro/qB6dS64sE9mMb2li5jF/gfmqiT8nWyRFkf9CjTndyO7w4OcEES9wSdrgjCMcCy7+4InXdion
	mCxsmUyWBy4/PfuBrzeDdzIabCDwIrg3OeP5+aBDnyvpRz6lpJZeY=
X-Received: by 2002:a05:600d:8453:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-488d68ae9b7mr121137355e9.11.1776051187989;
        Sun, 12 Apr 2026 20:33:07 -0700 (PDT)
Received: from localhost.localdomain ([87.71.34.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d6ee98sm114039175e9.1.2026.04.12.20.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 20:33:07 -0700 (PDT)
From: Aviel Zohar <avielzohar123@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	sean.wang@mediatek.com,
	ryder.lee@mediatek.com,
	Aviel Zohar <avielzohar123@gmail.com>
Subject: [PATCH 0/2] wifi: mt76: add missing skb length validation
Date: Mon, 13 Apr 2026 06:31:33 +0300
Message-ID: <20260413033136.5417-1-avielzohar123@gmail.com>
X-Mailer: git-send-email 2.47.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_203310_619403_69449C52 
X-CRM114-Status: GOOD (  10.23  )
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

This series addresses missing skb length validation in two mt76
drivers before memcpy operations on firmware MCU responses.

In both cases, the driver copies a fixed number of bytes from
skb->data without first checking that skb->len is large enough.
If the firmware returns a shorter-than-expected response (due to a
bug, partial DMA transfer, or in the case of mt7925, a malicious
USB device), the memcpy reads beyond the skb data buffer, causing
a heap buffer over-read. The over-read data is subsequently
returned to userspace.

Patch 1: mt7925 testmode - mt7925_tm_query() copies 512 bytes
(MT7925_EVT_RSP_LEN) from skb->data + 8 without verifying
skb->len >= 520. The leaked data is returned via nla_put()
through nl80211 testmode dump. Fix adds a length check before
the memcpy.

Patch 2: mt7915 txpower - mt7915_mcu_get_txpower_sku() copies
up to 322 bytes (MT7915_SKU_RATE_NUM * 2) from skb->data + 4
without verifying skb->len. The data surfaces through debugfs
(txpower_sku, txpower_path). Fix adds length checks for both
the TX_POWER_INFO_RATE and TX_POWER_INFO_PATH code paths.

Both fixes follow the same pattern: validate skb->len before
performing the memcpy, returning -EINVAL on insufficient data.

Tested by code inspection; I do not have the hardware to
run-test these changes.

Aviel Zohar (2):
  wifi: mt76: mt7925: validate skb length in testmode query
  wifi: mt76: mt7915: validate skb length in txpower SKU query

 drivers/net/wireless/mediatek/mt76/mt7925/testmode.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c      | 8 ++++++++
 2 files changed, 13 insertions(+)

-- 
2.34.1

