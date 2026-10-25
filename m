Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C27606A31A
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Oct 2026 14:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SUAWUPOQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PUg59jDr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vrMXt1z7sqI2rPBLPoXnJ9DxZ7jNjEuTfkEKdCrv0eo=; b=SUAWUPOQX2nq+Ocuj5DDJe93kD
	ObkJcFfS48iTmT8WZ1lZW/WEUa7Oj53yOFFF/RRj+6q3ICr3fTNefsIKBBouGPopZhzfwHXdqfkJX
	VfQTU+SmRWvuyGwAzA/jJp/d2DB/jpXRZmIRbG/GC7z6no+YSIRQ5uPXws2EqedlNjYaom27Wf7gA
	Y8JgJsuOPjFoKGUl01/hzYNsbR2GoTErYh9GASAGTcb1ccCSq4nAFasTd4knszyE3TVLjtTWZBqz7
	uuZC3RtNvEQ7Yq0BeO9YmQZpWLaK2jf1+mWlkPWKjunTCeNzijrfIHtxc0R7y1izYVGZpYweMqPHh
	oHJU8KEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKynT-000000016G3-2fFb;
	Sun, 25 Oct 2026 14:02:03 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKynR-000000016FR-3x0f
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Oct 2026 14:02:03 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-3535a54bed9so3561391eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Oct 2026 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936920; x=1793541720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrMXt1z7sqI2rPBLPoXnJ9DxZ7jNjEuTfkEKdCrv0eo=;
        b=PUg59jDr/0i4TNIj2N0p8dqjW0vLzU+oxpJlfmIaEUaU5a8XnOth+xd1wSYSQFvrma
         qAglj0Dnv1Qedb0uUQ7bM12OmIMNBDyHx5Ed1FbICtRoU+rE3i6VPwJYpdHSVf2vWAEc
         op+FUkv3QUT0qmMyGSOHOnzHsQqO/jmV9/tW0ULDQQeoe70r0hqGMvOLB2LFGOg3lQlQ
         sACESL+RFLA3MtrxApZ4nXlhbz8gl8C9rJoWLX4/s/Y6l6gzARoEtJ2a+dBRJ8C6NcCs
         0DKM+6nFC8cZQQRmpjqciKqjaecfoMhQUXDOAe9BVxn4ZYi0WoagNf/rceTKTf4ZG3yF
         P+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936920; x=1793541720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrMXt1z7sqI2rPBLPoXnJ9DxZ7jNjEuTfkEKdCrv0eo=;
        b=aHi1K5Ugf37ov03UU1aWG/3e1SXacIvsBnZo/EdFfGnwgQcf4UMDQakOb2X6GE4Lbr
         Sho02ailOGMO/CoWI8dfbWNSN9NoHXJ+6LTd5P/VYwfYyW3DNt0O0NoLM6z0zpM6Dvm0
         O0TARyr7Gbfc45GHlFYTmktMl+svdwke+7s4h48UbI+U3Be1cjJyN90/m21Nor6gowWf
         Fa2vaul3FnegB6xCQHRp2wwAnJTfhlNt5htaOeY9FxOLbClST+ZAjbmv/IOpcUXQspnV
         s8isQZMNB60Pj6ARSfracUjTVi9fG+rbNGKU8j5bhKAymOVasrmMaV892O6o1XlRLZ8Q
         rObA==
X-Forwarded-Encrypted: i=1; AKwUvBzgu/aHK5LnhWWnMaH/CbmQDEtZJaXWK2JbRMZwODpi+v7iejyk64VpnqU2iPn/+K49o7GanhJV4ab4jCG06g==@lists.infradead.org
X-Gm-Message-State: AFq9FYI9kjLAgRK8+4QPvXNBDzoyrKGLaOvA1MB8Rzng+9Iboqul0//v
	+s6oc+oR8RGsoMK1+f0KoDZnuMLtsFakPtjeN/T/7VfDFWguTqdN8QWd
X-Gm-Gg: AYBFou21Ls8EpcopIeuv6N1szhmbhOKcrxE1He/s9YO7wPjdfGszzr/ATprxIU5MAC5
	w3wbUrkI0x2+70KYD9c0tpPIXf0Z2+M9gMduwsM3ksHQ0/5a1lRpEkacM2fddpKLzbKTXUXnVJ1
	JPGBoqYi4dB4HxlWQ7s/EI2u0lztskAVAmNJwl5akd7PWQWYGTZTaXhGRAhaRdJUTKjrWOwT4u9
	jP5ZhLCvApT6Ky4l+vVFFFiWE+eOFlHEh4aEQebX1OVWqU+VFt05cxwOTnmMG13IRQ25Zj5jqBS
	IasxKdnIBTKl6U1X2ivzaTk1LPI8vJAzf56nIK6iT0rgZCvhHKSAjJB1xpZzPZV0fT2PU3474xE
	ry5VT/v0P3V/+9O1DmqOMxHBImrGgtmbyIbexCbnyZFDr+cDO6l0RIKzB3i9WMpeDSyN/6EuGFQ
	GDCB3dtmY/jCzRxo5cEiiqHyyL7IKtmNm15k42YFUySQyBQxPH+RCsWzh752CTLvIl0CmccELEs
	fZ93982qBbD6dTeu6pgAPDKNbmyd/zcErTedKOoZ728IAyzdwa+uk9GrZz+f94+9oGgbz1+2EXb
	QhbGrT0CsaTfdTcTn7CnYso7J8le5dtV37/iDy8=
