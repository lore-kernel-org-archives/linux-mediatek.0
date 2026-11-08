Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D4606A326
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zv2fNQO1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRuXikhm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+BAEkxNvBHvI4oVXleZQzH89SgumnMLG6pLMtheddDc=; b=zv2fNQO1TTKSGl
	hvYh4XsxAlkc36vSt/bGde7i07d/oLA8uqlNI8nfLrvPnrdq7z35Nld1CTk3VXJqzs5B2YaRwOJqu
	Y7jEaAdaVv/k2JBoFv1hSjAHcqrlg9QRHvtdDjV62XNV0dCzypE/Jxg285oQHEdc/J6krMJonGgv8
	H62O8EVbVQFAZViH6dF8MIHTs2CTKjuftOsQsdJIXOkgVlDRrktU46GtM+Xt32Fsyxyy0uB7zDhia
	nGlXR+gOI9hsMsAf5HcwTQuaZN6IFG3DzvtoIUEHJLXIHw+OvdlOnSECzM36W8Ihny66rK5zkKKId
	WlRuL32n87WQKhEg8YnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxC7-0000000FmVF-3cq2;
	Sun, 08 Nov 2026 07:20:03 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxC5-0000000FmTo-00Ht
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 07:20:02 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-14fc585291cso73533c88.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 23:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122400; x=1794727200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BAEkxNvBHvI4oVXleZQzH89SgumnMLG6pLMtheddDc=;
        b=lRuXikhmSdnjDbIoLuf+waY5BPcAoR4cjugmtSLGx7dMUh/jidKsJLn+edrLsVkoRE
         NnjldtEfhy3caRUKk8Ew1gMr5u/zBOwalzL0BmWoAa38lADfjY1wnOVyb0co2TosqTdl
         g7W71WH0xgWNpIXq/2AVBTqv8KLn+cHUqjYHfhUrNX0WQqSC/xBRI5e0PPJPzJJmBGZn
         lnmVhXLsxsX+MALikzBMmt16hIMLEWKi31B7BAB1oQtkYlBcy5FwgO7ubpzDuQELW6cq
         GDeHIyCL33PxI9Jgd9gK7RWXHuv4y1jT7/TuuN3DrJiOhZGT0ZYaPd9ms5Q+BTO+YlF5
         eFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122400; x=1794727200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+BAEkxNvBHvI4oVXleZQzH89SgumnMLG6pLMtheddDc=;
        b=FAqfQtPpMGFWbAfNA7KOr/KVnLMFiigjqvzcxYtQbj8oVoXtbknuQZ96wYDiCqMVDr
         WfFO6MQLLjTOJKudG/2/74G6i02Capjg4nebfQuwUEV01OZQ71x75cmSrwr1Vv8S7D/3
         qmP1aGeGGqTKuseIARXqhPssEdmsidAP5UNquQI3Dd8E0ciUnB4wBr9A9kJP45pMyEaj
         MgS5uZmZcwu9yPHWpsLkyHEpYItxs2yNI3o7VIYIj0Xae6wWzPqPYy8Grpx0L3mqQOl/
         Lculhni+mPUk5tPq6hdeUVULWaJpWHnulMx7NGVEj9cBlOBhe6YG1Kmv4p0N7m8BysuA
         ES1Q==
X-Forwarded-Encrypted: i=1; AL+hErGLrQRg+33l3RzpgfPmlDowp3ONSCrApxweFiH7VIZCz85RwpK3eG1cllJJbvi64cieXvk8AksYbvDfKqb8JQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/PtpeePRnSjif02/1XN8FGaxKfjiawoCrIC8XgQ4Ohhue4BePc
	x0xcjs5Q0PQqHJwSruIunttLlulauRg8hxr0eXN84F96dmgD+5kQHtql
X-Gm-Gg: AYBFou0M5YAZomnQl1bOzxD8cSCfSDwsM199qsUfK41MXyMer0cqO7EWewwzMmNZx34
	fRGlF/QbiBrTDWCGueN1pOTMgBTVRQy7USH2z1cWqdCvawiNDcEbGIdJeNEa5Sk4gpybsmz3vY4
	3iti7SCNPRq/jrQQZ5pqEsIt//fOoKPu9iwGh0nWP+S38e39AjbGS4g9yM7fCxjJo5KzykDKXWY
	MXR0/6h0E0DX9936yqyThLyQsWVLAg50CWheRKJYJ6XrXoqspbsznb8ALwHbzgFdzmCgKK3hY65
	A63VQ9rRzZ47GW2pwubRs3szcT7DUFJzGv1t4o4owZhtZ6aGxSFlNc4wEeNkzs6aCm0GUbp5ns+
	FvAteuG+HZZFCCaBzfDQHW7hJ8q8Z6xtPP9DjRskb2XDnRp2SZ1K0Lg8GgEqdvHD+vhG4qVBAaN
	x0vRTBOF/t6tNQXjSldIdMw1vehR9suffBU+cvIrFCct0rLbwOoCQwzfuPGFKic0d2YvcIO77yV
	1P5vf3JkCqDU7BfgI6wmZnB5Khx65E+dwhjXjIqHPpqXD/m3osO82Qie3kzNW8PTmUYAa3zTqel
	/aRR7dZVwBC+FUcL5ZRRUvxdv88QrGfhRC2A/wUM0cDMD+VqqF2p3CfUoG3Myn2xCZY=
