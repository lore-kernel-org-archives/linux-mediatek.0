Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A8606A31F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cKMmlqLk;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=pu9K0J6f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uEmIcA4u42Z9qeyvnoKEArIyxYyYC6zeHPEXXZ2YbSs=; b=cKMmlqLknZ3nhm
	26pRB4usgxtLA99WC6rRspSjkHKM+2BTVKdRnKNXDxzVxMBSclhpnOTxqc1Y2pNL/8rpgJ98/CUiU
	SZ723u62c2WMCla1QI8m1zJEj9s1kViZ3obrbxRfK1biYlNav3FpTH9jN+xZIFT1wzEhXL+zExkFo
	TXOeAlIdMi21469E06AzdNC1kgpQbUmcZQ3CaqphZlf4kDe6lCY3bMMDaCwosbQTmn7hjXDf7Gi1O
	hNBDb+dGA4G8M07qm2ik0VyFb0M7/YNHGwXwgwlluH9j1t2XnB0onAN8NOKSr87U14cx5tiHpT3PM
	zwZgBxUuSBsA5HyKj2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVsG-00000003xMJ-1nv0;
	Mon, 23 Nov 2026 15:22:32 +0000
Received: from out-242.mta1.migadu.com ([2001:41d0:203:375::f2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVsA-00000003xGP-2MlD
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 15:22:31 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0fJFoarfkDw25F9SrIg4i9jJZ381U0w0LxrLj8NhL7E=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447344; v=1; x=1796052144;
 b=pu9K0J6fSD0iW+JqMIdUYpUmHiWcaXDDUNh6dn3OTaNV+H3cbOUmupUYy8+p2X05THNjw3H1
 1BL1Un6Aj3pr3/UKdTUi+qKMdTbXCL6AClS+VZ1KRYFAW3uIfxwy3nN5AnUgTCuPCuuGRMJUB+l
 dgSN1J69yfB6EzdzmQSk3aOqPYWgENsdf+YCKExQivsR5mZb9oSPZhUtPtRtkov2rPigh7kSyL+
 vfPgTgqw/QmkLYForM1CA48YSTd16XZRhz9gwh5zq8xreFqY4/2uqzMffn5Ub8cxjpL/ItUhmxZ
 TGJaemitE57K0lySANbwRdAttMYmrs0o97Yax/Cd/5ZcQ==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6f568d7c378977dc;
	Mon, 23 Nov 2026 15:22:24 +0000
X-Mizu-Trace-ID: 6f568d7c378977dc
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alex Gavin <a_gavin@icloud.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next v2 3/4] wifi: mt76: mt792x: pass monitors to the driver as real vifs
Date: Mon, 23 Nov 2026 08:21:53 -0700
Message-ID: <20261123152154.99634-4-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123152154.99634-1-lucid_duck@justthetip.ca>
References: <20261123152154.99634-1-lucid_duck@justthetip.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072227_076676_00F8E925 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mark Anthony Agarro <markanthonyagarro@gmail.com>

An active monitor on mt7921, and on mt7925 other than MT7927, never
gets a channel: its request goes to the shared virtual monitor, which
it does not use.

Pass every mt792x monitor to the driver as its own vif, as MT7927
already does. Commit 55e95ce469d0 ("wifi: mt76: mt792x: improve monitor
interface handling") did this and was reverted because capture stopped.
Commit a7d35545c2ce ("wifi: mt76: mt7921: assert sniffer on chanctx
change") and the previous two commits arm the sniffer it was missing.

Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 7dddce02d600..3b27bfcbdb83 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -891,10 +891,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
 	ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
 	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
-	if (is_mt7927(&dev->mt76))
-		ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
-	else
-		ieee80211_hw_set(hw, WANT_MONITOR_VIF);
+	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
 	ieee80211_hw_set(hw, SUPPORTS_PS);
 	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
-- 
2.56.1


