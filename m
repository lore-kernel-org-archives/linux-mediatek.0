Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D18FC6162
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 20:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJB8TW11tb7vqsvvuXY9YlttNtwZmLNOXyK32XgfdCE=; b=IsgRUkStXof0ssvA6+fgA4pHza
	ItkpG+M82M1wJYitUiWg+AMXv93KfC2vzG+da5Tv4zb6ntmNWckgFfXzj6MI25yGF3vuqeHN3bMgQ
	Xey8ijSNaiQQEQAYr2v5xIqngY+5EsbRgnSG1NE9eBnqADYojsfDBzwdJW8zKaA8TW2sP5FKx2PqX
	MbfGg4xhDmCW84jq9RfnkUO4XA4CvW8PHzZTBAKxyoUfH8FniEJ4/6rs4oJZMwnNa3NgOfa2UAZiY
	C+W55wXE3lfBZkXo91Efh58gOY1KEXnrxfxeHP/bC2rTs6yEtOrsZTH28dhcOq/5U5x920Y7KdPYP
	R/AjQjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMp-00000008ggc-3lcb;
	Fri, 02 Jan 2026 20:03:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMl-00000008geu-3KLh
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 20:03:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a1022dda33so100384595ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 12:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767384199; x=1767988999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJB8TW11tb7vqsvvuXY9YlttNtwZmLNOXyK32XgfdCE=;
        b=aLWicx2vIwnVQZFCKyhO5H1/ovmNQxQl796iqpWRhvh3fNkrnTZn5E6Cp/x91Epf/M
         NmKpQbEK7urcFrClZlQtQ/sFTfeB9EWuiyI7qyjvtF3f317rWRJzmWRpWyWjFSP5xCAk
         KySrnm0xfm6VBpzx1eImN5JWKnouPi5tYvZAmyH8w/At0i7PEQPiAYzftGivke6Iz/lF
         nPBdPA3Q8Rw/V+JRFiTaDhqwSPeoT4dTDhBwNgLsk9OEk6OJZp+dKOjF36xYNfOA5EI5
         Y/WS0vn61q0o+3rMJiea9M0hBb9jeKfVZjoBRh7r5CLcfsC/h/n+FIUFmNdCd17qiK6M
         zmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767384199; x=1767988999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJB8TW11tb7vqsvvuXY9YlttNtwZmLNOXyK32XgfdCE=;
        b=waBucEVUNAVFORVN3XEJIMHmce5ovTZvR/3pfLRhXssxbxawvhDq5p8QweoyeIBmE1
         XKPhjW8D0K634+lROLKfq9kqBgZu2D65unK5RUZqc1u3goH2mAeiFqTsjaMsuDLer0nX
         qfegxbb0RpqsRTfYmBBGXNsfL6F1yvu5j2M1A7n1W8AflLexryUE+XJ1wV+Sg6rzUOCY
         GOtyzLhx1ewbrA2JA3GEZlN3576F4zoprO4+FOVUiP1rreHv6CRwqaqygGM9OLUNDhJl
         UiOfLDkeTlwlifjgR/9XRVZhUbcQKZg3jN8RUiGlWe8u1KKBKrJyBVihUh4I9Z/Vyqqm
         UqQA==
X-Forwarded-Encrypted: i=1; AJvYcCUX006vlSUS0UStQfdvZ/R4wlollU8oSJxHREb9ukUXgyJ9OOOu7Xw7/25CgGs6X0eDXGd9EZLJRZhIScsPOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx/YRuiaPpnUAOaXILcHlL/imV+zaLgj26MAXOwRReJHrrtWh6
	o2p1IkP1hbHiRRldWpT/Ay8t0IuBPq3F//KTl/jBvJXu9ma1B1RxvccG
