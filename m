Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E33EC38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUKy5cLCtr2agTep0UNplkIZGNAtrmGpQ52zbOdfdDw=; b=BYTz6P9DlH4WLt/I/ABOE7BrXB
	GnafHpcRd6asdWQCkiZle0+7H2eEx3Cmrn1HmiSDTi9xBOlUlYILAFHnNRQEzeq2gsTBltHe4kURH
	qe2UxwtgBZFlRjiVArOAcXlPXWCWCYa+dYRJItaiTMMw1ZEoFIt49jdoB7JzfXGpU7eQQKL1fNvF1
	3j0Ly9Ua7fMn1XrlaLL7RwR7ReGuGgiH4a4SmppQa68nGt9dZQSzkOuvPIX+9FsjoTzNXQc542wJR
	TArvpzQXhgonQFE7yn+kAOnm57RjIciRUbyVoh5h+NGpl6UjuXb4Sn09u3r6b6mIML2EPObcviJNk
	cL38HJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mf-0000000HXog-0uEA;
	Sat, 06 Jul 2024 08:28:41 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mc-0000000HXmL-1DMU
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:39 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25075f3f472so367180fac.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254517; x=1720859317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUKy5cLCtr2agTep0UNplkIZGNAtrmGpQ52zbOdfdDw=;
        b=VduYyj10eqA01N7WqZJH2Mkw5jCSWoaRB3UDGL9ji8FVILvLZt+psVeN7dEOHrigS7
         ydthNRWDGIqaRkUkC2y/sQE/Wg7rsXakh8oYCDFIuqmhc1kGWMPoHspH5yIzZwnsPv0b
         OKAUOoo+3rd3m2GeuxdCPdrEC7OB6UuOdIGJRQ36o4gxWfa8PJEUpBZqEmcxaXHPs8O8
         u5qfbgk1wOx1VUM/Wu56gLbSBvh2P9fEdEW5GC2OKabUxNW7DojXuxiSh7OmvRTy4iZf
         OCofh4QPFbw2J8vpTXIQLlbipYARfESjk2z3decGpQBbbd6frm3WnYnYvVfpMy94fLgB
         ob/w==
X-Forwarded-Encrypted: i=1; AJvYcCWk7C0U9x4VGLspOFiNSl1dqxMvtQzYH+wQkGfDtE/3w++ZgtWo0lUSqXqKr2sJXZJpzfUI+kRAo4WNUC15nwRIGC8hiN6+uoQBcaIffWJ3F2dY
X-Gm-Message-State: AOJu0YyYghBA8YP+8J37kI/KzSlzX4SBjXF9MGVQRuE6cNp62lNg9BRN
	ZR9HbAMCWLl+VVLDvSaKmHNWWs7BvqKEXbfiw2V6sWJ4rHCrq3iR
X-Google-Smtp-Source: AGHT+IH+qa3dsDD4Mgin9v93sY0n2Sl8CBjgDZghzcyc5VZ/TSITDy7VrSRro0EJ1uJdtQEiTNmmgQ==
X-Received: by 2002:a05:6871:24d9:b0:254:affe:5a08 with SMTP id 586e51a60fabf-25e2ba1b287mr6406811fac.2.1720254517608;
        Sat, 06 Jul 2024 01:28:37 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:36 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/37] wifi: mt76: mt7925: add link handling in mt7925_mac_sta_add
Date: Sat,  6 Jul 2024 01:27:49 -0700
Message-Id: <632faefe8c82cd5609c2af00aabee15ccc9616ed.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012838_357432_F2CE945A 
X-CRM114-Status: GOOD (  12.10  )
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

Added link handling to mt7925_mac_sta_add to support MLD devices.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index afb58a9206b0..042c9fe5a2d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -885,15 +885,25 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta)
 {
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	int err;
 
 	msta->vif = mvif;
 
 	if (vif->type == NL80211_IFTYPE_STATION)
 		mvif->wep_sta = msta;
 
-	return mt7925_mac_link_sta_add(mdev, vif, &sta->deflink);
+	if (ieee80211_vif_is_mld(vif)) {
+		msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+
+		err = mt7925_mac_sta_add_links(dev, vif, sta, sta->valid_links);
+	} else {
+		err = mt7925_mac_link_sta_add(mdev, vif, &sta->deflink);
+	}
+
+	return err;
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_add);
 
-- 
2.25.1