X-Received: by 2002:a05:7022:7e8e:b0:188:e51:e86a with SMTP id a92af1059eb24-1b39fe307e4mr1220936c88.2.1794122400254;
        Sat, 07 Nov 2026 23:20:00 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:59 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 4/4] wifi: mt7601u: optimize management frame routing and queues
Date: Sun,  8 Nov 2026 12:47:46 +0530
Message-ID: <20261108071820.35303-5-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_232001_054929_3404FEC2 
X-CRM114-Status: GOOD (  13.22  )
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

Route management and injected frames specifically to the Voice (VO)
hardware queue. This bypasses potential firmware queue suspension
issues. Furthermore, avoid requesting ACKs for multicast frames and
skip the standard data rate fallback logic for management frames to
ensure stable transmission.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/tx.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/tx.c b/drivers/net/wireless/mediatek/mt7601u/tx.c
index 5aeeac0dd9fe7..47c78c4ff5144 100644
--- a/drivers/net/wireless/mediatek/mt7601u/tx.c
+++ b/drivers/net/wireless/mediatek/mt7601u/tx.c
@@ -27,6 +27,14 @@ static u8 q2hwq(u8 q)
 static u8 skb2q(struct sk_buff *skb)
 {
 	int qid = skb_get_queue_mapping(skb);
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+
+	if (ieee80211_is_mgmt(hdr->frame_control) ||
+	    (info->flags & IEEE80211_TX_CTL_INJECTED)) {
+		skb_set_queue_mapping(skb, MT_TXQ_VO);
+		return q2hwq(MT_TXQ_VO);
+	}
 
 	if (WARN_ON(qid >= MT_TXQ_PSD)) {
 		qid = MT_TXQ_BE;
@@ -134,6 +142,9 @@ mt7601u_push_txwi(struct mt7601u_dev *dev, struct sk_buff *skb,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_tx_rate *rate = &info->control.rates[0];
 	struct mt76_txwi *txwi;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	bool is_mgmt = ieee80211_is_mgmt(hdr->frame_control);
+	bool is_mcast = is_multicast_ether_addr(hdr->addr1);
 	unsigned long flags;
 	bool is_probe;
 	u32 pkt_id;
@@ -148,14 +159,14 @@ mt7601u_push_txwi(struct mt7601u_dev *dev, struct sk_buff *skb,
 				       info->control.rates, 1);
 
 	spin_lock_irqsave(&dev->lock, flags);
-	if (rate->idx < 0 || !rate->count)
+	if (!is_mgmt && (rate->idx < 0 || !rate->count))
 		rate_ctl = wcid->tx_rate;
 	else
 		rate_ctl = mt76_mac_tx_rate_val(dev, rate, &nss);
 	spin_unlock_irqrestore(&dev->lock, flags);
 	txwi->rate_ctl = cpu_to_le16(rate_ctl);
 
-	if (!(info->flags & IEEE80211_TX_CTL_NO_ACK))
+	if (!(info->flags & IEEE80211_TX_CTL_NO_ACK) && sta && !is_mcast)
 		txwi->ack_ctl |= MT_TXWI_ACK_CTL_REQ;
 	if (info->flags & IEEE80211_TX_CTL_ASSIGN_SEQ)
 		txwi->ack_ctl |= MT_TXWI_ACK_CTL_NSEQ;
@@ -197,6 +208,8 @@ void mt7601u_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	struct mt76_sta *msta = NULL;
 	struct mt76_wcid *wcid = dev->mon_wcid;
 	struct mt76_txwi *txwi;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	bool is_mcast = is_multicast_ether_addr(hdr->addr1);
 	int pkt_len = skb->len;
 	int hw_q = skb2q(skb);
 
@@ -211,7 +224,7 @@ void mt7601u_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	if (sta) {
 		msta = (struct mt76_sta *) sta->drv_priv;
 		wcid = &msta->wcid;
-	} else if (vif) {
+	} else if (vif && is_mcast) {
 		struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
 
 		wcid = &mvif->group_wcid;
-- 
2.56.0


