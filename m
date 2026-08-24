Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC21C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFik3syta/xa+rpQ6R4qogLWpplWvKVpUybzi1DcPYA=; b=I8j9ZMm6UKHO6Y+bqdlGVACwI2
	x/2kPw1xQECwwak0AnHcqwJGPVY/dNfH96OVRv2JRadwgRpEaxtj+bdnEeYHIIpHIfXDnexF847Zq
	7E5byQ5uUGMUm0DOQ2IulLaImTHlJD+8AbQFV9FzGCnVkqrvBOHPOiFUY7MIzL2YAgxklQITUWrsW
	q1b1VQ6dv5Q9vdCskpQsPeeXXj8IWTEqmIQ8eZQ+HO6Fg5jXGJ9N1QiUoXrpZg7Giq43GB7iQbqh+
	ioMvDzwzspk5cPXiiASOFakhOV3ziI7WyNb7hbJsz3yP6JMxHdmVvr7zjdTQXM/VOf/n9wBZfHs9R
	wChwA6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaiz-0000000HKIb-0SRF;
	Mon, 24 Aug 2026 19:52:53 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaix-0000000HKHs-01eV
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:52:52 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-43bf9548df4so3853024fac.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601170; x=1788205970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iFik3syta/xa+rpQ6R4qogLWpplWvKVpUybzi1DcPYA=;
        b=KmAp55/5+GKvDUtfCU12SInt11bMSFeNWTGAsZbQJTLsrtJg3FCNuHkxIu0LSydnsD
         AjqA75CYLRm4KaPN+iGDdH7t1LoKyBOsSvvoKHLaC9e6ncPyFTQYZd6sLdyp8poVnM+1
         3qdfGJmHVpmEKZomfJXwecdYtKLKw9wxz+OZnpW7mrDoMJ28aX1fYVN5wI1Su3+r04u0
         J8LZf54Wlisz8BmZoM0/C/pOgLstrhnKofqu9ihNKkJfpRVCAhAAogHmxJPn6/+uMNH9
         YYTG7NTux47lVREKryqVvYdPmJ8vAWgso5EDSN6pn9J9acxd8GfMfVxbYQ4H7Ly51uTb
         Ggog==
X-Forwarded-Encrypted: i=1; AHgh+RpUwjQE6Qa2PGddzTOPlN9LKvrdobd36C+2JI9ao9fmqvtTHL5aRlqrlCRuplZd7kdQf7ouHkDQWIHydyQ3CA==@lists.infradead.org
X-Gm-Message-State: AFuF++niJk6yW+aJFXVWGqYLi/5Yta392QauxvXieg8OIDiXYb9zzYEk
	Djb62Bl9gXK8JpXWTXEhnonaeQTC5v7iCFtDpFRYKFNVhi8NSnQvrldH
X-Gm-Gg: AR+sD103nm5wgqSPG6Jw7l8nIHOTU5EMtRILRRFfYHMO3YNZIwb1rcRHKT87EmbukKU
	S+kImZNf61Lf1NIf6A1sXmrr0OJvHamLzoamSlB+8uIuScG9NjqyUoTtUmJZLOdEpH4+0/B7oBs
	UUj9oMPg8yvFiAmZyzsDnuybDfTp2GhdJngjcgwQdU9PGLgwd2/YZ1FguilfuyRerCIhbgDadkt
	IEN0cR0ZJI7edIDMiKPDxVYPXt44IvNAARQtcm5JZkhV3MBHjOO8PFXzbaaq5xpWabkbatmfZv6
	7G/rpZfGvSJdXArSHJWSq2ggTFQ3XSVXXcLSbxjr2w6YQPzUBwJNzsr/M34A8O/3y4DjF9BCQ1r
	7PE0XaqJOvXmnhPN+KVbXc8AkXNAjvLtdD8rbmoUwyIxT4BT88R//vo+5kAUOEot5L/DAm+lzX2
	2gnoNb80XFM57zaB388RwBNFsJjCCRHG6tcs+kzv6lKEy1QCgg68KrAnu1/2THy9CqJPgsgUCpM
	/9O8EccIKXbIxgaPpq5uppemgqY66MLsyB8WmouFdg1Opy67A==
