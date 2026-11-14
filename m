Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BC8606B95F
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m2ZYrY8/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7zG18cf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=; b=m2ZYrY8/UqMEi2
	LUKNRqEnqdnGQU/T0q+8aZi5NjpcrYI4wufPKQcPPYpuokGYNlhDsFefoM5t4KnPAzYryqKhH2XBv
	ssz54Mr8TjJaSKqlu0Nl1FnZ3Ot6IIkJUyjp2m/Hg6UVOsqIMo95wkpCmf7WRh60KjKwg4pMeNAFk
	+DKNpQUnXlKhiz1duJamnEvif/fLYyqFA6WLIlhE0U+bvoJn/T9akUw87/3VPJ+/G+gOYrmbvbAq7
	PXKjPuaBNluf4tjH6ukhmMVsHFQ2eTuyXByXKLvsH+d8VHK/Odw6cgnpd78WhV4M6Ou4a+7XGhfCz
	feNi0cSOXXm04h7dewlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFl-0000000Fn83-1pIC;
	Sat, 14 Nov 2026 10:45:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFY-0000000FmrC-3dH0
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 10:44:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso12340085e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Nov 2026 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653087; x=1795257887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
        b=h7zG18cfOm4sfqyZc7GtkElv2LuY0UOwNP2hHXL8p7lMaRWck/GSd86w6oxxqil+/Y
         cUybsNbCKpsHXVD2f7/yIwCMb2DWFQSWwIkjSsSpAi/6mP5M6a3Chp0HlLjJut/fyFs8
         CRYNlsSVm5/VyHWmSSbSZaMwPWn7tXWGPZVBL/rdOoHVphflsoAJ7SuMj2mDsgd+zS8C
         QlHZ/Q4oALpnh097IRWme3ltYJaoGOW1qi2A+drZd4JVN4EzCsRVc1lstz09flXChomr
         FlB2KAcV0HPyzL9NKRqFgUIb+ffF0Gp8YVIoIoMRrMK6cT7j1QdT3mjMP3PP6YDGAh+0
         GCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653087; x=1795257887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
        b=siMeo+4r8LFJ6W8MgX0zyM8EK9Enm3NHis9WknXVip+O2Pc+oy0xT3knjIErbcltLk
         TZTMk4jeeOoTy8SffjKPirGhTv7qi7r2BTK7onlHQh6NWvY6GtuljvSmJ09owndAIZ72
         uAi72Xjva61o7PYvm/202v98ZS2O/OPlY/bmDAHRilE49HOq83k0Bspl90AHNoUzEpqv
         BMg2C5eAJy8lyorMF/xFeUjx5NtxBr9AWSJAe5F3kR8UHdYAd7qq7BxJaIyJKdhbkvfH
         SlCZDZUpJ7EboWL/cAzzvW//VKCwgyhGMQnIeKFQAQoLxxyiYhE2xAjtWlNeNFntM2TZ
         uFvQ==
X-Forwarded-Encrypted: i=1; AL+hErH5tC419a+vM1EMYl28TBrm3VOglptjfzX+W8f9jJrL+FIQdJ6JYUwqqYzdBctvUY23VDdDN+gBk3nAYKUudQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9+UB9Pio9w0nPSyS0V9Lsf8Is/VkkqLFgxzIzWMJZeVz9kW72+
	CgbPM4pL5Paqr9p4DBOi1LFOx9gthQ5usdlfaJbvnwT2ykhZQH9NwKx1
