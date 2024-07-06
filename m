Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC54C38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmZqqZxko2JYQVXtVLRpulxVIyqXof1xyUbUxDuvHpQ=; b=AyspfN0k/Lhpd8d16Nyw0o3uoS
	G4bcszhBo7IXvIMV8Rexi1MikksukNJoomSRIqWUdHp0bENjXY4UzF+b+lmisxDgzd7zFOdGbUtTG
	TGc2qgGGn9+fsuvFhB2w+dq/0YaYWqMMWeusUQMP6cmWimW5sBIIoKqufozAUk6yg38tKC7LjxeGl
	I6CmC39tevNx09zP+MZr6ki1LlHqp+O5vtkNv6U7GJpXa1Kk1ASomqerNE5S263y0oQRgzGEOriB1
	0UVFL7gEDICAeMXKVcsAHYg6JUywmgwOLqGrm3aIWAYSPHbiet6Ds0OnO7RY0LwUP46U4+MjaDUEK
	U6fxx5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mz-0000000HY40-3fX0;
	Sat, 06 Jul 2024 08:29:01 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mx-0000000HY12-01j3
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:00 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-25cb5ee9d2dso294079fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254537; x=1720859337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmZqqZxko2JYQVXtVLRpulxVIyqXof1xyUbUxDuvHpQ=;
        b=T5kmdwpLSP5ZeQ/GnKK3H0EpuezDESA2iQLORtjnvx1eLKtO072tWLFszOsqcL5IEN
         hQk6FnbC14Eak/Th7eP/ho+oMJYGjNpfHne9V8Qgc4yxXcuUB6KdV6UpwF8eKULTJsG8
         2ysTTZCMR2fyRdkKXhAQQozfF5rFK4GKw7hJ2UK2f/5RGrSp+XN8HeD+YV/jF6l9uZhM
         NUgTIW0cv1frw5R+BFEE9Mr5XYJXIVBkvqgNOu5NxVsnzW6xC6YTrwiMjAWlaNtcauRH
         iuzbUoYNFY3rZCuY9mn4TnTHArdiWWu69XRFxLASlkVMKbyTCN2xFSnNzpHDkhR/RgSy
         GZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEdsbMnDOF/ylSJjjA5NxJuiUM7invqUCH7rxVyq8GtcwKDkoW9+H2FhrAZL0OvWZx50UAJeLrKLoSUw60T3W7QQ4FAE5l/nCz+82QVO6DS+28
X-Gm-Message-State: AOJu0Yz6RL0PQxR1ZXUhTIq8iHW568mr3dfnRnZVNPWz5hK1UBxRbsJH
	c6eCa3PGenofjxvqQX1xIBhzoVfgTobtmAjH74/Lhv2iO8Mk6i7SpItDOAh/
X-Google-Smtp-Source: AGHT+IFwOST0MVMtQVt8L7b27qxOca8D10UEvbV6G/pxUhHNqHvSniuXGuirugc0in75BVkca56RgA==
X-Received: by 2002:a05:6871:24d7:b0:24f:e599:9168 with SMTP id 586e51a60fabf-25e2b8d0139mr7038261fac.1.1720254537630;
        Sat, 06 Jul 2024 01:28:57 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:56 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 21/37] wifi: mt76: mt7925: add link handling in the mt7925_ipv6_addr_change
Date: Sat,  6 Jul 2024 01:28:01 -0700
Message-Id: <ed429b1896cc10c8db25dc2ade3e59bec78d7131.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012859_103317_EB2C7744 
X-CRM114-Status: GOOD (  11.26  )
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

add link handling in the mt7925_ipv6_addr_change

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 8acce16d88d6..54479c2fc167 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1490,12 +1490,12 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 }
 
 #if IS_ENABLED(CONFIG_IPV6)
-static void mt7925_ipv6_addr_change(struct ieee80211_hw *hw,
-				    struct ieee80211_vif *vif,
-				    struct inet6_dev *idev)
+static void __mt7925_ipv6_addr_change(struct ieee80211_hw *hw,
+				      struct ieee80211_bss_conf *link_conf,
+				      struct inet6_dev *idev)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_dev *dev = mvif->phy->dev;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct inet6_ifaddr *ifa;
 	struct sk_buff *skb;
 	u8 idx = 0;
@@ -1509,7 +1509,7 @@ static void mt7925_ipv6_addr_change(struct ieee80211_hw *hw,
 		struct in6_addr ns_addrs[IEEE80211_BSS_ARP_ADDR_LIST_LEN];
 	} req_hdr = {
 		.hdr = {
-			.bss_idx = mvif->bss_conf.mt76.idx,
+			.bss_idx = mconf->mt76.idx,
 		},
 		.arpns = {
 			.tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_ND),
@@ -1544,6 +1544,23 @@ static void mt7925_ipv6_addr_change(struct ieee80211_hw *hw,
 
 	ieee80211_queue_work(dev->mt76.hw, &dev->ipv6_ns_work);
 }
+
+static void mt7925_ipv6_addr_change(struct ieee80211_hw *hw,
+				    struct ieee80211_vif *vif,
+				    struct inet6_dev *idev)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	unsigned long valid = ieee80211_vif_is_mld(vif) ?
+			      mvif->valid_links : BIT(0);
+	struct ieee80211_bss_conf *bss_conf;
+	int i;
+
+	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		__mt7925_ipv6_addr_change(hw, bss_conf, idev);
+	}
+}
+
 #endif
 
 int mt7925_set_tx_sar_pwr(struct ieee80211_hw *hw,
-- 
2.25.1