X-Received: by 2002:a05:6871:14e:b0:452:213:bd4d with SMTP id 586e51a60fabf-4635173f31emr26372209fac.17.1787601169781;
        Mon, 24 Aug 2026 12:52:49 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:52:49 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 01/15] wifi: mt76: mt7925: fix NAN NDP STA record role index
Date: Mon, 24 Aug 2026 14:52:13 -0500
Message-ID: <20260824195227.12589-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125251_052500_21BCC25A 
X-CRM114-Status: GOOD (  12.26  )
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

From: Stella Liu <yu-ching.liu@mediatek.com>

The NDP STA record role_idx must carry the NAN BSS band0 index
rather than the mac80211 BSS index, otherwise the firmware maps the
NDP peer to the wrong role. Use the fixed NAN_BSS_INDEX_BAND0 value.

While at it, drop the inline peer-schedule setup in
mt792x_nan_map_sta_rec(): the peer schedule is already driven by the
upper layer through the peer_sched_changed callback
(mt792x_nan_set_peer_schedule()), so the redundant call and its
now-unused local variable are removed.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 31 +------------------
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  2 ++
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index d260e803d056..70cb2c44869c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -990,13 +990,11 @@ int mt792x_nan_map_sta_rec(struct mt76_dev *mdev,
 	struct sk_buff *skb;
 	int ndp_ctx_id = 0;
 	int ret = -ENOMEM;
-	struct mt792x_dev *dev;
 	struct tlv *tlv;
 
 	if (!mdev || !vif || !sta)
 		return -EINVAL;
 
-	dev = container_of(mdev, struct mt792x_dev, mt76);
 	msta = (struct mt792x_sta *)sta->drv_priv;
 	mvif = (struct mt792x_vif *)vif->drv_priv;
 
@@ -1012,33 +1010,6 @@ int mt792x_nan_map_sta_rec(struct mt76_dev *mdev,
 	memcpy(nmi_addr, nmi_sta->addr, ETH_ALEN);
 	nmi_msta = (struct mt792x_sta *)nmi_sta->drv_priv;
 
-	if (!nmi_msta->nan_sched.idx_assigned) {
-		if (!nmi_sta->nan_sched) {
-			rcu_read_unlock();
-			dev_err(mdev->dev,
-				"NAN: peer schedule missing for NDI sta %pM\n",
-				sta->addr);
-			return -EAGAIN;
-		}
-
-		rcu_read_unlock();
-		ret = mt792x_nan_set_peer_schedule(dev, nmi_sta);
-		if (ret)
-			return ret;
-
-		rcu_read_lock();
-		nmi_sta = rcu_dereference(sta->nmi);
-		if (!nmi_sta) {
-			rcu_read_unlock();
-			dev_err(mdev->dev,
-				"NAN: NMI sta not found for NDI sta %pM\n",
-				sta->addr);
-			return -EINVAL;
-		}
-
-		nmi_msta = (struct mt792x_sta *)nmi_sta->drv_priv;
-	}
-
 	ndp_ctx_id = find_first_zero_bit(&nmi_msta->nan_sched.ndp_ctx_bitmap,
 					 NAN_MAX_NDP_CXT);
 	if (ndp_ctx_id >= NAN_MAX_NDP_CXT) {
@@ -1073,7 +1044,7 @@ int mt792x_nan_map_sta_rec(struct mt76_dev *mdev,
 	memcpy(map_tlv->nmi_addr, nmi_addr, ETH_ALEN);
 	map_tlv->sta_rec_idx = msta->deflink.wcid.idx;
 	map_tlv->ndp_ctx_id = ndp_ctx_id;
-	map_tlv->role_idx = cpu_to_le32(mvif->bss_conf.mt76.idx);
+	map_tlv->role_idx = NAN_BSS_INDEX_BAND0;
 	memcpy(map_tlv->ndi_addr, vif->addr, ETH_ALEN);
 
 	ret = mt76_mcu_skb_send_msg(mdev, skb,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index f55730e25f46..1dcc888d98f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -65,6 +65,8 @@
 #define UNII3_LOWER_BOUND	149
 #define UNII3_UPPER_BOUND	165
 
+#define NAN_BSS_INDEX_BAND0 0
+
 enum nan_uni_cmd_tag {
 	NAN_UNI_CMD_SET_MASTER_PREFERENCE	= 0,
 	NAN_UNI_CMD_ENABLE_REQUEST		= 7,
-- 
2.43.0


