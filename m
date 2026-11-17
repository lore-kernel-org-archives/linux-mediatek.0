Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49621606F8A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UWS4N9/r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HA03tcFa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=; b=UWS4N9/rIsrRmZ
	oQ5dCii3N0gzTK2CZiRi4r6alEHL6JBJSSd/qr7xMla96Dh+uUeTxot8Yl/JUq/HORPSTCYUKF1my
	nEknbwhwCucR3dGI+7nSu21OoWbh79OGRUyX2Z7fIcLOCTkW760Ymg3C+14877jmmYe/X6vYaYdIq
	ZM5HbEZyQCPUP9vMxBhGwNyd6lYrbLFaYgFhqfsJogytSrUuvzXMZhQM1n6Qc5GuRCBtDOJAJTW41
	/5f/TROKpXtNO6fyGyjF9Y+I03WXzmT2UXv4gDouTjfYMVlIJmjexk5kb8GCQ/dceePiCBfVCHJE6
	4nuB/gECDJ7hhTAu7YBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIUE-00000005fTS-3n0A;
	Tue, 17 Nov 2026 12:40:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITu-00000005f2l-0B8D
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so33278655e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919212; x=1795524012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=HA03tcFafiLYmUGQjP+MGpR/jzT4KAc0iL9mvIbZfKMTA7nz6gNQcItM0sZpWHx/tq
         EP+bVMl9u9s3eo79Jt/FkJfuyJIEtmMzWB9AyQIijv6PkqYN3Lr5XBB1tdqpbRYPbN9B
         +N/P80ZtlRGvSs0L3e3rn8c43uVWEVUBodbtpSAwTl75z0/hyETb4lhkxmGYPomXfT9F
         uVeoms7P94u8WaJlCOpIdHvnBM5KK3s+Xg6gKLIiOc5G1IxZGjvjtpT3ekWoth/mhWgE
         rA/ZGxGAIt/rYh9bvRwJST9tCMvLRJoJ8ujaOvzU81kLieEO1aYpQMWdT2LuiMbblMud
         m0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919212; x=1795524012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=ke22xvbntGv8palLayZLjsSly5pQ++KTK0FSV3aLyy+gDweKCNXYGa8jftkqmps0Lr
         sa+Zxh1tfJrkl7meGnA692YO0wxgBeU9c/IDk/B5JDvexZlWYvHWewD5/s/C+IkkyhAV
         ByQPGLcmouDTTJsItHU/kjZzOvxrRAUhFI6apKn2Zr99sUDr1L/dTR+J7pwvBiZGyLIB
         zRWqcvboquWQLmkwLZehvEe5Xlu9VCN/utIXoJqckjsn7C+ePsGDdgMYj32kuK8GuoH7
         00jeyZIwZAEnzNSPoL4PGPEpP0hezRHXm4xBi9bdI2dd0RFPR0QH75sbDpNybxyc5hBQ
         OnRw==
X-Forwarded-Encrypted: i=1; AL+hErG9PC9kzJE2f8VzY/mGAB4dFLDo5mx033zKkiKV4R8DcJfikgcmu81RCbPp56/nmUm6cSmZjRXPdG++1qAG1w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Dn1gtyijC/bEyWsyZ4FV9SAQWn9BtDPVJQt3JMRH+ePp5wi/f
	f0TSbiDyk5dSfx5/4ggxpM04pkHOPb7n0/J3AzjgsF5MAs94/f0vLL6i
X-Gm-Gg: AYBFou2x58s2L4T8x4OugXWOZloIGeVlE+FyB8swuHdG60AYYYJy5AJ0fJXNKvUt+F8
	FI3Q1uJinjQUWYGRKKG+4lC8vU+JHOUykYj5vEtL7KIWPlVFYGRslgQq6cp+WY0tkWDWW0+GZSR
	syVbiyq5enBue79dIcPspf50w6UwJ4kIb87S82LFzQ1y43wp4CR/sNKqvPfct8SFb6SyAUFm4BV
	UHVDt/ivwQ3aBhpvdEQYoMM5+Hm4o6s8T/8V0KQ/0vq2DDVbn8abapX57UKJV9NO2GVbWkjtAJo
	+2JhxmRcMBtF2VsAi2DBfIpIMILv+gxvMKNM4OwUbCaAoZx1mCKhTBFMRpS6FYn3R4qkS3ab7UN
	uQWDdD21PlDTdFSfzCQjvqRA9yEJu90q6DlET7A7RryRMsX1fmfr8ZmMEnpsGwmcKTo4hmNrM6x
	pUeR8qgMKVxq52JsdJ4WeylrIkNa+tT4OK0obFjz1OzpPAwF9Dd1J4eF4mJh20NnD1vt6A3+aHx
	WAyPbj2V268YoKYsrFKyIoTnTF9Wbg9iagKG22+BOZ0Oy5UULXzINJtQsEEqn5kWysWTVCqF1ln
	e/f6Z+IFoqbe3Ts53AoRlC+/hCi+VqIlxba2yKKWKVQ6KvcJeYMMymiRUTeVq6CyD8ir4PAHRWj
	MVKngtXV03o4JPhuVerLBn7vVtXxquOqQorwb1Xja5V6f6aTuOa5OFZk=
X-Received: by 2002:a05:600c:4f07:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb6a5a7a48mr183926425e9.20.1794919212027;
        Tue, 17 Nov 2026 04:40:12 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:11 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 02/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue, 17 Nov 2026 13:39:42 +0100
Message-ID: <20261117123956.11981-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044014_109525_8902830B 
X-CRM114-Status: GOOD (  17.79  )
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
 drivers/net/phy/phylink.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d9d0ace2042e..f482dc608810 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -63,6 +63,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -633,7 +638,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1788,7 +1793,7 @@ static int phylink_create_sfp_cage_port(struct phylink *pl)
 	port->is_mii = true;
 	port->active = true;
 
-	phy_interface_and(port->interfaces, pl->config->supported_interfaces,
+	phy_interface_and(port->interfaces, pl->supported_interfaces,
 			  phylink_sfp_interfaces);
 	phy_port_update_supported(port);
 
@@ -2091,6 +2096,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2218,7 +2226,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3037,12 +3045,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3921,14 +3929,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4166,7 +4174,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0


