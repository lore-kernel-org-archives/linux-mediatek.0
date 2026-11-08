Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C88606A32A
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EyEvvyut;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xvhFZuG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AbPgMV5JpZj9v253RKm3XzmKplDOYUSJil3USPkP+2k=; b=EyEvvyutxEYbW6
	fiNjlMkbCKdwlEIlWjEmie20ql94VPSxzIgbQE30Mm+5arRS0tdBYqxq3tuV6nIltZvxc93SmFpLA
	X7jrlh0Xo+xCkjEE3zDvQk4IIrjDKiu6J0RiD93SUwCNtOLEy5zFqb96znDIlQU/KCoZ3yRFNRDV6
	/5FAz0vHQ2qXccn9hdIetsyaqdoCtvJKmgOBgvLPRf9lLs1lVvXVXaw1UcOG9FEw5nL6K2NFGubv3
	YLCTLjt0cQNj6ep/E4yDk5j2Xt7EYfX40r4OCk40pHLgoCQS7j6HgZxaBHqfliTxxv7mk1xkin7jI
	6LzYgOdUQST3FhH0vhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxBk-0000000FmPJ-2WoF;
	Sun, 08 Nov 2026 07:19:40 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxBh-0000000FmOz-3ofZ
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 07:19:39 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1055438eec.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 23:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122377; x=1794727177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbPgMV5JpZj9v253RKm3XzmKplDOYUSJil3USPkP+2k=;
        b=0xvhFZuGUXIeqZN1395Aqzl/WUdO0azrZ7V1n2lnvU9o9VTQg2pgYdgHnbg3YATzt3
         UIHtdic+IPX8QV2Ldd8kVFTL24C6rtKlMLeEYf6E1XniBSNx4FF4yhCzcTbJt+ULqyE8
         luxArUfDu2yovehIBwqPsB+rjUeGxGe3bKJyIRK2BfWDX2wyzyYy+v8NvdVDnGI+vX5G
         Im6fcKCYfJKTefaPBfPGT3xsS22FZBEVXIkDFfoQU4HAidgcwan07k/9avlIlmiAUPz+
         BrI5gyFQYRnr0C+32AsrjVYupfWj/WAIZThrG6vxp0MnpCt2SKG46ZlR9+ZZsqnkUz+M
         UXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122377; x=1794727177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbPgMV5JpZj9v253RKm3XzmKplDOYUSJil3USPkP+2k=;
        b=TkA7L03Q0/jYDryUW7zhu6Vd0vjRtvN4TBh6bRq/DtPdvAgEp6Km6R0+hcY95OelaR
         0FPW0QrNpkdRat2RqFQggCYo4zpoZt7SlTkts9Pkicllc4/8GeTl7YtoRs7gX5bFdSyk
         R/CeSvVFqK6An35YYw9AK58RVTKUoswa75gWh2qQu2li8MyfE60UA0m7WxZm0fP5xx8z
         STUjuemw1p5xgQMJMEx+DxcUMz9vQNkih3pSn1Dwc0XqEwL2HAaQ4rI7nrCB/nmqWCsF
         3HcQI8+ZQKxpdHdBusaYnxvjmvMWQ2alTQyMqtv80Ww+0A8ahwBAwgNq0y8lqmsDaG4m
         AwLg==
X-Forwarded-Encrypted: i=1; AL+hErGOQBKA1IGz3mhA4vuCwPc66IICDAF75ne+M+uZ6asFpkWKgS+L7ig3DYP2HGUMM6KaeBpQ0pPvPreKl64VuA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+dYpQNxiG1RQ33cVFtnM1oOortFOwQ1ZlG9lblG+KuLUglnkbs
	3DUwNCGc4fvQbPMsRn/oRDfkpt+EriqM3xo7LwRy9Fb3iYIk/5x1JExjs1Fpc5aqfU8=
