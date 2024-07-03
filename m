Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2839CC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8K/G1mFnUqG5/XVm+Bjq0BOwIjr9NKGtmLZt5vb8yyo=; b=bNHabj4oCyC//nsAPfEI2GqjD9
	7Q6cRRB9ZwQsgBaDIrmlY0l+n//hL2+uMZ8w5jPx6SpzolcCAlpzn6/MwqHPXupax3n82qyhiQvWq
	0BULMC8NaHNdeY0CG9jwlyEf7ChZg9LQermcAiWonkiSjv6k57FK/9PoGzJR42bk41TjUVrQXJy/j
	9wxIvacu03dIE+rK25FP8MU6mn1JrHJ43MiQRfzNm7zmRCroon2ItuWZ5Mf9sKv2kcXhj4w1nODoG
	HSmlFLbYRT5/3/XdwzBOrup5uZtnU8jbtFA9j41iyChNbh+PhV93Sx9AUtCrnSaGr46ZCTSfGrh89
	cGYSupYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7ke-0000000BWz1-3YY6;
	Wed, 03 Jul 2024 21:42:56 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kb-0000000BWxs-39I9
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:42:54 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-700cf03febfso89111a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042973; x=1720647773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8K/G1mFnUqG5/XVm+Bjq0BOwIjr9NKGtmLZt5vb8yyo=;
        b=h65CQOhKgichz4JSo+FckRGxOsAP1cAVU2U0pOfzASHfnLsvV4I+Ne2TfIyv7KVcHV
         cqpa+tbZAuAZiirAsEUJZ+NKzLbCkpe1MfpR2n2CXcRqp6pkBOTooKJrIPpD0+rpr8vQ
         57VSMQQVEX1mxMvL3YpyS8XmZ3a0eC0yiOqd6zo2dpl9gcieceH1KQ9a8tj2MSZK2jHU
         aKdHU1FpHn+DVTiSDA5c80ni4FaH3XxqU2UAj0T3xEkg7sonrTcaIo+cx+7AK4hJOGLw
         +h+wXyT6xX50eJx0rlF6To3ymSreFIuJYy/CrCmz6KR1W1qdUvUUC4w/g9B1VyOE65zg
         H05Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNQyA8IlycBpRBfnOVq1Sc8RoviLWnq5AA9aXX8089KcrixAVLtteANfZcqAX9lLz9VLUUb8zZKxZ5PioNFo+DhQtQJ67uzzGUzFJlG6OGVJ1/
X-Gm-Message-State: AOJu0Yx6G0laLolmnmxytBRXu7qv6NyGcglLn3h7FU+MzqQmwHbcQXHZ
	cfJ8rIF06GJEW6h6tEjYfotEEexiXdBD3+S/s1cQFkOgDhY8SUji
X-Google-Smtp-Source: AGHT+IEneCCcR7ZDKxvEJ7/VqWpNOTdFJy5jMTeENZKYzVaf+ecNU+xe/U5qPtR6pGZa7/YqfGtU4g==
X-Received: by 2002:a9d:7e8a:0:b0:700:e0e8:5e2 with SMTP id 46e09a7af769-70207560e89mr12823875a34.0.1720042973070;
        Wed, 03 Jul 2024 14:42:53 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:42:51 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 03/29] wifi: mt76: mt7925: set Tx queue parameters according to link id
Date: Wed,  3 Jul 2024 14:42:08 -0700
Message-Id: <b40df22b45353a59cc463d3e3fd1d4e8313f238a.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144253_813092_72E73D10 
X-CRM114-Status: GOOD (  10.70  )
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

From: Sean Wang <sean.wang@mediatek.com>

Configure TX queue parameters according to link id.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 1c8a44789e51..4e5868cd2a97 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1306,6 +1306,7 @@ mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	       const struct ieee80211_tx_queue_params *params)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif, link_id);
 	static const u8 mq_to_aci[] = {
 		    [IEEE80211_AC_VO] = 3,
 		    [IEEE80211_AC_VI] = 2,
@@ -1314,7 +1315,7 @@ mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	};
 
 	/* firmware uses access class index */
-	mvif->bss_conf.queue_params[mq_to_aci[queue]] = *params;
+	mconf->queue_params[mq_to_aci[queue]] = *params;
 
 	return 0;
 }
-- 
2.25.1


