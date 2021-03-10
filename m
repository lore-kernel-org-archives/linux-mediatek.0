Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6A7C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 21:23:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE9C64FEF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 21:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BE9C64FEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kVosrOP7zKZXHIEsWZNa9ORaocTbvoJhF8tZUo7k5Mk=; b=oQc9IEqZ6VNH7H59ZKqj+HX/R
	FidVIlfeZ8WDJp/EvO+CSpJrTPJ2QFsCg2ux/oxSSbucNcQNQygqhZB+7Amgyx36nZ/4CYfhGmFgA
	nYL+1NyDpGdDXCWpw542J8pKPRkXS14pAH1cK/C5V6BJVLZDqj7C8lKnbbd9BZKq/AMAbiC9sauLi
	ZF2b/i26dqKf+IYom3Yu8Z2kGsI4b0tOpP1sUWu7eJAUTZLyEQEDFz3he3lt5rGh8M/jeT/Ce3q4Y
	s5eMIBFzLhQ5jO51Ecv/uP/7MJHZhlrnodcnfs9BkxJrcUbmPnvxK5BZMnqWf5l13U0KtJRCcg5rG
	rGhiUgmUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK6IA-007muX-9D; Wed, 10 Mar 2021 21:22:55 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK6A2-007kSx-CG; Wed, 10 Mar 2021 21:14:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso7941208pjd.3; 
 Wed, 10 Mar 2021 13:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+v6qAt05GB3pyWDepiyyyWC9bZx8wHfiUnSye/9786g=;
 b=Bfqtm0qvVc7TNTh3q4/EWyuJxpXX1jie2lxkaJCEITbnbLyk0BhgBkeuSK8vlurR3I
 tHGC2RErjqD8Us9Bkr/Oy5IwY/9UbbTnbCJNyit/Z2EFVhC9DrB1yUtiZj8oN6U7R093
 RfQEKm6ske5N6nQN3d35cJcADPN2pmjnYHYQMxea6SB80bI5w1wTZGPvNaHHjOyW3TL4
 K29LwBcVT1BvpysQmbya22RNFNTMpAbOuwb6elDvr6QK4EuudQ6Y2nwpeDUC6rJ4kngV
 yMuvwW5/lxRwCHbHlceUYpFBgVTgH7xDbMAJi+D7Pybpef7uE42zewEDfeAX4MV93Wh9
 eSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+v6qAt05GB3pyWDepiyyyWC9bZx8wHfiUnSye/9786g=;
 b=a+0N8HXTbWda0NJSdROYPOCcCgAcdbXI2PUenWYsoVhwYXSd7893wX/MaEEF6ERwJx
 vF2dAznEe1qFFT1kqk4ojiVb5ljgK1MQJOdlw3AwuwtZJqFr7pY/EfWC5qkN5pu3awil
 7mChGo7Qag2g/KMsyMmDIXEchKVhSoRN+AC4pcAspDTA4Wrd3rL8U/B5cTDl6cGEROyE
 ivy3X+WY3sAs1ScX6yq9XHvy/NCw9QPSNkpMbNCXzwaiDmXi/gWTIC2ODuh/IKqSR8VA
 5qR2594lfOqGXeDjxj0v6h/vc8BGj1r7gPhe7fPACe8Obe3PzzSSEd1to1v7gG/vR671
 ZSkQ==
X-Gm-Message-State: AOAM5313X705XD9FMO8j20iBxZRwLIKHSFadoyLAwlpuw25Z3419lfp0
 648g65FflvJAM1Chyl1/L9g=
X-Google-Smtp-Source: ABdhPJzQXy7sfY96AqR6uwF3anxp4aOhTVgA5r50zW/IN+aChTsFBaAEqBcwxyoybmQBG0s5wUTYQw==
X-Received: by 2002:a17:90a:7182:: with SMTP id
 i2mr5360459pjk.111.1615410868697; 
 Wed, 10 Mar 2021 13:14:28 -0800 (PST)
Received: from ilya-fury.lan ([2602:61:738f:1000::b87])
 by smtp.gmail.com with ESMTPSA id 35sm412090pgr.14.2021.03.10.13.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:14:27 -0800 (PST)
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
Subject: [PATCH 3/3] net: dsa: mt7530: setup core clock even in TRGMII mode
Date: Wed, 10 Mar 2021 13:14:20 -0800
Message-Id: <20210310211420.649985-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
References: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_211430_709566_C6775B7A 
X-CRM114-Status: GOOD (  14.15  )
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

3f9ef7785a9c ("MIPS: ralink: manage low reset lines") made it so mt7530
actually resets the switch on platforms such as mt7621 (where bit 2 is
the reset line for the switch). That exposed an issue where the switch
would not function properly in TRGMII mode after a reset.

Reconfigure core clock in TRGMII mode to fix the issue.

Also, disable both core and TRGMII Tx clocks prior to reconfiguring.
Previously, only the core clock was disabled, but not TRGMII Tx clock.

Tested on Ubiquity ER-X (MT7621) with TRGMII mode enabled.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/dsa/mt7530.c | 44 ++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b106ea816778..7ef5e7c23e05 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -435,30 +435,30 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
 			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
 
-	/* Setup core clock for MT7530 */
-	if (!trgint) {
-		/* Disable MT7530 core clock */
-		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
-
-		/* Disable PLL, since phy_device has not yet been created
-		 * provided for phy_[read,write]_mmd_indirect is called, we
-		 * provide our own core_write_mmd_indirect to complete this
-		 * function.
-		 */
-		core_write(priv, CORE_GSWPLL_GRP1, 0);
-
-		/* Set core clock into 500Mhz */
-		core_write(priv, CORE_GSWPLL_GRP2,
-			   RG_GSWPLL_POSDIV_500M(1) |
-			   RG_GSWPLL_FBKDIV_500M(25));
+	/* Since phy_device has not yet been created and
+	 * phy_[read,write]_mmd_indirect is not available, we provide our own
+	 * core_write_mmd_indirect with core_{clear,write,set} wrappers to
+	 * complete this function.
+	 */
 
-		/* Enable PLL */
-		core_write(priv, CORE_GSWPLL_GRP1,
-			   RG_GSWPLL_EN_PRE |
-			   RG_GSWPLL_POSDIV_200M(2) |
-			   RG_GSWPLL_FBKDIV_200M(32));
+	/* Disable MT7530 core and TRGMII Tx clocks */
+	core_clear(priv, CORE_TRGMII_GSW_CLK_CG,
+		   REG_GSWCK_EN | REG_TRGMIICK_EN);
 
-	}
+	/* Setup core clock for MT7530 */
+	/* Disable PLL */
+	core_write(priv, CORE_GSWPLL_GRP1, 0);
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
 
 	/* Setup the MT7530 TRGMII Tx Clock */
 	core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
