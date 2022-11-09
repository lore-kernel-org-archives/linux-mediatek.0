Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E51C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 16:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNx2EvBgaSK9aSDl5n7dtYqaf36QTyssctQ2Sm28n8U=; b=U19MsZtQeA7p4pGtyr8cbTzdvW
	4ZzSgwPRYPFsEcQxzUCfICKfy0rpFTmqbIuK8WYJ5OcDX/YPlBU0L3AdLggYOI8+7KsEefakWf2WW
	mCMK4GEODn2wut2SuxYWmW96Nu5SOQhY87NwflEyILa6BTKZSia6uNVUV6L+R8QKAiVzk8TrwHqrA
	hZdP15YzDhz/rKD7PisZLFNrCMGIUdK8eAe3v1mZmyOKlqA3XXPtPuJiAVBIrERuT/vs3nPs/n1nu
	Weci5WF60Pp7DlGqAEpg6204mP6S4gOgmxk7TB42b0+RzfKCYTDURrlb/4PPOR8L2AjNLeJcyoplF
	Q9ifR3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso3F-00F3t9-Sd; Wed, 09 Nov 2022 16:35:45 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso2K-00F3KH-83; Wed, 09 Nov 2022 16:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CNx2EvBgaSK9aSDl5n7dtYqaf36QTyssctQ2Sm28n8U=; b=VOzMv9ZbI1H3uX1yYfBGtAh3xN
	xAtjtcjwrDAzIMopqcbRnIq5FDn4TYwmuVdg9rfGaGWC16JkG2SU8uPgSqz+sCZST6PEzBX2dFwNO
	BUnvv4DBPKDN99s5U3EYjgYcCTFIy8eSa2Vjmy4XC8XIU+dObGIyvYT67QXfYcESuROk=;
Received: from p200300daa72ee100054f3c61b16ef6e7.dip0.t-ipconnect.de ([2003:da:a72e:e100:54f:3c61:b16e:f6e7] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oso26-000l4N-Fp; Wed, 09 Nov 2022 17:34:34 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 05/12] net: dsa: tag_mtk: assign per-port queues
Date: Wed,  9 Nov 2022 17:34:19 +0100
Message-Id: <20221109163426.76164-6-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109163426.76164-1-nbd@nbd.name>
References: <20221109163426.76164-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_083448_304103_09BC6D53 
X-CRM114-Status: GOOD (  10.12  )
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

Keeps traffic sent to the switch within link speed limits

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/dsa/tag_mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index 415d8ece242a..5953356b829d 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -25,6 +25,8 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 	u8 xmit_tpid;
 	u8 *mtk_tag;
 
+	skb_set_queue_mapping(skb, dp->index);
+
 	/* Build the special tag after the MAC Source Address. If VLAN header
 	 * is present, it's required that VLAN header and special tag is
 	 * being combined. Only in this way we can allow the switch can parse
-- 
2.38.1