X-Gm-Gg: AY/fxX6d+8y7ztkkYDc8DdE3PrZhm6lJcJ+oDT0F9rdvug1KcOjI2M7t9i9rc5sLmO5
	x8ZGtmfBphS3CLrhEL4WBzXp5X7ap3w1+mgMPF5tdyTaRQNY0N7Nbvdjj0qRz5JwUQ93Z77XYUk
	8Yf7bn4Nl2PO+y7FFeLzjGnYysI3fizmeK55jifbrtfHPuEJh0l0+Raw2wytcXyulJQTtBc/MGN
	dhU/lrpNEKFsaLnXX87kELAqT+kK0uFoCm/slC1KaeUFrxu3dYl8Wa/QmJjHkJ4ADkWqf86zlwU
	g5/+Lf5k/9ELpYAaArA2iyQtW9Aw1hFWL1WqJu17Ek9SUuYLmJg3KE5Y8qkLvhnFX1IMWbgonPo
	YLpHIzheMxyhREecS+WSBANWb3ZO8udG5EGuh2I8IfnTj5pxEXggFIdQSiMLK7HjwxEyJxs6Vgu
	5uOklCyVCnO48ci/rWGwfEid9Fq0OawlJwKRqkD/+HtAzMNN0/uz2DTDrtj2tL/cRzpHyhjKCF0
	w==
X-Google-Smtp-Source: AGHT+IHLa5NwfXi5dnqqkLy7rzURooInQ8xuzAG/o59NC1Gor95N1PBHwsWeLY58bDJyMi9BmZDSsA==
X-Received: by 2002:a05:7022:42a7:b0:121:a060:6d80 with SMTP id a92af1059eb24-121a06075f9mr28800733c88.25.1767384198678;
        Fri, 02 Jan 2026 12:03:18 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm120203795c88.10.2026.01.02.12.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:03:17 -0800 (PST)
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
Subject: [PATCH] wifi: mt76: mt7925: fix key removal failure during MLO roaming
Date: Fri,  2 Jan 2026 12:03:10 -0800
Message-ID: <20260102200315.290015-2-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102200315.290015-1-zbowling@gmail.com>
References: <20260101062543.186499-1-zbowling@gmail.com>
 <20260102200315.290015-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_120319_833704_5DA1A0E2 
X-CRM114-Status: GOOD (  13.55  )
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

During MLO roaming, mac80211 may request key removal after the link state
has already been torn down. The current code returns -EINVAL when
link_conf, mconf, or mlink is NULL, causing 'failed to remove key from
hardware (-22)' errors in the kernel log.

This is a race condition where:
1. MLO link teardown begins, cleaning up driver state
2. mac80211 requests group key removal for the old link
3. mt792x_vif_to_bss_conf() or related functions return NULL
4. Driver returns -EINVAL, confusing upper layers

The fix: When removing a key (cmd != SET_KEY), if the link state is
already gone, return success (0) instead of error. The key is effectively
removed when the link was torn down.

This prevents the following errors during roaming:
  wlp192s0: failed to remove key (1, ff:ff:ff:ff:ff:ff) from hardware (-22)
  wlp192s0: failed to remove key (4, ff:ff:ff:ff:ff:ff) from hardware (-22)

And the associated wpa_supplicant warnings:
  nl80211: kernel reports: link ID must for MLO group key

Reported-by: Zac Bowling <zac@zacbowling.com>
Tested-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 13156333431d..11c0197c7426 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -597,8 +597,15 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	mconf = mt792x_vif_to_link(mvif, link_id);
 	mlink = mt792x_sta_to_link(msta, link_id);
 
-	if (!link_conf || !mconf || !mlink)
+	if (!link_conf || !mconf || !mlink) {
+		/* During MLO roaming, link state may be torn down before
+		 * mac80211 requests key removal. If removing a key and
+		 * the link is already gone, consider it successfully removed.
+		 */
+		if (cmd != SET_KEY)
+			return 0;
 		return -EINVAL;
+	}
 
 	wcid = &mlink->wcid;
 	wcid_keyidx = &wcid->hw_key_idx;
-- 
2.51.0


