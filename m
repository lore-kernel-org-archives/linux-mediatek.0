Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880D7C3DA40
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfyFCkyFCvgSR1kwXfpvvrzkz9hGipNgrPtLfbnBC/k=; b=I84g80zF9G5ac/G6d5AkrbKeD/
	C6cvPUXbUehXkvn9KpMTs+tfPw5c8HxwEqXfO00U3ttg6qm3we65NkEnCQx6iQOwAG7EVOtdA0w/T
	uHKXCgiu6Ow1CvRWfnnMpAFQzhmSfffLRSrsPyNP+fZvc3+dnk3MrT4ddN5yVU/gKTjr7MNfOjmgS
	mSbv0wnolpLKcGWnW8/6d7ej6AwVH+5X+MiXDxQg5Fffiozm9onf8EUzA5kyxFj57eSLTLrq/AE/0
	jRgGKUdm6cd433gWIYh52zueFlSSUd+lmi7j5QbUxLJhkW8HWAzUlWAJQZB6TAi0vxLMRfPlcUGp9
	yh9vzf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mp-0000000HXvk-0fko;
	Sat, 06 Jul 2024 08:28:51 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mk-0000000HXsY-3Qxv
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:49 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-24c5ec50da1so284883fac.3
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254526; x=1720859326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfyFCkyFCvgSR1kwXfpvvrzkz9hGipNgrPtLfbnBC/k=;
        b=EBUfK7lDskKWZPfiL+hn68hl9Jtz/MI4oqm6J+Dq9/sfMRAh8Nf3ntzW1qICLae3yy
         m2ft3veV2Jvup1LWuiNLeI9W/EvClZ9MYHO898v4wAXuETouioPFWnuWCUgU8cVMC6uE
         kANY7c3ueKgeVw2548cXgle3V2JsYscu1r8N4YIljRTujPRyTP2SOadc84obWJtduZrp
         SGzoP8xz0XwMdNOVMVmzH7HL+tO2oDMyZm5fQSadY6oP4rp1cFoKjupvbH7ptOIPQqGI
         DrNg/cjjl8MuwqXj4ZTSXhOBBRzX+DjPLtf2M5dDIw9D1T0ns8ux9np0xvOZPYRyp2sq
         PooQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ROsMRBxJshaBrx96Pas8Uga+pnBZ70QPkx3bpAse8W1aYSao2+ksqPEux4jez++BlTWibha4rSiccUOZenoHOvL0XvEbSCc0hFSqMqyJMAiF
X-Gm-Message-State: AOJu0YxVkSB7vvrrOCPZ/oAtZENGbhMRYoiRXIgF3haGsUUfKjbt4GFx
	F0bZkiKaROftn2FHc84uAW5FDi+ilCV883RqDo5CjJVVFYXszah1
X-Google-Smtp-Source: AGHT+IGjXRH5F+dHX9ZUzRhbiIaHxUXVqCoRgBDTO6Urq55bjKtulj+29cunN0oxXn0STaCgcU/MpA==
X-Received: by 2002:a05:6871:24d7:b0:24f:e599:9168 with SMTP id 586e51a60fabf-25e2b8d0139mr7038119fac.1.1720254526030;
        Sat, 06 Jul 2024 01:28:46 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:44 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 14/37] wifi: mt76: mt7925: add link handling in the BSS_CHANGED_PS handler
Date: Sat,  6 Jul 2024 01:27:54 -0700
Message-Id: <542ca29261af0cac007d2cb821ed36284d51c679.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012846_910660_B7195927 
X-CRM114-Status: GOOD (  10.98  )
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

Added link handling in the BSS_CHANGED_PS handler.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 957e6bcaf9c1..938909ab8d1c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1637,6 +1637,7 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 				   struct ieee80211_vif *vif,
 				   u64 changed)
 {
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
 	mt792x_mutex_acquire(dev);
@@ -1653,8 +1654,17 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 		mt7925_mcu_update_arp_filter(&dev->mt76, &mvif->bss_conf.mt76);
 	}
 
-	if (changed & BSS_CHANGED_PS)
-		mt7925_mcu_uni_bss_ps(dev, &vif->bss_conf);
+	if (changed & BSS_CHANGED_PS) {
+		unsigned long valid = ieee80211_vif_is_mld(vif) ?
+					      mvif->valid_links : BIT(0);
+		struct ieee80211_bss_conf *bss_conf;
+		int i;
+
+		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+			bss_conf = mt792x_vif_to_bss_conf(vif, i);
+			mt7925_mcu_uni_bss_ps(dev, bss_conf);
+		}
+	}
 
 	mt792x_mutex_release(dev);
 }
-- 
2.25.1


