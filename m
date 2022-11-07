Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0046C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 18:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qys05PG22fbxdWm5s8ByJ0wPdOueN+diTukAKqcYoqA=; b=JEzb0Npu7pqa0zE/PAMPK0I8cZ
	7PsDI4r6h1oPewL03OlVD+ffhIZ5kz6YmiLIk5/O2Xudl6X5PPOSd/AYx3V0cV3Ft6ADPniXwUl9o
	j8FCyCNRmjKiMPA5v3r7/S8dZhea7AUOM/V0f/bH/07klXmBCgSSvNnzd3bEWFEWQd85gTQhy44Hn
	nuLSYYDjBvds+iuBLnRBJCKY/X6KCJr57MW7Yym8uqC/mUgz7Ri9Iubv477fAV2wEvX7GkzNbB/VT
	reRQ0yB3aZ7DCkgP894VeQeayXE9yTuQ6mNWo5bdkqc0CKkQ1nxhXEBk9MNrRDTsb/CnrPtjzOtnx
	2M3twRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7JK-00HLtd-76; Mon, 07 Nov 2022 18:57:30 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7HQ-00HKor-9z; Mon, 07 Nov 2022 18:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Qys05PG22fbxdWm5s8ByJ0wPdOueN+diTukAKqcYoqA=; b=FxYpLAUUzZ0MezR3P4pPCvkz2p
	/RYuPhe0ELtcVlsyntSnLU/zmxETClklGmsfqVpQIdY0+hM+lS07kJrd/7+XniM7QNEyUlKZGFC+N
	6wKJjv6SCdI4vdLSRQfStoVeLpLj4cpnvQk6E9QmauVKZ+Uy2JAPOi0HZU51jBVmFT+k=;
Received: from p200300daa72ee1007849d74f78949f6c.dip0.t-ipconnect.de ([2003:da:a72e:e100:7849:d74f:7894:9f6c] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1os7HF-000LCc-A1; Mon, 07 Nov 2022 19:55:21 +0100
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
Subject: [PATCH 10/14] net: dsa: tag_mtk: parse hwaccel VLAN tags
Date: Mon,  7 Nov 2022 19:54:48 +0100
Message-Id: <20221107185452.90711-10-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107185452.90711-1-nbd@nbd.name>
References: <20221107185452.90711-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_105532_360211_2787A77E 
X-CRM114-Status: GOOD (  12.99  )
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

Pull the port information from the VLAN protocol ID field

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/dsa/tag_mtk.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index 445d6113227f..0dfa2354f77d 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -73,13 +73,18 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev)
 	if (unlikely(!pskb_may_pull(skb, MTK_HDR_LEN)))
 		return NULL;
 
-	phdr = dsa_etype_header_pos_rx(skb);
-	hdr = ntohs(*phdr);
+	if (skb_vlan_tag_present(skb)) {
+		hdr = ntohs(skb->vlan_proto);
+		__vlan_hwaccel_clear_tag(skb);
+	} else {
+		phdr = dsa_etype_header_pos_rx(skb);
+		hdr = ntohs(*phdr);
 
-	/* Remove MTK tag and recalculate checksum. */
-	skb_pull_rcsum(skb, MTK_HDR_LEN);
+		/* Remove MTK tag and recalculate checksum. */
+		skb_pull_rcsum(skb, MTK_HDR_LEN);
 
-	dsa_strip_etype_header(skb, MTK_HDR_LEN);
+		dsa_strip_etype_header(skb, MTK_HDR_LEN);
+	}
 
 	/* Get source port information */
 	port = (hdr & MTK_HDR_RECV_SOURCE_PORT_MASK);
@@ -93,11 +98,22 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev)
 	return skb;
 }
 
+static void mtk_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
+				 int *offset)
+{
+	if (!skb_vlan_tag_present(skb))
+		return dsa_tag_generic_flow_dissect(skb, proto, offset);
+
+	*offset = 0;
+	*proto = ((__be16 *)skb->data)[-1];
+}
+
 static const struct dsa_device_ops mtk_netdev_ops = {
 	.name		= "mtk",
 	.proto		= DSA_TAG_PROTO_MTK,
 	.xmit		= mtk_tag_xmit,
 	.rcv		= mtk_tag_rcv,
+	.flow_dissect	= mtk_tag_flow_dissect,
 	.needed_headroom = MTK_HDR_LEN,
 };
 
-- 
2.38.1


