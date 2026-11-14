Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483F2606A33E
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mK0L8yIj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WGAK3P8X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qm8+QVYYbok4Vr3mPbetS/0Kj1pqFxL1EyHoClw5nxc=; b=mK0L8yIjz6FbGj
	eHs1C3MJ3ZgBCgqBAXSf4YZuZO0Y4wz749UuY+gCSTlZvKiPWREt6TAUVMVYvVS2MJhjQ+p91Xtj7
	jj9Kl+evix8m99CPlcgFaGzgsMcKM5XCoEN6He70/30ztXOdLAcDn1Rdq46xCKCZmTSQpTlFn44Eb
	VGQjiWk6IEe1PLZ+Qw7b+VuGRBf/+f1ee+4Mfvfq60Uhb356tboVb2qmoPSMDvr0+lqqmcX50/cdI
	pc6RvXA9QTsBx0LB/gqf9uoyAP1X0sAdZ9uxTj0JPL5EvkV39DQ006YVWxhbP00VGPpwQKe+bz04M
	lldIiXs8AyvfIy6qfGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFm-0000000FnAs-29Xl;
	Sat, 14 Nov 2026 10:45:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFb-0000000FmtF-0AaC
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 10:44:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so18835705e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Nov 2026 02:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653089; x=1795257889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qm8+QVYYbok4Vr3mPbetS/0Kj1pqFxL1EyHoClw5nxc=;
        b=WGAK3P8X6WpcrRLXmnLGPTY6wkzHXmynja5ArZsH/2AGZnQObr3Ti7G1RPeSCJB/SC
         /El1AL7z25yDQEwrUGoXeZ+cstbW/8o7FfwiV6HPmjehh5gzzujHOgutg4Scg7XEye5T
         n/XxpFV38tjp2PKmA1pDEbCIxMoHgq8tRYmQlBvbREzfrebFw4GAvDVDvB/kbeR5Q3/B
         CLVVxq5k2Eh6wtIlMWuo5Ch5HfErXjwHO6trvyWS0HGNK6CWTUc5yu/Cs+F5QQltPwWT
         9MkxMM653bcgMa4m3/K3/tI82RHmClHNgQhWFrAbGOHHALbHRsYZjGRXa4thMY5RF3r2
         asuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653089; x=1795257889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qm8+QVYYbok4Vr3mPbetS/0Kj1pqFxL1EyHoClw5nxc=;
        b=lQdqQCFvU4GfyV6eoprimphsCqB/r4uPLZOfkuWS1/NBT6iNbd1t2qfiXJou+BNDjn
         k4JIcYjHtpWa6lrVHrsOy1zLt8NWJojDJ+LNMws4p86wVq/t4sxJOU4/gIZdCIRqaLhV
         DIaRrnpNQsIkG+rCHOqulga4lSVZ8Ux5GsJoYRXXz1ELLcLOTIT1nFjRsqvzYKzoftUO
         mSPEOJGlkNkRV9xXOiVTjylsvI9G0oRhfMDWfPMefd2KHdyz78NyE4F1JaSflHrX7rot
         BjbZ/FWo2I5em+DfLpKhS5BowZdosB8O1i2KrOcsYlwQe6INhQcV0EXSBkir8mrK4eP9
         z+Ow==
X-Forwarded-Encrypted: i=1; AL+hErEH2bTAbM1ojTRinCg+jR5gRTIWQT/lHGsNnVM8l4GxSbZRXfAjJhmBsQV0NF/oaxv/ahXk2ARMaU3PH1oTLQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/h62fBpYiKmxQJplfqVQUom69nSRtDMM37w4jTVSuFlEw7qlmS
	yYmmXhXvY6GZ2qlBXn7TByyNI0hEJDL54sfkxBMIfjhc0rumjbi+PGnB
