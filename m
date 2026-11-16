Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2759E606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4hKFwXMV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vDB9Oow+gwU7ZWLTzgkmtyG2uNtZJvw52UWjb3DFprg=; b=4hKFwXMVgtgl53
	gMuapXxuiAE0Ia/8SJ6M17J6AbSX0NaH1NjwJNC/P30WUSEJYE4gY4AgezcLWs57AHALkIv1n+she
	JgOH9SPrt6Jt8+IuQ+BJ9ZQc7Db0LpWEQ+HGmSzOiZSdQFq9C0CrfS2peYDnAy0RlIfDaEErt4x/b
	4LfujLvgbrugNKENMNAfRNgcrLEhF25CWF2SXyuC5RJWLjn75CV9P8UByCqcmlDCr61zcck9Be6mz
	v/ElqHYeYpYIsu0KCZqHfPz4j6T+s3mA1NjyEwtG7uSBVss1jPNXGJGkW4Dd5JHwvhUxuTCM8pMU4
	ClYBADChQcPqAEVLatxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yd-000000049Uk-3jT2;
	Mon, 16 Nov 2026 23:19:07 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yc-000000049Tb-0MGL
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:07 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4c5d8c7f326so1411761b6e.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871145; x=1795475945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDB9Oow+gwU7ZWLTzgkmtyG2uNtZJvw52UWjb3DFprg=;
        b=IIyyXfggiicLwBDNvUvH5JzNOpCA06Ct66nVl1Vi4Q/HL8wYq/YWc3tkhhfUQxAYnk
         VQZKe0L36gVRvqMzKjb+k7LVQFOO2QQkbtjBxc8zOhcNbdyKy12KVZQKL7B9vGv9Rg7N
         UFkcVTiByaT5IiwllBlNgUlT/ajDM5oIJNmTAxRfupzCSEsurb/N4PTb9nw9irrKc9wH
         TdVOsVJgI4EC+yZ0TQHPXRqgpLnatvNkZxdBrzBdakIn9zmVYI0Kny6yJDZRLiLyJKHi
         x6HOOsFUeP00mBSeLSv+FuCmHEI/avNqHLiFkNYx3ldZukF+UtjAY+5ENJXdrYmL96j0
         Gofg==
X-Forwarded-Encrypted: i=1; AL+hErGwJ3NPddvIM0DOheMZ8gKLuLdxzfQbUi29/s1hFLRGmRg2ROHah9EUGY4LCBheY3wAoGmPq76Lrf8acPI77Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9YMvjxNM5y+YQ2MIDkwNZXj/fZUD30sl190tUAuXiwXZ9vGNWy
	MA9rNzm6mHMZehmO7rwjuGrNj+yA67zl720aIZCGm+vceHWlgZ8irg8e
X-Gm-Gg: AYBFou1vcCNpZhCrw32MxAOdAnnwZeApotevXlXkq4H6B12zkgywCI/l94yZqig+KI4
	u5XdkL/8UAxL/Y8LW8SEtHKfgpxOP5/yPOahbmuAaPULD3ySp5KVNGPbVlECp7ucYwVHx6VwRvz
	diaCA8495F3rwA90P58zSS7bEvmNzBmqnb5ldMT26Pbrz97TiUK7gpVE8erktG+9HQr7KsVWTwe
	d/z8HaknESbgMdcIFaFvi5WW1pClAw8VKUAhm0KkUvj7vcIHrkDJxjNi6n4VAPu0xrFru6NWRsE
	+i1q3X3YY56U+31Vt5AwC9S8quREoMZrCYjN2vjDR44M9c4uqrh0ya9EhkkWpE/57MBH+3lIlhz
	pjdpZ56AAvU7oKoQCv9LlvEcd6FXeI3KGkZDUon2rAirdnIhIzy7SPNLNZJxAx7N8df+xv591a9
	sq6Dvgy9nLh70HQ7e4na/AaGI+HpLMw8/iJRoH4Ei0PruRBhhYgvwVZgpcfrR8G5KW7iQ2UBBHm
	FIricUKjcNyBbG+EINcssZF3YRQA+QPA9PXnnsnbWGT6/Tq4hG6fjOHupIGyayBQiGiNDXCjLaY
	lV7bmVF9WMfn/bQLp1WMzR19HwrqOVNY1ocKCTOiJ+WWOF3QxRj2dn6SvTO6QvGysY08dOBscGI
	mC+Vqy8eW
X-Received: by 2002:a05:6808:2386:b0:53a:3533:10d7 with SMTP id 5614622812f47-56e63ba55efmr11194502b6e.14.1794871145132;
        Mon, 16 Nov 2026 15:19:05 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:04 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 07/19] wifi: mt76: mt7925: assign the interface WTBL to the NAN management TXQ
Date: Mon, 16 Nov 2026 17:16:18 -0600
Message-ID: <20261116231630.1733906-8-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151906_142975_9C80DEA8 
X-CRM114-Status: GOOD (  12.03  )
X-Spam-Score: -0.5 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jacobs Wu <jacobs.wu@mediatek.com>

mac80211 does not allocate vif->txq for a NAN device, so every SDF the
host sends - multicast discovery and unicast follow-up alike - is queued
on the dedicated management TXQ (vif->txq_mgmt) with txq->sta == NULL.

mt7925_mac_link_bss_add() only programs the wcid of vif->txq, so the
management TXQ keeps its initial wcid of 0. The mt76 TXQ scheduler then
resolves dev->wcid[0], i.e. the global WTBL, and every host-originated
SDF is transmitted on it. That WTBL only carries the parameters used for
beacons and has no usable unicast rate, so a unicast follow-up sent on it
is frequently not heard by the peer and the send is reported as failed.
Multicast SDFs are unaffected because they need no acknowledgment.

Program the management TXQ with the same interface WTBL that the beacon
and interface paths already use, which is fully initialised here.

Instrumenting the TX descriptor write shows every follow-up leaving on
WTBL 0 before the fix and on the interface WTBL after it; a 100-frame
unicast follow-up burst goes from 92-96 frames received to 100.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a258996a6aae..2ff58b0742b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -458,6 +458,17 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 		mtxq->wcid = idx;
 	}
 
+	/* A NAN vif has no vif->txq; its SDFs are queued on vif->txq_mgmt,
+	 * whose wcid was never set and defaults to 0 (WTBL 0 has no unicast
+	 * rate), so unicast follow-ups go unacknowledged. Point txq_mgmt at
+	 * the same interface WTBL as the beacon path so SDFs continue to use
+	 * txq_mgmt but with a properly initialised wcid.
+	 */
+	if (vif->txq_mgmt) {
+		mtxq = (struct mt76_txq *)vif->txq_mgmt->drv_priv;
+		mtxq->wcid = idx;
+	}
+
 out:
 	return ret;
 }
-- 
2.43.0


