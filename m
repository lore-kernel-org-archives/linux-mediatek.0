Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC36C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 08:08:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E6DF64F84
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 08:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E6DF64F84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NJJeOqRm5X7jlHLGSVzBBfX6flNBCwnij9U6AW53kOo=; b=VvvuX55z92pEvscJmGuseyneo
	faChfLz2kSBK0R8CSVsJii3VhUo8dbOcB6T5dweZ9/cRKBWshIlkRuCJ7gtyDrCi8tWxS6KFmhiW5
	PXBn+hp6fLOiVjz3kpM4zpPfIuhDvgWWjChzXZ87KeaB7nOfEA1iaQJ5XRg0ToQMhxhjyZlFP4nCr
	K55uIk1AW4Rw1EDYLTTbk9kj1jd/YeWd0H2kkkchUG7nkWr+KJ41oBT9E5bGdPR7t9YW1QL9WdqlR
	wDij380rP/v0HtjmvGyGwqGWklMFGzayA/A80Mw/whRrz9jhcnSuMoQIp9ls3tAwmQCVIOqKKc603
	ws4xVwwvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKcps-00Aqxi-AI; Fri, 12 Mar 2021 08:07:52 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKcpe-00AqsR-Gq; Fri, 12 Mar 2021 08:07:41 +0000
Received: by mail-pg1-x530.google.com with SMTP id 16so8932304pgo.13;
 Fri, 12 Mar 2021 00:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=te3KkZ/7y8l0N1gnz9fMIpGsfWHYXiKPURp+vcWCB8E=;
 b=FihTQ2zVIfHyWNyLkfgjwMHDyPxCwUHIqC185KqAZJEdBqYjqLCb1Q/l5CK+41xDCf
 AiNkLws86GhP4FP3Acc+xWa2+xXBenk6JZEsb9HbOcvdBcQgDSA8p3761b2pPRUhWgr+
 nSLqprGw/+owuMqtBkPCiyjVGpguvMpen4mGlBbsGw4Yi/Crvuk+MzVCI00GfuWX1afu
 ddFffOoJ06oXlfWpzRaLscR00h9VQdXQX3fEO9OMwiUs/wn+0XOmsjkd8FaljK1lpRVw
 de2s8KqSdI1oMi52qdtFwwZRqieQZlojKTfkotKkvXutErd8kzYiMMrJqPic7grk6wkL
 z4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=te3KkZ/7y8l0N1gnz9fMIpGsfWHYXiKPURp+vcWCB8E=;
 b=ksdZHBxBnpg52exD0AhndvA8IgtfBaS1uvxME4TMVr0kxLc+JLafeC7AY9W/w92nKY
 N02Ma++ATCwn4cKK3Ldz3Ly5y5O9kZywaM3IZO3UBwZZBo0pP4svErtYJuNs/nqPIbu3
 mxy+/IaZLMwRO68ua50TFudGXjKzgyYlcfDRmVOsgeoOLWGE2iYJSskM7HzljIpzwNBI
 nxwhGMr7CI6GPmZ00/gRTF+o6AOY6x3/o6oPXCefixY6lSQglHFRCcKC7ZolqyDmwD2C
 v5x8yawqnrAi+6aem9Py0HhH14w1ZtEKIfOA2APzbOJcuaMIGqmdZmzjRH/3AdzdD2Fn
 70DA==
X-Gm-Message-State: AOAM530pfiTHBEKCWKi93nNNxZrKb+WkdmKnbaHA5AAswEhMrjyg6ygM
 VouFcuAiUVylDy+StgoFSJo=
X-Google-Smtp-Source: ABdhPJyAJm82NZ7DHwzELUMbIN2BgR52bHmEYM8VjrfkOBKeQ1wmBxxKrehZJ/MjRIv0iXyZEAOymg==
X-Received: by 2002:a63:3544:: with SMTP id c65mr10768213pga.284.1615536456233; 
 Fri, 12 Mar 2021 00:07:36 -0800 (PST)
Received: from z640-arch.lan ([2602:61:738f:1000::678])
 by smtp.gmail.com with ESMTPSA id h5sm4459973pgv.87.2021.03.12.00.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 00:07:35 -0800 (PST)
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
 linux-kernel@vger.kernel.org, sander@svanheule.net,
 tsbogend@alpha.franken.de, john@phrozen.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net, v2] net: dsa: mt7530: setup core clock even in TRGMII mode
Date: Fri, 12 Mar 2021 00:07:03 -0800
Message-Id: <20210312080703.63281-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210311012108.7190-1-ilya.lipnitskiy@gmail.com>
References: <20210311012108.7190-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_080738_716227_6F736BE5 
X-CRM114-Status: GOOD (  12.78  )
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
