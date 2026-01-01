Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8434EE9410C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXw0KS+mtzlW4R/yAZNXORVMUv1IZas0tr5wRPVkUCk=; b=0sYY74CBVeBmquBZru1goVxwBp
	J1wNskSkoY3bvCSYRidU9rWOgnhhWLBplh7tanXKkZhI+VzKELUKQOWDua/u7vQEITMCSqpClJtc7
	K7tR5ZjIt5bkfjMW3C8YM2nyvrMiR3Zx4Yggq8dlAWWpQ6IgxuAkcHChQ6ea5TqAtVAEt1PLidoJP
	UDe4hJNS3H0u+ni4CnEml9Mermn9UQWTi4ghgvYbpTqkkrr2KQAzUCLAV/6ZpJ5fPnqBlOfgNQzBp
	VLf6eg1dIQhjvVLz3HGH0AuRNU1gHop6aAmVS8oNECSwUx68FCBRKqyjK28uDT3TDqythc2/wjye5
	/uYUtiQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC86-00000006e26-1sKm;
	Thu, 01 Jan 2026 06:25:51 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC81-00000006e17-3D4e
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 06:25:48 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso6405775a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 22:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767248745; x=1767853545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXw0KS+mtzlW4R/yAZNXORVMUv1IZas0tr5wRPVkUCk=;
        b=YtxiRQVVPPKGuRr3Nr41MmQQ3PEZ5dcxXjsFxUVh7iQZHKxWy4cg4thD0uYk41/ldY
         OaMbzgfydk4H60N+pgdOoz0tph2UCiyrz64GhNRvcY1jQS29ZLK9hAai8c8O3HlmXfDQ
         SGaP3V3UI+9zdZanj/rf/t4zGbO8dMeVVe9/ad2I7/L//2wMQt6tmtPclhrRwYvOxDcj
         3sLtfyKUpGgYIMYDqZypfQRfbLCLyJt6YbrsIz7tmmu7SLapTs7hIPSacXW3ZCPjbPL8
         DSMMsRM5uXhdjodaKOaJVlLv5xY5iakADLEYoIuv6JTnx2gc5TF/lwh4s1EySWvozJfI
         VbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767248745; x=1767853545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PXw0KS+mtzlW4R/yAZNXORVMUv1IZas0tr5wRPVkUCk=;
        b=irzZASFRyhnuxIoTlzUs1eeVMLIstEi2Z8UJyRxhekquc0AVY2xqm4Os4RxjHoJ+HR
         8TAkpBI6fMwl2M1jwUNyNi9q5ArfjTCiJ8i6fnEXwp7jDya5SMoBzb/KNpZ566AsB92Y
         UT7JlNgBJQlGnzlPyPKyh4wgxfxclMXUZ8ly4O1KkPZ6cDMdGZ1b+/RZBf36UmFOXDtk
         KE7EtZ4Vil3MFPXqnvO6Jna8RqwTRrzQRonWspuedk3VUMTHsowVb5nRckHvx0kKVNO5
         i8Kak/8NZoCZVUcAhssLJkJbmzRAmeP0fugnCU9CiXmvO5uARb7IlUu1N7pZq+hLTToa
         gDxw==
X-Gm-Message-State: AOJu0Yx7uO7YQomJj2z50145+lWeEPJEpPsowdfRgGzmXXFaONmEItT1
	HnVe8C0b/PXF4iBWVFt/0wnbxYNQO4KwrVcD/K080rKMlR9DoXSDja4b
X-Gm-Gg: AY/fxX6XR0GJermVQ9xiqhgECUvIl/Xe5AIzye6dYe1axC4V2JpujJR7g1FUL/LGeCR
	QSiqyhPKNJvnqSXxWIHjDf95Ea7vw0DG+Vyi/WD5I6FPCVCn6pkK9y5+Cv2wFamPa92uUaCbVoM
	lsWS6BhpVwkIVAV4VSJDrFkQZakjU/ks7lQwf5/z74CLrnNp2qTmJ6qxeokQ7o1ZXVaFw8448X9
	vn9ePjag1RMbyqIt3BbwomOzPu3ZhPQ1PPtXa1T3Y1+L0K0tQOiF4YZqdEOzQ2vhONWpFsn7VoA
	RvaSOJSV973NDHN5D/yV47BulA5xF4vYewXUV1fGSWCBm/9K0Hh72xaIomb4v5iWwvdFDNECsr+
	wyyKUypMRmQxjK2zKkXeBK0EhCMx2ugaSwH7ly95nMgO6/NZzO7cQFGnSXTiiATFq+7L/ZWvnm9
	j3ZnGbpmkoWyFZ1kXrd4yiuryA/nYEcYDqFSLvJTdxUpB5Xk5Krfuomadfaqgqxw==
X-Google-Smtp-Source: AGHT+IE1qOMp6eNFeyruma+P5Tn6KvSSX3KbEJeZqgXymgEx/iCWBkP2LmFHmJWNFi+DprjfluX8jw==
X-Received: by 2002:a05:7301:1a12:b0:2a4:3593:ddd6 with SMTP id 5a478bee46e88-2b05ebb6038mr27901457eec.3.1767248744793;
        Wed, 31 Dec 2025 22:25:44 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm103120199eec.2.2025.12.31.22.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 22:25:44 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	ryder.lee@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: add lockdep assertions for mutex verification
Date: Wed, 31 Dec 2025 22:25:43 -0800
Message-ID: <20260101062543.186499-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
References: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_222545_808791_AF8BA7BC 
X-CRM114-Status: UNSURE (   8.96  )
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

From: Zac Bowling <zac@zacbowling.com>

Add lockdep_assert_held() calls to critical MCU functions to help catch
mutex violations during development and debugging. This follows the
pattern used in other mt76 drivers (mt7996, mt7915, mt7615).

Functions with new assertions:
- mt7925_mcu_add_bss_info(): Core BSS configuration MCU command
- mt7925_mcu_sta_update(): Station record update MCU command
- mt7925_mcu_uni_bss_ps(): Power save state MCU command

These functions modify firmware state and must be called with the
device mutex held to prevent race conditions.

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d61a7fbda745..958ff9da9f01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1527,6 +1527,8 @@ int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev,
 		},
 	};
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	if (link_conf->vif->type != NL80211_IFTYPE_STATION)
 		return -EOPNOTSUPP;
 
@@ -2037,6 +2039,8 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	struct mt792x_sta *msta;
 	struct mt792x_link_sta *mlink;
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
@@ -2843,6 +2847,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	struct mt792x_link_sta *mlink_bc;
 	struct sk_buff *skb;
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
 					 MT7925_BSS_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
-- 
2.51.0


