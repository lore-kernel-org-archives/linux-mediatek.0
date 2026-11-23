Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E544606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 19:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bfEpdTU0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFO+e0u1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tVpg3m8XkKzY55cEmyE7VyD81pFXe7BeKUYNIVpFSxU=; b=bfEpdTU0KR6yVCAK27FaI5mYk9
	xy/AE3vcV5Rsk9gqWeHrvkuk5EqEFa3uMFX42Pw20TguVx/cDyCGfg2hEHfkjOpROJwrDMDyOh04k
	jroAbtY4xDtlONmTOsxLLBrl6KPE8SZWTkD/qni2fh6f1SB3Jm1UXiNUcXfqnHPwrt1Pv/WgWgV5J
	eSXAJzm8uAwLBMr6HiwKvjHR2r7rWLAaxTC5PmXsbVJfNLo8IRJbpOQ/hll2MKQsDopxqNmQWW6pq
	u1sEUhMoZCT2nHTpXuTk3Xbs9dywrlG9JzetLw3ZNW9dT91G9WIWicASPvYm3Ilj14QnHUPB7V5C2
	eRuwKURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZi6-00000004fJX-0D0a;
	Mon, 23 Nov 2026 19:28:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZi3-00000004fID-2QXe
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 19:28:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e47347279so2202219f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 11:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795462093; x=1796066893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVpg3m8XkKzY55cEmyE7VyD81pFXe7BeKUYNIVpFSxU=;
        b=cFO+e0u1jycmHyqamx/5Rg59LXD8MaW2oX/vnM1gmZHXAfHybagDeew3lH7c1NPfwn
         E6DAjcFSSAb34zcoOmLtTDmv57U1uVMMAF88gCA58sDShF0kJ4Wehefzg9ODOyb/s2yt
         hWFRcTaA3shkzggp0a8yCMPL+WIuQWTMeQg9Gqa1AqCNbvueL42y+QKnPAhhhcrhxwJx
         E3spi26UGdWaGw6vFCi0ipuqRwnuDd1s87hDBau0BGQ+IymvLZyt++cvmBjDHvJS3Rf6
         BF53IbxOopy+1yHiqOesj0zvXi8reWXMtGyY0fTW8lzmHgMZ98MYo+Vg6DWuqYyG6CLy
         8mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462093; x=1796066893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVpg3m8XkKzY55cEmyE7VyD81pFXe7BeKUYNIVpFSxU=;
        b=CMH5tnJPWVmmGoHnidoRuVf1x6bauNmhvX5dH7FtW69RBsR6o8PUCoan4D0RIymWhe
         /2rI4KXN/0s8vxWcqs5ZjLJUhjvnbS2lvkYte9SXYEYPVQ2HMZHixZ3wpgzXFw8zPtUa
         +LyC8SDkfVqTlV911jnmURti0fsPOvsIP5GSqXEikr9qCpc6zKwARJFpuGyf2Uvqblc4
         awxm9T81/qpj1kzlQQIA/cNUhcWxOBcGEhpQcBCIGGHmnzmuFsSH5OqJOgwuyI4M8xLC
         Zn3+3Fp0schwIxBLUtPtqZsod6ZQRY9H1N004UN4GVVu2g3lME2glZkx+o75CG5hra4v
         m2+Q==
X-Forwarded-Encrypted: i=1; AL+hErEZj/EjgpKtnA0AJ99sMXHvPDcLYxxk9co05V2V0csUpUy35LoJlhhmjN38wDjMa51a/DUaFrtfK1bk516Mkg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9LnJ+dOyC3YdMlMr5se1vulaa3y7VHJmanMdugg2DsYlZJh+nX
	WJ1cTqiey7X4XbJdF6Hs557y6nXdrgKoq7EaPH0XJ6JytSG69w28M5w3
