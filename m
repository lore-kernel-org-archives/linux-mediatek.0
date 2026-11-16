Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C95606A887
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x4fxr65q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rHLutSlyk92/tZTdye7/3Pucv9rgQaVGVJYULoTD0E4=; b=x4fxr65q/3unS4
	Vft9VJCqkDgtp+BW+f8T5GUI2426jQZZeUuONlqRfGz7yThdsUr0op0ujhHg5cl1zc3mQgLhqA+Ws
	uvauRj6XMPvMklFuoxlWzMbVQnaQ+f6RaMXBF97LwyDaX6A5Y8RFEWZG7UUCdoEb0CK59Ya8R5t9X
	/Cyxm+m+Q+sv4/LUsuvXTLzPSIt1r9gO8BKZFjd87eyuc87htwqejm24PET3zZoHUAPZk2h6Oi8Rf
	DMPe5xPAe5ovQxh9m2cCzy+b5qKXIs2STtJNwkQHZh6lgFjC2ucagEjLIMxNbIGrwYGALdNCrx65L
	9FUfaw/VGbIvyzBbQ0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5z5-000000049di-0P0a;
	Mon, 16 Nov 2026 23:19:35 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5z0-000000049bP-1JrA
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:31 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-5722bc8ddc5so668430b6e.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871169; x=1795475969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHLutSlyk92/tZTdye7/3Pucv9rgQaVGVJYULoTD0E4=;
        b=zRcSBDPerC7WmbXYEfdorplMYt+kARZVssWTbvxkN9AOXsUNBY372JKsqlzCHG1CA1
         8mqjjKj386d4fdWU4Od4NT2uNdpSsbiKYH4VcvhglAR8MCAigBBvvRRm0nXiRlCUaqos
         iRJsLn7jiFmYYiyiEp4CobuYlgASTkQdLg84x1kT2zDPx2WxCNL3INazfM7AqtpOGSOH
         9hJtd01Cf5CfYhnFZOBXYFtY6sIDqwks68eZJQDSElDCm2qIaCB9hBOcKXdb6azaDwjj
         sbXMkIl/B8ig919h5pBBpSQce0Ujmw6NqCLDOZVJ5po5dNOgKGgZwOeyMQ3wx7wwgLiK
         BEQA==
X-Forwarded-Encrypted: i=1; AL+hErGszQkcwxK0yucghcFu5tZCOlebTBfQljsHMG/taUzyoPcB+tFumTaJC2w48Xcbe9Hb2P6L01x6V8ChGXnnKA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+o9nNRomH8lb9QOslAPFRNg3XRdKLmrE4dsuJ+PVtPtAIN1P7w
	FJnA17+PUQ8RdhvKW7ZWU1OSBeRfTSEPgOG0ANU3BquFdBM+jhODx7Ap
X-Gm-Gg: AYBFou0Cm+3DAR8vmcNwlyf4/UvXAi2KNTmin8tX4otceWyiOgZO/I5WkENpnm1OxMM
	oBo33AsBbnTYkNewOJ9R8Qvor0quFeVRxGPakHbkfPPXAoLT4sCWt+oZEULk8Mlege4C/GKPwcK
	4wI5n7llZMMl4tJk7Kj0D/TZP3lqIq3G1Y3C0TiBYy2VYfBSAtfLSdzonpZHe7Zr4SFxdW7mlyL
	9jKwtcsDVUTVQQsVp70+Avo9CY4j2FZZ00kBmkhvMw5UYF38TfsvTtICqTKbwqL1rlYTAupftfo
	YM/xaoTCO2A893L2mcTgDPB8SP5weY69B7lwBE/CJzE7C5VZKETgcT5pFdhmdgT1SN+HTbcOYQ7
	wKA/ORR44Xyi4s6Lt5kQyOO/E2QhawBOlmjcXxc0DdmJ4a4Cd5+jNgo3mKf+s066EB+cNzLmFcu
	gY1GwEJPwvZu1EWtEDjehqPZuWjMx/D9yqeSnmho4q4V1l08rS56Kik2ss194Hc9+injZiKoPD4
	avPEFsKc2tcLz8xeRoIkLv4BxZhO22Nr9s9gCK1difOik0mTqnYEWvhEDFLHkedY9WKj7ReGt0O
	vZ07NOKU4/6XnDwdK1r2ZDH4lim8Wx2X6bgUO0LC+O0rrIhyPhkUjE+oa7mS1j0uKSJY+J/ZKdx
	UUDG8t5Ir
X-Received: by 2002:a05:6808:23cf:b0:4f3:6c2b:5f22 with SMTP id 5614622812f47-56e63aa4882mr9024922b6e.29.1794871169424;
        Mon, 16 Nov 2026 15:19:29 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:27 -0800 (PST)
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
Subject: [PATCH v2 11/19] wifi: mt76: mt7925: double the retry budget for NAN unicast management
Date: Mon, 16 Nov 2026 17:16:22 -0600
Message-ID: <20261116231630.1733906-12-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151930_363204_1195A67F 
X-CRM114-Status: GOOD (  11.16  )
X-Spam-Score: -0.5 (/)
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

The NAN setup handshakes are one-shot at the host: wpa_supplicant aborts
PASN on the first unacknowledged authentication frame and completes the
NDP state machine without retransmitting an unacknowledged key-install.
Right after the data path confirm both peers transmit at each other
nearly simultaneously, and with half-duplex radios one 15-retry burst
regularly dies inside the peer's own TX window (measured ~50% loss of
the key-install on an MT7925 pair, killing the NDP setup).

Double the TXD retry budget to the field maximum for NAN unicast
management so the burst outlives the cross-fire window.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 5518960e1375..9837018ba193 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -827,6 +827,19 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 
 	val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 15);
 
+	/* NAN setup handshakes are one-shot at the host: a single lost burst
+	 * kills the NDP (peers transmit at each other nearly simultaneously
+	 * after M3 and half-duplex radios miss the reply). Double the retry
+	 * budget so the burst outlives the cross-fire window.
+	 */
+	if (vif && vif->type == NL80211_IFTYPE_NAN) {
+		struct ieee80211_hdr *nan_hdr = (struct ieee80211_hdr *)skb->data;
+
+		if (ieee80211_is_mgmt(nan_hdr->frame_control) &&
+		    !is_multicast_ether_addr(nan_hdr->addr1))
+			val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 31);
+	}
+
 	if (key)
 		val |= MT_TXD3_PROTECT_FRAME;
 	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
-- 
2.43.0


