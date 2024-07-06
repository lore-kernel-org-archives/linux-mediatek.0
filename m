Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0D4C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNbrfo87WUKSPAzqY+ihQ88l4268XCP8og2J9dUfydM=; b=lrPsB36ilLr/5vYtt+QHeV7axz
	Mn9spvyFeCf56qtVSC0XeLiv4X9PzG6XEG4Z+jxjHC7Q9ZVrua4R+/fj/+bwib+f3fV1FqOrQfEl3
	BG5DQrSFTV+dxVzvCtbzp/FFQyA5onk/17kNmDIWKshRzyI5mEv53JDsGsCoaraYRehiDDJBej+y3
	/IVDs7TDUngCR0grsNBHj3/c2J09WLcp+Uak4wnGudAetHs2xT8VRYBO31l0HGU1ifkA0YPNJUM7u
	29LbqPZCC4O/fRAHpoiFaMrjKE3h7aSLXlF3rtFnwlQr/9yb+Nn21IWMwce21AqCjBGBD27fbwL4S
	DbbEAJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n5-0000000HY7v-1Ncv;
	Sat, 06 Jul 2024 08:29:07 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n1-0000000HY4y-3Mzc
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:05 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5c229104335so56222eaf.3
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254543; x=1720859343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNbrfo87WUKSPAzqY+ihQ88l4268XCP8og2J9dUfydM=;
        b=SaiIN1j/JZduojChLXQSniH6YD324YnwE822olVLRdqTbpXgjrwIgBoEyCXIdNEaaR
         uHvn+BLlkiLmeYTvFMZWvJ3nCROdalTJU2Uv3FteQjnDFWfnPJ8+Wu5N2PTRyPvC2zHs
         xF6X1Ir8vShgmNdDBOc9ckPYsUuSTwkqIt3pnxo9jgH1psYvCyCxX1oAfoMUpEXqEsn0
         kdr4LStsuamSpK/Pw8YumX+aVLSp8uBF2p3MY1qacs3XBy5/JTMThzfkUgyMyWFTLbLY
         6Xs8ygKcghznB9zjFykbgrsSqqcF0gYOP2N6hU8+OuRmpbNqLxOGPLkLwMBKyAQsjXKo
         AdJg==
X-Forwarded-Encrypted: i=1; AJvYcCWdzXSvMCduMj5Zi0j4vNqbVT/RTwqgzKmBPKJeXq/De8dJNt2L+lz2lTHwiZOrJQJB90BhA27Eu+D5ZVCjCHUroRSa4/gzcUumF09T3GcTTJ34
X-Gm-Message-State: AOJu0Yx+XYgZQCEnQGAX+J8ZjfoH/leG+x9+OlHCBXn28pwPYEseWYvi
	tp7r4pEPY5cmeQGhUWweT2LPO7474lW5r8yxR//f3geuj8ZeftMO
X-Google-Smtp-Source: AGHT+IE4D1UPCBu4Iu6dQf7UbTChRc3rtaYw8RQe/rJ50IyYMe1udypfb6btw6+/ex9AYP2IIke5wQ==
X-Received: by 2002:a05:6871:7988:b0:254:a7df:721b with SMTP id 586e51a60fabf-25e2c06c433mr6843442fac.5.1720254542869;
        Sat, 06 Jul 2024 01:29:02 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:01 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 24/37] wifi: mt76: add def_wcid to struct mt76_wcid
Date: Sat,  6 Jul 2024 01:28:04 -0700
Message-Id: <d5188ca633666eaad7e90a8061d1a0585487e128.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012903_878135_7111C868 
X-CRM114-Status: GOOD (  10.72  )
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

add def_wcid to struct mt76_wcid to allow per-link wcid to retrieve the
struct ieee80211_sta structure.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e1d30326f5af..5f8773364d51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -368,6 +368,8 @@ struct mt76_wcid {
 	struct mt76_sta_stats stats;
 
 	struct list_head poll_list;
+
+	struct mt76_wcid *def_wcid;
 };
 
 struct mt76_txq {
@@ -1258,6 +1260,9 @@ wcid_to_sta(struct mt76_wcid *wcid)
 	if (!wcid || !wcid->sta)
 		return NULL;
 
+	if (wcid->def_wcid)
+		ptr = wcid->def_wcid;
+
 	return container_of(ptr, struct ieee80211_sta, drv_priv);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 1a6a0b56a23e..dabfb8eca686 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -892,6 +892,7 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		rcu_assign_pointer(msta->link[link_id], mlink);
 		mlink->sta = msta;
 		mlink->pri_link = &sta->deflink;
+		mlink->wcid.def_wcid = &msta->deflink.wcid;
 
 		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
 		mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta);
@@ -1900,6 +1901,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		mconf->vif = mvif;
 		mlink->wcid.link_id = link_id;
 		mlink->wcid.link_valid = !!vif->valid_links;
+		mlink->wcid.def_wcid = &mvif->sta.deflink.wcid;
 	}
 
 	if (hweight16(mvif->valid_links) == 0)
-- 
2.25.1


