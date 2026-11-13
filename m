Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2509606B7FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rSUxvOar;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kUnvp+Nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i5OFynf0yQ74EmgbLuwy7WCyI+wmTmFQ0TT8iw9nuIc=; b=rSUxvOarGRpkUc
	gQXqLwDqRvb++gVj2ndKz2b5Ymlh6m/psGKk00XYhn8+ZUTne5XqhrvspkNxFhgGgyDqawqSxS51Q
	lD9Tw6U+eNaI2tSCNVq7/7DuXnjPlS9v6wjgS5089dQV9mwpoV7GleIXI0ESogsVsvhO+qqBE4mW5
	+LCtyW+goDJN3pIirqws/Uxfr03phr8bm6q+tahVPWI+gUbA/lGMHBva5NbHemcXuabIokd/UTCpW
	/sn/C7Gz8zFvYsDgnTC8YfxA48dh3h6H5UoYRKnqZIGusMAfIkmS4OSVgAZX+Fb3ePZqlaBmxEOoc
	7z+xBo7H9k9kY7S4LEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDs-0000000BJUp-2O0T;
	Fri, 13 Nov 2026 00:32:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDh-0000000BJHc-1iOR
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 00:32:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so447695f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 16:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529963; x=1795134763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i5OFynf0yQ74EmgbLuwy7WCyI+wmTmFQ0TT8iw9nuIc=;
        b=kUnvp+Nl84GVc8lvhQbV8Nk9cxYTeWe9QuTd9mJGPC2Oj2wgoqNPv8puP1e/yk/Q5w
         nhroUlKfUmfQir1ih/1vW7fYilPx2OPH74NGEfQ4xWZtOB6KEBbH2Smj5RGPy1vRefHO
         znaPczrondALeaYh+6NJRqGcuRjBPZXpi9wraf66Dp6gmMPTgFirmWhbjkSbvsY6UIam
         91Z4mOZFuRm5dwD0wyQQ0DzP9XlOOmzctO2hDX5iUu+bumz8SVJxBzbGNYCQKpYMPlNg
         a7woyol6aYIAsXnX88ZrWVOnKh7mxWYQb6FgRhXjDfxss54I2papPrKWyeY1TSyIwnQo
         uXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529963; x=1795134763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i5OFynf0yQ74EmgbLuwy7WCyI+wmTmFQ0TT8iw9nuIc=;
        b=xKvzuz9E53W/IAONet1WB5FhkDezBo7/QflNi0Cmjtn1+o0hIAmK1fPzsNoovWs7Ds
         rQVa44m+U1tFBMXuoJAIvBaMaA800rs4LvYCnOinAKc9WhAbPK8s7ykG87TUwYNzRRUY
         yvtySjOcgjDsAlgqXQZHWIc6qPMAVNvAKm/58oaSnhC7KdZDqSa8T7Jq+xVxSohS31Jz
         0r9yH0/KWH3d5S9EZxLOazeiZPHCCZXs4TP0/KaXDxFddwnEYV+Oi+cx42kUutq5MQkc
         l5zctt5JDNUcfsjx0L85RFl85sCJ0QgPRrCnQ3Xd26VC7G4uCYOKmvZNBsoYgNixGYYq
         nJJg==
X-Forwarded-Encrypted: i=1; AL+hErEKE/36biGlp69rPGh0xaoVaMbNo2R7aHXOhLjHRB1WMKrZypBKla9FQiP2J4mrGVlQcLwxJOgzjG4GH+R82A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/vJ+0EhlffZA1zV0XtH2LaH7mSYSFxg/hCfJ/iKEPS1UZYbaDV
	ds8kQdWohQ5nz75nbEFsGXuyUzTYb7CInDAvnJGGOx9/AlnXdoaMN55E
X-Gm-Gg: AYBFou3HR9GByCY70SR5CV3L2PBjSg77Pe58LhvEJ1TmTsWKf+R2XlQH2frM8bZorh2
	ZIX2bMMLr0UVhLGaxHd9xzBGbih8YAEL+bpfOTUku8Uvbrj8Z6YKKhGGjQ4BoAnuTu2K9Dq0HYa
	rRhfIgWznaUyVPebX50vmEJ0gaDDFcoypK34jxUiHHO/tYz4ayBg8W41h4MBpQp4d/fTb+W/xKg
	F7FDVCCUSS32DVpa4a4CcnyVSb8oXnzPE/VQatW6fv8m8LzvVAtj5jtp0JlL7AH05IVwqlKkZqt
	6zyw5CBofkVONpLgkzFRqzhJeeqfke80GFiDPuGDQuYYRhvP39+iBtdIiOpP/dUQpXIl43WJwJ1
	d87jl4RTsm6VhNm+Te8IEsUFy0fB+Eg0jBU7ZwGrz8qJWFO5K5RIZdxQYkO2e1J9Q0jBhE3QV+/
	Iy+JGowKsCXSWeRzX6hzZAEdUe5YFw7hSGlpfgsySiSDuBuFrA6M0FVnoC85+C4kQr4QSCMlNBe
	2Xn1zEfh/QAy4m55EtHV4E+9f14zArAlJOIFnzTJa32wXdytxfdE+bxuJJtclqOYO/aPDBgINiw
	RrK+9oNZ+adycamdqd6pu179XaEex3gkIYs+z/4AatLiCk7e6o8xbmdG07M2u6b3BDT0W/MQrGf
	LbBRqjxdoFyejMIwV/J3GWd9XCd90BOGzituQeEaf4vGpHCx/DBf/8OMmlfFkNCQKpcvIHkX54d
	I=
X-Received: by 2002:a05:6000:2085:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-49c73a050e5mr2244067f8f.54.1794529963290;
        Thu, 12 Nov 2026 16:32:43 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:42 -0800 (PST)
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
Subject: [PATCH net-next v19 06/15] net: phylink: make phylink_validate state locked
Date: Fri, 13 Nov 2026 01:31:56 +0100
Message-ID: <20261113003217.197757-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163245_485668_140EF3ED 
X-CRM114-Status: GOOD (  17.36  )
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
 drivers/net/phy/phylink.c | 47 +++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e2e0b313fd61..918aa95e5a64 100644
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
@@ -667,8 +674,22 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
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
 
@@ -682,6 +703,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
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
@@ -2117,7 +2150,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0


