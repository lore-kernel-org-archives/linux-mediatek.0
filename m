Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F97C38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3S6mlsXmirTjv2z8akgtbzv3cHrQXWXD1zrwfiohz18=; b=XsCLGGU+OyYw3PwsXLMzaX7PvA
	NTqhmE5W/kCUlJochgZyhCQHEhJopx0FhPtoRqylj6G292ZNoy7cOnxlHK020ZgJq8lo/3imSJu6Y
	ZV50q1vXJH+XadBOcHhdP+7qXP+k03jZZLpOzsCQDYxQE6jWHTZ705IWrzCCveNK9bAdhuIS1bDzK
	NyhSRf2IuflrAUXJxDqnmqn8ZYwE+IpVrIkQA9fUJUndEcoQ4O8LvrFpNGCdrQbr0uA3h0tB5Ngb/
	+Nl5O6omxm8eBGtm6Y6nFk3+1RwGOhZUg8d+8zPYG5NSP7OsPLMJ4DNU72x7WVanoRgHdpHmB8jlV
	pc5aLYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mw-0000000HY1D-2OP0;
	Sat, 06 Jul 2024 08:28:58 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mt-0000000HXyM-0QvM
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:56 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d55fa5dfecso121384b6e.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254534; x=1720859334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S6mlsXmirTjv2z8akgtbzv3cHrQXWXD1zrwfiohz18=;
        b=sTlH29LINyZLws8eTHIfUtLJDTXs2+hkM01ge4pPKgF0guoTySrXRAcvcnvND/BWRH
         1XzsdI3vzD4o4KIa16GRqJK+agK1WHRlLKFPc5XoINrs3Vq2mgx4amXIzBje66dNEdFu
         FUUlhSmzYeV37DbC8H8tY6kOAHC4VB4l1l1N9ztV99zUZkKoEP1mXiFD8mb5oG0cyRv+
         RTcaK/HKuIu5JcMc5KGjmcfdTl1WkbK++reLf82K0KbcMBVl5udBAb8Mu4k+2qzTSfmP
         FeVW8mtogKl6dzzdrdE5030ihuPYrvubhEdHw+cKcjg5lZKClQe6ZCWs28eRkSg3DR9c
         RzKw==
X-Forwarded-Encrypted: i=1; AJvYcCUGNZWPx5BMRxWrxqSNNvBzu9tDSp1g6vM1P3CLliOkvrIddYzn1f48dbnAJH01PrRN4MKOWDCZtRBl88nXnZ8r7QTI0aR+RWpatbG10b6ATDjU
X-Gm-Message-State: AOJu0Yy0W8xyieb6rHU0ffp7NyI0Z8Vw4jbR8MjFAE9p8ojt0evWZOZ5
	3Rxo9HjsphVI2v/6atBKNTVRDkvj/sBR53atiw1qAWOiz4s5JA/7
X-Google-Smtp-Source: AGHT+IHh2/AbUPDMj3Hmw3iHC21ScZt1IRJwxGj917xgQkf9TrsovD+xoY+j5YDE28M1gNQs9IHFbA==
X-Received: by 2002:a05:6870:eca3:b0:25e:c0b:82c5 with SMTP id 586e51a60fabf-25e2bf101admr6656159fac.3.1720254534322;
        Sat, 06 Jul 2024 01:28:54 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:53 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 19/37] wifi: mt76: mt7925: add link handling in mt7925_vif_connect_iter
Date: Sat,  6 Jul 2024 01:27:59 -0700
Message-Id: <c8d66043a4d31801249d53dd23f695c28a97a933.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012855_175297_A495A553 
X-CRM114-Status: GOOD (  10.25  )
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

add link handling in mt7925_vif_connect_iter

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 0cb9031e9fdd..cf36750cf709 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1267,15 +1267,23 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 			struct ieee80211_vif *vif)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	unsigned long valid = ieee80211_vif_is_mld(vif) ?
+			      mvif->valid_links : BIT(0);
 	struct mt792x_dev *dev = mvif->phy->dev;
 	struct ieee80211_hw *hw = mt76_hw(dev);
+	struct ieee80211_bss_conf *bss_conf;
+	int i;
 
 	if (vif->type == NL80211_IFTYPE_STATION)
 		ieee80211_disconnect(vif, true);
 
-	mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
-				    &mvif->sta.deflink.wcid, true);
-	mt7925_mcu_set_tx(dev, &vif->bss_conf);
+	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+
+		mt76_connac_mcu_uni_add_dev(&dev->mphy, bss_conf,
+					    &mvif->sta.deflink.wcid, true);
+		mt7925_mcu_set_tx(dev, bss_conf);
+	}
 
 	if (vif->type == NL80211_IFTYPE_AP) {
 		mt76_connac_mcu_uni_add_bss(dev->phy.mt76, vif, &mvif->sta.deflink.wcid,
-- 
2.25.1


