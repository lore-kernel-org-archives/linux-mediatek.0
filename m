Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA5EC5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=; b=G+ouVCZLaKGKxCtXZiFdxUtpWF
	hJo9ocA57ZGERIHiKhsW90dE8oNYqBpkouKLMzhEdJC4LKrNUNFMLO9xo89CUJwRL22sbSNjM5JlK
	kjMLYVnFlQnz3sCjhLWkxOPZ/TOVI//XHiS45a4N09jRz2+l+9VCQofaVbB/+BvnQMC2B3ROFns6Y
	L9qvO5hQNUFRzjpUa9uzAKetLw+kWwRmMuEcIzEn0jX9ViIclPCwRKcr9a/jhQkTVBhbmio2q7nq8
	vXPKdNIApwZzuhQdV7ftLbR1UvQShj3V83N39eF3wZxahT1gksTSE7X9zr4xb04IOtc1wChLAbTOa
	B8O38lbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinA-0000000Dj4l-21oV;
	Tue, 11 Aug 2026 09:29:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtin7-0000000Dj32-1hNJ
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 09:29:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso32245645e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 02:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440539; x=1787045339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=iQhcuY9XZ4dEgcHCOZUPAaEZdvcazii5/ph1+Q+Xj6FV2XDRhibe3FTgqlWQY6D+Fj
         adZ5DyarcnnSOKL+owV1MjrEg99gUdgEYIkrhzxYrhq4iML6VRWLQ4laQo/LYHoZERon
         kTFNS8CV+x+par0Awed2nsQwdAWSU9/vShauiR3BHFwvUuRdXvWv0UpcVbjq/7dCmx9K
         8mWbeXOq7X9KNxUPZ/Jz9dBr7suWOba9H0LlXC9aIU75gJgK7IGpbSprQLPfRUw7+jD5
         6CtWbiLv5Blc/3Q3j/BBVWjW0fGEXrQR+c+RlwRkOblQGu+DFx4tJg6W1t14dbUPkM1Y
         adBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440539; x=1787045339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=L6wiKPme2vscN7B71nd1lH28qs26oxeVmIQaNDDZo6Opo3xirqZghI2wUP0XDJKVuf
         Ineq21xsfpVHQmxgj/tFEGUqmUjy73eRulxiIe9DCRKZn9H9CeOrrdNQnoRlmpp5P8K1
         DR9EccAuv3J75r0Pq9wpCHqBPjvmR1Gr3LAbRMEv7MvZNsSHTytUJgtBW4ckCrwlTiMH
         rixJc91b4+KZv/EQBqZiTwHzoIPvVNTTkNDyqtOaPthC3Mc7ijTSdzF1wQOmyr3DZpn3
         a/7SODIhqheQolzd34+D6QhHpiyxAuCqEjPyYhoMKJvvWzXU+CLR1D/64awtRiOixqEU
         d8+w==
X-Forwarded-Encrypted: i=1; AHgh+Rou3+VT9FmFKP1H+PkviqgUBYXy+pkQoohC6OCSukw2oNcOE64HscJjRiEAuHlwzStA6gvuA3N9iXD5brvHfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCezHhY/hwcShKrrf/FR/ODJrWBZxnY+JIogAhfdNA5Vx+sZYA
	GANyCwmssldod5536aX+qJ4Bx1HhSgKy0LsaJz+m39vcbBK8YUKBm0H9
X-Gm-Gg: AR+sD12N9+lu4wKtRxtvARrsw6DtaLt5IQ53PI2ApUGeLOsHvL3pP9Kom0Mc4e38y2u
	wr9NUeaYqL8Lrv7oMJKDq0nOgK+ov0GDOPqGpbdDAIUo3+8aECkZ3xW/EKlH1efZDL+mN8uJSMD
	uNBS+p/cJX9VI3CtYrkNpgJMQkQUi6FmMwpu7tLRrjkggQpz/xod/8/noOY1uWviLbae4N20KGW
	dPzeQjyOa4LKtcKNmAK+SQjQtdmLvHw0L1rBEInAZrltE8NRr6I6wgBSjxo23uOJBWv0pMI/Z9O
	h5ExFvDhYTmFvYMtjrTbC6YB1lqtJkliknE4wROI6bbJrw0P2HT2+8tdD1136otCA4fpvNEIUNw
	urj8Q0eWCW7wqGNQYzVrHftLwG+dGObqDIONw0JfyLxpHhULsjq+0CkpGkmoiePTOL70xfcdbbE
	FhVZFn8fU9e3dqPlyAPfh1NYpJnDz5x+rKORSSP0+SE6oUbN8bWdQTEM5WUxvORMT6OvAaw4MMv
	PYG4YvnDUUpPgARtwQWDBgSmzhNxAG6mvHiSTAqRBhw5Vr5
X-Received: by 2002:a05:600c:848a:b0:495:69eb:27fe with SMTP id 5b1f17b1804b1-49978463ca6mr33817265e9.11.1786440539279;
        Tue, 11 Aug 2026 02:28:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:28:58 -0700 (PDT)
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
Subject: [PATCH net-next v13 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue, 11 Aug 2026 11:28:26 +0200
Message-ID: <20260811092843.673837-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_022901_478699_910E502D 
X-CRM114-Status: GOOD (  17.91  )
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
index b241768edbcb..b7180ae76cc8 100644
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
@@ -1878,6 +1883,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 		goto free_pl;
 	}
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
 			       pl->config->lpi_capabilities &&
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


