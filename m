Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46623C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skVQMSALO8vNJg9eTzKOXnpwu/ZZsTQZ4qhOnqD3fsY=; b=PL/kXskIEEoPoIVaG0OSLRGyeU
	csqt5FN7PWiAa9RkU6bS5+z/DCxtIAJs9YlWamAIJVBvgYtTWILeCHHRexrtilGZQSe2woLEd3WYH
	CiQPE9XH5LHlN7F110kdGcMWJdEYoeZBIqIpqmOOb0mN6H4Z2t51RZ09IQzTaDJJWrqafi5aaInFX
	7OIJ/JCM6ORNvL01xSsEfVd/R0E4Lhr8A15kddkNdKPdwKqECKFG+vgTdS0/lUQDQQjp6BR/3Hs9L
	9rgdnDfj0bHifYWiGd/Q/INI3vR6pXFn2aJKcxb8fYLxRb29fdHqfmf0Hw5u1eptcScCpLVG+N8YA
	lTLXDJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw90-0000000GsDG-0kVM;
	Sun, 27 Sep 2026 21:10:46 +0000
Received: from mail-qk2-f41.google.com ([74.125.230.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8x-0000000GsBS-3H4a
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:10:44 +0000
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfd70b08cso311984185a.2
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543442; x=1791148242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skVQMSALO8vNJg9eTzKOXnpwu/ZZsTQZ4qhOnqD3fsY=;
        b=jGHoikB8tENyJ8jFi+7Oj9enVwrQi5DVEQaBsDRPnE4DAXsmN4wG4E7NyFxQNq0qFw
         4Ck1KeUQZZUlDFrh/OoDbCRPn/0ApBsQY80ob1x1PBm+HTiK8OFP+Nw6qv+clMY2OC2o
         Gt2ErL4tD5/XajZv6aOp5fZIGlKxTDGAv0RLWj9OgFkyAR0GHbHAol5A1DGK57pIxEj7
         z8M6hsAXGFo3HibWgBSsLh/W9SEd1/CS+B/ddA6iD5XzZUcCUSwNFmYAX6xLd5j+8/Ic
         fw/yRsf4+D5h5ry0fmETmxA2TLe6qlrFE09P/+zNkQuwHnSPcy5pfNv53RET7ICWa6B9
         b7QA==
X-Forwarded-Encrypted: i=1; AKwUvBwTqpYNuSsIVgYfx8p2UnazXUK6NeY0sSsJ7h5vRwYSjnHMU7AMO+3cuejHAjYHyPKdBrn7r8vJqDscWOAttw==@lists.infradead.org
X-Gm-Message-State: AFuF++kvlYfi0qiLe2OTcw0UNntNlMrx40MALkBkeLBaox6w/GuVxi0W
	KNqKZK2JGNAnPJcwleJv9JtWFFnBKG6LLOr9puAVvoqGKafiXIddyDoR304bdn4p
X-Gm-Gg: AYBFou0Ja5LiO29ixAkIoF8PuXAaXcoGX7CjT9vf85pTukukBy7eoD5zEXk7x8zugk9
	uMSBL7a1WzpTXdvPrGQNwfVHL2yiDeN8cjHJGRImls97VztjFqcCkAPsJzBR2wFxAj9MyGNZHoQ
	t0Kaq64K07PtQDXxVFEjg6ua0N5Y8YU4T36l5qqh8VOE5KQVw2HEmuwjuJvJXzHlRVKVKEo22zq
	mvDyRJ9dH2qmsBmgVj9olKXB9VR79VPsUdBUkIaasMmiy3QW0Z3abM6A0NMvajDdwbb+vxSMp4c
	HNFZTKfOweHF5Zlbq/ZsvurBW+CJdOFLIvSlUHLmUeZBHjc6DjZz3OQ2YYZMjl0THO2iqMeIchS
	1E5ItT737wvbjU4AMVci9wP82SDCUeN0vCfE2VeGYyTCeAuTexxS9t4Vi/2Hifud0YlTuzMVsxU
	VqDTMEZxBrNU/cbeHNBUSyJTTF7YjBmcS8S8rmJpnRSFEDPMXObU+eu0AUcDowmEHvA5mZiDfjH
	eLnxCxveloiGHR5r8jdjqR4341+y8UnghtWTsciTZOIdPN56zuqzqFaekpaLRYpXT1UtA==
X-Received: by 2002:a05:690c:a607:b0:81e:abe2:9a3b with SMTP id 00721157ae682-8a86ca4e2a3mr15878547b3.10.1790543035150;
        Sun, 27 Sep 2026 14:03:55 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:53 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Chengwei Yu <chengwei.yu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 10/23] wifi: mt76: mt7925: install NAN BIP keys standalone in sta_key_tlv
Date: Sun, 27 Sep 2026 16:02:52 -0500
Message-ID: <20260927210306.737669-11-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141043_812979_FF0BDB27 
X-CRM114-Status: GOOD (  13.19  )
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

From: Chengwei Yu <chengwei.yu@mediatek.com>

mt7925_mcu_sta_key_tlv() packs a BIP_CMAC_128 key together with the CCMP
key that sta_key_conf cached from an earlier key installation on the same
link: cipher_id BIP_CMAC_128, key_len 32, the CCMP key in the first 16
bytes and the CMAC key in the second 16, indexed by the CCMP key's id.
That matches STA/AP mode, where the IGTK always follows the GTK on the
same WTBL.

A NAN interface has no such pairing. No CCMP key is ever installed on a
NAN or NAN_DATA interface WTBL, so sta_key_conf is still zeroed when a NAN
TX IGTK/BIGTK arrives: the command would carry 16 bytes of zeros as the
first half of the key material and key_id 0 instead of the real 4-7 key
index.

Restrict the combined-key path to non-NAN interfaces so that a NAN BIP key
takes the generic path instead and is installed standalone, with its own
keyidx and its own 16-byte key material.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 76dcbbffabfc..d494753cdf04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1378,7 +1378,15 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 		if (cipher == CONNAC3_CIPHER_NONE)
 			return -EOPNOTSUPP;
 
-		if (cipher == CONNAC3_CIPHER_BIP_CMAC_128) {
+		/* STA/AP mode installs the IGTK together with the CCMP GTK that
+		 * sta_key_conf cached earlier on the same link.  NAN has no such
+		 * pairing: no CCMP key is ever installed on a NAN interface WTBL,
+		 * so sta_key_conf would contribute a zero key and a stale key_id.
+		 * Install the NAN BIP key standalone via the generic path instead.
+		 */
+		if (cipher == CONNAC3_CIPHER_BIP_CMAC_128 &&
+		    vif->type != NL80211_IFTYPE_NAN &&
+		    vif->type != NL80211_IFTYPE_NAN_DATA) {
 			sec->cipher_id = CONNAC3_CIPHER_BIP_CMAC_128;
 			sec->key_id = sta_key_conf->keyidx;
 			sec->key_len = 32;
-- 
2.43.0


