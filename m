Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF95C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q418RkM6qinLSHwTY7IgT/gNLjtyfu16DuBAIvo7lUM=; b=IamiAHvuWnYWwTO8agXnL2P66c
	HYc40lxEXvUyAlH3+sbaTqzfgX1y6cKwYnzQN8RNW3OtSmfzryCZ4h1Ddox/jFIqmvA4v0lMUHZci
	M2v8+suvVjakxXKzG4ss5iG9p4daW+G/JfIsywIG4aP90r/YFUgDVXLxwpMtOlyJfIpY1sfggEesE
	Wrq3k+EHzMsDC9fF/vEwTq+KPuruHbwPGHtKdWrHCx+e+mb/9mBgxSBEw1a8ERZUOwQ/GTXTIQu9h
	CnDdbeTSG/t0SbGmZy/dnUiYdJGYy5VNU1rbKAfzyqxQXstvqeDXqGR9Cc9oE/vvdgNUp4TcCw0aU
	0v5tfIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajJ-0000000HKQ5-1znI;
	Mon, 24 Aug 2026 19:53:13 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajH-0000000HKOR-1LcL
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:12 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-44ae14b4fd6so1961389fac.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601190; x=1788205990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q418RkM6qinLSHwTY7IgT/gNLjtyfu16DuBAIvo7lUM=;
        b=dw4fIPe8ZIYaer/FD4HHy/HWbmfl/mhcQQQ6hvPfiWKLGGC4t4G6SLn18SURqeK1Qy
         LEdlKJy6ErR4ruJw+TlWEma0/U2e0VbfAKdTzwp+JWKKYg9Ha4D1aSTXV/Iw3rLQ+kcF
         8630fCNRlg8+4Y/kIPR9yuzScF/h5ZBeU1tVNRyGZ5LaQTwH/OVQ9nY3/ukb9S8LTLmA
         /DQWoxlc/J1SlJCAmhyVZVtb+nD2oLzMY0wGmtILzyZOGkA8N0Hx0Gmro4Nc2xMfADM2
         SNoG6wz0ayRnTPHRJFg8ZADfibC7RCn3mMlLM6ZuWibo2XyQaQfEs1xh17JlWiRCqWza
         BVpw==
X-Forwarded-Encrypted: i=1; AHgh+RovP5eCKArFnStmFuy/PzsrE0zqmdcEnn5ug64G3XqII0Pbo3EyGgviDtyYw/YRjjRgwuxvTrJIldG7Ia0L2A==@lists.infradead.org
X-Gm-Message-State: AFuF++mngwlnS7mhoTG6Ug+ZI5yF6FfO9Bd8P/QFsN71XogxIzcY9eXE
	rtfXtYz2/e5hkiq5x7mstnBCOjO0kY03PIzQcZkzlTg2JBTOwpCS2E9G
X-Gm-Gg: AR+sD10MehFILR8sQ2HKNOKzprxuxi1uOl5e763VIlCOhr5NN+5JjXc77fqT5MsKead
	0JeQJNzDX5VCTxvKuvl7HED/BqBKu9ZLZj9ryI/pTcTAjoYxWAkNUAK2Lhmkp7dKOUgQ4XUkzZ6
	FL+vRX6zlYT4kNmwt9kPrR+e8drCMiVWIMUFLvT272XUtAQpDLf5y0Ur8DiHako9+BWyIw9wdD+
	vOTOOvCATnNbt5dNkhAFs0R63b45EeJgO6edHUBpayzImkSStn9saHmQDda/6mhSQkoHR6RCscQ
	RmlgJRtNFBrbVwDd/zn69hg3ULJTMP+o24gbmI2cpxySp7GW0RAFPyQOSU/uxRmZwoc9mWYYcbK
	0UK6QkwMpBG3dLLCLaWdp3DAtti/87xTSEYyMKCQGt+wrjadGpspi4MpgtIfegG5WRimvYsSk8y
	8zX+Y0V4cY/WH28RwHsVTFJAiE9XFGGiHUXuxZ1Z3w0S1MM4s3bFK6M8u3RTj/Mu714JEPM8hn5
	ojoRx5L8j5eQPGWb5Dg39uaMVPUnwk7O5KcfAd3cAQT
X-Received: by 2002:a05:6870:c088:b0:45e:caa2:4ea with SMTP id 586e51a60fabf-4637fa671b8mr20227908fac.6.1787601190327;
        Mon, 24 Aug 2026 12:53:10 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:09 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 05/15] wifi: mt76: mt7925: drop unused NAN 2.4/5 GHz support config
Date: Mon, 24 Aug 2026 14:52:17 -0500
Message-ID: <20260824195227.12589-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125311_535920_6AFCE8D5 
X-CRM114-Status: UNSURE (   9.49  )
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

From: Stella Liu <yu-ching.liu@mediatek.com>

The config_support_5g/support_5g_val and config_2dot4g_support/
support_2dot4g_val fields in the NAN enable request are not used by the
firmware, so stop setting them and drop mt7925_nan_set_2g_support().

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/nan.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index c04b12cbf076..5c6598a0f3b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -32,8 +32,6 @@ static void mt7925_nan_set_5g_channel(struct mt792x_dev *dev,
 	if (!mt7925_regd_is_valid_channel(dev, NL80211_BAND_5GHZ, chan))
 		return;
 
-	req->config_support_5g = 1;
-	req->support_5g_val = 1;
 	req->config_5g_channel = 1;
 
 	if (chan->hw_value == NAN_5G_LOW_DISC_CHANNEL)
@@ -44,16 +42,6 @@ static void mt7925_nan_set_5g_channel(struct mt792x_dev *dev,
 	req->channel_5g_val = cpu_to_le32(ch5g);
 }
 
-static void mt7925_nan_set_2g_support(struct mt7925_nan_enable_req_tlv *req,
-				      struct cfg80211_nan_conf *conf)
-{
-	if (!conf->band_cfgs[NL80211_BAND_2GHZ].chan)
-		return;
-
-	req->config_2dot4g_support = 1;
-	req->support_2dot4g_val = 1;
-}
-
 static void mt7925_nan_set_cluster_id(struct mt7925_nan_enable_req_tlv *req,
 				      const u8 *cluster_id)
 {
@@ -172,7 +160,6 @@ int mt7925_nan_enable(struct ieee80211_vif *vif,
 
 	p_nan_req_tlv->master_pref = conf->master_pref;
 
-	mt7925_nan_set_2g_support(p_nan_req_tlv, conf);
 	mt7925_nan_set_5g_channel(dev, p_nan_req_tlv, conf);
 	mt7925_nan_set_cluster_id(p_nan_req_tlv, conf->cluster_id);
 	mt7925_nan_set_dw_interval(p_nan_req_tlv, conf);
-- 
2.43.0


