Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE52C4321A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 02:12:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EABA64FD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 02:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EABA64FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P8LcSjEKB7HVvxY2sQ4MvxCIWxlgRSWtk9CXMjRdD5M=; b=BLOV3nMzC0+I7F+5iOxHNoGOX
	bXWCqNgysNOQwXFzw4B6c3xgIJoouF0JqrwHQGI3BCGA6UHAAL73MF+Y3k+qvtOw4xKBdDTg4mYI1
	NYuM2OFhB3US71UIIqcWy9zHxFW7vK4/fcAeY9aZSdzbRVx6e41LkDiteECA7N01ncTg0p1ajTz9j
	j5A3jWk41Vv8NVxgRZrd6HrLTeVXc+EBtXB0rf01xww8eOanqOBscnQ0INuFfhigAiz+zZvPhnHky
	HmbnJXqZOQZKz4oF7sRiWF52Rrp9FKcH9ShrbPwYHeepeIm/5PW2hzD21QXLquVzf2TCIWsEPpzzE
	pVofri1gg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKAnu-008EQO-MF; Thu, 11 Mar 2021 02:11:58 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKAnd-008EOA-GL; Thu, 11 Mar 2021 02:11:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so952458pjb.0; 
 Wed, 10 Mar 2021 18:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B3NvjxFQkBW7qiD7WXidQCqOgaMtOHmNc5t+RjW8jYs=;
 b=Ag4U2H/cx+7yWjZGqdF8jnN9Ftc1pFYjhKg1Qw/pfE+4UNlElJXTGt+DRYq5/fLFcf
 4ihweh8lj8HfxiisnOoSxxoIio7jJX9I2f3X9SVyKbILLCPRzbVGzxDXjcZsbELf4xVB
 lRvDAbE6Z12HPMYC1h+p2qvPAU1vTXFHbRn2mVkkm+WI2Q7lS45WcUQ6YwhofEtXKGkB
 ZSrUAj8Jk2C12+mZyhZHZF4oRkdrc7rHgRDmG0+Qge+kCeou2tb+ZuzUgAUz+Xc6ejHW
 T+IU2eBT8bjy+9cpBIgrxWSXPM5bkWXaQ4vZppl58LNITAeZvnWoAeWuCW3QDMtNP4ex
 p77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3NvjxFQkBW7qiD7WXidQCqOgaMtOHmNc5t+RjW8jYs=;
 b=uWrjyJJT7+b0SV9ZToaJ1KIFPyJCG87sDEZnQ/4uPLjvE+Gv4J9PhejmeZN350vFZy
 IpifP6imOeUL05Fzyuc3PXkXWq9muDUEq/6KKi0wevhzT4gq2DcLGCi3nyoNVvSw27Ys
 PcUL3JfnwFGzTF/JTxv/2HIeTC5zvLiErTEdRAemqgIhqRMG3H0MAz4cC1VNi0GdsgkT
 aNGWTBoGqeMGK727L9pc0NszrzaIMFRFvvWRHI1sXoLP9mYznw1sv0aVpoRTMUkTTgRV
 RW0tWtLGeQ9RLvhkNb3gt0hHE3qMt81oh97HW5jkeYmP0xxr2EZWvKoLTp227cwxgMoB
 AMzw==
X-Gm-Message-State: AOAM5309j1LJ+Vhf+BiCKqbaMI6awsMoCI7eaufGtdFUN6JiFW7LpB5q
 BrNAybH4nu3fhynAYwzw4tI=
X-Google-Smtp-Source: ABdhPJypqyrbNio+ygSelexHSUtxznF8mzVzEBNNmvXV5kFlJJk14K7c2oLyfeZUSoVWv9YhxHNb/Q==
X-Received: by 2002:a17:90a:c84:: with SMTP id
 v4mr6627560pja.228.1615428699863; 
 Wed, 10 Mar 2021 18:11:39 -0800 (PST)
Received: from z640-arch.lan ([2602:61:738f:1000::678])
 by smtp.gmail.com with ESMTPSA id p190sm672603pga.78.2021.03.10.18.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 18:11:39 -0800 (PST)
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
Subject: [PATCH net-next,
 v2 2/3] net: dsa: mt7530: clean up redundant clock enables
Date: Wed, 10 Mar 2021 18:09:53 -0800
Message-Id: <20210311020954.842341-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210311020954.842341-1-ilya.lipnitskiy@gmail.com>
References: <20210311020954.842341-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_021141_688004_59C47B9C 
X-CRM114-Status: GOOD (  12.94  )
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

Two minor changes:

- In RGMII mode, the REG_GSWCK_EN bit of CORE_TRGMII_GSW_CLK_CG gets
  set three times in a row. In TRGMII mode, two times. Simplify the code
  and only set it once for both modes.

- When disabling PLL, there is no need to call core_write_mmd_indirect
  directly, use the core_write wrapper instead like the rest of the code
  in the function does. This change helps with consistency and
  readability.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/dsa/mt7530.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9871d7cff93a..80a35caf920e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -444,10 +444,7 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	 * provide our own core_write_mmd_indirect to complete this
 	 * function.
 	 */
-	core_write_mmd_indirect(priv,
-				CORE_GSWPLL_GRP1,
-				MDIO_MMD_VEND2,
-				0);
+	core_write(priv, CORE_GSWPLL_GRP1, 0);
 
 	/* Set core clock into 500Mhz */
 	core_write(priv, CORE_GSWPLL_GRP2,
@@ -460,11 +457,7 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		   RG_GSWPLL_POSDIV_200M(2) |
 		   RG_GSWPLL_FBKDIV_200M(32));
 
-	/* Enable MT7530 core clock */
-	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
-
 	/* Setup the MT7530 TRGMII Tx Clock */
-	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
 	core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
 	core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
 	core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
@@ -478,6 +471,8 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	core_write(priv, CORE_PLL_GROUP7,
 		   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
 		   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
+
+	/* Enable MT7530 core and TRGMII Tx clocks */
 	core_set(priv, CORE_TRGMII_GSW_CLK_CG,
 		 REG_GSWCK_EN | REG_TRGMIICK_EN);
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
