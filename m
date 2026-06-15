Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA25CD98DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeREqKwyBL2tZifBDIM4b8FY1VqpNjyArTkAWxSLkSU=; b=Y3CevQLoi8pUswtoJeCnFz7T0Q
	t+wzNOCvjKrkuL0VuaFmDL+OsWJYQo22KLa0zosivDeek6QR5zsyUBirtBXWZ/8083lDOQ7XI+69P
	0D6WiNIBuauyEfr0p7clDaI3Ds0ysffRGlR93ILasO8yMz5/FSnGDPKAEfDweQ4J3QX/NsxzJ7Blt
	C1BPhwuZhSbwYJHlyLyVHKU+3eHEAuzF5GqxJcBrqy5XNGlMPKKwrH+PwOc1r1/dmqBafko2MTW5b
	SdNX4i/1RdEAG3xK4t4q1eXmj1+bAvgeVtEBhJ8h7Q9TFNnAyv8MOw2NaFce2x5QGD17W4MtF6kTV
	04bC3oFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Sn-0000000EBUC-0jRF;
	Mon, 15 Jun 2026 12:30:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Se-0000000EBKi-174A
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso42920205e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 05:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526639; x=1782131439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeREqKwyBL2tZifBDIM4b8FY1VqpNjyArTkAWxSLkSU=;
        b=s3sG8YcfLILGAlj4s323Xkde2ZBy1jlYf3eBAYxyuRh4P8VXQfPkUXuhuUzKOA4WFA
         MQQavHJrP8XE0AA6bWM2Q4PzkCMG6QxXfCFJi4eI0lI0R/wTGdq2zkuRjjvPYQ8QLETc
         oZR1v4szCU5coJYjvIYB0r8pM9ig+cgx+3kLwVXyYxZ9ZSJnMl6zjoR3kps0bWZldth/
         8dAMmJ+mz8TSbCz75SnNTTogPk3r6FqxMpk4Ozr3+Q2fINDSG6kftlBadyLA6H4H7uqV
         YXp0q83yEYFaHcp913QUwUcIElioiFrTTG6J4yLiAOk+8MQYVKZ+OdG869Qy08g1s1Xj
         KIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526639; x=1782131439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LeREqKwyBL2tZifBDIM4b8FY1VqpNjyArTkAWxSLkSU=;
        b=r2FJmfpkoIXfn9eYLBBinPpwNk3btNwZLYL5EZPbz2uIAlylgLmBmB1ERLLxK1Afnq
         77YJvVmwx81DvPJ8taRqL+kZiFSiALTlrST4dfXUvFT79MtsV5AeSUVfmC0aToVNVwE0
         njkYxF4LlsiT9WJBAdexqo/Vt23X+MEI8rIJOgWV6V9dFvmvHJ3lVKhplkiIWH2F97oF
         ZP12ypdawf9r34+gGK5R+zde3cj49x++6DT9UhhG69SHMupK46cIvFpqWJQIWae6YLCM
         7KknbU60YjO57HjDzLjBLSvSNA1QB0hkacBySpqX7Lxjjj4M7EfZdc6DUMkIckrNAAAe
         ZRuw==
X-Forwarded-Encrypted: i=1; AFNElJ9WApLOFFz4ye1SKLkt0N5lqwDPWCV/7hwilYPfh5VujlDcrB0tBKWtwRlVOa5M3PD026I2mnP5L5Vktzb4kg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw07N6oV99+kz7PCVoWnmy0SQijKCLi5gi+RxLuxrPgIV3Ev04D
	Ab827rnrU4yE+GbnU8jChKirga8H5N0zDUptmg0PnNixdzZ12M09v0ef
X-Gm-Gg: Acq92OE0pwh40n1wiKS4hGWZAlnruGklbhq1ditFA3YH+VlM24CzhpB5rpoWdFzKgj+
	L/OT9TJ+2PIjQTJJXVxaABgJfsnPri5T+Cis3vUg95E4C4toHpoWo9iwWx/XG0hsmO3cp0eZ0ax
	Tfk9NBsOCqIwY5FkNbvYRf0+3sZifMPUP8HJ/FhWgmop2vnBoUOHKUUNcu7MKAqDITgQzFZo3Ps
	GdhjK5CTktvFgINCsLc/WnLeAXXIIIHabquL8hbTskTvwqxuvLxPTUibCJhxysJssU5kNtv1ig9
	F3aMTt7DYfnQ3zoXuhGeZXbMnHs7rbuzPT+Mx8Fe1WwP5o+lOjy09VwVdEO2wjmbHC5BVdZroup
	Q6/Qk+4Id1u3tS10Ke91e7OTMWu3i8M3oAaxlH7G1j4XGRLvZooGbt3xXhoRZpJBRoN1aLlo/P0
	WZvd5+RpSI1jc9I3tv0AttuUJPXUIXCRAka3sVdDlrBiZkVXzCl5KTA+AGCAMgzwJKBQ==
X-Received: by 2002:a05:600c:3512:b0:491:9969:739d with SMTP id 5b1f17b1804b1-4922011393fmr139236575e9.29.1781526638312;
        Mon, 15 Jun 2026 05:30:38 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:36 -0700 (PDT)
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
Subject: [PATCH net-next v7 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Mon, 15 Jun 2026 14:29:39 +0200
Message-ID: <20260615122950.22281-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053040_387901_6DF7EA04 
X-CRM114-Status: GOOD (  21.07  )
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

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 53 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index cb07184ce82f..ca4dad4b140a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,7 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -918,6 +919,58 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+/**
+ * phylink_release_pcs - Removes a PCS from the phylink PCS available list
+ * @pcs: a pointer to the phylink_pcs struct to be released
+ *
+ * This function release a PCS from the phylink PCS available list if
+ * actually in use. It also refreshes the supported interfaces of the
+ * phylink instance by copying the supported interfaces from the phylink
+ * conf and merging the supported interfaces of the remaining available PCS
+ * in the list and trigger a resolve.
+ */
+void phylink_release_pcs(struct phylink_pcs *pcs)
+{
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	mutex_lock(&pl->state_mutex);
+
+	/* Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case,
+	 * force phylink resolve to reconfigure the interface
+	 * mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+	}
+
+	mutex_unlock(&pl->state_mutex);
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..15e6b1a39dfe 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -751,6 +751,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0


