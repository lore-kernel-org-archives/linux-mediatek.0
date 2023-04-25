Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1F5C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eABp2T9EGqsly6qmK4v+G30KCoQ1T2FiObQ9xyRbH5o=; b=I0kWRnPFB6CjAB
	DBBPVUf1mBvDOR5fUsN3p3TIhPrGnv0Rq2c8Qcrx/qxVZZS3F3on4fPAW68+zCSHBlAdwhUdahLyK
	VdZXRlULqLeGf0HNrWdzVWhMk+DizTC43OROkCYEwvyj/XiIYvKGXQ5PA6/xUU9PbR0aYmJ1YbKoD
	XKt4c8Qp+a/ThmG+NYsuEmKw0kv6okwXY8sY/s23z5Rfqs5BaO1EcvGQmww/kEVIAUwGYi0HxRU7X
	X9CFxmo9vs7rWmL8d5jIbjfmj78++/VzpD3D3X7GEc3T8xaxJ0Zy34luOWVehejLP+imnUdti3psu
	XInnI8YFaNwCXQcg5yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prF0D-000dzk-1O;
	Tue, 25 Apr 2023 09:30:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3q-000Uce-0l;
	Tue, 25 Apr 2023 08:30:07 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94f6c285d92so1016487466b.3;
        Tue, 25 Apr 2023 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411404; x=1685003404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eABp2T9EGqsly6qmK4v+G30KCoQ1T2FiObQ9xyRbH5o=;
        b=cB2aKGIKnK8sXy/Np6pdmxyc+H4rqYNIVyGo0WJHquZ4p1zxP/OkiRB7B5VPV33B7T
         E6fuLwcVajOBonc8NJ6DBT3VMTZXWjNyYQ1mnvg1dCh/5jN6rKD9LJGPhXB9ivuhPK8C
         rItsC6KgUAbEEiIYHncPzBKzs0p0kZdUP2hGnO06QAUHSiYr8gTlUZBpomQ0dzCVzaOK
         fntcT2UXSJ17Zv+v3gE/FHQ6gmKtNZeZU+819BJ8KyzWOxKYYRegkWHY+8/7YOD35cIR
         txiPeeN6E4etTGJ9qROOlONRBmkSa6alo7mf5poLGjr9q/yfXmkrSUk7sq6qaCU686Bm
         Qodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411404; x=1685003404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eABp2T9EGqsly6qmK4v+G30KCoQ1T2FiObQ9xyRbH5o=;
        b=BWdctE0MsAyuEN0Q1IMgn5QYrQ+MWHgygZcWTrWmg9/5eMfU9fvSWtIC+mg3J5Zyyx
         AW/Nepnzn2hd9SFxXI6i139Ryedz6KQ7j/gfT4ggvS5A5lAjl0zCE9w13FY1K/cuuTdK
         cNpeC1zP/IyYoxkGDhiQbRDey0r4juigmPDqEUexdnRMZQCePt5m69dGSJCr+DoFmbgn
         jc0cZ9N9R7+FM8j+fLGPJFht44M4FD1qmgO0mFG6uUl7rBUnF+Dc15RsLYmofQ1sFsoC
         /6Fog8IC0SVXpGi6thv5IA30fcveWXBaIRKDtqqmKy2HOcC6i9ZFEQixzI9h2FlGfb+A
         /D2w==
X-Gm-Message-State: AAQBX9cqTyBdOGkIUKGl3wW6pk8p7Pk9wlrJt7Ug7LTILN64rmKA5zDc
	+WDv755VvViYhLeUlgSS12g=
X-Google-Smtp-Source: AKy350Yfh4FNIpf1J1n9WFWtoIVX5lNY5G4I5kWaXKL49JEYOX0YSizzV0wjGFCcMhOxnyzB565mnA==
X-Received: by 2002:a17:907:c06:b0:949:cb6a:b6f7 with SMTP id ga6-20020a1709070c0600b00949cb6ab6f7mr15611951ejc.56.1682411404365;
        Tue, 25 Apr 2023 01:30:04 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:03 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 05/24] net: dsa: mt7530: improve comments regarding port 5 and 6
Date: Tue, 25 Apr 2023 11:29:14 +0300
Message-Id: <20230425082933.84654-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013006_276154_2E104529 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There's no logic to numerically order the CPU ports. State the port number
and its capability of being used as a CPU port instead.

Remove the irrelevant PHY muxing information from
mt7530_mac_port_get_caps(). Explain the supported MII modes instead.

Remove the out of place PHY muxing information from
mt753x_phylink_mac_config(). The function is for both the MT7530 and MT7531
switches but there's no PHY muxing on MT7531.

These comments were gradually introduced with the commits below.
ca366d6c889b ("net: dsa: mt7530: Convert to PHYLINK API")
38f790a80560 ("net: dsa: mt7530: Add support for port 5")
88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a new
hardware")
c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 29abf2745294..d0eae8e8c41d 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2498,7 +2498,9 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	case 5: /* Port 5 which can be used as a CPU port supports rgmii with
+		 * delays, mii, and gmii.
+		 */
 		phy_interface_set_rgmii(config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_MII,
 			  config->supported_interfaces);
@@ -2506,7 +2508,9 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 6: /* 1st cpu port */
+	case 6: /* Port 6 which can be used as a CPU port supports rgmii and
+		 * trgmii.
+		 */
 		__set_bit(PHY_INTERFACE_MODE_RGMII,
 			  config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_TRGMII,
@@ -2526,14 +2530,17 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 5: /* 2nd cpu port supports either rgmii or sgmii/8023z */
+	case 5: /* Port 5 which can be used as a CPU port supports rgmii with
+		 * delays on MT7531BE, sgmii/802.3z on MT7531AE.
+		 */
 		if (!priv->p5_sgmii) {
 			phy_interface_set_rgmii(config->supported_interfaces);
 			break;
 		}
 		fallthrough;
 
-	case 6: /* 1st cpu port supports sgmii/8023z only */
+	case 6: /* Port 6 which can be used as a CPU port supports sgmii/802.3z.
+		 */
 		__set_bit(PHY_INTERFACE_MODE_SGMII,
 			  config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
@@ -2725,7 +2732,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		    state->interface != PHY_INTERFACE_MODE_INTERNAL)
 			goto unsupported;
 		break;
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	case 5: /* Port 5, can be used as a CPU port. */
 		if (priv->p5_interface == state->interface)
 			break;
 
@@ -2735,7 +2742,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (priv->p5_intf_sel != P5_DISABLED)
 			priv->p5_interface = state->interface;
 		break;
-	case 6: /* 1st cpu port */
+	case 6: /* Port 6, can be used as a CPU port. */
 		if (priv->p6_interface == state->interface)
 			break;
 
-- 
2.37.2


