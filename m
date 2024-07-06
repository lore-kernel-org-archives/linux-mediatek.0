Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37613C38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHXCbEjzxJHt6d9yCUkSCCwiOq2AKkZ8WtSCeFmtnbg=; b=y8eddCcrVBk4Jw3qo3N2gULpS2
	qwL6Qg1uz0tMEDNC3GFRINMwdR82u7V+hw3HNJvlPx3P9OjOLgxmVGSLL/0ngBMThHEwi9w6Y9C/i
	D8i+/0vQKx6LRXI7byH5KjXZac68dSLCWNgLML8t5d3wg2PWqYFoCGdYhNuCz+emKiqUTjFL/Qsfp
	tTI7RgKV0lmpwrSQNHrC6gEU8GSgRChGgu7uJ70ah+cXLmkqfVMBt9LQ4D9q1nAIZyGoowTZUUSm9
	PhdDww8sUNk3Na/vjTOmQgNXXlPUwnoPOQ5m6RWsb1q8F/ZNDX+zpiM/cUEuMOeBC9MXXr03TQJaq
	D0UDhULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mk-0000000HXsi-2mpr;
	Sat, 06 Jul 2024 08:28:46 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mh-0000000HXqJ-3nTo
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:45 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5c229104335so56209eaf.3
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254522; x=1720859322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHXCbEjzxJHt6d9yCUkSCCwiOq2AKkZ8WtSCeFmtnbg=;
        b=C34pMEmiJMnuNVUaCzfryeBtCeR3kyRH3gS40rFq3DCNNTANpd2m9Tp8yxpc2el4Cf
         8UHXbF0xIExBu3ALpHh2wDOJeUb5HSkqpzl9Q1C9NbMD0hAPcftN7KmbWzBk+oQyAwfp
         kbFm1f8KqnJQ3yX1IGD6Xd06jV/dndFIwSV5XKK+AdSmd5jKAhAwpFTQsAm3xOIFvLpI
         O2Ci/6Dz7pu4oZ5vDfffW7MaLzIHbdUZGfFIo6sto+Ns01d3WTDztvuYhFSUqyMQnXfh
         LdzOs/S43AQj61hBu0oMCopEAC+hXU/NtCyrb8DN49m+tZYBLRS/UOiy49MFHX05SdNT
         nZsg==
X-Forwarded-Encrypted: i=1; AJvYcCUqAuEPDCauxFro5gS/Lgy6l536IuUDISmxhkDtTjbV7UJhPEksoj3PpvlOK2qU6jre7f6GlrdCkxdRbqIgcIe5n/1GG/IWoxCvuLRx1oCJx+w/
X-Gm-Message-State: AOJu0YztW32vDj1/xV0+y+AcmVVDshYZNRMlsWGGjlmzxKJJ6m93IB9i
	NuIul/o2eL/M2xu+fMxeUFpxrztXE9Eqivpb8fUuJ+YJdGLRr+QY
X-Google-Smtp-Source: AGHT+IG62pAdB+ysm+HXJY9D5Yk5oLHWN7dIsI7MbULc7deb19Ww0URCw72J1juBmJHNDg5OQtX0Lw==
X-Received: by 2002:a05:6871:24d9:b0:258:4ae8:4aec with SMTP id 586e51a60fabf-25e2bf90e00mr6558049fac.3.1720254522586;
        Sat, 06 Jul 2024 01:28:42 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:41 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 12/37] wifi: mt76: mt7925: add link handling in mt7925_set_key
Date: Sat,  6 Jul 2024 01:27:52 -0700
Message-Id: <164608d96ce10a40e673bc6f252189c94bc48da7.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012844_147915_D2DD769F 
X-CRM114-Status: GOOD (  12.44  )
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

add link handling in mt7925_set_key to support MLO-enabled
firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c   | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 79b43101237c..a2cf05fdfc3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -610,6 +610,9 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			  struct ieee80211_key_conf *key)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
+				  &mvif->sta;
 	int err;
 
 	/* The hardware does not support per-STA RX GTK, fallback
@@ -624,7 +627,20 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	mt792x_mutex_acquire(dev);
 
-	err = mt7925_set_link_key(hw, cmd, vif, sta, key, vif->bss_conf.link_id);
+	if (ieee80211_vif_is_mld(vif)) {
+		unsigned int link_id;
+		unsigned long add;
+
+		add = key->link_id != -1 ? BIT(key->link_id) : msta->valid_links;
+
+		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
+			err = mt7925_set_link_key(hw, cmd, vif, sta, key, link_id);
+			if (err < 0)
+				break;
+		}
+	} else {
+		err = mt7925_set_link_key(hw, cmd, vif, sta, key, vif->bss_conf.link_id);
+	}
 
 	mt792x_mutex_release(dev);
 
-- 
2.25.1


