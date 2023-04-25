Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C86C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=co2jsjwTwJzbd0CfvHd0rFDJW53+yrpC0IXVfcexPcs=; b=uKy3bru9wehpk9
	Ryhvz19hIq6DXfYW59aI/PaESFtUtsAQEePNwfM50X6bZ4eqZfBNEuCWsjvuUPQAPHxR8HeA9g8vO
	dwQzRhg4ItPWLuC7rFWTJt3liYUFsY1fCmbdr1sqZU/4reTVretbACVxt5KsO7Gv/rocj/1cuSvBK
	z7FeFrZ4EKUIyKm1ItMXHtIeQuh289kQ5R0KyyHdzB6HVpT51FIPtpRGw9BCc/TokA/SRbziKAIBf
	+WS020jgJEc/3i7gLDY2vnNdCnPDat34MQOXvDSBtWRkqewazynXHCu8YyYPRIy4f5UDznZKDidd3
	eIV63dYZrJLhjFbhoU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prFEk-000gFG-2J;
	Tue, 25 Apr 2023 09:45:26 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4E-000Ukd-1a;
	Tue, 25 Apr 2023 08:30:32 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-94ef0a8546fso856443566b.1;
        Tue, 25 Apr 2023 01:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411430; x=1685003430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=co2jsjwTwJzbd0CfvHd0rFDJW53+yrpC0IXVfcexPcs=;
        b=XKb6hqva9cpaCTomkMHevUFoOT7/EU2Bze1fOeF/HN9vi9NOc1a+AGZkDack/8l0MD
         CdM/Ra+IIeBSyktSfQbpm8gj15u1/9FXIW0O+Js7Q/Zl/xgIyxVlCtvzxz8Sy2x49uxo
         LZKNfuW3TxpjjSjRph7wkZHXTgWZZCfeH3jdjen2DgyAWNwf0mYfOkNd6TV4NKXQqkit
         yeL2gxBcpSfcHwx9HlamE1NhYdEkYIpH1YEyXBfnhgiJch7oesiUG4A+HnisISEyjG3p
         6sbfi3IxOUWc/OL21CNwTZVx2ETn3oV+llgn4CMEDJtM2pLu+L+nG4oFDQDgIJTm+wuV
         I9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411430; x=1685003430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=co2jsjwTwJzbd0CfvHd0rFDJW53+yrpC0IXVfcexPcs=;
        b=DGaX8g8t1/CfvxukvWRaAYdzTWjnUo6TaEmi0Gc1MljZZ0J+Kh2cNv5NPiX11jo0QT
         PGS3sSLl8JxRroUpCFR1MMkJOIJ9ijRXUvcDkoyS0eLZMQBxujlFICpIE2lPPkDBzSdq
         Un1XGIlmRylFhzLhkZVjJ6WGwQpnijgRq4KqrVuStfjmQufQe91OWOcYadH3CP6nxloe
         YmjQR+6HNNjmnc9z87XmZHea8MDDcYg8iEmrtGBHwiuQ0CF+JhBPgA7UKgR+E+kTh0FY
         XJ2ZtYNL1CBgeAGENVw7p9sUw80E4fT28+mDsbnl1vQhffC6TeymINJOjWQ8doWiiRvE
         /JVA==
X-Gm-Message-State: AAQBX9dirMsseHnu7OKF2dKpFzJfoJmb+xKHFbuQo6L5Kl8+eZpwjYAE
	R+B+JmlvbL44f/6D6d+eV5U=
X-Google-Smtp-Source: AKy350byQOy4L1omedzexSzAU2byBGn+c47N2fDo8+2S0flJALDDrH1iY3icL0zV3jg3N5AK/4u2nA==
X-Received: by 2002:a17:906:69ca:b0:94a:5925:56e2 with SMTP id g10-20020a17090669ca00b0094a592556e2mr12028586ejs.22.1682411429791;
        Tue, 25 Apr 2023 01:30:29 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:29 -0700 (PDT)
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
Subject: [PATCH net-next 15/24] net: dsa: mt7530: switch to if/else statements on mt7530_setup_port6()
Date: Tue, 25 Apr 2023 11:29:24 +0300
Message-Id: <20230425082933.84654-16-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013030_538779_55FC5CC9 
X-CRM114-Status: GOOD (  15.45  )
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

This code is from before this driver was converted to phylink API. Phylink
deals with the unsupported interface cases before mt7530_setup_port6() is
run. Therefore, the default case would never run. However, it must be
defined nonetheless to handle all the remaining enumeration values, the
phy-modes.

Switch to if/else statements which simplifies the code.

Change mt7530_setup_port6() to void now that there're no error cases left.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 980d59170ba2..ea023e32313c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -400,11 +400,11 @@ static void mt7530_pll_setup(struct mt7530_priv *priv)
 }
 
 /* Setup port 6 interface mode and TRGMII TX circuit */
-static int
+static void
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal, val;
+	u32 ncpo1, ssc_delta, xtal, val;
 
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS;
@@ -412,16 +412,18 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 
 	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
 
-	switch (interface) {
-	case PHY_INTERFACE_MODE_RGMII:
-		trgint = 0;
-		break;
-	case PHY_INTERFACE_MODE_TRGMII:
-		trgint = 1;
+	if (interface == PHY_INTERFACE_MODE_RGMII) {
+		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
+			   P6_INTF_MODE(0));
+	} else {
+		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
+			   P6_INTF_MODE(1));
+
 		if (xtal == HWTRAP_XTAL_25MHZ)
 			ssc_delta = 0x57;
 		else
 			ssc_delta = 0x87;
+
 		if (priv->id == ID_MT7621) {
 			/* PLL frequency: 125MHz: 1.0GBit */
 			if (xtal == HWTRAP_XTAL_40MHZ)
@@ -434,17 +436,7 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 			if (xtal == HWTRAP_XTAL_25MHZ)
 				ncpo1 = 0x1400;
 		}
-		break;
-	default:
-		dev_err(priv->dev, "xMII interface %d not supported\n",
-			interface);
-		return -EINVAL;
-	}
 
-	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
-		   P6_INTF_MODE(trgint));
-
-	if (trgint) {
 		/* Disable the MT7530 TRGMII clocks */
 		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 
@@ -466,8 +458,6 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 		/* Enable the MT7530 TRGMII clocks */
 		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 	}
-
-	return 0;
 }
 
 static void
@@ -2562,14 +2552,11 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	int ret;
 
 	if (port == 5) {
 		mt7530_setup_port5(priv->ds, interface);
 	} else if (port == 6) {
-		ret = mt7530_setup_port6(priv->ds, interface);
-		if (ret)
-			return ret;
+		mt7530_setup_port6(priv->ds, interface);
 	}
 
 	return 0;
-- 
2.37.2


