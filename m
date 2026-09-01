Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F0BC61DD6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyxU6GfAU2OYJBof45H0mHXE5/R7CERzacXu0RY4THE=; b=RrvEBdCfdAbRpPd54aDhNchk5D
	cIQh7z/G2jWSbmu2fSxpHr9a2OQvvunXbq8xi7cwJfXzIXjV0aiYPGjf9/O+OSoNxRDBox0JGqVim
	1YSX2MIh1+CDhvn2bN9+7rAbiecNy2k8ZI8btxeCab+TbU3a+4TSiz72WB6vJdX+k/u2ZyxN7pPCU
	z790F853fgNxI8egFSRleZARCtbUGw9pYDZ33NcXR7qcJYNId1xM9gPPdO4R2kZx+mBJcOuFmXAkZ
	3w8LeYB2S5Kn7u4F3kPCNs53+ltQChG9A9zajaEwvCNjb2PCoDuej1IB0NzDZ8FUY2UdUL2GuT0wv
	2qI90xxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jsr-0000000BGZG-1je0;
	Tue, 01 Sep 2026 08:30:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jso-0000000BGWK-2dyf
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 08:30:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so6454325e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251417; x=1788856217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YyxU6GfAU2OYJBof45H0mHXE5/R7CERzacXu0RY4THE=;
        b=QVwVAeig3nJeW6WTkfxB8GaAXgccnLLjXPUcy8n+h+/rtwOK9c4ndeGdV1m9EaM6TS
         copzGHySg8zqZtn8eOdTJll0jP98l3l0wvKaNBJCq49kFhyEhsWTQjfdi+5DDfYk9d5z
         bSRweh1/ZdmMitZ12jk6nwwgbJ9zWosu6U3/sXZmLxq8qFx37751Xv0rjhzzeJvoLLRG
         Zk0/lNmFM9Qx2/zlMqHXk1svxcqQTR4CWS7Z+MeG5DTvtubcifzVhAr+KXf8Jq15Rdzg
         ItwFvllvVp9xMa/NKKKiNwC71bekoLs1ZckxU/2ORIoSRKVeZcQd09rXD+qqYnBbJY/x
         eARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251417; x=1788856217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YyxU6GfAU2OYJBof45H0mHXE5/R7CERzacXu0RY4THE=;
        b=prlMfKUtaGkmYPFIaQK1xtML3rGGDno+5/EJfP39ZMTqGwuxY+1vP1r/Q5d9PfEi1m
         Kr+CRbB0vCuGimrfU4LYo9gxwC1f6MmmLXjNOYv4ifUKchseomunfLIZXZ8eOjJkOPsH
         5CyxzsCa87m3SIt+UqZEIHj6f6ERUw4E/7ZoI15R7spYC/EhgKkdYR7AkzKXSatgb8Oh
         64Q68cc+71pQc+Alo22I83CfE3K8XVvzeYWVO8FaS31ThL1qeTQRi+ep8ng3IvIhIaRi
         YzM0OtCzJJqi04N+B6R/u5HmPK/1Yind9d9BLPnrkiopAZn8Io8Zh894Pmlf2OYgwvVm
         /LWw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0rUQRh4aE0Tiyy49f0Z0a7SikqpelE2TchVr4NmaWIXN9A6MB9wrNGv6DGZKqVeO8k1H+0Bzbph9yiiaNfg==@lists.infradead.org
X-Gm-Message-State: AFuF++loMKzO81Eiz8yTd1L66qYYWRVNlhO7k+rKZBSux5OeJaVqIO1N
	k0iAZ4Fe2aA4OakhG4rGjc+TWtBOLJJ0cNDKIKPNNSbArBQvMEgKcsNW
X-Gm-Gg: AR+sD12f4vSw4T9u8i0wn3wqnevlc21Lt6BTwc4iW3dLaRW4Mf4I2G1O2a1xxeeuCO+
	Ymx8orryGk/xSIvHyUQ3VcOXf5FKCCElfSj5b47MecP7s8LMa3MIrCuDvCDXLtVRnTMtWR3pkcQ
	qrD2W93JYzLDiGXLleEODO2NKwijLY5W5Zrd17+IXk5tyZ8ROP0+HpHMgBjuJ9hSKDlAdf21/2S
	BAR+b9mjysG5zKWFpv19VqglhXBsCpaKwCdXZrTRTkCCct+i2qO9n8MCzkx35ErQEYoNT+Ca3l7
	3XOlfehSXaUkWKXo14HQ/VogrTwwi4sPDNcFb251fuvbX7rfL5DHjfXpggdCPqYuL8rOE1TDSvk
	MSfy36DOi3dKCWNFzf3U2tERfN3doWGgbaFj72m/429OPGYZhlWG1/QYlwfzIu8UK35PowoWl8C
	WDcMw8nhB92t56YL7wh/YE+ICN0/lzxCQhG1gi2IwzgppTC4TuNMpJaOrSUDdxCy1m73yHu5+v/
	N8QDi/H6WkzHz1ImHVfzIwFxxxHIfK1HDyBDynPtFf4IK4/IDuF
X-Received: by 2002:a05:600c:4592:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49b91c290c1mr378787125e9.7.1788251416552;
        Tue, 01 Sep 2026 01:30:16 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:16 -0700 (PDT)
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
Subject: [PATCH net-next v15 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  1 Sep 2026 10:29:16 +0200
Message-ID: <20260901083001.8044-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013018_697450_44583D3A 
X-CRM114-Status: GOOD (  18.64  )
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
index 3ec3bb439109..7f7a7328124f 100644
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
@@ -1904,6 +1909,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2025,7 +2033,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2825,12 +2833,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3758,14 +3766,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3936,7 +3944,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


