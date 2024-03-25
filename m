Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7BEC54E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 22:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yj0lKCneUUNFpuWmlMG2eg6t5bdla+97utz0tzfjT9c=; b=gVIUXw+OubJtLf5tY9wJPy+U9E
	7oJC4RpUVuDgO47viTnun4ymEXW8url19IfeTTtXSaj7vYBRWl71LzBw5achkmyrg7Q93xbzhh901
	v1eCpYR504VxBCpYI0yG1YBJTtXLK+dsDdYoBNljF54+DYrUQaVHBEORyO+Kjodhq3q73UWATEvyl
	oDQ3ueEWGHd8iBt2qbyZ6AuuRlQ+P9zcHNbRwpndtcR+qGTmkYaTu49A5/9X8YsBMXxGV+/nzG4jX
	CXie9N9l5Rmb9bxk9yV9xhpFSDpnjyaOKlwD2NZcaLsGDgCE6bGhhoEZccioskcZu8OiOgHzuZK3s
	OVluDSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rostK-00000002DnP-0yKN;
	Mon, 25 Mar 2024 22:34:06 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rost9-00000002Del-4C3L;
	Mon, 25 Mar 2024 22:34:00 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2d4a901e284so96027521fa.1;
        Mon, 25 Mar 2024 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711406031; x=1712010831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj0lKCneUUNFpuWmlMG2eg6t5bdla+97utz0tzfjT9c=;
        b=KARoPshPlyZof4tNnPDrP9vTILlbiJDy6HJ9lLiyjFxNv/DzI59S5isU8uwlxM2lRs
         dIo+RYqOa4u1ZO+jbyAcvjWOXMdXXYTLqp1G+6VXYJ1ZOfN2uTzpisnZNIs45Z0So11v
         5a/QRqyXqON5Tl975Z2/7YbZFgAbblq1Udxb9vFBOQKUk5o2NDGk9dEELgV8cGUGKMmb
         0D3KCqkbhMKskpvDT4Ha//UZd9712EjfdNYR1RgaShXBoqfvyKpukz5SkLPgr9LDpaiY
         P9yOvVOoBrqOt6pTx9iTDR4H5QSPRMI1k2tclc6vePAqbRgYX3DnBQFvfi1t9QOigUNH
         OdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711406031; x=1712010831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj0lKCneUUNFpuWmlMG2eg6t5bdla+97utz0tzfjT9c=;
        b=xEa4nS75SEfOnIk+3rQczBxlTAqpwZSw06GhMBJsyr0bd0U5bCMTnB08+4+2q5eA3S
         poFhL/dXnRUhPzIwFY11lqU6rFhD9K0dDI3T4W0lfa/Wug1bapRgUx0x+PWJFvp1p8oU
         nVcyBBWZ+9iZOyXqXn0Lly8nx2r/XZXVeeicfrIARDz+xVkxjvtvpyYxyzDUf1DjQDhY
         o9hBzOpwvPucGzwkWieGG65CW/V5m2YSW4zFa2wigqhAYDirPXW+0mBZV+CbjluIdgGo
         ioTyaF4iGHbfT2r5zJKilAbUl0ZJlUwdRulORlHaUYUN98UJoCcogwPSLjDkBtIlq5ZH
         vDrw==
X-Forwarded-Encrypted: i=1; AJvYcCWIQz3gIz365nqy/vkN407PBww/EObSMhNc9yxztu5r725/CZuypfYrrzntHae6SpHYfJzhitWiR2w8ua3zHavKo58AFLEMDzuoMObMopk733RfhQ6+LE58X5E7rcKBI+jzyumUSNBCBPKa+7ewiTFQjUlUnwAcxNY=
X-Gm-Message-State: AOJu0YxPJfjeLSwdJd/jUYkwL69mMAMHCr+whxq2t4TVy0TfrpVESMoR
	vCkLPGRpIIv6OMid9uoWUP/m1MHVohh7LoKGlZgcG+bYiltwCvHa
X-Google-Smtp-Source: AGHT+IFEdSvP4N4t9jGkeQXZI3vk9OxPvkV4RxMgtnTvFQKLCtONSH/wLY9I5+xWuiI6522NGNrFLA==
X-Received: by 2002:a05:6512:b8a:b0:515:b0be:3a42 with SMTP id b10-20020a0565120b8a00b00515b0be3a42mr2443071lfv.33.1711406031115;
        Mon, 25 Mar 2024 15:33:51 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id e21-20020a170906081500b00a4df251a601sm89295ejd.77.2024.03.25.15.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 15:33:50 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openwrt-devel@lists.openwrt.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] wifi: mt76: mt7603: add debugfs attr for disabling frames buffering
Date: Mon, 25 Mar 2024 23:33:19 +0100
Message-Id: <20240325223319.30125-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_153356_676780_265BEC02 
X-CRM114-Status: GOOD (  15.41  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7603EN and MT7628AN were reported by multiple users to be unstable
under high traffic. Transmission of packets could stop for seconds often
leading to disconnections.

Long research & debugging revelaed a close relation between MCU
interrupts of type PKT_TYPE_TXS and slowdowns / stalls. That led to
questioning frames buffering feature.

It turns out that disabling SKBs loopback code makes mt7603 devices much
more stable under load. There are still some traffic hiccups but those
happen like once every an hour and end up in recovery in most cases.

Add a debugfs option for disabling frames buffering so users can give it
a try. If this solution yields a success we can make this feature
disabled by default.

This change was successfully tested using 2 GHz AP interface on:
1. Netgear R6220 - MT7621ST (SoC) + MT7603EN (WiFi) + MT7612EN (WiFi)
2. Xiaomi Mi Router 4C - MT7628AN (Wi-Fi SoC)

Link: https://lore.kernel.org/linux-wireless/7c96d5ee-86c1-8068-1b58-40db6087a24f@gmail.com/
Closes: https://github.com/openwrt/mt76/issues/865
Fixes: c8846e101502 ("mt76: add driver for MT7603E and MT7628/7688")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7603/dma.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7603/init.c    | 1 +
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h  | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
index 3967f2f05774..c80baba7a402 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
@@ -115,4 +115,6 @@ void mt7603_init_debugfs(struct mt7603_dev *dev)
 			    &dev->sensitivity_limit);
 	debugfs_create_bool("dynamic_sensitivity", 0600, dir,
 			    &dev->dynamic_sensitivity);
+	debugfs_create_bool("frames_buffering", 0600, dir,
+			    &dev->frames_buffering);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
index 7a2f5d38562b..f5ab729dec31 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
@@ -27,6 +27,9 @@ mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
 	u32 val;
 	u8 tid = 0;
 
+	if (!dev->frames_buffering)
+		goto free;
+
 	if (skb->len < MT_TXD_SIZE + sizeof(struct ieee80211_hdr))
 		goto free;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index 6c55c72f28a2..5abc2618ec8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -515,6 +515,7 @@ int mt7603_register_device(struct mt7603_dev *dev)
 	dev->slottime = 9;
 	dev->sensitivity_limit = 28;
 	dev->dynamic_sensitivity = true;
+	dev->frames_buffering = true;
 
 	ret = mt7603_init_hardware(dev);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index 9e58df7042ad..02c88334cdc0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -155,6 +155,8 @@ struct mt7603_dev {
 	u32 reset_test;
 
 	unsigned int reset_cause[__RESET_CAUSE_MAX];
+
+	bool frames_buffering;
 };
 
 extern const struct mt76_driver_ops mt7603_drv_ops;
-- 
2.35.3


