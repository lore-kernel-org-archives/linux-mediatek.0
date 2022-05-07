Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C87CC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCc6D3gcC0tYgJcfXDgGcY686FYxjMyALLhltJhuLBo=; b=EIbdG53lygeuKq
	CN/D90KCz/R5dpVwQk5bKPlF85XCK/ULp74YCgCTb1fQpkXhhrmV8+3Nu2lE8Rnt3WRsXOHcfI7tj
	4Wtc3Tao883ITQO1GSZFtTCis+CM2NJSRYRbKgdBczGxOiaVsCqJRC9InTgaJufAPk++hF7s7WPY/
	XWIxOW4fXBujF6ifmbCVHOh1qLBRR+6Tl+sXhLoJgm7G/ye60H+r9TwM42RwJKIao5sFs3gVIXYZn
	DYm0IoocGh+zxcjwYBqkpNMz6ytAPkx19B6olkhVnInTr4rhZTffhO/XpCv+dpabu+yAkPGBUM9Ka
	jqOGKyKK2ZrvgVAJj20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnNsS-007lEU-BO; Sat, 07 May 2022 17:05:56 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnNrW-007klV-I7; Sat, 07 May 2022 17:05:01 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout2.routing.net (Postfix) with ESMTP id 787F05FBBE;
 Sat,  7 May 2022 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1651943093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOY0bxdUhNN3M6I8q15fOn3ipf8lrnx60tc5aC+4lnk=;
 b=nqkLXOeSkx0VfNka4n7l/jrc0pql7icRrrm1B91MdHmrdpcESrNV1P4BaIkCM3JCbqM2hD
 9O1tZEwMLOfWwvClUDqVJz2knCu6bIURMi5440WnFj796Ib/kVEBvjMY9kWMn6kfrhwLVd
 OrOYwZNMTn/YUNw7Yj2sg0TEqKO8eZg=
Received: from localhost.localdomain (fttx-pool-80.245.74.2.bambit.de
 [80.245.74.2])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 618EA800E7;
 Sat,  7 May 2022 17:04:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/6] net: dsa: mt7530: rework mt753[01]_setup
Date: Sat,  7 May 2022 19:04:37 +0200
Message-Id: <20220507170440.64005-4-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220507170440.64005-1-linux@fw-web.de>
References: <20220507170440.64005-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mail-ID: fbc2c6b2-366b-40c3-9cbd-9defd045faa2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_100458_785563_FA1BB236 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Enumerate available cpu-ports instead of using hardcoded constant.

Suggested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/mt7530.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 46dee0714382..144c29f8fefc 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2087,11 +2087,12 @@ static int
 mt7530_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
+	struct device_node *dn = NULL;
 	struct device_node *phy_node;
 	struct device_node *mac_np;
 	struct mt7530_dummy_poll p;
 	phy_interface_t interface;
-	struct device_node *dn;
+	struct dsa_port *cpu_dp;
 	u32 id, val;
 	int ret, i;
 
@@ -2099,7 +2100,19 @@ mt7530_setup(struct dsa_switch *ds)
 	 * controller also is the container for two GMACs nodes representing
 	 * as two netdev instances.
 	 */
-	dn = dsa_to_port(ds, MT7530_CPU_PORT)->master->dev.of_node->parent;
+	dsa_switch_for_each_cpu_port(cpu_dp, ds) {
+		dn = cpu_dp->master->dev.of_node->parent;
+		/* It doesn't matter which CPU port is found first,
+		 * their masters should share the same parent OF node
+		 */
+		break;
+	}
+
+	if (!dn) {
+		dev_err(ds->dev, "parent OF node of DSA master not found");
+		return -EINVAL;
+	}
+
 	ds->assisted_learning_on_cpu_port = true;
 	ds->mtu_enforcement_ingress = true;
 
@@ -2260,6 +2273,7 @@ mt7531_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
 	struct mt7530_dummy_poll p;
+	struct dsa_port *cpu_dp;
 	u32 val, id;
 	int ret, i;
 
@@ -2332,8 +2346,11 @@ mt7531_setup(struct dsa_switch *ds)
 				 CORE_PLL_GROUP4, val);
 
 	/* BPDU to CPU port */
-	mt7530_rmw(priv, MT7531_CFC, MT7531_CPU_PMAP_MASK,
-		   BIT(MT7530_CPU_PORT));
+	dsa_switch_for_each_cpu_port(cpu_dp, ds) {
+		mt7530_rmw(priv, MT7531_CFC, MT7531_CPU_PMAP_MASK,
+			   BIT(cpu_dp->index));
+		break;
+	}
 	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
 		   MT753X_BPDU_CPU_ONLY);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
