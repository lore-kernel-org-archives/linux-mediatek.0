Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BC8C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAjVZTnUhu0dIEUEUzrUR6KmfLF6doPnT97CAweb4kU=; b=s6apxnka67J/W9jBru000b5809
	SZVDlnpY3FwxQmtI55PYq2R15jNe5TeJ6hwqpcEYq0BrQzaz0w5BUAe7AHzhYwhGF04tEP8UCWwBp
	lVISIlZpHZF2cCogcEdJXYtgcWgd456V0lmfbM1rIfYI6ZQlhJIUWO91kH0VrtmL8cs+HmNNEZaC5
	6XPm7Qq2W9FBeX6leOYkiODTt0iItNms/4pAmpR977cpRcXqIfi3tvgRUgqljG4QSccoaXecaHhCX
	09bNqvw3Z+xRzkf5BRTuyV2UbDPzOVKhVUP1r6Aiem9VFliLtOZiBAFSkkQoXLwZDF5hmKBw3L/cd
	gEYtFM8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mg-0000000HXpu-2lcY;
	Sat, 06 Jul 2024 08:28:42 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0me-0000000HXnZ-1JWC
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:41 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d1b8bacf67so330228b6e.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254519; x=1720859319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAjVZTnUhu0dIEUEUzrUR6KmfLF6doPnT97CAweb4kU=;
        b=EluwfYJiD7NcKTGFFcUZsbf12nnclQt5hz2R9ASOML/SOAVHrL8JKet1lzEvU6iZge
         w8jWd8Lh0QtZuqyuPKYiOYNc0++apqMZERk3oLj1whu90XLVS5RDghQ2Rd0DSa+Mf24O
         xQZPEutx2c1vcYLYf/7Pj46iZIY8ucLOlLsfvtPveT6GzI9gs7/K6686R+pwdDgylxrQ
         UIbrTR6YzEBJuRXjHsTFFBUUlvZLGomU4eqUiI268L5JgUCYZYeLcy4GQfgfKjYwivIX
         R/aXMe6IsmvgSAczLW7X830dsAV6RsV3hmQKuPrDehxVuZXlqJqOxYAVbjk78NYYZFqp
         N8vA==
X-Forwarded-Encrypted: i=1; AJvYcCWAhikp3IdmpjAmxkaSlajxuq0xq3hloQc0ngx4L34iVHYk63+Sa5ampTc9b8CcJ5D9WM6rt0a2ftluf38Gll8sM/3p6J3cIPMLwJJlgW7KbyUe
X-Gm-Message-State: AOJu0YxzlpzLl2Cj8IG2nzc9b4v56sm7/ks732bV492Lllf3tdd8LvUj
	rdYsjsQBxgGCYubffCh4rxVv758sFCvhZfqxrsay8in5mHKOkda7
X-Google-Smtp-Source: AGHT+IHCvWG8tRPJXCVddAO6FRMJQFPuKQrMHuZK7N8spyF4+hiGS/P8jKzoibHFGJWs2r6oJ9WKOA==
X-Received: by 2002:a05:6871:588c:b0:25e:2624:eb5f with SMTP id 586e51a60fabf-25e2b8cf269mr6539703fac.1.1720254519351;
        Sat, 06 Jul 2024 01:28:39 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:38 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 10/37] wifi: mt76: mt7925: add link handling in mt7925_mac_sta_remove
Date: Sat,  6 Jul 2024 01:27:50 -0700
Message-Id: <20d53511fe1f64984d893f4d3ec87cb9f87d3070.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012840_423867_EA9EEDEE 
X-CRM114-Status: GOOD (  10.88  )
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

Added link handling to mt7925_mac_sta_remove, supporting the MLO-enabled
firmware. The change remains comptabile with the non-MLO mode.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 042c9fe5a2d9..79b43101237c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1033,7 +1033,13 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
 {
-	mt7925_mac_link_sta_remove(mdev, vif, &sta->deflink);
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	unsigned long rem;
+
+	rem = ieee80211_vif_is_mld(vif) ? msta->valid_links : BIT(0);
+
+	mt7925_mac_sta_remove_links(dev, vif, sta, rem);
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-- 
2.25.1


