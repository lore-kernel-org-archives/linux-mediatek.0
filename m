Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB6FCD3427
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=; b=mPmimWU28gnk3G3xzYUkrZH9G5
	emCh2b5bb3kpdbfZCzMxloq1BoF7uzXXXZvk54776aYLG9TH3aPWrqch9xMqNaaMWFvqcMsLq1ew+
	3V5w7MMvE1JnDl3m7mCSkUsCt23mWvhlU3ui31+BIGr8Woh5UeaJ9Mf80nrbw21rpB/D/ZuvOat/u
	nFnMTH3h7DQL/rLZxFoYAuZLb7F+qvpIWaJPYtzompGlpfa0jgULHoaximZuuauN6O1NDxsLSfdC9
	sei5Uw/GI15HrAYFwTGeRlPU4zic6A5TR8bNnToY+cs7wa5JracKlbOoLhHGeRGqi8wv0Ka2bgVM8
	0DsRqz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUV-0000000HAGS-2iTB;
	Tue, 05 May 2026 18:27:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUS-0000000HAE8-24OV
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 18:27:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso30721885e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 11:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005647; x=1778610447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=AWoehVONG9DGPMvf+fdC7DNrEyO1IQLqlTWV027K8l1gietfsIXS8VMbCXhjfdsjHj
         ZOjovU4bZGWTRoZwF1SM2qVNA/5/lQC8Zg9vm2xGcPigyqGT8at3+B0MebrpfyEn1wV6
         TnmwcCupWbKanJlOR+7tO2XVxtXK5xT4NLqcWKVsL95jut25nenO7OxemVPLgBVpNlr9
         8KEwvHkcn7G/0UgaVN17nXY/n5vNJ03qMjv/deU3K14SkQlYhIqRaE06K1s6pkKJyeuX
         kExvsEvucF+J9FQSbi+5vQU2ovIixhOfs1FJA9US9ptLD9wGwZ6O+sDJGrfe7xP17t9u
         qxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005647; x=1778610447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=e2J+t0mo+grEnK5QI1/ETJYt5/KWXY6oykpL8nPUbeFiC48zzNkxdiGbmrug9Itzx/
         USSo3TPxMIL+BJXaopKRFrKOWVSHqrIIq0yofYWGskQBY36Vv3Z/jWel0W7VQDc6QZLx
         B9CcP9VrIML/DoI5Tg+5jcRgR6f6yQO6NHe1YrjTo+NeqK7GKMYKjALwAvpc6Yb3FdR4
         myfmyvmfeSZgRlkoONk50//zCO/Nilr8ueokZgvk5LYoyljCXqf7AJrQtZdvVnl2vtkY
         LGTI1X/ntM84sLi+91WItz4yiliX2pqboxH9nok4lysCXIuog6KOcSI+pzGLTaIruf6y
         Kfwg==
X-Forwarded-Encrypted: i=1; AFNElJ8zHiUDWWCHH31wAllzNwt4MatBx3eY3qblVEOTCE7qMjnajQ22isjqdxRsXByytHJ6VOAT4NeOA9mGh+OzBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ChHTajlkVyRDVL3I3WQTS+Nfu+MRIfQ41vSMPftUHfa/SRxQ
	SHR0M9fZqQpeOY//kAUzWYMOEOEFTnSUYwqQ0cM2ldm/tbMszyjLX+00
X-Gm-Gg: AeBDieu2xpT11GNL9pMSKUixrI+bHGHn+spOsda2mGJFUr2Km0ysECj9sgR2zuIuuPO
	Olj+BAFaGOCC9uetlB1xeO4M98mWpjlhFzhsslLZc+phu1uBOR23gcRF0dGDofdx3JgCLY/X/mq
	mVtcvUHCgXmlDjGrK/QA3oxXhiq0Nqjmh2LWXh6x+ci8IeYSjqRpj4Dq0kAsv2v7DKvyZBn+4kv
	vZzVhYxlX8tBSZyur80q16P49IvMscveh76QsAqenFXOwYF2Gqea5zj/QfrkGFmVVEGhp/j6/Y3
	lur15BDStojuKRB0DitVJB1hH3lZgcWk65MtOnxXEasOm3Mi90hN7VgRx9IFBLODp+mPkyaKBlw
	hCEzSBsp3mdgw/r0KGljRZDlmgXa9BFGP9NxQTgXCdKWlzMqxi6fz9AXEFEDln5NiNLulAPRZQ7
	J7BDpenA2iLanjr+Mud9ruut30sQUUAgoDroitW4uOBXFGsCZxdDDrIr2G8uRPcK5fuhlL3CU6k
	U7WmM0=
X-Received: by 2002:a05:600c:a412:b0:48b:339:73cf with SMTP id 5b1f17b1804b1-48e51f184ebmr5001945e9.1.1778005646464;
        Tue, 05 May 2026 11:27:26 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:26 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 01/10] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  5 May 2026 20:27:02 +0200
Message-ID: <20260505182713.27644-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112728_576263_4B817C43 
X-CRM114-Status: GOOD (  18.08  )
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 087ac63f9193..4d59c0dd78db 100644
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
 
@@ -629,7 +634,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1868,6 +1873,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2026,7 +2034,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2828,12 +2836,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3761,14 +3769,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3939,7 +3947,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


