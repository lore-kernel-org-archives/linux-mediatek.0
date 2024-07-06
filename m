Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC34C38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxHeMh4wlCaNsBAEaEhqWJP5pfcIdTUVwY854lC9UJQ=; b=VWBWPYpFquJWqcyvMMU/Wga1F9
	S3f3xetR43IhmmfZiDTz1sDv/Z+trlLCthYcBUiWACa8b8XIwNcOZAhm5bDdjgsr0DruZn11Q17xI
	2glApIkI+a7EYJUHFmX4UfSzcFJtwnxoTQPGxZxtOwBnLh88j3C1jUp3nflselpH/evmxo5nV1Fkr
	KsycM8Tv0V9/1CjXwzaz5SKGo+M62XDOPFKeELjz91QqOSy33c9Vl/O+cS7vVbU2ptNjxRSKvuR1X
	k2U7nl/RI+ttgLwddkmJ4EIjqBRewCebOjq1L+4bqVL/pfIX6IIk8EWwphAeADJVoi2QZD4rkyKEB
	zTp6mO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mp-0000000HXw7-2HLg;
	Sat, 06 Jul 2024 08:28:51 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mm-0000000HXth-3yUN
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:50 +0000
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5c223f2f97bso42500eaf.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254528; x=1720859328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxHeMh4wlCaNsBAEaEhqWJP5pfcIdTUVwY854lC9UJQ=;
        b=NifV1E0QxzRAmOAqkXzShbBVw15jLyhZA3l1vndhTZ9W+8UWk++CYPFplF7tfpylqM
         7CgJ8Y9Uy1ttT10T/+X1GNbaeBUbjMxI753w6b6UVGAZkOYWaMKWYWQDeQGiAvHNpHRg
         yEMKDa8by6XJ6DjDmFVMvClRN8aXjX6YMEuKbek5Yz9z5rjParT2yKGxGAluELwkippg
         N4iZjXDuJfwjBis+UDcyI7dv5VIvFG+B0mXs2GkwSIy9BYgPFgkgHuwWVtA2WxAvyrEf
         hnS/5dYL3Z+ToJCzHAPw2T7I6LmOribIEgtGLK+8+L2Mmz07Roh5DVT4g1VpGs9Fg3W/
         2ZdA==
X-Forwarded-Encrypted: i=1; AJvYcCW9qsBVyCXNNKpPZysXwaYpEILMAU/lQUv+y268pTd+9dSxYSDnK8mjl6EjzgDo3NNmILm5DhCveXnPT5AtN4PQBY9zhmAP1yPwVmMpQGYtB/GY
X-Gm-Message-State: AOJu0YxDdMnfynC+g4+xCr6vegCG2fmcbbZCmdEO259dZyYdtt2V9WOC
	gcigCiDMvFGGO/L8itCeHZxWDnnvbptQy+1mOrEPJ7QmaR1yNY/z
X-Google-Smtp-Source: AGHT+IE97gP4q0ZkWnwJvWnniBVGYpKbvU3SGVfqlg+6uBeR4gYRI0sjUfKWO+BbR90ANYfMGNFWyg==
X-Received: by 2002:a05:6871:5229:b0:25e:dce:491b with SMTP id 586e51a60fabf-25e2b8b79abmr6843594fac.1.1720254527757;
        Sat, 06 Jul 2024 01:28:47 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:46 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 15/37] wifi: mt76: mt7925: add link handling in mt7925_mcu_set_beacon_filter
Date: Sat,  6 Jul 2024 01:27:55 -0700
Message-Id: <b814718a40ad5df6100e63d15c87ba95a318bc22.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012849_064023_FA0BA722 
X-CRM114-Status: GOOD (  10.65  )
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

add link handling in mt7925_mcu_set_beacon_filter

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 43c20fdb747c..9a4dfe53da17 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1818,21 +1818,32 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
 {
 #define MT7925_FIF_BIT_CLR		BIT(1)
 #define MT7925_FIF_BIT_SET		BIT(0)
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	unsigned long valid = ieee80211_vif_is_mld(vif) ?
+				      mvif->valid_links : BIT(0);
+	struct ieee80211_bss_conf *bss_conf;
 	int err = 0;
+	int i;
 
 	if (enable) {
-		err = mt7925_mcu_uni_bss_bcnft(dev, &vif->bss_conf, true);
-		if (err)
-			return err;
+		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+			bss_conf = mt792x_vif_to_bss_conf(vif, i);
+			err = mt7925_mcu_uni_bss_bcnft(dev, bss_conf, true);
+			if (err < 0)
+				return err;
+		}
 
 		return mt7925_mcu_set_rxfilter(dev, 0,
 					       MT7925_FIF_BIT_SET,
 					       MT_WF_RFCR_DROP_OTHER_BEACON);
 	}
 
-	err = mt7925_mcu_set_bss_pm(dev, &vif->bss_conf, false);
-	if (err)
-		return err;
+	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		err = mt7925_mcu_set_bss_pm(dev, bss_conf, false);
+		if (err)
+			return err;
+	}
 
 	return mt7925_mcu_set_rxfilter(dev, 0,
 				       MT7925_FIF_BIT_CLR,
-- 
2.25.1


