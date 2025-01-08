Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300A4E7719A
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 02:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KdsPIydIRIbKmfDENt47w2PJVUxUaEb2n4hB8nXzq8=; b=C490gpxNkqwNGVYUqCxYCIuchB
	GBWwGXpl/wCNEN3o6CrYVJzH4Jw9GY8kjXNByWfVRaeGwgVWICBimGbbzHnpvfXZtxGzLd2U4+vHr
	JswHsw8chd5RvebjnKOJmQiLz3/9uNT9ZPN1DEDvUEulKjVfpt0zn6DopZyWShyCWXxRAvR/Zv39H
	a73hsjVyjsWAbr6bULJdgeVtCOicrXEga/J4na0sldUgQ6zZO+qsxolb8qY1BJI95tfSdqqXmkeU6
	9a9Q/CJfevoKiNxYBqDrTMjXM2ss1Zhf1frYpKkS8KykTrfsXzWnhTXftmpRUFgEGEFwGURvU9klX
	TpTXoAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLqy-00000006utP-0Lfq;
	Wed, 08 Jan 2025 02:31:28 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLl9-00000006tHR-04VG
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 02:25:28 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f2e2608681so8093628eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2025 18:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736303126; x=1736907926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KdsPIydIRIbKmfDENt47w2PJVUxUaEb2n4hB8nXzq8=;
        b=CRxnjrEHck4mIUXZrJf9/QfU39Waqha1ZgGqmh6QzoF7EcsyM6cdFl7yThGfFnbTV+
         G7vVmaEx5JUQT1KOB2N0Ot3oi/J2sv9dYDednEPsJWwh+/vViRETmckjBHCZQHQqgfyY
         wkkSQ22uK26Eqah5c5Sn0vitK54X01Yr5b5dBwlDhobrcqoSlgiHZR7B7m+0/+/zRlLU
         POYMAsiRvZRPZekvZ1TqGHFaZSrhLmuQo4fdPHxt2KOsxEj+kuZjuRAwPSkuahnGHSpc
         XZQQrG7ET8sXSQ6Egs0zsL6MUSWhkntKK9upY4Q8+hruBvoR2/eN1lYQXMwF4CKHal/0
         wFqw==
X-Forwarded-Encrypted: i=1; AJvYcCU0bfH6s5YWuxfh+b/v3dOrv+2B/ZPRHFsyAMcI23SrVptZTp0+I7Vou99cV4ZB5BmSkxKdfefSnkAhA321hA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6I60HFGH+ZrJyLWznHmAaoxeDANh5skbVGiecWTo/bHTUSSB6
	TxB2jD1sZ8aA1T+PDJ9oZBEVQH465n5S0OEGhcEBRJKLPFNTuVYq
X-Gm-Gg: ASbGnctzPHmfXYVsmbTI34sG6BAPHBU7uznZ9dkWrkd8PFKZKgj6cKSDruScV07m7az
	DCXsV5expSLUs5d4UkVr4Nz1Xo3r/XfGBCx4Ag7HTWRzqGWvGEUr37NsCH1PqtLdDg64vAsmPBE
	7rP7MBjmP7XFWAr2BNNxWJZjKKKg8YL6RWZVL/qS47sAjjTb7jCZh69nBVb7A+Nfhg/oMeWULRm
	PojIvzuF0rYy93QB8urI1NtcNKVLTZc6pHAXd+y14WUbCwYQa39ryUoZU0KoOXsc258YZBvdg==
X-Google-Smtp-Source: AGHT+IGs582Bl+Jd+5X8M124/0pd+re+wzXpkBHMXYifN5VHFiYiOQ31GhLfhoJ5EGcBMXMot1q0Fw==
X-Received: by 2002:a05:6870:2007:b0:29e:5297:a2a7 with SMTP id 586e51a60fabf-2aa068d657fmr703235fac.30.1736303126104;
        Tue, 07 Jan 2025 18:25:26 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d77f6340sm13072862fac.48.2025.01.07.18.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:25:24 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/6] wifi: mt76: mt7925: adjust rm BSS flow to prevent next connection failure
Date: Tue,  7 Jan 2025 18:25:07 -0800
Message-Id: <20250108022509.217803-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108022509.217803-1-sean.wang@kernel.org>
References: <20250108022509.217803-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_182527_059196_94C33399 
X-CRM114-Status: GOOD (  12.96  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Removing BSS without removing STAREC first will cause firmware
abnormal and next connection fail.

Fixes: f8797298565e ("wifi: mt76: mt7925: Cleanup MLO settings post-disconnection")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 45 +++++++++++++++----
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 35dede041248..4714c07cfbfe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1155,7 +1155,12 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
-		mt792x_mac_link_bss_remove(dev, mconf, mlink);
+
+		if (ieee80211_vif_is_mld(vif))
+			mt792x_mac_link_bss_remove(dev, mconf, mlink);
+		else
+			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
+						link_sta, false);
 	}
 
 	spin_lock_bh(&mdev->sta_poll_lock);
@@ -1175,6 +1180,31 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 	struct mt76_wcid *wcid;
 	unsigned int link_id;
 
+	/* clean up bss before starec */
+	for_each_set_bit(link_id, &old_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_link_sta *link_sta;
+		struct ieee80211_bss_conf *link_conf;
+		struct mt792x_bss_conf *mconf;
+		struct mt792x_link_sta *mlink;
+
+		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+		if (!link_sta)
+			continue;
+
+		mlink = mt792x_sta_to_link(msta, link_id);
+		if (!mlink)
+			continue;
+
+		link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+		if (!link_conf)
+			continue;
+
+		mconf = mt792x_link_conf_to_mconf(link_conf);
+
+		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
+					link_sta, false);
+	}
+
 	for_each_set_bit(link_id, &old_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct ieee80211_link_sta *link_sta;
 		struct mt792x_link_sta *mlink;
@@ -1213,6 +1243,7 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct {
 		struct {
 			u8 omac_idx;
@@ -1243,14 +1274,10 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	mt7925_mac_sta_remove_links(dev, vif, sta, rem);
 
-	if (ieee80211_vif_is_mld(vif)) {
-		mt7925_mcu_set_dbdc(&dev->mphy, false);
-
-		/* recovery omac address for the legacy interface */
-		memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
-		mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
-				  &dev_req, sizeof(dev_req), true);
-	}
+	/* recovery omac address for the legacy interface */
+	memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
+	mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
+			  &dev_req, sizeof(dev_req), true);
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-- 
2.25.1


