Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4207606B94F
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hDW5ltOf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fP5uagtU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=; b=hDW5ltOf04n4u+
	tAvkk0UbY4QaBASY8MpgA71nOH2m3GkQ5FHP3hEocq7h/dwtYa0ADncGgD4OkJEDs79c8QUgaorCa
	v7RlQZkrTnihf3AgdXnWJTZFrCr9Uv/LTQwp+4UQEe/CGdGU9NqeuB7NYNcjkrL41ICqZXxGMV3iT
	JkqiDfuDbh8p6/DTLEYNS6n9In/mD2Wx+I+5FQodJYrfaW3MoY+Jl6WbTilMyx5OoED6ph7ApYSj2
	iHl406SacZTOEOpMS6oxG4addoTJsuw2NfDuYojmrM4LQ+BoDMe1bwhn0iYBx964AwTGvPoGEuac/
	h+HDsFam/Scq66hx35yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFk-0000000Fn5B-1mT1;
	Sat, 14 Nov 2026 10:45:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFW-0000000FmoZ-1h8w
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 10:44:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a210470b49so14781515e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Nov 2026 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653085; x=1795257885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=fP5uagtUCignTPLNbACOWRq+DaXAeaJdVY0niHGdATtfGV1B+LZh7nCGLwWWUcVSxS
         SffiBLTFDcaoBAIuUz34rrjzQy9CepUb+lT8Tl2YaRX6TQHkQDfETtTvBj4NE6OqNrkM
         w51FqPvpoLH9l8niTqrtVdnOO4i9eLQd/5OgLgpvacKI5QcBd7nW1mXWMXR9D+u1is4h
         4mKCxXsPybh5ySE5tKHojXjeClpTm542XCYvbXv7kyOeKnEYG2y7Zzjf/iCvYd/hAKGN
         Om0E7psJ88yccvi5r+1SSzqGnrZHVR1s8XHvzp1annCHAYijasjboE3maFNNbpyiRRsv
         ktBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653085; x=1795257885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=BGQOCvqiamsd0J5C+pALKjxMEf0vVLW8ZIX5SLvNbIHlqbztn0KRpu9OcTTiI9u9IY
         rmNZqNRdwbvW01KGMYXvGaI5+GPIX/ok7uM43ghSyKreIr1kVWKXz61bGCVZrL7bHlWq
         T0ZUmQAN0RBR5ReteaT/vbPjQTGmcgA3E/ik1al1DnDoqsKetmjwQz7+KlzRBM5dj9PX
         fYKuZbXGAstMjzs7lJdG/Pw7rdx/F+t5boSS7F/FiDVUxUKkOwDriposeGBy8FlKF/JM
         tCtfFwtMdqz3dbf6CZ00pNVfVZGWurpbrhUzhOQ0Pho/9oZ9PmjRvJzGM6RT8rG2S6QE
         IDcA==
X-Forwarded-Encrypted: i=1; AL+hErFyBygbL3iVybuqU+VAW4W8ULEyto4PM/xzxp4yWem+akJLCBO/Mn0osoM4uauzDx51NzVn6exqxC6yshYKpg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+IaUXh4AlZY7qCWB2BrVegkDbcKQ6TgBO6kE0UIH0SER80Q1eF
	Tl8fRRh2zqpzOBrDHS5glSWnISX00Dp9AUOxmQoaeaXSXsAoA27yyHCc
