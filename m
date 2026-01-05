Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8848C2A062
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4A75z2eUdNK91diKdVTUHzH8dkd/SHqnoNMun1BNbA8=; b=b/EIozPgdtSjRx3MZzvc07mYbx
	XHXWUgNQJOCHtVpivXLf3wZYkE27c+s4BeRDLmxNnqq22XbfyhRQRqnhC0dvgQCdA7dQZZWLZR4xH
	BKLRhRa5DXwJTcuXfxGGVr1vWOi0P/Ynu7jV+dLvVsACmVR301JGxLdGHbaHzxs1NcPjyKTsm/3tu
	esGHG3AAKmBOT4jXLh7HasbubDQumWpRNQlBu+42EQlxbE8Z4I781JTv2XrK6D2NIzTz/CLW0O3wg
	rUXQeNW6OvrkkTCc4nllf2VBXNg8z18oJQNLoSj5gsrHDG0WBs+eGBXn1lcSNxWIO6nkej0u4eSGV
	E0Gxx1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR0-0000000AZtB-2wba;
	Mon, 05 Jan 2026 00:26:58 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQx-0000000AZpr-2J08
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:26:56 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so11571190b3a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572815; x=1768177615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4A75z2eUdNK91diKdVTUHzH8dkd/SHqnoNMun1BNbA8=;
        b=JCaKT9eQE+eoIli86gBscW6QhN9xqPrDerivDcTLqXVH7L0KqPAXDm0f1nFgmJEoy8
         VSHVkAtPcjxn/uQfyX/Uz97NUDRZRGbWgKZ6aVmyoSfoJf3UdbmXM38R1I8PJoUyNuhU
         /nv0NuA26i3TOxylOUUPsTjPKnj/LmO7BpTt+XKNM+gxefj4Hh4DsQPaBUNyXb73x7MK
         EAZWQbJNby2uh+1tuPJ8cIFzHePbwp4r8JTrHLH3ndzIR9X6l6Z2IaXjZBEevCNrLIky
         BKjydYMP8RmVb9jek0TZpz4oVtVQjEe8Gn3BPSv5qf5oeb3X0G4cVtHx6g2mOp48KTmI
         /DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572815; x=1768177615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4A75z2eUdNK91diKdVTUHzH8dkd/SHqnoNMun1BNbA8=;
        b=NHVSoa23WRk/eK0OK18H1whuZEnPdr5IHczNX+6X2GN0JZnz6EnfIhSFtfhjkWeUO/
         q6eQ0oMh0kieZIB8C09UDepHagJ6KBv5sTiQldI32CAclfto/4xkqQD46Vc/t2vts1Ty
         FN8A1FfIYY3N5HozQzkFA5SlhG9C1Gi378dy2bcsgS1vn5YGJ6QxTB5iodLxpnt722fg
         bvKt2zw6O9iGx/HVW93+NbqieSPgzwvCMrPbuZAuSwOx2R7ajvWWQS96LwjfIJbBliXs
         Blz0fWVxBY2p6ftMVpvYQFNjMOZcGe3oBExM+SpVOebEs/pL5Lo0sqhS5REuN0EpIDc4
         16oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDiaxmusVgNzP+V4QHOm2d3OxbTGrsjdsHjZCKggti451zsjpTAElqxyDodBb5QU6jEfK93rqd6HNHPdmh6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRcPhX1QqVHzUe92xIyDZUdKE2LtepxKAkId9IFqygLmuguMM+
	BRl2unLXauYo60kK44STplYNxPbw81TvvJ+RCZqPuQQxcVPEdDdaErAl
X-Gm-Gg: AY/fxX7jFIMsA+LWzjJWw6lbLYpBXq6dgS7zXCbloEMp8Hxd10Yqvzl+jqfm1EWTdsD
	lv+Qcw6svhJj4kB/NsoqCWfytafOq0CFkeQfrO/Lk15NYN4SbqDL6ArttaY6t/GddibPVrBpc+o
	dxQhbheRANpFw4Z8yTPuoCN8vnlhvXjFD9n8aT5DXO7nCJhSSL8rIoBT2kYdjUV3iEZNX0u36Eo
	k2cGGNHUDV6g9akBXD1Mv1C9N4JZ+c/LBCCZEKox9biPT09loGShobpETONDOBszhosks5xN0rE
	oej7QOo0mK6mD3eeZBXqI76/qx/1KtLIUMvALRFVtEz841qqSMrszxK5Ob++OVt0yNomnwkMX8o
	5LoqQbPTIKHhjcoI1pDWU36s5Q14nqYRsgTQARnzzkaXZjn7J8XYV47ViCc755IePHa5MlBgi2q
	QZTWjvDUFefzUDsChvu1dWLOHAQvolSettYhOCYGji7m8Zc8xPuVWbhNydaYoFlxc=
X-Google-Smtp-Source: AGHT+IFBK3F0/2RgdN/ZpBCzCmAP/zg/RkfAb+km8zi3yK6Guq4CtpKQC9B+fW+51Yj7xBIyBIQ59g==
X-Received: by 2002:a05:7022:6190:b0:119:e56b:9585 with SMTP id a92af1059eb24-121722ac504mr52295722c88.10.1767572814538;
        Sun, 04 Jan 2026 16:26:54 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:53 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH 04/17] wifi: mt76: mt7925: add NULL checks in MCU STA TLV functions
Date: Sun,  4 Jan 2026 16:26:25 -0800
Message-ID: <20260105002638.668723-5-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162655_587647_9858EDCC 
X-CRM114-Status: UNSURE (   9.63  )
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

Add NULL pointer checks for link_conf and mconf in:
- mt7925_mcu_sta_phy_tlv(): builds PHY capability TLV for station record
- mt7925_mcu_sta_rate_ctrl_tlv(): builds rate control TLV for station record

Both functions call mt792x_vif_to_bss_conf() and mt792x_vif_to_link()
which can return NULL during MLO link state transitions when the link
configuration in mac80211 is not yet synchronized with the driver's
link tracking.

Without these checks, the driver will crash with a NULL pointer
dereference when accessing link_conf->chanreq.oper or link_conf->basic_rates.

Found through static analysis (clang-tidy pattern matching for unchecked
return values from functions known to return NULL).

Reported-by: Zac Bowling <zac@zacbowling.com>
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index cf0fdea45cf7..d61a7fbda745 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1773,6 +1773,10 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_sta->link_id);
 	mconf = mt792x_vif_to_link(mvif, link_sta->link_id);
+
+	if (!link_conf || !mconf)
+		return;
+
 	chandef = mconf->mt76.ctx ? &mconf->mt76.ctx->def :
 				    &link_conf->chanreq.oper;
 
@@ -1851,6 +1855,10 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_sta->link_id);
 	mconf = mt792x_vif_to_link(mvif, link_sta->link_id);
+
+	if (!link_conf || !mconf)
+		return;
+
 	chandef = mconf->mt76.ctx ? &mconf->mt76.ctx->def :
 				    &link_conf->chanreq.oper;
 	band = chandef->chan->band;
-- 
2.51.0


