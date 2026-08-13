Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FFAC5AC67
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmNJwBBHheDDW2AFt9/9ZIdRf9AaEJM70d9DBjkc5RA=; b=tMc3EGH6fjAV1mNGeHM9oSOMTA
	9cTQGnixYDJdV0l0IiTXEEJ2Xpeay6kfVIFQnYtHuXivf4h4VEAOYkMeOVS26y5/DqunhJGcOABp3
	CeMKyZKNFNB9iM6I+6zlCoZmzrnDNjcvr6Idy80YotFJBa8qVa95J3iT+G+4Tm6uD1/WsgqoKWZ5F
	dcTlV8xSmxpXlY8N+KxWu5Xhn5TD2G9g+kgHVUHhRTMbvdOu61gIP1/2U1U9C+N+9XlCXW80SnIKC
	VzbEbyzj/CiMlR8BrMj4wjl83SHelohtBtiHuT4Ov3uj41ljm98+MRJiM5IyHRO2ETrGA7jAnWP6x
	Iznl6TYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQur-000000009Tg-3XgF;
	Thu, 13 Aug 2026 08:35:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQum-000000009Ou-1XFC
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 08:35:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4994c49f588so6644095e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610150; x=1787214950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kmNJwBBHheDDW2AFt9/9ZIdRf9AaEJM70d9DBjkc5RA=;
        b=QAtYj3h8jThxSrzTK2jUzIWEelv4OnbYv7hx1kVfoiZktl1UobjG76HXbOFF9pA1HX
         pDVH5Hhm+n/Gca8v1ndTUQUybNXMdKSk6H8vfXFm/Vm97ti8SYoltmcDe1pGnpxB4J3q
         8g8x9h48xNkDQN7IGWpXLcxHpLbE/o9h+BqtRSZ03p03bApUCYjEEiWjdCXCj9lgGMV1
         Mik5DPssPgRm5FmYak4UkB8l25DN1xVfhU6Pfq8CHAqE1fBl4NlyBPN/6kdQ6eLWhQWH
         AvApPMV8LzwPPvBKO53OXZ7+/wobEJfw5zP8/COKs5vDiYMrioh3T6n3FRqLAvx+DI9E
         xnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610150; x=1787214950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kmNJwBBHheDDW2AFt9/9ZIdRf9AaEJM70d9DBjkc5RA=;
        b=Io8QqIONnXyvmtJlJ+2lYboAr18vb826NRs64qTfRzUtWTdnj88iaymYxH3xkVYLHx
         PQFHBRP96ZjKU33ryL5jcxV1SrBPlzEfe4gVEjcyWMaDBWMOT/A/1VwB7XJMbJX+dEwP
         HxLafCZl4MsDNczloZJyrcY7PxqTOv9GmRFl+ePMVaNhmsM0wwEsm1UPGxaKdTa4FpCu
         yceuAI7m041i8w9C8r6wtbfOdIFZkAahyri0hPpNTlalytGH4PZ9xqrQsMsBJt0021ma
         Q4UbF3FWIK6FaqNHNc2J88sjvuwIUU2xP3vFaOEnyYLVyJ8fFSn6T8ZaNc9tn6lCH3Q9
         Rizw==
X-Forwarded-Encrypted: i=1; AHgh+RqUI2ipDDHW/i08XdGGsMgPrc+FTvt8Xxwbusxcf+Yqtu/nVHnmbDU9JwR0cMtxx4X+qr044kU3scUXmFzDrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyM0S5ECMJUh7n8eebptBO0rzcuU2hOwU0UuRchvjNHRoBHdpgu
	d46J+5/BZG1bxxzodoOKNSlSZP/Lzeqckfn5FQatNHZ5Qdr0fuz1/N7I
X-Gm-Gg: AR+sD11/dXDsZiZEJZE5cj3iJYLZ9v0+py7FjKyYSnXCVWkOReiDiqplhIPeM0BIwyy
	KQlg4XDLPZB97xHv1CFqTJ/CVfptJqk2CH9OxMAWTJDpgI8Ino0/aAOCO1wfhOnfij2jfC7t/DJ
	6YWr95BHDGxUaR8wH3oEuIFCzcVdog+7vsYitIX1MM4qcR2SG/VfhWVQFvzn4P7MTlu2C4/cvqW
	hzooaWcAh6VXlsEsgBWSVXqFa8Z3QGhPBtKjjyfwkXSpBDKJwhno013VHuIN9UiCwCFMq5B6e78
	akApx9Bc7BdrNpBnQ6oz1usSPeOkZdUxpyPyYcXo3QTv5gmtDezW8ASOPalXCRcn5w1Z7odot1h
	SKtZC1z6WxgFms84C30ZXH1Wtrn1fbYRozMomDfOJcEPSxwAobdR6LssrVxLnhbE9yDUpPDnbW2
	PJgtIKOsPLuYKp7P4f2pDMQMgwa6sEXfcM1w+DbB7dWjZUdrljRmrL10TSNF4gv9v1VCdPFhqdv
	2FZ3ma1zfo4/G9bBArpF1bI1GBRzQxzM0O7SFzro3Yytx1P
X-Received: by 2002:a05:600c:1546:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-4998220bc5fmr32213365e9.7.1786610150509;
        Thu, 13 Aug 2026 01:35:50 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:35:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v14 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Thu, 13 Aug 2026 10:35:06 +0200
Message-ID: <20260813083536.970196-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_013552_439968_D07DF271 
X-CRM114-Status: GOOD (  17.66  )
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

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b241768edbcb..e1e9f07f51bc 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -628,7 +633,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1903,6 +1908,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2024,7 +2032,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2824,12 +2832,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 		return interface;
 	}
 
-	if (!test_bit(interface, pl->config->supported_interfaces)) {
+	if (!test_bit(interface, pl->supported_interfaces)) {
 		phylink_err(pl,
 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
 			    phy_modes(interface), interface,
 			    (int)PHY_INTERFACE_MODE_MAX,
-			    pl->config->supported_interfaces);
+			    pl->supported_interfaces);
 		return PHY_INTERFACE_MODE_NA;
 	}
 
@@ -3757,14 +3765,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
+	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -3935,7 +3943,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


