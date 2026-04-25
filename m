Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2264FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CVP2NI4wEGcr08f75y7514rRrWBedST0NWFV3z/OKM=; b=FXcZHDT3h5jIw4VvbK0hj/s9kC
	VC5IKLZNR5JIYEsgwvn2zeQXY/npdXLtnN1Eaboj0prZ8OcFgZZrhbPWH7glEURmeQMYmcJQPP8rp
	KhX1gk7hisubANjSzxgYnyRYjR2MVJ45XqzjI+Q/nr3jDouulhbIQ/hdkElOJW/ZBeyy7ay0xwq11
	m8JtINrZWjO6llQGZ9FnReOrpST9uX6LvSr8zhqfkrK0Fyz2iD4qOQQmviozl5ZlqmYkW/Ganqjri
	VJLtBrbVHsXbym1wsRaqND96uy4EIN6j7TCDLaB4BykSntwHfIGKy0jmA8cE/k5W+v3CXHJx9V8Zq
	87Lo+X3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1w-0000000EmHj-46MR;
	Sat, 25 Apr 2026 19:51:08 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1u-0000000EmGp-0auQ
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:07 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dcdd1b492eso4789881a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146665; x=1777751465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0CVP2NI4wEGcr08f75y7514rRrWBedST0NWFV3z/OKM=;
        b=gdsktbv5y/tgX0H/y53N3gak1Hd5lg8dL1VXaxx1KTCAUh4pd3cphMUG9cnp7N6CyH
         sUDaTtN17ouqrvsXh5ok5JwED8Gye5t5tOErDSwuoNcQIO7XLw8zD07XnOEaOZORCoBa
         9HgHpNBX1CMWKmvC9ywZ9yzXpz0kUCfZLruK1hyiY0FeyrBotqx81GlUlzD7gEcJxUEv
         BeL9pTMIi+OSQ07p4W1fChvOOUJcuJN/FvJfivqqy9XwbiPcZQjDvr2xlRl/wS4TQCKj
         T/IuU3XKzYYh8MP2G1DX8RucISFJMkjPf02/ZwTkAMTEE1SBSfJwaaWb18ENWMLyG4X5
         iDaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/v5DheZHq0ThEHvlhvsnhr4sySxrjnR89G5CwTsJyoTbWGw8b7HDX3R39T72jtW4vQLZ0HnAoeuaL3Xu8g5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMKCS8+labZ1CCrnNycxEPRJgIpNaVlGZQLRpMMz49ZuD6nPct
	/4w9ATI2seyfasb/ZG6t2/hvj9CdcY5NIzla0hTFoi3ItsXpVxPObAuU
X-Gm-Gg: AeBDietTCfRfJGH5AdeIK01sAfQWpnAsXSx+QjU0/hfljITIlR1ALnfZ81b6Px1OhFo
	YBAraNvHbXOzdqDHgnLI97GHtGFcGF100HOqFYChnK/E0rtjODJweMlcBaPO50sYxKEfKm9FD7C
	0efKU4FFsdInCRUpP1g5yW4fryzfbgUks06sZZt9F1XR003zWYE1mXxxMPawkMIQzx/3cBUdtUW
	ahNwrnSfYX/YuoM3Yn/B1Rq99PP3Z36YBi6sDNS8y00SKE4jBtUq8l/JEkY39C0NzIPblZHzLUJ
	1Tw776A9THQ9ErIVpR5PhUGoZeOIqlPL71U1Is8AFknen1RhsImJBxWzzvClcWFRz+a14eM9Zr9
	6rej+xCE9WVEF0WaBHyWpWHhvuJA+6IDYUsnS5Ab1l7FTU6BTN+2qOUDsIg+bQ59YstuCHsVRhR
	nasn16AY8zyywr/LUPL7IPOnfJ+lFlBbYY/q+dvNPk614Okw/T3sTIMvtvhszcRjyCcZrtrZ2Zx
	Q==
X-Received: by 2002:a05:6830:2782:b0:7d7:dcbb:280b with SMTP id 46e09a7af769-7dc954b47ebmr19354311a34.1.1777146665303;
        Sat, 25 Apr 2026 12:51:05 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:03 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	Cristian-Florin Radoi <radoi.chris@gmail.com>,
	George Salukvadze <giosal90@gmail.com>,
	Evgeny Kapusta <3193631@gmail.com>,
	Samu Toljamo <samu.toljamo@gmail.com>,
	Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
	Chapuis Dario <chapuisdario4@gmail.com>,
	=?UTF-8?q?Thibaut=20Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 06/21] wifi: mt76: mt7925: add MT7927 chip ID helpers
Date: Sat, 25 Apr 2026 14:49:56 -0500
Message-ID: <20260425195011.790265-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125106_184612_6F5ACD39 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Javier Tia <floss@jetm.me>

The MediaTek MT7927 (Filogic 380) combo chip uses MT7927 WiFi silicon
that is architecturally compatible with MT7925. Extend is_mt7925() to
match chip ID 0x7927, and add is_mt7927() for code paths that need
MT7927-specific handling.

Also add 0x7927 to is_mt76_fw_txp() to match MT7925's TXP format.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 802cb26ed6e3..45479cc29134 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -174,7 +174,12 @@ extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
 
 static inline bool is_mt7925(struct mt76_dev *dev)
 {
-	return mt76_chip(dev) == 0x7925;
+	return mt76_chip(dev) == 0x7925 || mt76_chip(dev) == 0x7927;
+}
+
+static inline bool is_mt7927(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7927;
 }
 
 static inline bool is_320mhz_supported(struct mt76_dev *dev)
@@ -284,6 +289,7 @@ static inline bool is_mt76_fw_txp(struct mt76_dev *dev)
 	case 0x7922:
 	case 0x7902:
 	case 0x7925:
+	case 0x7927:
 	case 0x7663:
 	case 0x7622:
 		return false;
-- 
2.43.0


