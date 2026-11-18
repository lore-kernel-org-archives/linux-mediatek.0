Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6935A606A32A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 18:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z1ybyNMc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFkf7XNP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=; b=Z1ybyNMcEX/NvD+aRFPetkqNnw
	NeY2VAq37fQCHvxJgPFZb7uey3ZmgM8G1gOAvMvIwr3eSwSOwBMb4NLJi4MCFpI5VV3+PwAwTHLUV
	1IuhTotcMuXgUy1iyO6EvsV/hQ9tz8szdS4b5pWXar6ZkbToSXHd4jnk4yNgBRlVvzxAAvEiQtpQr
	v6tj691Fctf2PQLzeDpjy9u+BO5izahVXtbYY1SxmNHCB8PgN5Z83BnEpdYNIIMY5T9KbJeZpKOqS
	mDh9aazgugH4wY/NE4i4xVDL2ly4a9GO6ggzccjPQEFtlHd7EOM8Ezz3i5X0cgB1w0NirLTIk7iUa
	Lcni4Shg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkUy-00000009zWO-02VA;
	Wed, 18 Nov 2026 18:35:12 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkUs-00000009zSy-48Di
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 18:35:10 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-380c28f9e35so95983eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026906; x=1795631706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
        b=uFkf7XNPlPMG0jkA3BWdUkzSASgttECqR86N6myjOxb9VMVzgIoOQ41d2rhoNPeHsu
         UldWKJLbVgdVCVyPaJqXCPhKwzly8wgEArMWjcOnejcRWR/W3/XPoaZEMaosA76qjvzi
         rbLNT0xlf1+rWh95QEUMkLnqat33YqgMxOj/TjFyqMKDMol9F4oL8taUZK8td17846s1
         12FQhpw52GoXCg3fUqwIcKDH1wfhpHFsHmpJ2om0R9JRPsW+5b3pEj29yNt9gTplTzpt
         yZIh5QAIopmxuDcfQa9njBvVe65TCMFV9+4syJxHQPYbCnI295uphumv5k3cAG/TC8f6
         LGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026906; x=1795631706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
        b=wKdQEfKsb8xXz4CN4TQFCjgkX+p6G74ohfGN7fEF5RlPT1SYLmJ6lzFVhk7Z8c3OJJ
         H3rfaRS2TgU6Kdy+aJoVCgavLGCx4mlXnlS34U4qURmT8LNwV4DCsU1p8z4WZ6g2faRM
         tXbuNnSWUP7ZOR+IGKACTQ+6Lc3mAoQjPw42Ti26q/OzzLCNqkoTkSP4zFZl6erxvUOU
         k8O2oiljQql3FqIoAtGlzfSzn3i+8U1c1tYM3OxWR3knYLOaFM0WIiqcD8WRcWtqxvVf
         61ylSFN5FcSgTgph8bYZIHdaiWNkcTQaEl5+HT5GXXnGp/J+vX0TeTCIMd/ytQNUi2ux
         yoaA==
X-Forwarded-Encrypted: i=1; AL+hErHrMWWpCH122rfPyYfQR2dpPwJIYkXiyrj2Uku8nENCXfmtt1RpCi/MACYmplAYHXcL6wB5Ridd4jin3HzrxA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/KL31+zFgXK/HJqZ1RmGCwOIHDZeEd6xh/xgk8LsiTHF+Qx6Aw
	3VH0k7MVY/EbVCrAdtmkmPKqFaj1fnNKJe39nbXure3XLxBmMRJuf/hu
X-Gm-Gg: AZFdTZcGy/4YDWh82KdveKaGDWoXfhHOkTcxhSay2u6hoszWGPD7WSxxCXmf9DJGfJi
	HEvkLtme4ZAHT+LRyhWPVNGweDqhNCjL8rlyqvtl08TTq/FPF8k+drhOvggS89wB8RDxi0b7Nuf
	t/bc42wLzlltkJJI67llea6n0uCmVd5/2G2OBJzKoe8snjX0SZL9DhF613/YmLNyiiIg1VqSc/h
	50nTo6GgimSZDfmT6J8yQYAkTEAQBQa0ycbonmnvFTjet6iXCRVu6HLcBRHa/cA+4cpC6/sJ8kk
	7+taIiS19i+MpDpuqGl+AO1mfw5u3mBsA/6gxkqwiY+y/EBDkDtaPpEtuZROP2RSILvjSlePuEC
	DABsqnWmvn9w0GEHhas5EujHEhfjzIMCCW6Aa96A7ke+CRrXIvSd+3dk4wvj6ByRwg6+lUHtAZP
	0Uknt8hvJ1Oz9rNVwSr4iFuiGg5pSl0vSQ8MGi9V61Ie1wg4b1MJhxHKrokWGqh3iPzYQq3wHk7
	O03v1woN4nLN+pxkxdZr9Bw9TgaobDTT4lstyGJ2Bjv85o3njKsz9EkhDq+n/WzRjH692VLedEn
	WmMt/H2ByruFYEK70HNAWquE+DYS2QTNOIN/rO15bpkOddUxEfLqGXi+hpGDu2SI6IKv970acnc
	mjZyu
X-Received: by 2002:a05:7300:ae97:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-383ee2228b7mr240375eec.13.1795026905715;
        Wed, 18 Nov 2026 10:35:05 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm9453348eec.19.2026.11.18.10.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:05 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt7996: restore the wcid flags on reassociation
Date: Thu, 19 Nov 2026 02:34:38 +0800
Message-ID: <20261118183438.44794-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103507_148904_F233E391 
X-CRM114-Status: GOOD (  11.43  )
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

On disassociation, mt7996_mac_sta_links_event() clears wcid.sta and
sets wcid.sta_disabled. Nothing has cleared wcid.sta_disabled on
reassociation since commit 13e2e9c6b348 ("wifi: mt76: mt7996: use
mac80211 .sta_state op") started setting it. The ASSOC event used to set
wcid.sta again only after the rate control commands, and no longer sets
it at all, so wcid_to_sta() returns NULL for a reassociated station, and
both mt7996_mcu_add_rate_ctrl() and mt7996_mcu_add_rate_ctrl_fixed()
dereference it.

Set wcid.sta and clear wcid.sta_disabled at the start of the ASSOC
event, as for a first association.

Fixes: 13e2e9c6b348 ("wifi: mt76: mt7996: use mac80211 .sta_state op")
Fixes: 28d519d0d493 ("wifi: mt76: Move RCU section in mt7996_mcu_add_rate_ctrl_fixed()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in a QEMU guest with KASAN and a test hook
that reassociates a station through mt7996_sta_state() on a synthetic
device whose firmware commands are captured: without this change the
second association hit a NULL pointer dereference in
mt7996_mcu_add_rate_ctrl(), with it the association completed.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 9321c8146e2a..77f0664fe57c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1491,6 +1491,10 @@ mt7996_mac_sta_links_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 		switch (ev) {
 		case MT76_STA_EVENT_ASSOC:
+			/* Restore the station state that DISASSOC cleared */
+			msta_link->wcid.sta = 1;
+			msta_link->wcid.sta_disabled = 0;
+
 			err = mt7996_mcu_add_sta(dev, link_conf, link_sta,
 						 link, msta_link,
 						 CONN_STATE_CONNECT, true);

base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
-- 
2.56.1


