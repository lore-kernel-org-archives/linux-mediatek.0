Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A72C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=810KJYvQua3Tgj0eTQnOjCyIwfPHWRslPBRk0KhS8r0=; b=JeompQ3evKwzQsNeml7RN/QEtR
	hiyKjIRnm59MpmtqgdAocH3jxg+EmcHiIKTSTCAYH1fPg9oOOLyLUkVgi1uxVxn0tC/LZLO1Ztrl3
	YKS2KmMzpVi7UYlZaf/LKlKD2gA7GsJd0inp/fErv8Goe1z3Mt1Vx7D6kjJH6NTXNsglgZkI7y5Mk
	adxTaO605HC89TQOQMjEgYagNI/KcTZ9tpPtsxjYO5pDoJGUDUEGa2iPCDsdHYaXmxzrWWruNH99A
	wJDS7Y8sOwR6b+1aXW4E0OE1sFFknw+gZEa0ve/DXAjfC/JAi/jseryAR+PxEkakWHjzl18hyN30t
	URPT1ApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osoOq-00FHSK-E6; Wed, 09 Nov 2022 16:58:04 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osoOe-00FHNH-J6; Wed, 09 Nov 2022 16:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=810KJYvQua3Tgj0eTQnOjCyIwfPHWRslPBRk0KhS8r0=; b=NfgRes3FlgLZOAi5KPhr9WSYdb
	rrBOtRbDLSQNvOvLOh6GDIC6Y8+5WVCLr8KEzM46i2phVihE73iMK3m3knPfug2NL4xmYMdgRQjGY
	KslSg1b2y1q1dfWQMjh40HhMGbWbK3pRT4Da2eR4NAaPIDW4Yu/BGunFKikhGOOJHcGg=;
Received: from p200300daa72ee100054f3c61b16ef6e7.dip0.t-ipconnect.de ([2003:da:a72e:e100:54f:3c61:b16e:f6e7] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oso2B-000l4N-M4; Wed, 09 Nov 2022 17:34:39 +0100
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
Cc: Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 11/12] net: ethernet: mtk_eth_soc: set NETIF_F_ALL_TSO
Date: Wed,  9 Nov 2022 17:34:25 +0100
Message-Id: <20221109163426.76164-12-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109163426.76164-1-nbd@nbd.name>
References: <20221109163426.76164-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_085752_657198_BBFDE5E8 
X-CRM114-Status: UNSURE (   9.52  )
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

Significantly improves performance by avoiding unnecessary segmentation

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 1c85fbad5bc1..60da6936559a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -49,8 +49,7 @@
 				 NETIF_F_RXCSUM | \
 				 NETIF_F_HW_VLAN_CTAG_TX | \
 				 NETIF_F_HW_VLAN_CTAG_RX | \
-				 NETIF_F_SG | NETIF_F_TSO | \
-				 NETIF_F_TSO6 | \
+				 NETIF_F_SG | NETIF_F_ALL_TSO | \
 				 NETIF_F_IPV6_CSUM |\
 				 NETIF_F_HW_TC)
 #define MTK_HW_FEATURES_MT7628	(NETIF_F_SG | NETIF_F_RXCSUM)
-- 
2.38.1


