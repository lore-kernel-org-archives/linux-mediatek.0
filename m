Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C9E60A3814
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VpbxiIZK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ON4J+AiS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=; b=VpbxiIZKrGYgsP
	Py2tN2+Z3/E4uhZJOn7DbXjtsshDMwl1vo7Gowrc2+wTbMWhIDCb2JPtha9NzCnMkBCTFswW0LZzH
	u0hNkrQfNtb1GeU5G+etZUJWpJnZNbuiidHN66wRKNA4xAM50zeHmFsKwa0zP6V1nzifVpQJ0zuwe
	ac4OHVL9uczlMUzGtLqCAmwpq2KHjfAZvNANGwTu9xtqGg/8I7rpcriTQ+ftriB3MAb/NRV/Ha7/M
	B+H9NXceQiWESXjjDuTjaZPffhqIvwX1zxn6FlHw75rDRXOnYjuW70s3jpbQe2HIeyEYmFul2pIpP
	cCVyE6AQdwhtyqX0IX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFU-0000000Fmn5-2dgU;
	Sat, 14 Nov 2026 10:44:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFM-0000000Fmhs-3d9i
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 10:44:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so23108135e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Nov 2026 02:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653075; x=1795257875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=ON4J+AiSG0HKQOf9BM5wvBVsGyLLcM2ueNM4N6NLi+2TVknoXFJ8LvPYYa/15iBtl2
         /uAZ/j2aHbzza13id3wa1u34m4wMcqhzUEvHEwTxLQzFE4WRY+S9uj/r/DE8/hMYaC2q
         QvtHICS9xDwOIEuOaLQfv6zEDz1ZXGcCh2Eaogs8Tw0MCcwNH3EsSxCr5ypvGzvd0exJ
         ltkMwG6ENMwTdCqkBkKR5JdnGhMt+JF+0JJO8s+tRgIDyimHlZpg9S36+/sKmpAVlSrb
         zsDV5MhmIYnmk5bHa3kqVtxu/Ouhy9S8NbPGH1C8ido/68rNMDt6NpT8x3vyyddouEJS
         IsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653075; x=1795257875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=XTEFq/uiW3qwr3xbWH1mOzq6psVHaHUcL3kAxQUlvekR1DVHWs69TxhEsUWGN11XHQ
         HvDjdGwCGm2JKEcsuvEt3stSs+5WckP31Jx64AJV18c8ONsUbKW5VhTsXa+SaKyFLlwJ
         mArq/38VmxwJI/zLWFcxC8yl+KNRZ+UFLDNO5LBIm+fkNB7PyEAv+rTgCLyjMYCGaLpC
         u86x4wUE6Q5zJPNbceYhfkLqGesQmAFmbS7i2rKqQK16oOZ/TFBVYwtTHVAxXS1BSzSn
         p1xqgO22e6ge96I9WZhaistQX1Qs/snrDBWxBiiOX7u1TYsvMCX2JcNHq1yIrTAThiZh
         gwbw==
X-Forwarded-Encrypted: i=1; AL+hErETb640WsxU2wJ7tM7i8b4usmWxE1J1EUg2eg7YQW0BHWRDmsHVTHTZP6zmwTZ3hbQ+BHQcPLY2Aak234pNyQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9iaYyuQXPE1UN/2byNS2MxPAjeGY0pHeS0aWiV9svz2SwH2HG4
	ryJW8zNkjSj2i+4DXPxLPUoQNH3z8/V//5tCRAVYjoaMnA2/TC3O6deJ
X-Gm-Gg: AYBFou3ltfdY2zjr5dPBs0U7DUzEDlDwYDzUrX5Oy4jp5Vw2UUlLajhhpb6RCxf3ePM
	jAc2chxGcGHIRk3N0wEJq/LfZYloTG1u+p1JACNWK2AABNYIixd2TFUL7Xn984Dr9zKtcuMi98D
	pKhe04p1aMxbPIOtQpzgzQwpOKcxXD9vGfOJr94RGI1qzMk3gcCyaSHGvkbjiT8GIlO21D2rr+m
	iAhenbJpsVhM4pdHtNn2sHcBjjQlb/ltdj+swnydBgiLKqDspkzuv9qOn5SzFng7FF7agRjAlYQ
	sB4kvTV56nikeVGykEb03rcKjCa6lWXe3wH6UvUn9E0Vz2NS0QfW+MuMRcw0bBYdIicmvCt34qI
	F5pg8bkEujmYhGty5mWSyCnQRE21tPEsdcP+t+hQ2/KrKEkr62J3yLPTNLdxkW2sqjudplSRBXO
	PdOrCJgJEoHdtWx/zm6nJWNuuZK/VE8JKyTi+n8YKRohwphhZ7g0XD62te9/H/HD217Ve/JRfdH
	TWuVoQFQoY7TyIBkcf6OyDfT3HPvzqo3Df/OqZh6zWP+saH7+U4+WI3Rppbu9Pdvr6U/M7QrHIs
	cSwpAkEpntV3JVbPDHyrqEWZnJRhMw0AzbQQDeqxF8QNdV4H+H8ngpqj+WT7IsCXhPMAelHyhl8
	ryqjN1CJGUxuByCTd65+r5UdvZA1rJM1Zakk=
X-Received: by 2002:a05:600c:3495:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb68477c73mr8647025e9.26.1794653074802;
        Sat, 14 Nov 2026 02:44:34 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:34 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v20 01/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Sat, 14 Nov 2026 11:43:40 +0100
Message-ID: <20261114104426.235620-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024436_927866_087BB0F9 
X-CRM114-Status: GOOD (  16.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index e7734e45376c..5d649903be9e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -62,6 +62,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -632,7 +637,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -2090,6 +2095,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2212,7 +2220,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3026,12 +3034,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3910,14 +3918,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4155,7 +4163,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0


