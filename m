Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF412FCB638
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiCd21RRNVunHfikiq+alj3bx9CAi4ebqKg+SQ/IzOQ=; b=l4lZSe6oczu63L2AxpOdome6qO
	udLGtX9Obc7YtglWR8GtlTIGja6wmpmDXB6/XAc+SG8I03AboNA8QE9vHwN9kuI8ut8Vrz9AgcZF2
	h3QNVUsXz8tEK29qnS7VJVp7psThy5vvvY7J8+BWZmHOMTXHCY+kMlVfaex3ut0h6abJamzCd+WgO
	yWQCF9ceSpWBLAR5uReKSrAmnIoEvW/J519uklLYtEoHVS8WeFRUw2eVi2Au+8UsJNSnpKwKFdW6/
	zC4m8x3lWfFIp7b16IiWuyBuxvPISMlIjU/Cr7k8qWxBxuQJR+pr/8GVKTufCRyOv6ir4cnFw9Goz
	9nDd+S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeW3-00000004dXy-3Fez;
	Fri, 06 Mar 2026 23:23:31 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeW0-00000004dVy-3Nwp
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:29 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-466eaeda27aso98173b6e.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839408; x=1773444208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fiCd21RRNVunHfikiq+alj3bx9CAi4ebqKg+SQ/IzOQ=;
        b=XRa4T3G12/8p50Wox3W87efuCv52PMsZRUo3GLn2xitMtwa02z9PMnWtE32mrQU05S
         yCIDseWYvFzctt3dSYh4v1nwq09hPvNlYODZJ2AhOajsjWxESdefLwO7E100gFp/q/R2
         7vOja5euy1vdpQ83Fo2QTGF/GlUnBMdwg20vcKuO8j1oGjLfljMp4G3NYNzKbZ43NXYQ
         k4GPOZQOu4gJYIv4I7Txfwmoo6XgYs4JNR6FvCfRMUCnG+eOU69c/H3Uo6D5Bkukkxmu
         JA/qZADOIXrZ7r84oDSnnbhJ1YGpDlhfdAvej36OivkgeuBxNIn9pqUmTTNdiuQg4wFB
         dPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvCGjnX08xims6dYiiwo5pJjXpyptew5sf1kXjdDbZAgBtNt+/7PUUeWsyMrAYTf22gsIhwOkkPuqFRndV8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCbEtPfyyuLhxRGEPDjI7fEdtnL1I0EZK+oTV4Eo4UvUoisU9t
	H+dgUR6a3hu6UOHz8SuaRYaFVwAUrrN3fI/MCqiyCJVntqeV8KHEeAsDDbtlcw==
X-Gm-Gg: ATEYQzzK00DqhwWgRUjdA0tfECerRz4Ja4E18D+rEZ5lhn0iIPIPCFkYDV0BNAm+x9N
	+tbSFalNc5b8oByz4CQ+QttpZZddGoLE/aJCV4gtkrGa3uBZ7v/ZHgckQc98MGkA03c1Ou8g3mG
	5IZYc/eIVbKymwywIEXXyQ61YDLpsqssx7wSBFFCdkYYMQW1oBNow+SfXYnVx4Vnlu9qTqCZg4b
	61GnZu6Eu268beRdfb7jcxI9qYqmpX8Y7KdDDMr6F3wozQco/8tfEFXATgNpbTXWAtaJObhHjhb
	J+dJXXhWa1SDsMs00/BlmWb8dXPKaigTnudDJZg8PTHhWP+3pDgk+3NUl9iDy9fHXoWOlXxEkfo
	G4iCbhhNkY9Ir9/JzK2c5Lp7hrENT63LC9tCiOX9VoQXXBhFU8HUHaMAZTTn7Te4vQ21kgLWmIV
	ZrWGHVb0gk0eCBgi2R6s5LrM94kERbwpv9MygNH6GOewWEXxM=
X-Received: by 2002:a05:6808:1b2c:b0:45c:9b3e:64ed with SMTP id 5614622812f47-466dcbb9369mr2064426b6e.60.1772839407720;
        Fri, 06 Mar 2026 15:23:27 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:27 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 06/19] wifi: mt76: mt7925: pass mlink to mac_link_sta_remove()
Date: Fri,  6 Mar 2026 17:22:25 -0600
Message-ID: <20260306232238.2039675-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152328_858355_4CE46755 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Drop the mt792x_sta_to_link() lookup in mt7925_mac_link_sta_remove()
and pass mlink from mt7925_mac_sta_remove_links() instead. The link is
already resolved there, making the extra lookup redundant.

This keeps the remove helper lookup-free and avoids hidden dependence on
msta->link[link_id] during teardown.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d7a09a0a79fb..ddff6c5ab876 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1121,16 +1121,12 @@ EXPORT_SYMBOL_GPL(mt7925_mac_sta_event);
 
 static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 				       struct ieee80211_vif *vif,
-				       struct ieee80211_link_sta *link_sta)
+				       struct ieee80211_link_sta *link_sta,
+				       struct mt792x_link_sta *mlink)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct ieee80211_bss_conf *link_conf;
 	u8 link_id = link_sta->link_id;
-	struct mt792x_link_sta *mlink;
-	struct mt792x_sta *msta;
-
-	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-	mlink = mt792x_sta_to_link(msta, link_id);
 
 	mt7925_roc_abort_sync(dev);
 
@@ -1213,7 +1209,7 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (!mlink)
 			continue;
 
-		mt7925_mac_link_sta_remove(&dev->mt76, vif, link_sta);
+		mt7925_mac_link_sta_remove(&dev->mt76, vif, link_sta, mlink);
 
 		wcid = &mlink->wcid;
 		rcu_assign_pointer(msta->link[link_id], NULL);
-- 
2.43.0


