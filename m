Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C9E606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tJexfDzO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6bZahOU0jfr1VcMxypA8yBE1XjlpO2WF8uwUxbk0s9c=; b=tJexfDzOopwpPo
	NGfZ1rOcwXfIyhIRr/2GdLqOmkssFqeXc5cI7SfLjqkuIVwmJH7eSGqOrRBuhb1v9VLaHs/Ms2d66
	ZHPRoeUPx35VuApRs85kJ1A45Mu3n3CvIzeun3w9fkj7yI/ExKqZRW2se/EYCOnYkH7klAOn/8I+N
	A0asa+iwmgtb4sV5TRq6iT16EaN2q7B2hzXfNCxQSEy6jx1x9bQofViQ71vW9/yZ+otFn3X5z2SZh
	skvDLa0kflglm1Cw05xEfRu2je3ZVsFe34l20hODD55a/x0qCK76vb/lSCIE4f3/DBP5uUu4BloW3
	hQ7VlTv8jMij2e0bVgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yw-000000049ZI-0ZZU;
	Mon, 16 Nov 2026 23:19:26 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yt-000000049Yi-1Mml
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:24 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4877837890fso2563469fac.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871162; x=1795475962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bZahOU0jfr1VcMxypA8yBE1XjlpO2WF8uwUxbk0s9c=;
        b=wseXDzvWWrp/ikmY3GzX34wJlkmYPFbsJ0Aw9fCaHeg19r1C9a1CEXDtY7oTc4lyix
         /ayhxCg08FVk+B1/mLhfOj5MkshO4M6ggYBnVNcmBTjN8hMmf1oImLFB/9L6w6ekqkRg
         1GRntIdoLfrylNlElVDTSLQ5xi23hz14J6heHdx4Qk4b2Rxvq99A803sugsx+4TIw9VZ
         Kx/elttGUHbStLljewn9vhn5d6UbvBKd20GFkOW3vqlnE4LQnqNWdvWU7tib2xkG/Oy2
         4/KbzYUkbNYvsADye+lzElM4Ww2Z7s+4X2xaoEmHIP5lXDIkSD9SY9TEG06uS0M+/u/c
         jUPg==
X-Forwarded-Encrypted: i=1; AL+hErGH5TBcTwuvsDigzQxd7crUWN+LJR3EQMsY2amUAu3GAtiUmReFGMeiGbceXEt1kMv/mYZsiEWW3hfKczRdGg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/AlFWfUGqa338DzFZ7Z36molrEP0/kBlVO+mTvEujwmPsPMP7c
	SSC7YPp/7Wvn5uEsFoU4KGb7ttPuV5CCFarG/UzGccw53mki5zji+YQi
X-Gm-Gg: AYBFou0BOnUED+IYHIjAww8irW9nBmJLkSlBX85/pmYXw6AMC9zMxhsi5VFLrqRb8cn
	FyWL3+g9FXOxf5T8upEcxKkhQO2S7Gba7jH8EMwtveMzFk62+QfP6jCtcF996/DNcwkVJF1mP6w
	EnM/DMhlQsKarh1pAWBr7VSkLZ3v8Tirp2SMb+9jGlQWS177wg2y+5In2B4AmesbIHpDViUI2h6
	Udhfdg0AMI6grefx0LmKGvDezG0XB9tbJXB6EASLBD4iE9temVyJF39pb3vmJ0LiyawmrY+MrKx
	2jPf+BYyOlpnGDZ6+3fnfNyqbHepuU53T/kGdCRcPn6/5Sb3U9teBL7jRlWId9LjFCeMtMj2k9j
	N+NPRMjZTknRsTMkrWd/OZkkPCTzyAu9DR9cEcRHK+0+okGx4mF6Y7IYhAdhu8Te7aWP4H+QgQk
	ondi9woRgXmMHV8RW6d0CFQCT2zOKPXlMWqAuNGz0tzvSwOYgVLCedj68ORMtnedoiqvMZm3Eey
	OOB9/TdANj++O6GvIYOZDBxV3DmP0I+Mvqz6Cxdqwzg5GtC27G/8M6fu2OYoaCi4CcSPCJvEj+m
	psp0iyZwd5sJhBU8rO9TCu8cn2awcb/CDshm9m37UU0Yueqozqt/RQ1mbbV9LnZ4Hd4OhSiFt79
	OPyKOytzc
X-Received: by 2002:a05:6808:6607:b0:4dd:18c7:5448 with SMTP id 5614622812f47-56e654179bbmr12127147b6e.56.1794871162239;
        Mon, 16 Nov 2026 15:19:22 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:20 -0800 (PST)
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
Subject: [PATCH v2 09/19] wifi: mt76: gate NAN unicast mgmt by peer availability via STA queues
Date: Mon, 16 Nov 2026 17:16:20 -0600
Message-ID: <20261116231630.1733906-10-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151923_371694_2655C903 
X-CRM114-Status: GOOD (  11.87  )
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

Host-initiated NAN action frames (NDP Request/Response/Confirm) were
sent on MT_TXQ_PSD -> MT_LMAC_ALTX0 through the interface WTBL: a
force-TX path with no relation to the NAN timeline. With a partial
availability bitmap the peer is off-channel most of the time, so the
15-retry burst (~11-51ms) regularly misses the peer entirely and NDP
setup fails probabilistically (half ~2/3, quarter ~0), and per spec
unicast NAN mgmt must be transmitted within the peer availability
windows.

Route unicast NAN mgmt through the peer STA WTBL on its AC queue
instead: the FW pauses/resumes the peer WTBL AC queues according to
the peer schedule record (the committed-window intersection computed
by the supplicant), which is the same gating the NDP data path already
relies on. Multicast NAN mgmt (and unicast without a peer STA) keeps
using the interface WTBL, which has no pause driver.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index ea9993e9a199..0cb27aaff19b 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -713,6 +713,18 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
 		     head == &wcid->tx_offchannel))
 			qid = MT_TXQ_PSD;
 
+		/* NAN unicast mgmt (NAFs) must stay on its AC queue: the
+		 * PSD path maps to the ALTX (force-TX) hardware queue,
+		 * which escapes the per-peer STA_PAUSE availability gating
+		 * and transmits regardless of the peer's committed bitmap.
+		 */
+		if (qid == MT_TXQ_PSD && wcid->sta &&
+		    info->control.vif &&
+		    (info->control.vif->type == NL80211_IFTYPE_NAN ||
+		     info->control.vif->type == NL80211_IFTYPE_NAN_DATA) &&
+		    head != &wcid->tx_offchannel)
+			qid = skb_get_queue_mapping(skb);
+
 		q = phy->q_tx[qid];
 		if (mt76_txq_stopped(q) || test_bit(MT76_RESET, &phy->state)) {
 			ret = -1;
-- 
2.43.0


