Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F07C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L17xDYgVdAfPX0dyJlUo8j3jUMWLwVqA5L7fwy5iAF4=; b=bd0GNW4R1UTuGMHYZvW8L5xm8z
	SLh/HJVq6C8K7nvDCI8c35qbNsDTkQYYV6sLkRpk48xXFmOYuu5tpKdPutTyMzgpA08WtCnFuXWAQ
	WA3/h3iU+fJLQGsIg6/wel2b9yPL39XLOjwqXHH9RqABTWt2kH2wrAB1h12uo1Zry8S3B1+E/O4aL
	IHjZhuyeH6apTZLV8NQOt/RWBDZeWJD1hjOp81GInMShdxwjg/DI5y412sSKjjaVrjOTomZudvwPL
	ebrPLDLRhnJNmlUtTqUKgWhoTCZsE9sLuiqsg0k80z7fLmWND5XHRUd4Mf/1c5eeGB10NWlTl+ubp
	hr+r455w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n2-0000000HY5j-1Joo;
	Sat, 06 Jul 2024 08:29:04 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0my-0000000HY2U-0owk
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:01 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-254939503baso94605fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254539; x=1720859339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L17xDYgVdAfPX0dyJlUo8j3jUMWLwVqA5L7fwy5iAF4=;
        b=dbB+lsE1iPOEl6hnfXkJM5z2nYgyw+MqU0ecNywCQcCK8F2jwYmKWOgbyoMoZe8cz1
         FYFc5F5lIR2mId3e09zeI42+tD6rLwjLUUA/Mxi8O2zb1dcmlnCF+DH7BiKF1/JXYjQg
         9CS94UBFRBSZZvHimwGhE4I3f9zaxS240h/IoD6Bt+hiWxRt4Vf8/QcC82rYGNW9n9b2
         L1JcJ6eusTMCCTnhlS4DE2I8muz+R+2qXe/7KKRtXF3JLHgEiMGY75rsoEsMVvxHiIi7
         W90TmU79Q92vT0wCsIiML1ql/q7+lKRmC6VpPCHauYix+7PIvM6p0SG+m1AwnZXGQQCR
         +xIA==
X-Forwarded-Encrypted: i=1; AJvYcCUN+/4nj5qZJcN9BeIkS30TixrtCnX8lUcJs3shVO4bYICmX1m317IOoRgR6PYRqeOZEENJnA9yIVAUpg7CPFmVzjuSWwvzDq0sAvFd2WN1Jqkx
X-Gm-Message-State: AOJu0YwSajMHGPjepDJOHcb8znqsSqDSmgm15yW/NxQZbXzZLiLmfXJw
	+dkQ9cffw3S8L+wafnjgsqnG9z2FMn+Oo8Jd8DEPczNhO8UNs21P/EHGboz6
X-Google-Smtp-Source: AGHT+IGcPB4DMUSotfZxfYkuA3vtERCQ08CkirXCvIo6j47xA/pJmbNAaY+olGcoE1et+KNb9FBa9g==
X-Received: by 2002:a05:6871:24ca:b0:254:ecbd:1815 with SMTP id 586e51a60fabf-25e2bffce48mr6346814fac.5.1720254539381;
        Sat, 06 Jul 2024 01:28:59 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:58 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 22/37] wifi: mt76: mt7925: update rate index according to link id
Date: Sat,  6 Jul 2024 01:28:02 -0700
Message-Id: <e0bbc0932edbd9225fe7b7736693c137cf433a52.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012900_316320_2D6D6FE0 
X-CRM114-Status: UNSURE (   9.19  )
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

From: Sean Wang <sean.wang@mediatek.com>

Update rate index according to link id.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 54479c2fc167..e1af5b4179b0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1801,9 +1801,12 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 				     struct ieee80211_bss_conf *info,
 				     u64 changed)
 {
-	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_bss_conf *mconf;
+
+	mconf = mt792x_vif_to_link(mvif, info->link_id);
 
 	mt792x_mutex_acquire(dev);
 
@@ -1817,16 +1820,16 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_MCAST_RATE)
-		mvif->mcast_rates_idx =
+		mconf->mt76.mcast_rates_idx =
 				mt7925_get_rates_table(hw, vif, false, true);
 
 	if (changed & BSS_CHANGED_BASIC_RATES)
-		mvif->basic_rates_idx =
+		mconf->mt76.basic_rates_idx =
 				mt7925_get_rates_table(hw, vif, false, false);
 
 	if (changed & (BSS_CHANGED_BEACON |
 		       BSS_CHANGED_BEACON_ENABLED)) {
-		mvif->beacon_rates_idx =
+		mconf->mt76.beacon_rates_idx =
 				mt7925_get_rates_table(hw, vif, true, false);
 
 		mt7925_mcu_uni_add_beacon_offload(dev, hw, vif,
-- 
2.25.1


