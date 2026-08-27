Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215C6C61DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS22c8zF3DbRecTzHL3Ci77nNp6+M/LCW83Org4yN4M=; b=QAxIEnoqtkBs/RU39r9Ro00LY4
	Rldo0lKEY1fzkxTQrQBJ7/KxxF1xfybqubOOJgX/dWIr2aQ68rU07EFOGuWoOItLa7ojm0qgflYSn
	tiXlkF1V/zLZ9kuh/qcnbNeGKtBgPKPOjCzFHy0PF1FlLDAhKOZ8j8+bZ2mCNoDYooZVLEEovt5rS
	w7xGc/RJf6FZQRzF9fjB4nEmFYDWhUL/xXr9HCs8I5fhfDXdqvIlpeWBmHyMCztVhxsRDAU1xtLcR
	K1v8iNLVblhatbE7vPozd+X7QRrmQd9PzIVvttptXjP8bTo9Lhz7tY1vGsgvKe9n4QJ4MzlVj/iVj
	8P2Em+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhT8-00000004ncF-1HGm;
	Thu, 27 Aug 2026 21:17:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhT5-00000004naC-1scg
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 21:17:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49954b88fffso1753535e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 14:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787865421; x=1788470221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS22c8zF3DbRecTzHL3Ci77nNp6+M/LCW83Org4yN4M=;
        b=SfZ6MLhSa7mFsia56I08N5CTImTnv7zUCJlemq+9xK3YQyy/o5MOiJnLhFpELbf3w5
         wJwfNnQuUNHyeahxeszZoYR5GitO90mm/6+613paUQy+pUe90KVoitTDec7jeOTIUyq9
         BSjYQIiisioZwErv8KrOAR+wuZ/8m3oK0ycCJGNBvo31PfTYvDPifKSwfjuowfUmw2zi
         TnRcCS28eJzylEVt2Oi1rOy8ChL7FKO+cOaF//rnhlsyEVHFqoBOsvE3kd67eSA+yCAs
         jjQj+CoklEYrYJldEdfYv5fpsWqgJEfxPM2rDTjqZcagS4ILep9+rPN52WV/g+toTYfh
         hK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787865421; x=1788470221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GS22c8zF3DbRecTzHL3Ci77nNp6+M/LCW83Org4yN4M=;
        b=n9oECKjg+w859x5VAZzqYe7Vpsbu9hytd07I87smeOgBtNZbyHSSwOiUUh8ewS3pxT
         OIWHWGHh1qQaoulRQt2hY9P2OY5qhk0N3eFS43hIBcaOlYlH4i7KnQy+OCB7nyIwuljx
         dXJrcNaNebc15c2yr+jLUNeKtjngbN/R9FPKHivlKUC2XWMNI02h0WSiUQ/Vd7muzHI6
         jzb4XwXwA0Dyz2naUOAesarPOJqPWvVwpY9/onwwQK41CnHJgNF4yBHXT3lhNFlGe0xV
         xrz4lvEnayzYvgG64r0rZnN62ubEbQgT0/K+/pwm6n5THagbEQ6dTyQVG6Vf3S6BHWu3
         LMXg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9OvDWbd2SgLPV7DtitHUfBjb3gMgGf5nSkX4B6V9eCt95ZIsBVcWRMPslvwg4u/L9/8xwfD6yTcRbJ92LXg==@lists.infradead.org
X-Gm-Message-State: AFuF++noVsZBmw3BB0Os1Q6QHaP1Hz+ccOyVZsE6ZHw3ngvU+gkqoHrc
	BjCDwgRKrPYj5ZKDFJ05XUtWWWQdIXUjIaxdUDuwaixQY3qDClKUZdx/M3erLV7nvPs=
X-Gm-Gg: AR+sD134QF/atesqSPwEZMvM0MlVsC+LAzgtADa1tNw9EAVtPBqkmkI9W7jbJEcqS6z
	mdm0H9eROF1JCJlx/9djPX1KNw5YA6hMgf6Ulvk+/6qdRrZ6WWXii5duIPNRu09R/lgyPkLJKp3
	f4b4Hx/ygXe+K/nfsdW3scDXrPlkHHoT1wuNM7jjL19L5rRl4qsPvh2d7qSYVBZ5EteHlCCjkf/
	Ji7mw/qPrRmuouu00hEPoLy+a02qrBPPk3M82AfM4kxJ5Mg7s8JL3CEBIi8V+fUdk7S8YlKFRhW
	gbX/LRqLqQvfMr+FRn9PofGSNooWyhhVQFSzw+epOs+EZVtiVc5ShYR+p/PRpk9fboikX5+NmXA
	f/c00X24MX0jMJa6IBeBHSo4Q4lOcCEreDA4RVkucy6A8fFH47yaEzpGIRfvib0mrobUdcavrOq
	/A2qnLbb+XenmM6Vj2m/uOQB35d4vu159TKzDtTscMrdocfNB3EMHHETf6
