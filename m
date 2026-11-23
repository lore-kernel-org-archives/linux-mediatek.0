Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8307606A31E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mrxt2ly6;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=oOyxLzrB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Message-ID:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c0z8mGhw1gEtfDzRgfSbjxN3RAnNpBLR7FXcIzFsFr8=; b=mrxt2ly6q2xx25w5jC9t9Drx6Q
	iDJZEMfPK2NqCNYvO03PwQKMZbRBGcRbj1pXc1eidamHpTkdOpZ54Cq9NbqGi23NRfAVuyryMNWSi
	ZOBAkEVb4PjdNpYErEO4NF5tjBirtezx5DgGwjB/rn7EICYlMVa6Nu7azT/bX4zCtnQ3SuBoN3scE
	/JimKvvVsQmhwKuhv5er035eMTfAOfj/mEGHjcdwwlH1Ak6iqdwAQdDozxs8IfLUdPXByT+IwS5dX
	SXN2oXXNjWole95cGZYRMpQhZRxJMrXyU2F5B/dm5FSQuMn3bShmgbAXkUwQhBFqg2MyglOB/df4G
	Pyf2Rerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQCy-00000002gGw-1Kva;
	Mon, 23 Nov 2026 09:19:32 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQB8-00000002fjU-2BJK;
	Mon, 23 Nov 2026 09:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1795425449; bh=0NaLGEZPj32zgH/oU64wfMuqILAJnnZvT802hbIKr38=;
	h=Date:Subject:From:To:Cc:From;
	b=oOyxLzrB5eb2+KfnYnpuPwX5kRj7ywK3OqKP35XM5/3xuL2I30+28Fm57gxzZnijo
	 PCBDQr4/k/2KFpbrykzOQgRbTZMHhl37Rfc8d2kHGpUVF+mm2M3vH6hHc3jdjxpEoE
	 4TDS4DMbXEWU4Le3mKZaYBwgJBUjBpkVKgbPRrSZzoyYUIuCKmu6KYfjr2RaNSJ8Oh
	 ov2IEp5lsHRNY81d5WHT59c3NoDk3hrC+zPJI3hnR7GQhEqvSR2je8n29+UP3iHTAt
	 NVHf5HNsG3xvhQh+WDr/C8E2N3w25Di4mDEXbtdw56OGQXUSN8MIuKhJRHR6INLU22
	 31HEn9bmli7DA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.6 at mail
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with UTF8SMTPSA id 4jY0hR2m1Nz5j;
	Mon, 23 Nov 2026 10:17:27 +0100 (CET)
Date: Mon, 23 Nov 2026 10:17:26 +0100
Message-ID: <001bfb2024a3941fed1c2fe7eab9caa1462ad3b1.1795425090.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2] wifi: mt76: mt7925: deduplicate MLD support code in
 mt7925_mac_link_sta_add
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sasha Levin <sashal@kernel.org>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	Leon Yen <leon.yen@mediatek.com>,
	Stella Liu <yu-ching.liu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011743_198011_68AABFDE 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Simplify mt7925_mac_link_sta_add() logic branching where
mt7925_mcu_add_bss_info_sta() and mt7925_mcu_sta_update()
are called with identical arguments.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 v2: rebased on top of commit 3eea7a990506 ("wifi: mt76: mt7925: keep MLD membership consistent during link add")
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 36 ++++++-------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 15d95ad32636..22cc5b49da0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -918,6 +918,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	struct mt792x_bss_conf *mconf;
 	u8 link_id = link_sta->link_id;
 	bool wcid_published = false;
+	bool is_secondary_link_sta;
 	struct mt792x_sta *msta;
 	struct mt76_wcid *wcid;
 	bool pm_woken = false;
@@ -962,6 +963,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+	is_secondary_link_sta = ieee80211_vif_is_mld(vif) && link_sta != mlink->pri_link;
 
 	/* NAN_DATA (NDI) peers skip association - fill link_sta caps
 	 * from sband and push BSS_INFO with correct phymode + RLM.
@@ -983,33 +985,21 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 		struct mt792x_link_sta *mlink_bc;
 
 		mlink_bc = mt792x_sta_to_link(&mvif->sta, mconf->link_id);
-
-		if (ieee80211_vif_is_mld(vif)) {
-			ret = mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
-							  link_conf, link_sta,
-							  mlink_bc->wcid.idx, mlink->wcid.idx,
-							  link_sta != mlink->pri_link);
-			if (ret)
-				goto out_pm;
-		} else {
-			ret = mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
-							  link_conf, link_sta,
-							  mlink_bc->wcid.idx, mlink->wcid.idx,
-							  false);
-			if (ret)
-				goto out_pm;
-		}
+		ret = mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
+						  link_conf, link_sta,
+						  mlink_bc->wcid.idx, mlink->wcid.idx,
+						  is_secondary_link_sta);
+		if (ret)
+			goto out_pm;
 	}
 
-	if (ieee80211_vif_is_mld(vif) &&
-	    link_sta == mlink->pri_link) {
+	if (!is_secondary_link_sta) {
 		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
 					    mlink, true,
 					    MT76_STA_INFO_STATE_NONE, NULL);
 		if (ret)
 			goto out_pm;
-	} else if (ieee80211_vif_is_mld(vif) &&
-		   link_sta != mlink->pri_link) {
+	} else {
 		struct mt792x_link_sta *pri_mlink;
 		struct mt76_wcid *pri_wcid;
 
@@ -1036,12 +1026,6 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 					    MT76_STA_INFO_STATE_ASSOC, mlink);
 		if (ret)
 			goto out_pm;
-	} else {
-		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
-					    mlink, true,
-					    MT76_STA_INFO_STATE_NONE, NULL);
-		if (ret)
-			goto out_pm;
 	}
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
-- 
2.47.3