X-Gm-Gg: AYBFou2SUzFkN9JYoY3fdcd4FG//Ml8KZNyvvf02dtJUz0urf0DzYvzZ5gs0GOXWTwZ
	RFlWaJVJW7bE6uYsQHMqkqN6nFT8goXzoYA/BWJd+2NwZih5I/eGAfoxVE4f0mjAHtL1UH9bsRR
	8fXrqTBzynxVUUnyBH+Doqxrkrw7smeHrDECqawTxlwB58uMGssPGTbw+waYwy+VElHcfL40QZX
	BdqQ40dCoh+Rl28OQNc/7ya9mCxqTHXRIkCQQKO3LbeuMobBSL2DUWpFMpVzFEefJRQ+9XIoQy/
	JdE2zvwO6GZPyWm5gQaGtgB4BxO3eSqExs6U2bmQtBj/uquRjptOuyAQtZGuGmI+drNKxeVHf4N
	y5xK2lEtlUkZSCI4Dn4nthcAhXhhBvMMlsbUc1Tc92IiSvbg4HDHPxBv0pqWxbSkJnDXXA7GsnV
	X/MAyM9+W71GrEk/tExR9NhX31gUl8W6AWLPmghhCKDPB2lRrk7umPTt+3AZIQYDPwwlYFYBq4w
	X4xUscZZyZpRa+3XccFx3WHD6h7FqcIHtgymAfEUH86uZli4xiFFM32/lgeAj66eUVy/PP4MYke
	v4awWupMmh24T2vbLDJZdkEhFjO+5WJIUtcpMN1YI2CqtA==
X-Received: by 2002:a05:7022:3b87:b0:165:aced:1fde with SMTP id a92af1059eb24-1b39fdad047mr1551818c88.0.1794122376963;
        Sat, 07 Nov 2026 23:19:36 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:36 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 1/4] wifi: mt7601u: fix out-of-bounds access in rate index
Date: Sun,  8 Nov 2026 12:47:43 +0530
Message-ID: <20261108071820.35303-2-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_231937_969208_31AAF6C3 
X-CRM114-Status: GOOD (  13.25  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The rate->idx value can occasionally exceed the supported band's
bitrates array length, leading to a memory out-of-bounds access.
Add a bounds check to safely fall back to CCK rates if the index
is invalid.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/mac.c | 32 +++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mac.c b/drivers/net/wireless/mediatek/mt7601u/mac.c
index ca9cf628eb10d..bf485dabca745 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mac.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mac.c
@@ -118,19 +118,27 @@ u16 mt76_mac_tx_rate_val(struct mt7601u_dev *dev,
 		if (rate->flags & IEEE80211_TX_RC_40_MHZ_WIDTH)
 			bw = 1;
 	} else {
-		const struct ieee80211_rate *r;
-		int band = dev->chandef.chan->band;
-		u16 val;
-
-		r = &dev->hw->wiphy->bands[band]->bitrates[rate->idx];
-		if (rate->flags & IEEE80211_TX_RC_USE_SHORT_PREAMBLE)
-			val = r->hw_value_short;
-		else
-			val = r->hw_value;
 
-		phy = val >> 8;
-		rate_idx = val & 0xff;
-		bw = 0;
+		int band = dev->chandef.chan->band;
+		struct ieee80211_supported_band *sband =
+			dev->hw->wiphy->bands[band];
+
+		if (rate->idx < 0 || rate->idx >= sband->n_bitrates) {
+			phy = MT_PHY_TYPE_CCK;
+			rate_idx = 0;
+		} else {
+			const struct ieee80211_rate *r =
+				&sband->bitrates[rate->idx];
+			u16 val;
+
+			if (rate->flags & IEEE80211_TX_RC_USE_SHORT_PREAMBLE)
+				val = r->hw_value_short;
+			else
+				val = r->hw_value;
+
+			phy = val >> 8;
+			rate_idx = val & 0xff;
+		}
 	}
 
 	rateval = FIELD_PREP(MT_RXWI_RATE_MCS, rate_idx);
-- 
2.56.0


