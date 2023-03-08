Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FB6C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1qQOPUYZltp62usDX13u0lfSl6bY/5+CW4Brvbfffs=; b=d3LHyiD2aaKO1mdqRkNz+MMVfp
	Tzb8yVp0u1+ias4ilZhPD9Kwvh/Ti3R9DSdXQ1T/koKF0EKs2skusgT8ViHpt0hPfOuBsINnlbkYy
	t/IC6j4qUau+PtsJxcImy/2dXEKAaMDE/XziooZJp7OSbKe+e7kT8fprqFB2HTv2ODASete2e9mQ+
	B8AEtn6DnpKNB8i+ufGmTMgo6q4isS5KtEnemF22qw0i4n0NP5cznij8rUmOgZ1ndFH3nmO9oqduK
	vV507ot8AF349CiAg+WcX/tFL1BRUOhxeIEo1RaWKkAi4fQHpHGaIBcjoqXs2YuY7z8moxgYM59f7
	4JCir7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtb1-0056FP-B7; Wed, 08 Mar 2023 13:12:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtVx-0053SP-Pi; Wed, 08 Mar 2023 13:07:31 +0000
Received: by mail-wr1-x42d.google.com with SMTP id l1so15258111wry.12;
        Wed, 08 Mar 2023 05:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678280846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1qQOPUYZltp62usDX13u0lfSl6bY/5+CW4Brvbfffs=;
        b=LoOmc33r6hDYRPAbUIc7PLTQTmw1nd1Yu1JjIRp7tohLlnWvHQuQCbrLVsYxnwhoAf
         7VAG8+bxYrXzKq7/ZvkKKQaAzMUUmJZIv36GBOP2aOmn9aLjsKnMVBeidiPun1jUfnAu
         xpV9uTVIs4cdbz0bmyRk12AxbOUz80jMj9C7KVzL2WdVbEwwOj2l5dkkcWnWLZJVT99W
         EKbq0sEzdSCv6kVAJ2AqPWtCQC8j5ocjlB1nfwwNOBUE9IpXxUm1OYnpTuRMufAUweQU
         FuOHJQOcV776gVr4QYPigLCgBUdJxaFpYbwEDAZs46B9QkzfG/aYe2ZnunJfFjCfWTkY
         f8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1qQOPUYZltp62usDX13u0lfSl6bY/5+CW4Brvbfffs=;
        b=SARtTeKIIDHFlcrqe0OnNpimQWfI5y1fXBFTh0RjRBfOca3baSYRe9NhFtebzMAHuR
         7tx4Ofq7wdH00lgWdLTnbQlBITlecR29igkW4V65gvsbnmU4n3Eqr81wOsRGX40yGexA
         Mosuhkv61qDyZTPf6i2InewtyjzUfxEj8oPVDf0HM3p+Djb5sJR71RAS4waOF7jd/Jpc
         X8bmSw1Ace/FM2QPwnX8PTHp2A7OCxhMZoqv+JB/P3KVnA6bMA9JJ4xfHHprxWi2HbXH
         et1B0ZtMT1zPmNlNSnEpxNO5oeZ1X1d78LWUTpravsc95/PJjPCJyWX1fhOSe7DQTi0+
         YmrA==
X-Gm-Message-State: AO0yUKVzoeZ2lsKPPKd58GBltOgB89bPrVPKNoSujNdWXU6niFCJxIVH
	vyVn9fW/XX41OOTGLLANx+s=
X-Google-Smtp-Source: AK7set+chCvVyMu/Alk9YMPkc6M1D5hQo3UquQkcmNKdIEeu879ufUQb+Tt+MiE42KL0vZoz6/4HBQ==
X-Received: by 2002:adf:e606:0:b0:2c5:587e:75ba with SMTP id p6-20020adfe606000000b002c5587e75bamr10918723wrm.55.1678280845802;
        Wed, 08 Mar 2023 05:07:25 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d40c3000000b002ce37d2464csm11461328wrq.83.2023.03.08.05.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 05:07:25 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 net 2/2] net: dsa: mt7530: set PLL frequency and trgmii only when trgmii is used