X-Gm-Gg: AZFdTZenwJMoUF2S3qxzJQDMUlIlFJqTm1V7bcnJSq/irGiY4hISNq/ewwIzN5GzCqb
	xVQBUPR4oWAQ5W64CxjlWytd1mcF3YKT5TpjwcWZ6dt8lTRxWoQDAMWH4ofeHcirZu5PjsIGzDs
	IjQNqiHendD5Pa2FWCXhtdMP8mK7Isq3z5AF/x56NC1PPUK9G6SzXjyF/s/06zPubf+75LsF+xy
	epqjlbkD6s3W1QVaTdEf0jvIxpQC9sakiU5man8obxjM8MgHHSQWl9UfpAd6/MKihEy0LYM3oxw
	5FdabnzwG9WRu7GxrnoddFeHKw6ELdgEX8WPwftpUrI263w7+YG7Tu5D8fWifwr4h9I3bt7fzJd
	ahn9WsiMkC/iDxSl9XBGBgNizC3AdJaN96xzUYzupdmVo4kMt8rPq/7zCpdNsrtsX6gX//pL8lY
	xrIP6pye5EwheT+WxXg1rSNCb79dVWs+7VCoeeIfLpYbVEUGP1WJQKd2Z8/YqrO5pmO2TLMuur7
	2axNM6VO3zlbNMvH+6vPWq75bYxh4A2wX7yBUsbph6yhM2bwuksAvRR1J+D5o7ZT4z6fkHWmaga
	qSCv8UNCuA96xvZl1IMigFiw7sfZ34xME/LvVRjBJx0vzvmsw0i6RkSTtkwaY7jSCV6gNc8=
X-Received: by 2002:a05:6000:2383:b0:4a8:8004:5261 with SMTP id ffacd0b85a97d-4abb6d04250mr27449503f8f.44.1795462092747;
        Mon, 23 Nov 2026 11:28:12 -0800 (PST)
Received: from kidala-computer.. (ip-109-41-51-17.web.vodafone.de. [109.41.51.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm24879522f8f.8.2026.11.23.11.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:28:12 -0800 (PST)
From: Oleh Shcherba <scherbaoleg4@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oleh Shcherba <scherbaoleg4@gmail.com>
Subject: [PATCH] wifi: mt76: mt7603: remove dead WEP handling code
Date: Mon, 23 Nov 2026 20:27:34 +0100
Message-ID: <20261123192734.7149-1-scherbaoleg4@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_112815_635684_5BC511CC 
X-CRM114-Status: GOOD (  10.27  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt7603_set_key() only offloads TKIP and CCMP keys to the hardware and
returns -EOPNOTSUPP for everything else, so WEP is always handled in
software by mac80211. Hardware WEP was disabled as broken in the
out-of-tree mt76 repository before the driver was merged upstream (see
Link below), and in mainline mt7603_set_key() has never accepted WEP
ciphers.

The WEP cases in mt7603_mac_get_key_info() and the WEP-specific key
offset/length handling in mt7603_wtbl_set_key() are therefore
unreachable. No functional change.

Link: https://github.com/openwrt/mt76/commit/cd456ca87fb0afe4485ce9b091f40cf2faa3991a
Signed-off-by: Oleh Shcherba <scherbaoleg4@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 196c39f..836ce7d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -894,10 +894,6 @@ mt7603_mac_get_key_info(struct ieee80211_key_conf *key, u8 *key_data)
 	memcpy(key_data, key->key, key->keylen);
 
 	switch (key->cipher) {
-	case WLAN_CIPHER_SUITE_WEP40:
-		return MT_CIPHER_WEP40;
-	case WLAN_CIPHER_SUITE_WEP104:
-		return MT_CIPHER_WEP104;
 	case WLAN_CIPHER_SUITE_TKIP:
 		/* Rx/Tx MIC keys are swapped */
 		memcpy(key_data + 16, key->key + 24, 8);
@@ -916,18 +912,12 @@ int mt7603_wtbl_set_key(struct mt7603_dev *dev, int wcid,
 	enum mt76_cipher_type cipher;
 	u32 addr = mt7603_wtbl3_addr(wcid);
 	u8 key_data[32];
-	int key_len = sizeof(key_data);
 
 	cipher = mt7603_mac_get_key_info(key, key_data);
 	if (cipher == MT_CIPHER_NONE && key)
 		return -EOPNOTSUPP;
 
-	if (key && (cipher == MT_CIPHER_WEP40 || cipher == MT_CIPHER_WEP104)) {
-		addr += key->keyidx * 16;
-		key_len = 16;
-	}
-
-	mt76_wr_copy(dev, addr, key_data, key_len);
+	mt76_wr_copy(dev, addr, key_data, sizeof(key_data));
 
 	addr = mt7603_wtbl1_addr(wcid);
 	mt76_rmw_field(dev, addr + 2 * 4, MT_WTBL1_W2_KEY_TYPE, cipher);
-- 
2.43.0


