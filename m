Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B0AC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 01:21:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E7C64E33
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 01:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E7C64E33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJJeOqRm5X7jlHLGSVzBBfX6flNBCwnij9U6AW53kOo=; b=p9Cwr/62BsntVMMcI7IZW+y3EV
	CXuYZPCb3mxAdtpD0RVaKHY8lvzJanAnp/LI6xSM4mhhdqYawCZAw9MEBIdCnQLcvLVSqSEgXs0OA
	B7fK3rTDdHjBH4EydO5uz8PhFj3Jlpk5ANUUxKqHiiTBVnyoPpYX7S3K62SWyxV3W1kNB7JP+tSxO
	0rAMhg8hcM85Yuw96w6kYi+IMtYG9c7SJYY3EXlf6dQfgj9pWi8ZWIux4JgxYXWp8lzS+0964LgKB
	w4PsVoN0MO2lIGTYWYMT/pLiMIlyfDGaikTwX+TfnGvqH8vkGhR5/+p9lDtHBB4zWp7w6WLiAfem8
	Y+Kmnwcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKA16-008AYM-WD; Thu, 11 Mar 2021 01:21:33 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKA0l-008AQi-JD; Thu, 11 Mar 2021 01:21:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id q204so13289775pfq.10;
 Wed, 10 Mar 2021 17:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=te3KkZ/7y8l0N1gnz9fMIpGsfWHYXiKPURp+vcWCB8E=;
 b=Au+RBIDSlz3wCuB/gOx33O1w5AROEEMoqV2WiwYIkaqfiSq5If3GPNfTo4eKol3JQ4
 Eml/1T0KBGaXSkuPgFUmVompKUMjCZcjkA5FbWidBCi2qGUpae5SYoxAo/lGyrO/0OaB
 7CiWJw6z8ttZuazqW32CJ9OifmAson1OXihNyRbijeKyHXSjiguefsl4DjJocHNr3LgO
 zLY+oXDx1E0VFOLORK2ljBX/5s66zo1Wn2o29peHdEr6+pedp7ldmPgrsjPmj6AVfuVG
 c6ZEXgCDW9AGspuGz/YfpjcauGdltXbLLLjFvBW7fU9CBfc/CjEk9N11G8wK3qv/P/zC
 bk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=te3KkZ/7y8l0N1gnz9fMIpGsfWHYXiKPURp+vcWCB8E=;
 b=Nk3/GnQtu4HXZ2qKhbnoM7FF1n5AwT1HjXWHmsodVoPH5I6JVlfy7FfnFFEPvtM+7S
 EYLREHeVGPiDCUPHQ9aNtDkwbRkdclRCbOmT60iZIgU1lMrtJwLv3NM/j/9JTzNKlwuU
 jF8Df4ptWqRkPYF5PbtXOlIqHFkH6tLd0Td/12hn/7Pi+SldKWjB8b7uCKh6DYnVtoYv
 wZfeWobm/Krg/sfsfbTQJMoBk4Z+7anNj/afgPM8YmueJEAv/hcZ4B4avnD9QJwZ8ByZ
 o/mDF8ctmtXwgt4sfAwNSZbGf0VJ7WRd6h/m7D1ZqgJ3d9G3uJb4GWqLRhsiIc2TLMzt
 hYEA==
X-Gm-Message-State: AOAM53213ewmzZD0E4nefOzXDFz/Bxq44gfLG3afQIX4JOVW1d3QkTBl
 WQs/CCqKsewWzIRCSkvYCpU=
X-Google-Smtp-Source: ABdhPJzfCTM0tCmlERAEvAYmQCorqH4rabL9SlWfRvF5lqGrcyno8QV1gtoYRxQjOM8CF4PXaClBkQ==
X-Received: by 2002:aa7:8286:0:b029:1e2:70ef:c410 with SMTP id
 s6-20020aa782860000b02901e270efc410mr5058738pfm.45.1615425670189; 
 Wed, 10 Mar 2021 17:21:10 -0800 (PST)
Received: from z640-arch.lan ([2602:61:738f:1000::678])
 by smtp.gmail.com with ESMTPSA id g7sm595470pgb.10.2021.03.10.17.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 17:21:09 -0800 (PST)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net] net: dsa: mt7530: setup core clock even in TRGMII mode
Date: Wed, 10 Mar 2021 17:21:08 -0800
Message-Id: <20210311012108.7190-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_012111_830125_8A409D92 
X-CRM114-Status: GOOD (  11.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A recent change to MIPS ralink reset logic made it so mt7530 actually
resets the switch on platforms such as mt7621 (where bit 2 is the reset
line for the switch). That exposed an issue where the switch would not
function properly in TRGMII mode after a reset.

Reconfigure core clock in TRGMII mode to fix the issue.

Tested on Ubiquiti ER-X (MT7621) with TRGMII mode enabled.

Fixes: 3f9ef7785a9c ("MIPS: ralink: manage low reset lines")
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/dsa/mt7530.c | 52 +++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index f06f5fa2f898..9871d7cff93a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -436,34 +436,32 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
 
 	/* Setup core clock for MT7530 */
-	if (!trgint) {
-		/* Disable MT7530 core clock */
-		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
-
-		/* Disable PLL, since phy_device has not yet been created
-		 * provided for phy_[read,write]_mmd_indirect is called, we
-		 * provide our own core_write_mmd_indirect to complete this
-		 * function.
-		 */
-		core_write_mmd_indirect(priv,
-					CORE_GSWPLL_GRP1,
-					MDIO_MMD_VEND2,
-					0);
-
-		/* Set core clock into 500Mhz */
-		core_write(priv, CORE_GSWPLL_GRP2,
-			   RG_GSWPLL_POSDIV_500M(1) |
-			   RG_GSWPLL_FBKDIV_500M(25));
+	/* Disable MT7530 core clock */
+	core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
 
-		/* Enable PLL */
-		core_write(priv, CORE_GSWPLL_GRP1,
-			   RG_GSWPLL_EN_PRE |
-			   RG_GSWPLL_POSDIV_200M(2) |
-			   RG_GSWPLL_FBKDIV_200M(32));
-
-		/* Enable MT7530 core clock */
-		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
-	}
+	/* Disable PLL, since phy_device has not yet been created
+	 * provided for phy_[read,write]_mmd_indirect is called, we
+	 * provide our own core_write_mmd_indirect to complete this
+	 * function.
+	 */
+	core_write_mmd_indirect(priv,
+				CORE_GSWPLL_GRP1,
+				MDIO_MMD_VEND2,
+				0);
+
+	/* Set core clock into 500Mhz */
+	core_write(priv, CORE_GSWPLL_GRP2,
+		   RG_GSWPLL_POSDIV_500M(1) |
+		   RG_GSWPLL_FBKDIV_500M(25));
+
+	/* Enable PLL */
+	core_write(priv, CORE_GSWPLL_GRP1,
+		   RG_GSWPLL_EN_PRE |
+		   RG_GSWPLL_POSDIV_200M(2) |
+		   RG_GSWPLL_FBKDIV_200M(32));
+
+	/* Enable MT7530 core clock */
+	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
 
 	/* Setup the MT7530 TRGMII Tx Clock */
 	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
