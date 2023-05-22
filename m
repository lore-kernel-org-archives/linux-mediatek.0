Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C0AC7EE26
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXJvm4BanXy98faJtbpsaIfSwxdUE0yan5VZ72bTyhw=; b=HEtAr5pBPTy8bC
	6XTroDfr7SUMN6aXQ7LEYCDFzXPj/Ux7wCNUw3bRyZp21F4dtKSj4RhYwnCayGuQ0+OXWLd9i9oWl
	4uA23qtUC+EH98JB6se2dy5IG7cf3b+eOe+9V9J1Lc1I2SVzZWg06IeVlqi9pdvov4+h0WmItIAuf
	fmQaj9BsoJNM93xAUvbsr7eTFyq6Vxdyud6vfRcymmjGBvJflmpWSOK+40KcSNKeUuoXqt4LO9sn/
	l1Szxq8rdef83eQdtFHfF9WjG2GKZTWGfIYozWbjJcX8TCOpEEQ5SGCSFSsXAMBPeqrnmlpympE9p
	T8rD0eNgR0lswD6kpDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14ql-006Wkc-2k;
	Mon, 22 May 2023 12:41:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14qd-006WeN-06;
	Mon, 22 May 2023 12:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MXJvm4BanXy98faJtbpsaIfSwxdUE0yan5VZ72bTyhw=; b=DcCJmwnD2HQj53uUIvudVd8Hme
	iuNjtwVza0ksPbZGPM7RTPO04rczDQJn0kX0wQm/5kf61Ffq8Ux9dtC/UPfNe5Pi9oh24gVJ4u2ib
	iBtB3dv25lMuZyZ8caTTrYzMwU4kb/vCxFO1T7OeGw4MKAQTXUQiZta+fG2i3ZMBRKMNlIKjjNqIc
	Rl1R4n2cr3sLH4MCDQK2MubRDFuLPrzY/32nGLjdPs9StY/X86/MRV/TuyQzOfqQbZA1vbz1lwXOR
	bDiDSIt2fMdo0aQzjB7EVENHX5uij0GMYnqXdWPifOW/KJxxZwpPSzWMyzIQ1e8rGz/UK8RPqJdDw
	ReKlBz/g==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Sj-0021mR-2m;
	Mon, 22 May 2023 12:16:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96f6e83e12fso489594566b.1;
        Mon, 22 May 2023 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757788; x=1687349788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXJvm4BanXy98faJtbpsaIfSwxdUE0yan5VZ72bTyhw=;
        b=JFML/u+TZX374inSW9dEos+1RCN6m2sGTv63O/EfGGpmOJhQQ8zqpNh8cRppdWf6lq
         ymtwX6Y+BdlMhtGfP3cEfoIq6tCmI20/SW0P7pS4lumP3KLTKIBmVIFxResi0X2aX+vx
         tke2x165gkXom6+/GJc1qS8fTaXlif3ynvr1PR7AYCS+1NGwKINg9ZvJndQj++BiPJXt
         BSJzvT+aIOM1QbGeJE6tvr2JonPJ22OOI2QaCQFGEFZRdA+un4O9XAugd3E0qrC+DhXZ
         8LjrEhGpP4PY0IPPRcOkPXfhXq/fR/cZUY8VA5RY2NwPmB8zghJLyL3Lza4loz0O7b3F
         wyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757788; x=1687349788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXJvm4BanXy98faJtbpsaIfSwxdUE0yan5VZ72bTyhw=;
        b=X4fNbaqKpYaIRZzW4ARJ+8/ywbhwgFctC6v9BLLJN6iAK1k0il0B1wuyZ1T6XYeih1
         gzrGZQQqMa1HQR/H8RSdvkfrD6XUIq66wAghNqMuVyTiRRGACaPWqHUML5wQSB8T3SG3
         GGik/pSWKTvszolbiVMwlLXBO+HkPRGW03UhEd4iuuPDGppjQB4uQaeTw+2QUpCpBSkc
         n210XAg4VwsVdyaM2wFYb2u+sVL7G5zB2ZnyPMyt9J6deDYoQwCfHnJLVg+ciYI9n2Ye
         3zTPtKuKw8HDBn6qQPEh2yjOoXfGZR/N4kWfSB6850aUzOedMdtEXSVhIOFCp9Fxcjst
         HDFA==
X-Gm-Message-State: AC+VfDz3gJ/oNofAMIHioICiQfRvS0J1gDjPFZf1bNVT1mnzL5YJUGlp
	CEOFycz5eF5XdYhR4iUiJCA=
X-Google-Smtp-Source: ACHHUZ6vJ8AzE8PNAfVN1zoa1xmkJap1GYfYdM/+VUy2HoekWvjptqJ31qOUOdDQPBDRBrJsLfLySw==
X-Received: by 2002:a17:907:3206:b0:94f:6058:4983 with SMTP id xg6-20020a170907320600b0094f60584983mr8336972ejb.76.1684757787991;
        Mon, 22 May 2023 05:16:27 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:27 -0700 (PDT)
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
Subject: [PATCH net-next 14/30] net: dsa: mt7530: switch to if/else statements on mt7530_setup_port6()
Date: Mon, 22 May 2023 15:15:16 +0300
Message-Id: <20230522121532.86610-15-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_131630_040078_C586E024 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
index 47b89193d4cc..744787e38ecc 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -400,26 +400,28 @@ static void mt7530_pll_setup(struct mt7530_priv *priv)
 }
 
 /* Setup port 6 interface mode and TRGMII TX circuit */
-static int
+static void
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal;
+	u32 ncpo1, ssc_delta, xtal;
 
 	mt7530_clear(priv, MT7530_MHWTRAP, MHWTRAP_P6_DIS);
 
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
@@ -432,17 +434,7 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
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
 
@@ -464,8 +456,6 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 		/* Enable the MT7530 TRGMII clocks */
 		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 	}
-
-	return 0;
 }
 
 static void
@@ -2563,14 +2553,11 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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
2.39.2


