Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ACDC982C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 23:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CVtSRo73kcxXzyXjS3Uh97Hci0HJhAxnJFberGLSLg=; b=KtPXFLQ5VC1Y4bofzm9sT8i8t9
	3Tj4hWD2zedRzs3thNYUoOo2CJoyq1ExfNW/DSvkb9VuWtr1LkFUjIhEDUYGv/CsC1CePSu3/GE3p
	uPAdMWK8PPABFAa3MxTaUckrZ5cm94w0ov91wwrP50vtw3IiCIkeOwu9v6GsOTX5Cyycsbu18MZrA
	2zlW+ESyuJfEX8O91hjECv+r/FeFg7ve7gSVH+/odBTtyWtyUodWlyOzuu74Vrpbdzjaz0HYQTkL7
	SGp7/mOUXvxy0vJk0rC0r9p60kqX7ZaVuesdEbQhwGtnjGzCuUYGXL06wYesty336PqFTaQv6AkPM
	pk6lcN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQH-0000000AGH2-3giN;
	Wed, 16 Sep 2026 23:52:17 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQF-0000000AGFq-3YBC
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 23:52:17 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-484366874b0so111503f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 16:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602734; x=1790207534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4CVtSRo73kcxXzyXjS3Uh97Hci0HJhAxnJFberGLSLg=;
        b=JxKw2XTnOOfwdCExfbktlidCO8oSFqRxHUNTEgOJUySD2fDyxd5CuGtD5VnTCFtGh0
         +jAwgUCjeRRu9hAxwGIQXXeDyx1i4dasGuO70tG75HYvmJtjIFa3xWcWMvNA4ahjdzor
         1jue3a+/wkKcJ5u33aJfXov80Dl6FviWVfXybcIEhsQU3GJ3+JPEz0W62ZfvlJGQkg2F
         yXPW/7lnsNVrEZWNrAxVGl673aTwspfWW2rSRIbX2YDgREv3lJjOwzPwGtCTIAPEOES2
         iMdrhJu/fKxJF/ZTVqtwYl18mrifQ56XBlZ0p+uWjJmF2mHyCgAYgqdvvgiyQsWDLyD5
         jIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602734; x=1790207534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4CVtSRo73kcxXzyXjS3Uh97Hci0HJhAxnJFberGLSLg=;
        b=T48FirZyZsRdQKkUoLboSbDe47ZVdfwi1TNgU+rOO6ESeldI/SMyECejopk62bBnP0
         P1NvJ3Km/jcGfZlxq67ERP0j5uL7FlrxqeFQc2PZB/hICWRu0VmB+BkX2X+m/f1jBuwP
         go8aKQjXrftQKquI1oH4nHvemSwkuFr9dIa1SlWkgFFPheUiKWCV8W/CDh3JYD1AOo6G
         1//Mn4BenKmmVAkae+GFj+sFq2fMKtuVhShmHV3elANocYwaNDId7G2VX3ZsJ6CwCP7O
         vTtsr4hSTgPYNfgSp4mnAE9MkYGZJvUoeVEGdRIT4SM1f7MUCiImHV3Sn8c52aow4E+8
         9Xrg==
X-Forwarded-Encrypted: i=1; AKwUvBwbuO8DzsUpQUoBSyV9YrRKL5AhnUw3N0ybJ7b+t5VEIZSA7BW2EPyC65Hz9gt3L1h1R4zhy6iU+h3Zw/XziQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mxIXOR6C3hLDxeoG4OZkS8NvxvAc7SP3UzzHYjOaWBkh0AwtQo
	F54y1waMlAST+EQZxhMD5uijy2zNPgSi6hITIRXAzGrY8StQolqus9BR
X-Gm-Gg: AYBFou0ZmaWIJ7StVKyUjUa8FzLJkZn0eL4eoSVgwBt5ePrPrQUMbS7mdWo9agmO7sx
	ll7qCNActLIwjndQ9MxCr6YIMHbo3A+1a1mxeb7JhoGJWfKf1yRxRwer9SS00KGZO2OJ/TsspsI
	4xahrXP3YB7MkwE2IPlaRYk0v5RR+/6cFSx3P4y2WkEYe6XCjOh7iGaHX5vgym1+MUN460ZnFTH
	gKgnBdzDASOPEI15EthcTc60rZQGYKBBkZ2OOmy+Ys7kdMzWrgrN1FuoicQWLJHHxGECgXAPZUc
	1ujD23nof/jH3yVdzKhyY1z0Sg+ifXaPzDsdqOXGujzhBXG5kZv4GU57oPfmj6sdnzX2mMJzwVS
	kCOF7kTCOPc7v4Sbybyd3JJAKTBnsnAnc9VvIAYl821Av8uvG2NcWTRh46ywyf1fbyTlucIl0Z6
	XnU4bhNr6/749yOxrR6QpeO6aW/cAv/9XQA/OjwERtqbaPRxjEvbcY+CAwwyYJ9F+QwTozD337I
	op+32EvJxYMx/s2l4owkomfwANT3ZrbWQEdyphluATaljfPNqCJJfECtAwQHRM=
X-Received: by 2002:a05:6000:1868:b0:487:980:b42c with SMTP id ffacd0b85a97d-4870cef14b3mr9005287f8f.11.1789602734011;
        Wed, 16 Sep 2026 16:52:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:13 -0700 (PDT)
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
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH net-next v16 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Thu, 17 Sep 2026 01:51:27 +0200
Message-ID: <20260916235200.20712-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165215_905622_37AE0CA9 
X-CRM114-Status: GOOD (  17.87  )
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
index 390d3eb3e6f7..d67a5184c524 100644
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
@@ -2026,6 +2031,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2147,7 +2155,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2947,12 +2955,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3831,14 +3839,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4009,7 +4017,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.55.0