X-Gm-Gg: AYBFou35IyjcmYXZHkyDKxgOIGTjieCPX6rcaLmktxYsi7po42WedzvhvUXDOKo2a5A
	ylh4Sk5ffeaNF04Fn+WuyneLzzsgXSHRrsUBCQBGpnsdKV7Jnquwo9sIq/BbwjL3e/IfPrJUJn4
	LMEuAOW9l6xmfzqECbijJ+iewjwVoOUlv9AtD7AW1VyHm2XW6I0h7NoqVaswD+60/UpA+CTNV+w
	SWHQYpydWPScC8GrSKLGoW5vwpHnOWDZWu78r3KtY33QW4P/Rv5il4SI69Nd39WuzFVzSbpr4lh
	h8E2wyYEl682h29yOJ19WOq/H726CshjJUi+EMyVQPSCr/0hVItawl5jsSkHosuLhBvthckXJHb
	Ct14JekkaIBj3k88Ex23BkOJVH3vzosbIbEhKssax9F59KYGeH4AGoFjx6ETKePIarSV/9mkPvD
	n5E6vyo4r1qrAvfTfvn2aAmmvD/q4n7lrW5Oa8fMR1jFuUNob4fvoWPKmPeLaGZGtBPr1Rk8KfC
	CIoGpJBp9qeK3G/RdltHycJ8I3BOVoqE5z11MrsbuhwON+3bj3SCmYRA+3vRYjhgrzTkiP6geeo
	PPiXt5M0X5hS7e/RKiY/sev7bfOjB/QR9Dh6hWswP4f29HEY/2o5x9LHweIaw4eQWbsPuM9S6/Q
	T86sz0PwH7P/AKXPaU2O4xO0+vnDD9EnX4A==
X-Received: by 2002:a05:600c:3b16:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb55a6116bmr111312825e9.4.1794653089250;
        Sat, 14 Nov 2026 02:44:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:48 -0800 (PST)
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
Subject: [PATCH net-next v20 08/15] net: phylink: support PCS provider release
Date: Sat, 14 Nov 2026 11:43:47 +0100
Message-ID: <20261114104426.235620-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024451_238622_75C7E2F1 
X-CRM114-Status: GOOD (  30.52  )
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

Add support for release of fwnode PCS from a PCS provider.
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_DEL every time
a new PCS provider is released.

phylink will then react to this event and will call the new function
fwnode_pcs_matches_provider() on each PCS of the phylink instance and
will check if the PCS is provided by the PCS provider that is getting
released.

If a related PCS is found, then such PCS is removed from the phylink
instance PCS list and the supported_interfaces value is updated.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Finally a phylink resolve is triggered to handle the PCS removal.

Protect every access of phylink pcs_list with state_mutex to handle async
PCS provider release and capabilities recalculation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  47 +++++++++++++
 drivers/net/phy/phylink.c | 136 +++++++++++++++++++++++++++++++++++---
 include/linux/pcs/pcs.h   |  69 +++++++++++++++++++
 3 files changed, 244 insertions(+), 8 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 39550d9a12a2..25b3248e8b93 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -22,6 +22,19 @@ struct fwnode_pcs_provider {
 
 static LIST_HEAD(fwnode_pcs_providers);
 static DEFINE_MUTEX(fwnode_pcs_mutex);
+static BLOCKING_NOTIFIER_HEAD(fwnode_pcs_notify_list);
+
+int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(register_fwnode_pcs_notifier);
+
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(unregister_fwnode_pcs_notifier);
 
 struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
 					    void *data)
@@ -74,6 +87,11 @@ void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	/* Signal phylink to release any PCS from this provider */
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_DEL,
+				     pp);
+
 	fwnode_handle_put(pp->fwnode);
 	kfree(pp);
 }
