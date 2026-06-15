Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3391BCD98DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 12:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=; b=usTpbjdJJ4B7t7c3gtGTUwH6+t
	Ph5RVzj0fGMHF6MWbwTFswmYFR3Yow0QhQa/J2N2E5bwI96i3T87tN+064dffTr1fogUsX8tP0xAL
	6/M5OIE7eB/2qN7rkbfN2x0igU6FFsZ9lZyOMkBlYFg79zPu0G+l6qv/bzRwwW7cf12i6zJSzIwoF
	d5LCv9VhDEgWOd9ZGDAQksLFdUdj+uBZmAjxLveSfPAkg3ieRrrHVWx4XwVi/o7An39sMtjHU7geW
	SOi6L3YAc0p36hx8qS7PZ/L+1Nis5bsEXwL5lvJP5BZr3FlqXutzb6m4r7ePOlcryYh9dnTpi2kWL
	tZ80oVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Se-0000000EBL2-13Vl;
	Mon, 15 Jun 2026 12:30:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6SY-0000000EBHT-3Fzr
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso20864065e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 05:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526633; x=1782131433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=gEbgpnOs1MGOg/LtlfNmmWWSFMDvkPsK2Xe78oL3ugNUYpF1uPwWjAG4PFYRG3SmoR
         sdXx+HjDFhb9jhmAvrPzDYeV0mLu6d9nwwvkOnyeODQAFyPANw/EJ2vEPXUQEqnd9EBG
         bMMTuh+MT1rxZhYQ97+MQsWs+jnS3D1sQNjOjML7257TtbuWpbYLoitKRnsjwndKBw5q
         M0kpWZ0H0pwEYkwX6HSe6mzz8Dx7n6lTwwUSV4RgNd1gD0FuNuOGPZOj/lTSJJY7n7ey
         7VTFStkTL/6O6EOh6Bm8G4rjA/rSuMU504+IpxvzGpG7Zbkaub1V2kELQ1iUwswdaq5Z
         7Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526633; x=1782131433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=DOThNpwWGomW0PNrL2KzpGRVZ/p7rXeHSZ32Z4sBrB5b11cbcqW5X58y0wfimA/z43
         bkuhIZ0jupEATw3tDewsLmyfklY2BA4FHW3u0x0DtDKbTAzhkVGwLqjZzR980vaKYn+/
         ne09UO5e3WzHYNqLxZH8nPrLinT6okC1gLB7j7pKhHYXg2LO1lmEfWegFmAMD0F+rtzU
         okizOFCCZ4bIw4KbqxozPMaezjnC5/ByUJ5+2rmkDMTDPsFCavYTfv3V8bUpEXC0LNSh
         3/C0QtoKp+xYSbHDf71viJXNj3tb8hSe/OgJHsZk8xZNXbaX9Bz7YiqA/KfC9qXb201F
         NHGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+W08/ur8Dl/9ZPDXPDn7aY64Zb0vpaUAROY7K+Y2uDC6m1L4ArWHNpPihIRp92PnUARYGZ5ADkAkHdlhVdDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw4iOEuxC+tDmfG1rO7suEZI/vcC3NkUqwxwgWf1/oVfnVRd6Y
	oQUi2OM6sroIwUqHBb9pOnyFUu5exEwM/DrRcNHqPGkHE+nSEKPrM/bw
X-Gm-Gg: Acq92OH/cYjMUNf5gFBH9OZOQKQvF3QtpCMB2daAKgzJnlqSIvb5a5lYtw4A1wrr/0C
	+dm6HZ0nmQPIwcGkwhHBYyBqkHqmAFUvXLSFoVgQyDlRgt/3NHcmQ9MpAdvLvF2eaCmbV4+j8iC
	QzWUg0uddCqYuOSabqoGukJpexhfWNuj/9NNCzdZhEamVM4azya9p2Fxl5b/CFbUwH4D/NZW00I
	UwUMsuER6mofpgTiM6Dk1dtngO2wTFWuZ1qngYlkQUHXN6y2x2Jmj4aaTuVUB/SOUnQYnoZjqpe
	hPrfByfCM4L7HcsrERwYmYkeB83QcWv4ALqLE2FkNl8o43xlTOU4xIj9r0iKty88NaHImuzbwd/
	0Gz6yZ0brvWui0xenqDnXvNZDPLrqvWI07JmhKYOj4UTCxTKUKZbM1U6Mgq8lBSdFYwqETX+CJB
	8l4YIV23ehi7cbq5drpm4hSLsUvYtmIE/uFCcoXk4FbNvEwElaUy4c/B8=
X-Received: by 2002:a05:600c:4753:b0:490:be9e:fd03 with SMTP id 5b1f17b1804b1-490ec4bf9a6mr188542715e9.7.1781526632715;
        Mon, 15 Jun 2026 05:30:32 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:32 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v7 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Mon, 15 Jun 2026 14:29:37 +0200
Message-ID: <20260615122950.22281-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053034_838680_28DAB002 
X-CRM114-Status: GOOD (  17.95  )
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


