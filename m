Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F94BC98318
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 23:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=; b=lObKH831L+Gn75AHwhUZAxfmC3
	5GmNmOG7v+ShVGFVT781/yXbIHoEEOAKnc18pcMC9JwnlrvFLOo+flRaMuAr32MEBhC4hIq7J94CU
	hbTHvY4qYs1nVaP47k0I7RFvoM4ioBpWxGd4HhccheMFQsDHX8uGP1gITcbh2671xwhYEwgFI8KmX
	6HJS98zES3NZOgSJfrD0Yd8lh5eYz8+N5vSu83RW0fVboHGx4OVadzb1kxxmAHR5Px4ZuQZaJrcF5
	muWAddo+HNQ//dAx3ZmhShMdfi9AtBqIOKYdHXXW58OpsPrEIOlgJemELro05vWOXyHPWLzHX3zeC
	uu3yEIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSa-0000000CLMd-1Ipb;
	Thu, 24 Sep 2026 23:02:36 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSR-0000000CLHc-0c3r
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 23:02:28 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso3348115e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290945; x=1790895745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=PEEh1Id6ufHjuVwx0EeOyAqzxefgeSsMMBrE7fqXOnM0lSN9LLTAWnM1zJUGL3pVtJ
         cYRseaycctpFdOXHJPJ9KY44DipyVzZOK/tLn/k4+Ye2Up/tvrpOcIe05nqgvhY61fiA
         MdpFlcvrRHvRW+UDLRaA/VRyBofHNXDT1qXv87qBXODcOKKFDCe+xldQcsttLSowS+Pz
         yy+oUEH+P2qo2xin66Ar5xR2m9J4uEFfuiuofcJHnqJB9Otim8vsK5b0KZ4d35yND/Kp
         Szr6KZ4q38kQ29aRDDDRI1BPTUjeoRKdtBVAv4q9Yxz/9PG2NHKwLXl61Z7Ig0o82BrR
         H7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290945; x=1790895745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b8iZrjI+sv0kO4V1v7dMASv2fJp8vatl+BnwAIAKYts=;
        b=D0AhDG8AnE9IBN2aAlZ62XHjJAZoqAfH/y+1uLqtMbY9bp3qCeyg7CRV9U5DxSIDQT
         2j90ZP2CJH5LakX3USn5qvSZmSd/vm8o59/mHCuj0L384pmYkNNuTGj4lj1eaw7haFKd
         2BRYpL2bO/CoMvgux9Q8+ttkJn8a5rC79st3JDObyBN+fRvCAeHkQa0Pgd6tF4GACO+i
         e85D56m4Ls69+0P4tgQhgHXV8WM1lOlcZaPLR9Bay7KIRvXcgLVlfvKKe9pfXSF3EwhP
         phCdI4Qy8qfRrv7kjEDKZhvnJLbY/nwsS/K+xDxWWeTx5e556FjLgSbVGUx6FdhpIqHk
         TGWA==
X-Forwarded-Encrypted: i=1; AKwUvBxQB8AJMidRitRDU/AQ1LZplTgpkAmic+MIuZ+j/D3G/65L1Cp1fxh1g8RYNWj/Dm2ng7DHrIqoI+0ANaJKAQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lWEIy1ZZnRCrZZWjnWumXB3V7lVy6sxPI18lL0hAIl85+q6p13
	Cdoxh5RqvwlPXWJAJdVkEGRZw9K6mH0Ftg7p5LIOkLCL2zKpyKU/DjWg
X-Gm-Gg: AYBFou3UsH3uxx/CskrampbXMhfBRhG1rIXCb2FEJJQ/kKsPGK8BO8PdrH5aYXWsgdE
	Fjkes/hkVb6XmrYIZIZ5zOve1wO0zeE4jTLfK6JggnA1X3Vcl7CLDa4GzfPa1tbZsYVVys+WPLw
	+Ph6mApi2vHYYHYnaXTxSxWiYL7pnHfTp1oJ1e+FXNw8FMPYGKAUwNh3uVKDEWdcI2YcAaUunkC
	bXPOCiqtu5VNLETU72oN6P5JB2CgaC4a3rD/Z/DmbbVGkGf25N+BNj+o3nawMSuNcTYJH92KgjA
	t9K8eF+OJ1/guh9f+28Jq9JeaUHTcYRlsJFBlS6//iLRAiE0UUWtM0ILPObek3kbhcruiUrcHaT
	tFHSzkDUK1gt8yWaI/9+WSGkkxplOfEO9ahWFdjm/PA/wUlvFVsUMgi7OMpuO+/LePPP5KKqDrp
	ZPY9ZjSmh1AYBpq2xh6ZsPS467PcZs/SQVRtPc7blmjWj+tSJhyEwoSfMTaBACAKU/tScVPLIPk
	Li+7pe/dM463Kc35Y1QYD5Vt4UTpA0TzrwTIgUMF9NXon+dLtF6yobJ2SQPiwbl
X-Received: by 2002:a05:600c:530e:b0:49f:bc28:e8bc with SMTP id 5b1f17b1804b1-49fe7bab945mr63722815e9.17.1790290945335;
        Thu, 24 Sep 2026 16:02:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:24 -0700 (PDT)
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
Subject: [PATCH net-next v17 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri, 25 Sep 2026 01:01:42 +0200
Message-ID: <20260924230211.11519-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_160227_211148_898F0575 
X-CRM114-Status: GOOD (  17.86  )
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
index a7d086cdc9b2..a98e62fa4bd2 100644
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
@@ -2961,12 +2969,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3845,14 +3853,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4023,7 +4031,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.55.0