@@ -183,6 +201,35 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+				 const struct fwnode_handle *fwnode,
+				 struct phylink_pcs *pl_pcs)
+{
+	struct fwnode_reference_args pcsspec;
+	int index = 0;
+	int ret;
+
+	while (true) {
+		struct phylink_pcs *pcs;
+
+		ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+		if (ret)
+			return false;
+
+		pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+		if (!IS_ERR(pcs) && pcs == pl_pcs) {
+			fwnode_handle_put(pcsspec.fwnode);
+			return true;
+		}
+
+		fwnode_handle_put(pcsspec.fwnode);
+		index++;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_matches_provider);
+
 unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	struct fwnode_reference_args out_args;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 957241652525..f8fc52c73646 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -11,8 +11,10 @@
 #include <linux/gpio/consumer.h>
 #include <linux/lockdep.h>
 #include <linux/netdevice.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/pcs/pcs.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
 #include <linux/phy_link_topology.h>
@@ -68,6 +70,7 @@ struct phylink {
 
 	/* List of available PCS */
 	struct list_head pcs_list;
+	struct notifier_block fwnode_pcs_nb;
 
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
@@ -722,6 +725,8 @@ static void phylink_calculate_capabilities(struct phylink *pl)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get user-disabled advertising modes */
 	linkmode_xor(disabled_advertising, pl->advertising,
 		     pl->link_config.advertising);
@@ -729,7 +734,7 @@ static void phylink_calculate_capabilities(struct phylink *pl)
 	/* Calculate the full supported advertisement */
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	__phylink_validate(pl, pl->supported, &pl->link_config);
 
 	/* Save the newly calculated full advertisement */
 	linkmode_copy(pl->advertising, pl->link_config.advertising);
@@ -1058,6 +1063,9 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 					 phy_interface_t interface)
 {
 	struct phylink_pcs *pcs = NULL;
+	int ret = 0;
+
+	mutex_lock(&pl->state_mutex);
 
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config,
@@ -1074,9 +1082,14 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 	}
 
 	if (IS_ERR_OR_NULL(pcs))
-		return 0;
+		goto exit;
+
+	ret = phylink_pcs_inband_caps(pcs, interface);
 
-	return phylink_pcs_inband_caps(pcs, interface);
+exit:
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
 }
 
 static void phylink_pcs_poll_stop(struct phylink *pl)
@@ -1617,7 +1630,9 @@ static void phylink_mac_initial_config(struct phylink *pl, bool force_restart)
 	phylink_apply_manual_flow(pl, &link_state);
 	if (phy)
 		mutex_lock(&phy->lock);
+	mutex_lock(&pl->state_mutex);
 	phylink_major_config(pl, force_restart, &link_state);
+	mutex_unlock(&pl->state_mutex);
 	if (phy)
 		mutex_unlock(&phy->lock);
 }
@@ -2047,6 +2062,9 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	if (!pcss)
 		return -ENOMEM;
 
+	/* Lock state_mutex while filling to handle PCS notify */
+	mutex_lock(&pl->state_mutex);
+
 	ret = config->fill_available_pcs(config, pcss, config->num_possible_pcs);
 	if (ret < 0)
 		goto out;
@@ -2066,11 +2084,91 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	}
 
 out:
+	mutex_unlock(&pl->state_mutex);
+
 	kfree(pcss);
 
 	return ret;
 }
 
+static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	lockdep_assert_held(&pl->state_mutex);
+
+	rcu_assign_pointer(pcs->phylink, NULL);
+	synchronize_rcu();
+	list_del(&pcs->list);
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by this phylink instance. If this is the case,
+	 * tear down the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		if (pl->old_link_state) {
+			phylink_link_down(pl);
+			pl->old_link_state = false;
+		}
+		if (pl->cfg_link_an_mode == MLO_AN_INBAND)
+			timer_delete_sync(&pl->link_poll);
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		WRITE_ONCE(pl->pcs, NULL);
+	}
+}
+
+static int pcs_provider_notify(struct notifier_block *self,
+			       unsigned long val, void *data)
+{
+	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
+	struct fwnode_pcs_provider *pp = data;
+	struct phylink_pcs *pcs, *tmp;
+	bool resolve = false;
+
+	rtnl_lock();
+	mutex_lock(&pl->state_mutex);
+
+	/*
+	 * Loop all the PCS for phylink instance and check if
+	 * this notification is relevant for some of them.
+	 */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+			continue;
+
+		phylink_del_pcs(pl, pcs);
+		resolve = true;
+	}
+
+	/* Exit early if nothing has changed */
+	if (!resolve) {
+		mutex_unlock(&pl->state_mutex);
+		rtnl_unlock();
+		return NOTIFY_DONE;
+	}
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	/* Recalculate capabilities */
+	phylink_calculate_capabilities(pl);
+
+	mutex_unlock(&pl->state_mutex);
+	rtnl_unlock();
+
+	phylink_run_resolve(pl);
+
+	return NOTIFY_OK;
+}
+
 /**
  * phylink_update_pause_state() - Update the phylink pause frame configuration
  * @pl: a pointer to a &struct phylink instance
@@ -2281,10 +2379,18 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	/* First register notifier for hotplug PCS events */
+	if (!phy_interface_empty(config->pcs_interfaces)) {
+		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
+		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	}
+
 	/* Fill the PCS list with available PCS from phylink config */
 	ret = phylink_fill_available_pcs(pl, config);
 	if (ret < 0)
