Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BF1C77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFh2cVYNVWNH2e/B2Q9MnHN00EOGUMNPev4l4KjaQPQ=; b=Nv54CWf8GTe6yg
	/cBh8vghkIviIyMNZj7S/jzDnLn+MmAOsDOS5adGeF6DO+k+rfqlqOL2nsFoB/RE33Q68PMtQDq72
	4y1t0Bb/4s6Aj5vfeRZpYfh4Z47sMWcf8LEPxS7Y7C8jK5arSrTVdts/sIY5H659pkXN6MktyxWi7
	jZtiAnGdY/h5FlBg7lBuLKUcQL0XjsxmWIL1vjQXgsN6QTcieaEZda5N80MklugTURchttbixm6aK
	LXm4k5My/72kDuusrzUXC07wYub08I9uWPR5EvwaxR6DlwGSvVYCVCVC62SVeeY71MPNYFTGczOT+
	8rODo8ht6lu3DkpNbLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprug-00B8p7-1N;
	Fri, 21 Apr 2023 14:39:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtA-00B7aq-1K;
	Fri, 21 Apr 2023 14:37:29 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so12863107a12.0;
        Fri, 21 Apr 2023 07:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087846; x=1684679846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFh2cVYNVWNH2e/B2Q9MnHN00EOGUMNPev4l4KjaQPQ=;
        b=Eji7XoaMdAzuLZN23yCesTBFPa6Gx7VFBSGwOlbm/mx/yEJNkFWxiSoy9sZbvFQTDH
         R2EopPYhnBw+zEqsC4T4JFkh+694rd14o1UvM9MwCZf/PlBPn94u7J6jP9yQBjyXGtV/
         zOqtHTFzvaAjPCUoWT2D32fCkRLRJm69Oac5h4L5mqxz8aWc2A27GxS/4rPBlkdn+J8B
         BBUQ9JlQkva8CaildHU7EdmGper61dY/YdcEp+vaEgCQpP8NuOhV3vjBE5B1592O4BcM
         J4lj4YYfzyhekhv78/Gah9fer+cNGvjrHJNLtUQHjurp1KtykNLJG5S50xOq1H4xv2Ui
         QJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087846; x=1684679846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFh2cVYNVWNH2e/B2Q9MnHN00EOGUMNPev4l4KjaQPQ=;
        b=Ml1hjIKWNFCaf1OK5v7Rmy7qkGR2TmAmIdXeM2UB65EH1hfdsMTeB+0HLLXQGG1VLj
         X0E2nFp8VCSKxBpaSKcAGOaJdGz2O4CwLecutVy2z+PXGCKYPWlFqFR4BwhO93GzVgkS
         SCRVhJxKbr+0KH+pswuOSURqkZlwNVBolfUqLNP+Dc9+/xNMDZM5djWnisc9H8eJt3B0
         Mb7niJRP0IfBaKzWZdxYcUM5wbNnirzSSfYVS2AGnZQ1xP9jYqj6Db4xUgpPAzGYtXLw
         gPX6M5JgZ0qLkqbUGOXicaVQbv1HGkheACMaHrt+L94Ep340/j7EbYBLUg5k7JD5ZoeO
         UOyg==
X-Gm-Message-State: AAQBX9f+URs515lG0406mwbkLoLTt11aJmSBI7dn3u4x2fXpb+p65Yi9
	2kF6l1r+WtXuRWXPR5ghamI=
X-Google-Smtp-Source: AKy350bbVTzvWAyw1Pzyv3JZvCjOYIu5BlzcjdfB57uvypsYM9/7E18cQ+2Yd/+fSMrEkeBkXKLRJA==
X-Received: by 2002:a17:906:4557:b0:957:1dda:853b with SMTP id s23-20020a170906455700b009571dda853bmr2170790ejq.24.1682087845626;
        Fri, 21 Apr 2023 07:37:25 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:25 -0700 (PDT)
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
Subject: [RFC PATCH net-next 14/22] net: dsa: mt7530: switch to if/else statements on mt7530_setup_port6()
Date: Fri, 21 Apr 2023 17:36:40 +0300
Message-Id: <20230421143648.87889-15-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073728_450631_183EE0D0 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
index 8fe9b1e6932c..610828b56eac 100644
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
 			/* PLL frequency: 150MHz: 1.2GBit */
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
@@ -2568,14 +2558,11 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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


