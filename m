Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DF7C3271E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g37T4CjI6r9HOceV/Z2FL5pGlk5t0qMk/CEhDyaAnXw=; b=nw/j4GJu+VwYheYnZmNmYzyqIB
	g5YdPR/7qS4+MmDg9MJxJI2zDtfTONrYkDKYHddgdgVl/XFb2FnrK0o1WN0DNHPtKITdtXUt7OYBw
	XjkLA0lDPys1B1fMwqArxFVKfF+U476pK3/uk1Hyv4gToVv0FaqeQEp0C2tg4Qov6akpUnVx7Sdil
	mj+Yk/P/42tgPfuWMXOjSNt7MlivLPgMhXbUT5looUWarRyalmcYrJJbhe7zZ272d4Ji6WJQf7Ym4
	SJpcEH9l19Bsk68i0mrHWc5QLRltbd4FMFBTLl4FK5Oou3CXjlEkMFJqck7btg8TSfJbztK9KVbFH
	Zl652x0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lM-0000000BXNl-0OFc;
	Wed, 03 Jul 2024 21:43:40 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lI-0000000BXLP-04fR
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:37 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-702021fba9bso113280a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043015; x=1720647815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g37T4CjI6r9HOceV/Z2FL5pGlk5t0qMk/CEhDyaAnXw=;
        b=GdoB1gwkmw79ZkcxCS5/nNDtL6GXaSOjIshcVhmzvZm0aLyxFJ5b4q5wEMStwOemdj
         9kUAcZkh26lvXKQVBS3A7D0kM2g0EQ+KU19zoNmJ7WhWSZuP5W0SpkLfwz7lEAenepms
         ySR7OR7J6NzvtAfbffoQH6MjB9BborBnKeFB78Js8DdOBxDCp2JnQUv19lbffBnjRzeO
         gZ0+nU3RjxBRxlCClLN4ikZAkFclWZAYWkmeR/j0ItctRFFgEq8nvmGuenUcV+0Enuz8
         PqLtUXqWpNp6MYyBtDIvEFhEzRgsPxg8dlUvxKwnr3kS0y+u5a768OZ3WmeXoaCXeKIQ
         IKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Cqa6dbh4gjnF4tFYF9AU2Asz/kcE781/Vgn3e9bdNRhov0HHyDZggYV5HiAI8zB8rAQqlQ5NAhQ7uHw57iySTMUm3QqMdMERZe6b7MvkpIKA
X-Gm-Message-State: AOJu0Ywk6NJ0O3218MSv6VN2RLfoHlVMOI1bFjrpOxgaSI4PqGQsAuNB
	zR3Jn1UXMra7ViqcFy0m0xK/O13GGU8V2NRmpj/yCUjQM12kzBva
X-Google-Smtp-Source: AGHT+IGZQAxkdXIk+I8F4X/wcmiceJqFKgT51xCUKYrAA7cmb2oD4iG5Df3wtgYhrthp3Cx1CY5XHA==
X-Received: by 2002:a9d:5c89:0:b0:700:ca11:1158 with SMTP id 46e09a7af769-702076766bcmr11947539a34.1.1720043015253;
        Wed, 03 Jul 2024 14:43:35 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:34 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 23/29] wifi: mt76: mt7925: update mt7925_mcu_sta_mld_tlv for MLO
Date: Wed,  3 Jul 2024 14:42:28 -0700
Message-Id: <99eac993f7020488f0debf972e2fc71f4bca36a4.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144336_081705_05B79B65 
X-CRM114-Status: GOOD (  11.35  )
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

Update mt7925_mcu_sta_mld_tlv for the MLO-enabled firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 3f0ceebed2f8..71f1fb9fbe2f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1735,19 +1735,34 @@ static void
 mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 		       struct ieee80211_vif *vif, struct ieee80211_sta *sta)
 {
-	struct mt76_wcid *wcid = (struct mt76_wcid *)sta->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	unsigned long valid = mvif->valid_links;
+	struct mt792x_bss_conf *mconf;
+	struct mt792x_link_sta *mlink;
 	struct sta_rec_mld *mld;
 	struct tlv *tlv;
+	int i, cnt = 0;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_MLD, sizeof(*mld));
 	mld = (struct sta_rec_mld *)tlv;
-	memcpy(mld->mac_addr, vif->addr, ETH_ALEN);
-	mld->primary_id = cpu_to_le16(wcid->idx);
-	mld->wlan_id = cpu_to_le16(wcid->idx);
+	memcpy(mld->mac_addr, sta->addr, ETH_ALEN);
+	mld->primary_id = cpu_to_le16(msta->deflink.wcid.idx);
+	mld->wlan_id = cpu_to_le16(msta->deflink.wcid.idx);
+	mld->link_num = min_t(u8, hweight16(mvif->valid_links), 2);
 
-	/* TODO: 0 means deflink only, add secondary link(1) later */
-	mld->link_num = !!(hweight8(vif->active_links) > 1);
-	WARN_ON_ONCE(mld->link_num);
+	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		if (cnt == mld->link_num)
+			break;
+
+		mconf = mt792x_vif_to_link(mvif, i);
+		mlink = mt792x_sta_to_link(msta, i);
+		mld->link[cnt].wlan_id = cpu_to_le16(mlink->wcid.idx);
+		mld->link[cnt++].bss_idx = cpu_to_le16(mconf->mt76.idx);
+
+		if (mlink != &msta->deflink)
+			mld->secondary_id = cpu_to_le16(mlink->wcid.idx);
+	}
 }
 
 static int
-- 
2.25.1