Date: Wed,  8 Mar 2023 16:07:15 +0300
Message-Id: <20230308130714.77397-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308130714.77397-1-arinc.unal@arinc9.com>
References: <20230308130714.77397-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_050729_928535_C6183D56 
X-CRM114-Status: GOOD (  17.46  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

As my testing on the MCM MT7530 switch on MT7621 SoC shows, setting the PLL
frequency does not affect MII modes other than trgmii on port 5 and port 6.
So the assumption is that the operation here called "setting the PLL
frequency" actually sets the frequency of the TRGMII TX clock.

Make it so that it and the rest of the trgmii setup run only when the
trgmii mode is used.

Tested rgmii and trgmii modes of port 6 on MCM MT7530 on MT7621AT Unielec
U7621-06 and standalone MT7530 on MT7623NI Bananapi BPI-R2.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 62 ++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b1a79460df0e..c2d81b7a429d 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -430,8 +430,6 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	switch (interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		trgint = 0;
-		/* PLL frequency: 125MHz */
-		ncpo1 = 0x0c80;
 		break;
 	case PHY_INTERFACE_MODE_TRGMII:
 		trgint = 1;
@@ -462,38 +460,40 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
 		   P6_INTF_MODE(trgint));
 
-	/* Lower Tx Driving for TRGMII path */
-	for (i = 0 ; i < NUM_TRGMII_CTRL ; i++)
-		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
-			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
-
-	/* Disable MT7530 core and TRGMII Tx clocks */
-	core_clear(priv, CORE_TRGMII_GSW_CLK_CG,
-		   REG_GSWCK_EN | REG_TRGMIICK_EN);
-
-	/* Setup the MT7530 TRGMII Tx Clock */
-	core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
-	core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
-	core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
-	core_write(priv, CORE_PLL_GROUP11, RG_LCDDS_SSC_DELTA1(ssc_delta));
-	core_write(priv, CORE_PLL_GROUP4,
-		   RG_SYSPLL_DDSFBK_EN | RG_SYSPLL_BIAS_EN |
-		   RG_SYSPLL_BIAS_LPF_EN);
-	core_write(priv, CORE_PLL_GROUP2,
-		   RG_SYSPLL_EN_NORMAL | RG_SYSPLL_VODEN |
-		   RG_SYSPLL_POSDIV(1));
-	core_write(priv, CORE_PLL_GROUP7,
-		   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
-		   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
-
-	/* Enable MT7530 core and TRGMII Tx clocks */
-	core_set(priv, CORE_TRGMII_GSW_CLK_CG,
-		 REG_GSWCK_EN | REG_TRGMIICK_EN);
-
-	if (!trgint)
+	if (trgint) {
+		/* Lower Tx Driving for TRGMII path */
+		for (i = 0 ; i < NUM_TRGMII_CTRL ; i++)
+			mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
+				     TD_DM_DRVP(8) | TD_DM_DRVN(8));
+
+		/* Disable MT7530 core and TRGMII Tx clocks */
+		core_clear(priv, CORE_TRGMII_GSW_CLK_CG,
+			   REG_GSWCK_EN | REG_TRGMIICK_EN);
+
+		/* Setup the MT7530 TRGMII Tx Clock */
+		core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
+		core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
+		core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
+		core_write(priv, CORE_PLL_GROUP11, RG_LCDDS_SSC_DELTA1(ssc_delta));
+		core_write(priv, CORE_PLL_GROUP4,
+			   RG_SYSPLL_DDSFBK_EN | RG_SYSPLL_BIAS_EN |
+			   RG_SYSPLL_BIAS_LPF_EN);
+		core_write(priv, CORE_PLL_GROUP2,
+			   RG_SYSPLL_EN_NORMAL | RG_SYSPLL_VODEN |
+			   RG_SYSPLL_POSDIV(1));
+		core_write(priv, CORE_PLL_GROUP7,
+			   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
+			   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
+
+		/* Enable MT7530 core and TRGMII Tx clocks */
+		core_set(priv, CORE_TRGMII_GSW_CLK_CG,
+			 REG_GSWCK_EN | REG_TRGMIICK_EN);
+	} else {
 		for (i = 0 ; i < NUM_TRGMII_CTRL; i++)
 			mt7530_rmw(priv, MT7530_TRGMII_RD(i),
 				   RD_TAP_MASK, RD_TAP(16));
+	}
+
 	return 0;
 }
 
-- 
2.37.2


