Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D82C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIPw6Fj4eUcqK2lXqmxVDqLdzLAH3cHlKhsCRY7ov/c=; b=VXHeZNjJmKR3p1lTPdoK7ODItn
	ImhWuZsEL4LBP6DMLhB9AyIpfyvrMErhTkxWKtOqzmTZd6/KwjEUcZw64wV6vBbZxkLHcVPFymbFB
	xYoVqAqUsoJ8kq6LVSjtaKvfHsLDaXv0bZUktjUfvsEUqxJj/0uTuYReyXykH5DPZTWHHRecJvA1x
	n/ti/Hox6FleoKgxKV1Y0tR+xTJ8zYe8e8+gLqXHPRHPbEuu3wUO3sowcTzFkGiwjVJhHhqUSA3Y2
	NYvkX/xEZkBgx9SI3e4L7XU0b41/iJOwYFRFUuPEd4BFnhgZmKYR4RNdi58L/j3vgW1zThU6p+VpS
	199C5xMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7IL-00HLGh-J7; Mon, 07 Nov 2022 18:56:29 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7HP-00HKod-VS; Mon, 07 Nov 2022 18:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MIPw6Fj4eUcqK2lXqmxVDqLdzLAH3cHlKhsCRY7ov/c=; b=IxaTc7l7M1626+mMfOlWwYXuxi
	LnHo0KamGTSoQ1smd59tNgKlLBEBJwpdhCMCudyffzOcVE/IKehIjoFmppTg28GSXX5Z5h2fksoMe
	UpsTQh0KlLbwv3qIsltPHgqGQGbYJGBg7fgNKYj0C7OOVAmL+E5EJpMyBHQ71PFqNdfY=;
Received: from p200300daa72ee1007849d74f78949f6c.dip0.t-ipconnect.de ([2003:da:a72e:e100:7849:d74f:7894:9f6c] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1os7HD-000LCc-G5; Mon, 07 Nov 2022 19:55:19 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] net: ethernet: mtk_eth_soc: compile out netsys v2 code on mt7621
Date: Mon,  7 Nov 2022 19:54:45 +0100
Message-Id: <20221107185452.90711-7-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107185452.90711-1-nbd@nbd.name>
References: <20221107185452.90711-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_105532_045762_B20956DC 
X-CRM114-Status: UNSURE (   9.19  )
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

Avoid some branches in the hot path on low-end devices with limited CPU power,
and reduce code size

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 8123a646ba0a..e09b2483c70c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -905,7 +905,13 @@ enum mkt_eth_capabilities {
 #define MTK_MUX_GMAC12_TO_GEPHY_SGMII   \
 	(MTK_ETH_MUX_GMAC12_TO_GEPHY_SGMII | MTK_MUX)
 
-#define MTK_HAS_CAPS(caps, _x)		(((caps) & (_x)) == (_x))
+#ifdef CONFIG_SOC_MT7621
+#define MTK_CAP_MASK MTK_NETSYS_V2
+#else
+#define MTK_CAP_MASK 0
+#endif
+
+#define MTK_HAS_CAPS(caps, _x)		(((caps) & (_x) & ~(MTK_CAP_MASK)) == (_x))
 
 #define MT7621_CAPS  (MTK_GMAC1_RGMII | MTK_GMAC1_TRGMII | \
 		      MTK_GMAC2_RGMII | MTK_SHARED_INT | \
-- 
2.38.1