-		goto free_pl;
+		goto unregister_pcs_notify;
+
+	mutex_lock(&pl->state_mutex);
 
 	/* Link available PCS to phylink */
 	list_for_each_entry(pcs, &pl->pcs_list, list)
@@ -2301,9 +2407,11 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	phylink_calculate_capabilities(pl);
 
+	mutex_unlock(&pl->state_mutex);
+
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
-		goto unlink_pcs_list;
+		goto unregister_pcs_notify;
 
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
 		ret = phylink_parse_fixedlink(pl, fwnode);
@@ -2322,14 +2430,18 @@ struct phylink *phylink_create(struct phylink_config *config,
 release_link_gpio:
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
-unlink_pcs_list:
+unregister_pcs_notify:
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
 	list_for_each_entry(pcs, &pl->pcs_list, list)
 		rcu_assign_pointer(pcs->phylink, NULL);
-
 	synchronize_rcu();
-
+	/* PCS notifier might queue a resolve, cancel it */
+	cancel_work_sync(&pl->resolve);
+	mutex_lock(&pl->state_mutex);
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
+	mutex_unlock(&pl->state_mutex);
 free_pl:
 	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
@@ -2355,6 +2467,10 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	/* Unregister notifier for late PCS attach */
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+
 	/* Remove phylink instance from every PCS */
 	list_for_each_entry(pcs, &pl->pcs_list, list)
 		rcu_assign_pointer(pcs->phylink, NULL);
@@ -2367,10 +2483,14 @@ void phylink_destroy(struct phylink *pl)
 
 	cancel_work_sync(&pl->resolve);
 
+	mutex_lock(&pl->state_mutex);
+
 	/* Remove every PCS from phylink PCS list */
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	mutex_unlock(&pl->state_mutex);
+
 	fwnode_handle_put(pl->fwnode);
 
 	kfree(pl);
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index ef2134c578c7..83e0a2ad4b09 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,38 @@
 
 #include <linux/phylink.h>
 
+enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_DEL,
+};
+
+struct fwnode_pcs_provider;
+
 #if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * register_fwnode_pcs_notifier - Register a notifier block for fwnode
+ *				  PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Registers a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain. This allows phylink instance to subscribe for
+ * PCS provider events.
+ *
+ * Returns: 0 or a negative error.
+ */
+int register_fwnode_pcs_notifier(struct notifier_block *nb);
+
+/**
+ * unregister_fwnode_pcs_notifier - Unregister a notifier block for fwnode
+ *				    PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Unregisters a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain.
+ *
+ * Returns: 0 or a negative error.
+ */
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
+
 /**
  * fwnode_pcs_get - Retrieves a PCS from a firmware node
  * @fwnode: firmware node
@@ -19,6 +50,27 @@
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
+ * @provider: PCS provider to check
+ * @fwnode: firmware node containing the PCS references
+ * @pl_pcs: PCS to check
+ *
+ * Parse the PCS references from the "pcs-handle" property of a firmware node
+ * and use provider to determine whether pl_pcs is one of the PCS provided by
+ * provider.
+ *
+ * This function is intended to be used when handling provider removal
+ * notifications, where the provider is already known and its PCS need to be
+ * identified among the PCS associated with a phylink instance.
+ *
+ * Returns: true if pl_pcs is provided by provider and referenced by fwnode,
+ * false otherwise.
+ */
+bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+				 const struct fwnode_handle *fwnode,
+				 struct phylink_pcs *pl_pcs);
+
 /**
  * fwnode_phylink_pcs_count - Count PCS entries described in firmware node
  * @fwnode: firmware node
@@ -52,12 +104,29 @@ int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 			     struct phylink_pcs **available_pcs,
 			     unsigned int num_pcs);
 #else
+static inline int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 						 unsigned int index)
 {
 	return ERR_PTR(-ENOENT);
 }
 
+static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+					       const struct fwnode_handle *fwnode,
+					       struct phylink_pcs *pl_pcs)
+{
+	return false;
+}
+
 static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	return 0;
-- 
2.55.0


