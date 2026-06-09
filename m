Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2EFCD8CA4
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=; b=XlBQKg+U5+797B5z121hC1knmJ
	IA5gk/5GlRg3MuOrKuHAg3MpjRIDFaw3ssp8V7+IpXW7f6pmvnYAk9O85SQQDbiZtkvlw22byu+q2
	OojKE+AnPfOMo8AboaMJqEbeW20N1VxS2TjXxVw2YvUjH3WRyjrDyhlBj5opPQTQIsP++K0Ai6Fr/
	IfChgFUJjAm2ndZifYzuI6v3eyyBr8fQdkGOtt1zIjti/lMvVJAgDKhZFk/oySaX66PoT/zKBjUl+
	tIKMRDjVF5t4K0BxXSLFN8C/2oGer8RNa1m1l3ly1QeqJhA5up4t1tH1vyrCzPD9QvmazKiun7Lta
	ZNBguTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8c-00000005s8L-01St;
	Tue, 09 Jun 2026 15:13:10 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8Y-00000005s6K-0uNM
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:07 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-bed2195323cso839476666b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017984; x=1781622784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=gEf14ZlmoIPKWBog7jMdgOj/u7MvzUXeCOCa+N2qUIwdLPAEhwtYqRUgwY7p6MXsjS
         99MB7sImDS8hLJs4yQHNY77yrAZZbzdBCrYbDCkxLCpHRJpm5xWcbUynfW1ZUd0Q+FYb
         7w1aioucvaC4/3b9H7MVF1PxSw1gAb42SPOnRAmssr7KJ9GZe6+Vc7vk++SEPxkEjSJY
         Gjo9OKdVVNkL+3m+bAy3E/Z9yboPJHTz0E9oXGtQoI7XjkWpY2nF9Ax8tInIogBLjsAf
         k/k+6n5EWN7FcoilspFHAM6Epj/tPRmSZWL1KVdoVIS7s/OYwNS3N8X4PmWl6nKoG4jV
         xKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017984; x=1781622784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=qKKHL1sOlWNROCHdzm4F9RAHIxcm/GD6RVy3lZH6uMpv1ITPxtVMekvzQce+r4kHLX
         U4z8ZREyrry9nS5V8WuDmuDg6alMIbkfclqq+NX0WpaOPBvVWMlCXEZZpZU0kEPRdRN3
         YlTWUqpCs/FVjYNdUO9lnT5TnMqdZuGbC+U6FX9Jr5Sl6s5qMXyYdIAU53BgDg6VjEmH
         4hz2DN6Z911NvPnZhKb2iBzL32tOZSXTnvtKOXPoaZJAX8Pl8B1dfi37PziTlDjmyrHB
         A1c+qP35stq+hJZLo7N94SfGao+yW7Ojd8LHjmhKGbzULamnS8wB24BKpexJh6rPXg1W
         tBUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mSW+J82FLPmM98UTNJyrpgxLVO6Hdl8UEzAtu2eV58XgV4UJEdja1QDWAlpcbsKSPU4mXgCC6swSouH7sUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Pxp5GNp+4vWkY2d3Q00j5sqV253YqsHKFtXoD1se8E4nhtGJ
	arCLrvwMhPKlX+ziLhnKQO09skGeaFZvOCP8GMMBFUvpFtCS5g7Dfz6A
X-Gm-Gg: Acq92OEXIcKuwG42GKytozrYir/3VHHeCCM57qeZq1g1mmH68iO/wttMwsnjo9pvz54
	JR6jLvT3ha2s0gugB4/Xbey74KBJKMn7xnV4aU7c/m5tTFrcu7s/7rjjLodLlkdbV2WAb/uK6sP
	xaOaKGHrTInp4t798sWoBkVLfwXv9aWRgrwv13nGdHH9HnMWFD4DiROczoK1WzjkzILz8AV1Ytv
	hPUJNks0snMbKPfN6EO76FQi7jyLwc9GEdrXhppB4S0qpF/WWb7L05DO/HIbv5f8VPoyObt0/J+
	XkAdl+v8d789bOqVGw6Czfg8lYDSuZ38phuumuZkqV8Awp1T0aENfyZCAc7jGc4EFCtCSTGJ/P8
	Qrt8yVXiQPAyZ2NuIXM48vJnvCEzx7pXzicuUmggDvrbASA52kPLbQrVXOoAVizug2Xbj3Oo+Vm
	XR6b0O5dBudM+hmCSTG+neLzOd2ilGvSdU2MdPgRCdV1U=
X-Received: by 2002:a17:907:78e:b0:bf0:701e:b148 with SMTP id a640c23a62f3a-bf3721590cfmr1063340066b.27.1781017983934;
        Tue, 09 Jun 2026 08:13:03 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:03 -0700 (PDT)
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
Subject: [PATCH net-next v6 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  9 Jun 2026 17:11:57 +0200
Message-ID: <20260609151212.29469-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_081306_274229_D6250406 
X-CRM114-Status: GOOD (  18.04  )
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


