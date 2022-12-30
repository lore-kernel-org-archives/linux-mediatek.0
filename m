Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4641C10F1B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P13fC0gIy9H1wpJFlbhQImrQkU7AmQuWDjdNHiwtHhE=; b=M9HTR7KJ0h1sm21eVt8/6UOrKt
	0UAG3Pgb6TsmmnaLz9HPMfVnkcNVsaW1jogwOFDJM9JuovUoojJsJov3B3OqM6HTiyNREbRJyj2aL
	PMdwq7wt6LdREi2ieXljV9qMYTTgOgBt1zsxhCYG3sCiuGL7npPyyk4D1VNTAnS89eciyZIP24JG/
	jhZZCUOYyjI9Bapnaxcpt17vUcVrbVN+5aa9YGfcAL3NTsIR9XecKl5xFBjugyT27K6JkkAk/PMJI
	xObdFaz+F3skX8SmdyGwlt8A/wtdQKd7MYRCbjcIfZWVLJP1ZId+mJQUywC2W2/vVBGuJVdBKM22k
	MDjwpMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9u2-006vOZ-W0; Fri, 30 Dec 2022 07:34:07 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9s2-006uSC-Tz; Fri, 30 Dec 2022 07:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=P13fC0gIy9H1wpJFlbhQImrQkU7AmQuWDjdNHiwtHhE=; b=AinItdjyBiZbYhA1gF9YGn4UVW
	VxjwKYu0OviTHqSGApDH7OL35y6COZAeGsAEw6fl1Qnf3E/HCElLzHSBqVC693O6GP01Y5PtUJqAs
	osEYDCU6D/rk171ZGsWzM1M1TzPUZeSMdO91Vz1nsTDwVXMWzvgYPMTgC90xhmobBKAM=;
Received: from p200300daa720fc00fd7bb9014adaf597.dip0.t-ipconnect.de ([2003:da:a720:fc00:fd7b:b901:4ada:f597] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pB9rm-00CcyM-An; Fri, 30 Dec 2022 08:31:46 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/5] net: ethernet: mtk_eth_soc: account for vlan in rx header length
Date: Fri, 30 Dec 2022 08:31:41 +0100
Message-Id: <20221230073145.53386-1-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_233203_064157_DECBA481 
X-CRM114-Status: UNSURE (   9.45  )
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

The network stack assumes that devices can handle an extra VLAN tag without
increasing the MTU

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 18a50529ce7b..877cee9bcc66 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -34,7 +34,7 @@
 #define MTK_QDMA_RING_SIZE	2048
 #define MTK_DMA_SIZE		512
 #define MTK_MAC_COUNT		2
-#define MTK_RX_ETH_HLEN		(ETH_HLEN + ETH_FCS_LEN)
+#define MTK_RX_ETH_HLEN		(VLAN_ETH_HLEN + ETH_FCS_LEN)
 #define MTK_RX_HLEN		(NET_SKB_PAD + MTK_RX_ETH_HLEN + NET_IP_ALIGN)
 #define MTK_DMA_DUMMY_DESC	0xffffffff
 #define MTK_DEFAULT_MSG_ENABLE	(NETIF_MSG_DRV | \
-- 
2.38.1


