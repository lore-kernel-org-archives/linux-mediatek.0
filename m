Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D2606A330
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2026 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D39JmkSL;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UsTDTdqY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ox2XlTyOSiiELfMJRA1RMpYz/DEXqGXFohGx482vSjg=; b=D39JmkSL4C0bAu3ftrgGSTIe8u
	yarL9icgfsEvmNAM9fNQnFvwAnyNqrOnxlzSSwtDO1VdilbzDc/PmJP87vSl0uxS/05Rhz/pJj63Q
	XMWQ6vLahFY2ssMzluORrsJxunEYSvLBjpw46PyZru2Cyr2l9ITpbM9H6f/IMX//WlN059esMI6u1
	8mwE7bBeAx3D4WD/wzDDBnhzvg2WQVp/Aze+GRRVmTGBoU5RoyAAidPAu8Muoaecyq/T1EacjzIrx
	zJs9jP5zXlFQKnwdLNiBbJygGBmj+n6L/ZEK55jls+vdXWd8eqT/HcG3llD0MVay/yrMCS5EwZvY/
	36nWzskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVCH-0000000HD1W-3qpl;
	Sun, 15 Nov 2026 08:02:45 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVCF-0000000HD0v-13Ac
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Nov 2026 08:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ox
	2XlTyOSiiELfMJRA1RMpYz/DEXqGXFohGx482vSjg=; b=UsTDTdqYIgrfG2yCl7
	p9l5zRaFhkqL6dLz7I/pvh7lF9JVvwXTHcZbyM6qyu9RToyIrz2nn1u9Y99wxQbJ
	hiuBkVTiiOBvZ+2UgAU1qzNyciERnaszjeVo4NcrYeCaEObDLKqdAQ6Fj+QSM31P
	oej25ueIQDy44OiIK/5f+Opvg=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3v_AZZ_lqifQ9IQ--.40454S2;
	Sun, 15 Nov 2026 16:02:33 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: connac: use wcid_to_sta() when dequeuing PM frames
Date: Sun, 15 Nov 2026 16:02:33 +0800
Message-ID: <20261115080233.910330-1-zihengw03@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v_AZZ_lqifQ9IQ--.40454S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF47ur17KF1kZrW7KrWDtwb_yoW5Gr1UpF
	WUK3yq9r1vgr45Za1kAw4kZF9Iyan5GFy0yF1S9wn5uw1rZF109F4jga4YyF4FyFs2qFnI
	kr4DtrnxurZ8Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkGYLUUUUU=
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7hn4SWr5Zxmk1wAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_000243_733518_AEED9575 
X-CRM114-Status: GOOD (  11.75  )
X-Spam-Score: -1.8 (-)
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the device is in runtime PM, mt792x_tx() cannot transmit right
away and queues the frame with mt76_connac_pm_queue_skb(), keeping only
the wcid. mt76_connac_pm_dequeue_skbs() later recovers the station
from that wcid with

	sta = container_of((void *)wcid, struct ieee80211_sta, drv_priv);

This is only valid for the default link's wcid, which is embedded at
the start of struct mt792x_sta and therefore at drv_priv. Since MLO
support, mt792x_tx() queues the per-link wcid of the link the frame is
sent on. For any link other than the default one, that wcid lives in a
separately allocated struct mt792x_link_sta, so container_of() yields
a pointer 600 bytes (offsetof(struct ieee80211_sta, drv_priv) on
x86_64) before that allocation. mt76_tx() then passes it to mac80211,
which dereferences it as the station, e.g. in
rate_control_fill_sta_table() via ieee80211_get_tx_rates().

wcid_to_sta() in mt76.h follows wcid->def_wcid for link wcids and is
correct for both cases. Use it.

mt76_check_sta() in mac80211.c has the same pattern, but only uses the
result when MT_WCID_FLAG_CHECK_PS is set, which only mt76x02 and
mt7603 set; neither supports MLO, so it is left alone.

Found by LLM-assisted source review. Not tested on hardware. A test
module that queues a frame for a separately allocated link wcid and
calls mt76_connac_pm_dequeue_skbs() hits a KASAN slab-out-of-bounds
read in rate_control_fill_sta_table().

Fixes: ebb1406813c6 ("wifi: mt76: mt7925: add link handling to txwi")
Cc: stable@vger.kernel.org
Signed-off-by: Ziheng Wei <zihengw03@163.com>
---

Notes:
    The changelog was drafted with an AI assistant from my analysis;
    I have reviewed the code, the fix and the text.

 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 8481eac8d..6c2caade6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -134,8 +134,7 @@ void mt76_connac_pm_dequeue_skbs(struct mt76_phy *phy,
 			continue;
 
 		if (wcid && wcid->sta)
-			sta = container_of((void *)wcid, struct ieee80211_sta,
-					   drv_priv);
+			sta = wcid_to_sta(wcid);
 
 		mt76_tx(phy, sta, wcid, pm->tx_q[i].skb);
 		pm->tx_q[i].skb = NULL;

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0