X-Gm-Gg: AYBFou1RnvFLCrggU3RKBIaSoC8WwdORa46tFoXThzVZeCAFyunpckkvO2w+im+nSwU
	KDebmTzdJcotMRgZcRiLMt5wTm95FTGxZxJLoTjHp0lF0ShdORkv1/ea9tNi0ZUol26a/M7Dh1z
	r5um7xLitGbGN2FvANOgCPxcQ8uZ2ZVXQ1OP3b6h66mb07KhX8CJ3DFSjYbTR56mFRL205uNrLt
	Me5avWjhs2VqU54j00u90n3HXn2UvIK+DyU3fd2hfu/gGTZz6KosMWabLS5e/xL5vcaGhGb2wLv
	hHeeo/SuhnJTm1501cd6pqs/6LEAsE0cMVWW8UDApwthqT7GK1XSOIt1vLn9aFrShArJZlhMokn
	H3jX27eR195jBNj0iu9AgUZeST466L/Z2znPEepqjkFbbX9MzD165EUpELnKS9USZ+Y30CuiLWH
	g1ABlSITKWbzkHrBL0Pm2pFQbrBlUr5zHvhxAdeYKmh9ECSyu0I9dg+7v0KK8boUKnRFqYZQD3X
	Y4aA8wsHlQ4TDlgG5LgnNJgJldg4cOe5rafdMJHAUZaXzzeuXB1bNKO4LCF6D6tCIpK9AM8dHv2
	HZGETRXsjCH+27ouJVm78ZSKc6L3CkI4/ZIoqv/h8Y52bMqz9IeQZdVjgGwtVGFECQYC9C95p/v
	+9j3qRa4lIBVncjUYlJz170iv1wTspL/JEQ==
X-Received: by 2002:a05:600c:544:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb55a662f9mr75106665e9.10.1794653084661;
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
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
Subject: [PATCH net-next v20 06/15] net: phylink: make phylink_validate state locked
Date: Sat, 14 Nov 2026 11:43:45 +0100
Message-ID: <20261114104426.235620-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024446_474045_953C3E28 
X-CRM114-Status: GOOD (  18.03  )
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

In preparation for support for PCS release/late attach, rework the
phylink_validate functions to be locked under the state mutex.

With the introduction of a notifier that can be called concurrently while a
phylink_create is called or an interface mode validation is being run, on
recalculating the supported interface and capabilities, an inconsistency
can be introduced with 2 validation run at the same time.

To handle this, make the phylink_validate lock under the phylink state
mutex, add lockless variant for phylink_validate_mask and phylink_validate
and add lockdep check to make sure the mutex is held in the inner
validate functions.

Function that already run phylink_validate under state mutex, are updated
to use the lockless variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 53 ++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e2e0b313fd61..a7ec4feb950a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -9,6 +9,7 @@
 #include <linux/ethtool.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/lockdep.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -550,6 +551,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	unsigned long capabilities;
 	int ret;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -628,6 +631,8 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
 	struct phylink_link_state tmp_state;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	linkmode_copy(tmp_supported, supported);
 
 	tmp_state = *state;
@@ -648,15 +653,17 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	}
 }
 
-static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
-				 unsigned long *supported,
-				 struct phylink_link_state *state,
-				 const unsigned long *interfaces)
+static int __phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				   unsigned long *supported,
+				   struct phylink_link_state *state,
+				   const unsigned long *interfaces)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_adv) = { 0, };
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_s) = { 0, };
 	int interface;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
 		phylink_validate_one(pl, phy, supported, state, interface,
 				     all_s, all_adv);
@@ -667,14 +674,30 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 	return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
 }
 
-static int phylink_validate(struct phylink *pl, unsigned long *supported,
-			    struct phylink_link_state *state)
+static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				 unsigned long *supported,
+				 struct phylink_link_state *state,
+				 const unsigned long *interfaces)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate_mask(pl, phy, supported, state, interfaces);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
+static int __phylink_validate(struct phylink *pl, unsigned long *supported,
+			      struct phylink_link_state *state)
 {
 	const unsigned long *interfaces = pl->supported_interfaces;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	if (state->interface == PHY_INTERFACE_MODE_NA)
-		return phylink_validate_mask(pl, NULL, supported, state,
-					     interfaces);
+		return __phylink_validate_mask(pl, NULL, supported, state,
+					       interfaces);
 
 	if (!test_bit(state->interface, interfaces))
 		return -EINVAL;
@@ -682,6 +705,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return phylink_validate_mac_and_pcs(pl, supported, state);
 }
 
+static int phylink_validate(struct phylink *pl, unsigned long *supported,
+			    struct phylink_link_state *state)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate(pl, supported, state);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2117,7 +2152,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0