X-Gm-Gg: AYBFou0kUL1VXKz5P6bv+qs+stcbtbKXHwARwiDMoxK3v894nh6lBwluE/sDUDgO7ZW
	KVdyEy5lHeJK2ffFuH5ZmV/LVmJlAJLNjfE8iPDcvJ6LV6sGHUHcnONDyvmVQdz8MHLAA8JKLwa
	Dp5Kq3TCOdR+tBDuS7dIhudMBnmQK941lR9ttYlivPcQgRAW4bxvU2J/Wl/FHAC7J57tDJuVMXw
	Pk2LQKpKER4UeEPG7pzMPi8EkRRK4JQtg1kCS5/KMpwrSa+yf62cKn+ot/7C6TUDbuI82BS2juS
	OejiuDu+NPTn5YeQH19Ny9eIcarJ1xA0V7Cq+9CTGN1ipJJrJreshkpup0J0Z75AwJrgxeQ6Lvb
	zh7V0zuZWS3Xur8XKiBCDFwcKxd7i2hYWBkY3PEO35PBwblsto/7vAbayKMkvDuk/psjeqI0bx+
	lRs6C5evs45eagMPl/It2vfajqTs1NdeuA7dNPccjMy//9eLt6KJCW6IebYJ+8OijKcH/1cilPi
	Lc+e+pb5QGEpJErmCT49jBwiNhXkIodR6vwVe/RNRfBbAcjpgKtGua6ixdWH8oFAC23Us6/bZxW
	1k4tDevRCO8uYYnUbCbAmPUl0x8r6JrfeKHS0Gt00azoLRb27tyFJjUrgxK0U4Ixq7hj08KCW7U
	bVQOy7FrJEkNKPf80CoAsFO38wgA+iHhg9Q==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr110359075e9.11.1794653087248;
        Sat, 14 Nov 2026 02:44:47 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:46 -0800 (PST)
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
Subject: [PATCH net-next v20 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Sat, 14 Nov 2026 11:43:46 +0100
Message-ID: <20261114104426.235620-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024448_951647_D2768A79 
X-CRM114-Status: GOOD (  15.88  )
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

In preparation for PCS release/late attach, it's needed to introduce an
helper to calculate the capabilities after a PCS is removed/added and it's
needed to track the advertising in link_config changed by the user compared
to the originally one calculated in phylink_create().

To archieve this, introduce a dedicated advertising in phylink struct and
update it when the new phylink_calculate_capabilities() is called.

phylink_calculate_capabilities() will then compare the advertising saved in
phylink instance with the one in link_config (that can be modified by the
user to disable modes), compose the modes that are user-disabled, calculate
the new supported modes and the new capabilities, update the full
advertising in phylink and restore the user-disabled modes.

phylink_create() is also updated to init the phylink advertising and
link_config advertising.

linkmode_xor() is added in addition to other logic operation to parse the
user-disabled advertised modes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 28 +++++++++++++++++++++++++---
 include/linux/linkmode.h  |  6 ++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a7ec4feb950a..957241652525 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,7 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -717,6 +718,27 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return ret;
 }
 
+static void phylink_calculate_capabilities(struct phylink *pl)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
+
+	/* Get user-disabled advertising modes */
+	linkmode_xor(disabled_advertising, pl->advertising,
+		     pl->link_config.advertising);
+
+	/* Calculate the full supported advertisement */
+	linkmode_fill(pl->supported);
+	linkmode_copy(pl->link_config.advertising, pl->supported);
+	phylink_validate(pl, pl->supported, &pl->link_config);
+
+	/* Save the newly calculated full advertisement */
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
+
+	/* Keep user-disabled modes out of the active advertisement. */
+	linkmode_andnot(pl->link_config.advertising,
+			pl->link_config.advertising, disabled_advertising);
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2252,6 +2274,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2275,9 +2299,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	linkmode_fill(pl->supported);
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	phylink_calculate_capabilities(pl);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index 3b9de09871f6..a8290d021994 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -32,6 +32,12 @@ static inline void linkmode_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
+static inline void linkmode_xor(unsigned long *dst, const unsigned long *a,
+				const unsigned long *b)
+{
+	bitmap_xor(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
+}
+
 static inline bool linkmode_empty(const unsigned long *src)
 {
 	return bitmap_empty(src, __ETHTOOL_LINK_MODE_MASK_NBITS);
-- 
2.55.0


