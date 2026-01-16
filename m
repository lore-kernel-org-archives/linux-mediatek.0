Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285D9D47CA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyvHxTD9jYvJ1aFDphS8iH5fAIcPW7RDWbIxYHLNdZg=; b=mgLVsCfF8UFtNgbISU/r6ImQ2H
	OO8W66mLZMrP2jbV88Rzxl5+ij1UZTQBbXD7uRb+wbbaJPOTCZSwcL9MqBrXXemAN013w50QsJUry
	RC33/O3SAXTRzbiR80ODyoivm1zMHA6blF7jGKYDi3G5ZsG/I0lh4dcD7CZ2bj3Ie+QjNTHbrKcD0
	B0OByDE6YQNilthH9Ijo2yBVdJFIu/qLz++WcONxFsIHdkYodIpojNUgXi8ikn5ESv78IPPETLzsL
	xIyEVL/Kwyopy2guQkAFCMlmtW1fmV0YRHr8s6aCojnFClBIw+NofqkbjcfHptp2ZHd/7SGgQROE7
	iZeIlYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHV-0000000DOVN-0R3p;
	Fri, 16 Jan 2026 01:05:41 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHL-0000000DOQK-3TV4
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:33 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b6ae4c2012so847258eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525531; x=1769130331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyvHxTD9jYvJ1aFDphS8iH5fAIcPW7RDWbIxYHLNdZg=;
        b=SqsdSszuDr1tALs4mMZDWqaHZrQgd8eg8ueTr3gvZGPEoqWJu37ir5Ht886CSySGIK
         W4K9QOWoQXooVZfj5QM0jLEnDw7xgD1eCSh06kYZla+eFyAgoACcSHGQfUGNnUk+x/dx
         HhkQCjn2r6stxx1T4mOE8W2x13q2/CBXfz0TTSK+EAR9eI6mnl2WqCKPq6Dk2sSd9MGf
         WOUWqKpuQvHzM8nv7QlGmcoTEKUTcat8NNgw3vC/jJYRY11QYrDcAXHb3C01gn0RnxKn
         taZTWcZefjCpCkN8saTVp8D0PcRM/U4WN3Oklgmd3j/26r/CV9dpO2PYiV7PCOAanwPW
         sjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525531; x=1769130331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FyvHxTD9jYvJ1aFDphS8iH5fAIcPW7RDWbIxYHLNdZg=;
        b=SEzKZb0V3p3X2rKu1Y1BqZxIddRrPBH4YaPp05JP5M4SJGzyVZISog8/0gg4/O9i19
         wxNKRFNHnzQKTbJoYc5RU/IA/Ewgtorn1u8t07kZmv72Ft4ik32kwAdOjSFrB88KQs6S
         bxZ6KyyMVH434XM7FRWHBJY9GceBmaanGpZ/HH7YQ1Nz0tEksVZZduK3Eq0r9mMXH8lV
         ZnuMTLFB0up2bAs1blOaxLFaboHhyDffXfL0oEMQwqeI/5CB7FHrexIkMsSgq6Ng5fr2
         Ohz2nGi3WYzbYkV8lYvX0YIK4IbDJHVpXtopTFfUaGpkhVfQsMWJTTr0DCJYGQdxO3Ob
         L62Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDZTB5KdJyKS/iemA0o05R69sQ6Z+AKGNJTpoWosnZbln/c2Lido4qCBIFX/vz4Ydk+K9tNTu/dZE6cUNdug==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUDmSS6uwFKaRwB3cNUSCoZl8i3heKe/Nhj/KqfzMOAFtrTnoJ
	zl+U5d97jHYpar9U6yhbF1Hou8ne7W/HEjn+EdbnwsvnOc9xdfWyRbU+
X-Gm-Gg: AY/fxX6c1LETlJeJA4tauh7ptRX/WaSALFmZJZ20D2PxBtihEE2xNeYy8vPX3/6GigU
	ll19BwvsMdAWugln+5Br8AoDG5tT3sPTFd59qdQyB8NJl3uDOFjKcb01o6zlr3z6dL3VeLSNupV
	zMKrpHHoovz+saa1/+mWR/AVCBD9i2tAFp0Qq6LUln4gJgdhewCh0gxKK2g0ZoKSV6Se8CD6ARE
	9XKe2b8C33MBmr4+q2pwXFhnpMWYR1qK7Ic2FkFupQApK1w+eJg4vwwXAw5R0agmqd6G3F37TTN
	SoVY7Gdhn8lzOAwwtv/EUxJTBqlnX1R7FtdIQEEy9viLlfFKmoAUazgQClC9l7zDnGbMxCZ5r8d
	x6/hR0Kc5cNSOq/56BrN7h4qYgacasBvBnXtTiS6MfmV1QVG7H1ykvT2ULnpWlqYBORkRej9uzM
	Zy1L2jTVsV+sKatq1XYo24vTbmXSG4Cm9m71vcx1vTrjISRxOoe26K0RPY0A0/qg==
X-Received: by 2002:a05:7301:3f07:b0:2ae:60f7:7f42 with SMTP id 5a478bee46e88-2b6b3f05f0fmr774432eec.11.1768525529188;
        Thu, 15 Jan 2026 17:05:29 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:28 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 04/21] wifi: mt76: mt7925: add NULL checks in MCU STA TLV functions
Date: Thu, 15 Jan 2026 17:05:02 -0800
Message-ID: <20260116010519.37001-5-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170532_692006_010396B6 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Zac Bowling <zbowling@gmail.com>

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
index cf0fdea45c..d61a7fbda7 100644
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
2.52.0