X-Received: by 2002:a05:7300:8aa0:b0:35c:ceb0:8bf9 with SMTP id 5a478bee46e88-369e84e00acmr6241494eec.38.1792936920256;
        Sun, 25 Oct 2026 07:02:00 -0700 (PDT)
Received: from Gris-Laptop (gia.grisge.info. [67.230.185.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm9280272eec.7.2026.10.25.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:01:59 -0700 (PDT)
From: Gris Ge <cnfourt@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Gris Ge <cnfourt@gmail.com>,
	stable@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	Stella Liu <yu-ching.liu@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7925: fix NULL dereference in CSA worker
Date: Sun, 25 Oct 2026 22:01:18 +0800
Message-ID: <20261025140123.12056-1-cnfourt@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_070201_989137_85066611 
X-CRM114-Status: GOOD (  14.97  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

`mt7925_csa_work()` checks `dev->new_ctx` before taking `dev->mt76.mutex`,
but the pointer is re-read and dereferenced after
`mt792x_mutex_acquire()`. That check and the later use are not serialized
against a concurrent teardown, which can clear the pointer in between:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:mt7925_csa_work+0x83/0x160 [mt7925_common]
  RAX: 0000000000000000

`mt7925_remove_chanctx()` clears `dev->new_ctx` without synchronization
against the worker. During a channel switch mac80211 frees the reserved
channel context (calling `drv_remove_chanctx()`) before
`drv_abort_channel_switch()`/unassign can cancel the worker, so it can run
with a context that was just cleared.

`mt7925_channel_switch_rx_beacon()` is serialized with the writers by the
wiphy mutex; the worker is not.

Protect `dev->new_ctx` with `dev->mt76.mutex` in add_chanctx() and
remove_chanctx(), and validate it under the lock in `mt7925_csa_work()`.
Keep a local pointer for both firmware calls so the context can neither
become NULL nor be freed while it is being used.

Reproduced the panic by injecting CSA-less "abort" beacon, works well
after patched.

Fixes: 7900da40e315 ("wifi: mt76: mt7925: introduce CSA support in non-MLO mode")
Cc: stable@vger.kernel.org # 7.1+
Signed-off-by: Gris Ge <cnfourt@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 15d95ad32636..fb5f9aa3534d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2020,7 +2020,9 @@ mt7925_add_chanctx(struct ieee80211_hw *hw,
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
+	mutex_lock(&dev->mt76.mutex);
 	dev->new_ctx = ctx;
+	mutex_unlock(&dev->mt76.mutex);
 
 	return 0;
 }
@@ -2031,9 +2033,10 @@ mt7925_remove_chanctx(struct ieee80211_hw *hw,
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
+	mutex_lock(&dev->mt76.mutex);
 	if (dev->new_ctx == ctx)
 		dev->new_ctx = NULL;
-
+	mutex_unlock(&dev->mt76.mutex);
 }
 
 static void
@@ -2509,11 +2512,13 @@ static int mt7925_switch_vif_chanctx(struct ieee80211_hw *hw,
 
 void mt7925_csa_work(struct work_struct *work)
 {
+	struct ieee80211_chanctx_conf *ctx;
 	struct mt792x_vif *mvif;
 	struct mt792x_dev *dev;
 	struct ieee80211_vif *vif;
 	struct ieee80211_bss_conf *link_conf;
 	struct mt792x_bss_conf *mconf;
+	bool roc_started;
 	u8 link_id, roc_rtype;
 	int ret = 0;
 
@@ -2525,26 +2530,27 @@ void mt7925_csa_work(struct work_struct *work)
 	if (ieee80211_vif_is_mld(vif))
 		return;
 
-	if (!dev->new_ctx)
-		return;
-
 	link_id = 0;
 	mconf = &mvif->bss_conf;
 	link_conf = &vif->bss_conf;
 	roc_rtype = MT7925_ROC_REQ_JOIN;
 
 	mt792x_mutex_acquire(dev);
-	ret = mt7925_set_roc(mvif->phy, mconf, dev->new_ctx->def.chan,
-			     4000, roc_rtype);
-	mt792x_mutex_release(dev);
-	if (!ret) {
-		mt792x_mutex_acquire(dev);
-		ret = mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76, link_conf,
-					   dev->new_ctx);
+	ctx = dev->new_ctx;
+	if (!ctx) {
 		mt792x_mutex_release(dev);
+		return;
+	}
 
+	ret = mt7925_set_roc(mvif->phy, mconf, ctx->def.chan, 4000, roc_rtype);
+	roc_started = !ret;
+	if (!ret)
+		ret = mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76, link_conf,
+					   ctx);
+	mt792x_mutex_release(dev);
+
+	if (roc_started)
 		mt7925_abort_roc(mvif->phy, mconf);
-	}
 
 	ieee80211_chswitch_done(vif, !ret, link_id);
 }
-- 
2.56.0