X-Received: by 2002:a05:600c:8411:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-49b91c279e1mr27682655e9.8.1787865421583;
        Thu, 27 Aug 2026 14:17:01 -0700 (PDT)
Received: from ownbook ([31.146.92.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27aa050sm11004557f8f.12.2026.08.27.14.16.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 14:17:01 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: Aleksei Sviridkin <f@lex.la>,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v3 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Fri, 28 Aug 2026 00:16:52 +0300
Message-ID: <20260827211652.63504-3-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827211652.63504-1-f@lex.la>
References: <20260827211652.63504-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_141704_389995_A7D62DF5 
X-CRM114-Status: GOOD (  18.03  )
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

phylink_create() decides once and for all that a MAC supports managed
EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
lpi_interfaces. mtk_add_mac() leaves lpi_interfaces empty.

So ever since EEE support was added, ethtool has answered "Not
supported" on every MAC that uses mtk_phylink_ops, and
phy_disable_eee() has locked userspace out of turning EEE on. MT7628
is unaffected, as rt5350_phylink_ops has no tx_lpi methods.

Leave 2.5 Gbps out of both bitmaps. MAC_MCR folds SPEED_2500 onto
MAC_MCR_SPEED_1000, so MAC_MCR_EEE1G would govern LPI on such a link,
and that is unvalidated rather than known unsupported: MediaTek's SDK
driver sets the EEE force bits for 100 Mbps and 1 Gbps only, and the
unit of the wakeup timers is undocumented with the port clock at
2.5 times the rate.

LPI stays off until userspace enables it, but the EEE advertisement of
a PHY that advertises it out of reset comes back, since phylink stops
force-clearing it.

Fixes: 952d7325362f ("net: ethernet: mediatek: add EEE support")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

On the netsys v3 switch MAC the xGMII filter empties lpi_interfaces
outright, as PHY_INTERFACE_MODE_INTERNAL is the only interface it
supports. It is a fixed link port with no PHY, so phylink had no EEE to
manage there before this patch either.

Pre-existing and not addressed here: mtk_mac_enable_tx_lpi() programs
MT7531's reset wakeup times (17 for 1 Gbps, 36 for 100 Mbps) whenever
it runs, as its own comment says, so they now apply to every SoC driven
by mtk_phylink_ops once a user enables EEE on an eligible interface.
Those values do not appear to have been confirmed for MT7981, MT7986 or
MT7988.

v2, with the full argument for leaving 2.5 Gbps out:
https://lore.kernel.org/netdev/20260824024117.46154-3-f@lex.la/
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..37a831f73da6 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4828,7 +4828,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	phy_interface_t phy_mode;
 	struct phylink *phylink;
 	struct mtk_mac *mac;
-	int id, err;
+	int id, err, i;
 	int txqs = 1;
 	u32 val;
 
@@ -4907,8 +4907,11 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.type = PHYLINK_NETDEV;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
-	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
-		MAC_2500FD;
+	/* MAC_MCR folds SPEED_2500 onto MAC_MCR_SPEED_1000, so LPI above
+	 * 1 Gbps would be governed by MAC_MCR_EEE1G and is unvalidated
+	 * rather than unsupported.
+	 */
+	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
 	mac->phylink_config.lpi_timer_default = 1000;
 
 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
@@ -4966,6 +4969,19 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  mac->phylink_config.supported_interfaces);
 
+	phy_interface_copy(mac->phylink_config.lpi_interfaces,
+			   mac->phylink_config.supported_interfaces);
+
+	/* The MAC side of 2500BASE-X is never below 2.5 Gbps, not even when
+	 * a rate matching PHY drops the media to 1 Gbps, and
+	 * mtk_mac_enable_tx_lpi() refuses the xGMII modes outright.
+	 */
+	__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+		    mac->phylink_config.lpi_interfaces);
+	for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++)
+		if (mtk_interface_mode_is_xgmii(eth, i))
+			__clear_bit(i, mac->phylink_config.lpi_interfaces);
+
 	phylink = phylink_create(&mac->phylink_config,
 				 of_fwnode_handle(mac->of_node),
 				 phy_mode, mac_ops);
-- 
2.55.0


