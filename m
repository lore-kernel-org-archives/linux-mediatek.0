Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E175606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R0x/2FCO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bsLcNNgQGkV7kIB2Jc2TaqavrWinMHs83TVWzb59Ej0=; b=R0x/2FCO/vcCqV
	Tf+7RfHBAOcDvqB0IXJc6v5GslNDJED5j4oFmTDfKGBef4qC8/YFLlhPznsko44ZB9rFVjuRIu8GM
	qHYRKAGw/zMQuRCVRUzDwx+5YwgVWD4n0NA+9y23Fe3sqsLBGhrL4/opIcz23uXJnIBGpMF/VMdEL
	GuG7T+TQDct4312yOhoov1P3ZNyPFhpPwlnh6VYKrLIu8AeoQ5d+Hf5Wufcij9GSX2SHkfutEJePL
	6ZQ/7nJZm1Ukejv481W1fhWm+MIn9ASMHn1vJbo2aKhu6B+3kWvaqaP0Uvens7ciyQNc/YAEY5/Qa
	QVKghKP+Z+y7cHAPu2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yW-000000049Re-3L2p;
	Mon, 16 Nov 2026 23:19:00 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yU-000000049Qr-3vXW
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:00 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-86156cf8a7eso238132a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871138; x=1795475938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsLcNNgQGkV7kIB2Jc2TaqavrWinMHs83TVWzb59Ej0=;
        b=NmJFE5Shmt8ta+mM8NqiMhmaARQ2qLerNoaSf472JFa4uBv+JOA77HYco0gOuOAfwh
         qORXaNEGQ986sN4PaRb9t015v9YhgmudrOg+oqRKtnqa36Uc6yQqtcK9hreHYiBERSfc
         OzwgpG5G0k/if32gOoeUtDoJ0W3Ck/PI7dJXs2AFtiCZpxYVQjTdj+gjdtSL1gtNHLsk
         R6hPf8Wj+z5xMGHaX/Do6xKWyxBnE439jNl7bZxOgMgmymNMcPg5WEY/bq6ovM7fJNvD
         dAWnv3ZImP+0/qtEAPPvCJbqZjOF/nmj/sRzyiOAl2afMiilc2OswVjltM/phj0QxJr9
         Ov+A==
X-Forwarded-Encrypted: i=1; AL+hErG/lPj7OJcgP/VgLA1MVO/qjL48C5HDwu3Lyi8hJmJeEW9KJeJhzyqnwVpAhfKz55FeWDBhn25p0f0q1fgfvA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9VuswhJhzhqw3oEQJyYgYML9kRI9aEYYqgF2endJpFhIwTi5Ds
	4ktkXue2CLmlpGcYBkzp37vkn6vmX8fcEzF4HAZ0Y8ieyhPAtAw122dn
X-Gm-Gg: AYBFou12aWiVL1Tn3M7SkPTmTZ4iQYAIWr0Hue6JXNbesUfl9oVhkxdlTvtivRWBEni
	Fk+QYaXcLqKRS0qTmR31Kw5I25PgfVDq5IA7Ru4S9IvQDYcDWsRoSrq5y2xT/FiClkwM4E0InKU
	YA//iTEHiMPODjEbR/NLTJZk18FCZKzaf6fL0sjzJ5u3MuUbN3zF48Vn2lbSuV2SJmr+czNR/Lk
	4EkKSrbJvPRljDcKm3Ey2jl1BxUMln2Kc/D9XvvHFf76TpAT9an2freYwStru9usbjqY2ADpuzF
	Ewse2df0ckjfiolaqwfXXv5kg75I/NuUUrttd7EeI/C7XdhYSpq2BefwBZKkmB+DcLRp/FuOPPP
	rUSNfI2D7v8u2apzM04EB6Wcl/oTQmOvyLe6CbzcCrpTTMVDLv5sy6QAnvSBeJDNETID60sXiwO
	zfU4RfGPev0ZD5n/ifITHyt0Udvzk3RjEH0VUZ7huqY3kz2t+Dfz48rHYHlrWRlkMhKRDjrstAN
	7OzTPiegnq5uGqi3SqhhxELbcflgakF8lVVKEGhUKEw8h2GzVK4huy2+zs/SqgRNkY2UK2hCyNS
	fJ6Ifi2D699tpePjvV8tQdF3x3uJl0MsWc7bdXgNTLVn9FDesBFF00iZNaY2eTLtoNKK5+hT+nq
	3Mz6aXria
X-Received: by 2002:a05:6808:c123:b0:55b:fc1e:bcdd with SMTP id 5614622812f47-575db6543c9mr836957b6e.14.1794871137929;
        Mon, 16 Nov 2026 15:18:57 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:56 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 05/19] wifi: mt76: mt7925: install NAN BIP keys standalone in sta_key_tlv
Date: Mon, 16 Nov 2026 17:16:16 -0600
Message-ID: <20261116231630.1733906-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151858_982115_05BDC1AF 
X-CRM114-Status: GOOD (  13.20  )
X-Spam-Score: -0.4 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index c800ec2f25dc..a902fdd441cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1458,7 +1458,15 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
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


