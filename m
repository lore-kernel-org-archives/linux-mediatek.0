Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345CDCD98F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kf2l+c+EJ+NGnPUNRNGV/q/FBKf7V0o+eIvvZe9tFq4=; b=kDdcu7FaxoQZRndl/IfhllRG1C
	IDvyYCPKSlcqLnUzUFDPOygKx/MFHnyGMSdqeVnHSKz/fD+xoduMtGi0TQIGneASE2p7Ty8EYwNVI
	UQuj7jWBebeRBTHOm7/J5/zyhbjN9eAX1YPRLecvnSgCBANg8fmLjCSsoUZv5VL8O7RrYP6FtixQT
	aFdtIQkWtBgcUMhrDj8CqN7+xTeuCti851bFv6FdLXQD3PU0io9vNAzirouTbya4JQB82tyu9QLPd
	dQQMWslCxLx3chS8tTJyi3OgKRY6y7MAwB6DtFdbNrv+6MZ/quIm2JooJ+f386NPpblMWCy6WHNUn
	328PrUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCK4-00000001IHQ-0JRx;
	Thu, 18 Jun 2026 12:58:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCJz-00000001ICI-30J7
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso5756745e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787494; x=1782392294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kf2l+c+EJ+NGnPUNRNGV/q/FBKf7V0o+eIvvZe9tFq4=;
        b=K+V3uBHRUqODw83DuUdE8KV+eQ+qmk/6bDJ0QmoBB/jXB5zs7B5pfOJpTBK+OXMxKD
         aSPPCc5mgHYAVMZqFd+JY+IaVgaO9Di/tMdgDTU7ZsuyiRTd1CThXXdPG/wTEq0OeooM
         AMAVR2hjsSnSnvpr3ONscCmNfS7vLFOrKNjq9fYfzDzNFVd/BwKYDyPr1TU2esp9rmw1
         MnDi8H/U6TB4VnQYpBmIFSn1PVWITRzDhPvM/CSSSTT6+nD54wM/PaQZMpIwjzhROgnE
         09Y++AAZt4eQEQ4uA8wqJq6fcNtr6xb8qVNdRSJNA8Qh1hY80TDZYuCwQePbr85NeP7X
         E8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787494; x=1782392294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kf2l+c+EJ+NGnPUNRNGV/q/FBKf7V0o+eIvvZe9tFq4=;
        b=tPzS1cc1nHrh7CyqwQ7IX8hcuwGtZIqWt3DIKnEjFfQwaaVBFSDq6KgD1CMPt2DMDx
         SW9Tv6+4kzl7Y2EZIsQ9Q55Zsb2gfasu8USStuaMq8YCkJRD9fE0zwz7ZNWX+skL0MXS
         1PxljEJmFJ5ycFKAyTxskDa/PxZscVL1f7U8P6/VDxiZN1UtGp0pAVY6tpgjaFExxkw4
         s/aEkFZF6iGUwY/3OGA6Mt98G3oMLwAzgPhwoAysLxTr9fo2l58mOxsWNlFHKyFPF9mv
         RjY3Kbho/h1iqu9dIJQMHjaB36fe8XEnOvU78vORzaM+qvFJJf7BnsdO7t60L1AzLvlN
         FyhA==
X-Forwarded-Encrypted: i=1; AFNElJ+rnTWBBhvOFH7bBsJZaNkKR1Q/kYDjqWa3KRPi8RFCbqnSIUfsYgkXv85TuvJGcgZP0NxIsgy99WA9h/ZJUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya8XkD/BHpNdEftdFDZfE5rxRsKnO4BfWwu/mBOId5Id9tk6t6
	+XPddtcxeE9y94N+iQXTI36aAhFQLYP0fMyMqePbX5RsPFz4BweMI9mZ
X-Gm-Gg: AfdE7cmRXePDDKnYVAOnG0kXvJ2vYAyF/R0kCXQdGDBMQvhXHTP2r0csxe2QQCq4qOg
	M//dt/CFq1wpN5xjBvHQdGGdjkqqInmGfMB9mUUR6Zq5ahldSB4GpituXFN6PD0SEgiBV51t3yi
	1IRLi7EaMwuds0168Bx7mhiqzMLCOrG0+5L/M7nNJx5QdOtc9tnZkdxucisbwd5BlTQI+2g6aFP
	Bbd7gS4nynLRtlQNj2BdGfsJ2cVv7yZvCoU/LNNlRW1MRtTbWr7jq21d4Uk6eON8bKI843ukyRi
	2IEt8cF4P82+YFO7zODac2LaFld7N/Wv+pvQ7TYwMNRImGafPinC0CdmxtGBsLXMMAYBZ1YU+jO
	fNgOSgPrGv/69n/d8b+937k3ZADF1fz90E74oDolWKSSA3tYmdwIUW0Kcc9yszjRwGS9f2q7u64
	NgHG17LeJXFxCWeoZjaeTOxEx91UFVDPAnkl3/2twdzENfA7HYMPRlhPwGzkshkw==
X-Received: by 2002:a05:600c:4f91:b0:492:1e36:d16e with SMTP id 5b1f17b1804b1-492333f7ff3mr142127425e9.36.1781787493602;
        Thu, 18 Jun 2026 05:58:13 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:12 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 02/12] net: phylink: introduce internal phylink PCS handling
Date: Thu, 18 Jun 2026 14:57:10 +0200
Message-ID: <20260618125752.1223-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055815_909351_268ED58E 
X-CRM114-Status: GOOD (  38.99  )
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

Introduce internal handling of PCS for phylink. This is an alternative
way to .mac_select_pcs that moves the selection logic of the PCS entirely
to phylink with the usage of the supported_interface value in the PCS
struct.

MAC should now provide a callback to fill the available PCS in
phylink_config in .fill_available_pcs and fill the .num_possible_pcs with
the number of elements in the array. MAC should also define a new bitmap,
pcs_interfaces, in phylink_config to define for what interface mode a
dedicated PCS is required.

On phylink_create(), an array of PCS pointer is allocated of size
.num_possible_pcs from phylink_config and .fill_available_pcs from
phylink_config is called passing as args the just allocated array and
the number of possible element in it.

MAC will fill this passed array with all the available PCS.

This array is then parsed and a linked list of PCS is created based on
the allocated PCS array filled by MAC via .fill_available_pcs().

Every PCS in phylink PCS list gets then linked to the phylink instance
by setting the phylink value in phylink_pcs struct to the phylink instance.
Also the supported_interface value in phylink struct is updated with
the new supported_interface from the provided PCS.

On phylink_destroy(), every PCS in phylink PCS list is unlinked from the
phylink instance by setting the phylink value in phylink_pcs struct to NULL
and removed from the PCS list.

phylink_validate_mac_and_pcs(), phylink_major_config() and
phylink_inband_caps() are updated to support this new implementation
with the PCS list stored in phylink.

They will make use of phylink_validate_pcs_interface() that will loop
for every PCS in the phylink PCS available list and find one that supports
the passed interface.

phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
where if a supported_interface value is not set for the PCS struct, then
it's assumed every interface is supported.

A MAC is required to implement either a .mac_select_pcs or make use of
the PCS list implementation. Implementing both will result in a fail
on phylink_create().

A MAC defining .num_possible_pcs in phylink_config MUST also define a
.fill_available_pcs or phylink_create() will fail with an negative error.

phylink value in phylink_pcs struct with this implementation is used to
track from PCS side when it's attached to a phylink instance. PCS driver
will make use of this information to correctly detach from a phylink
instance if needed.

phylink_pcs_change() is also changed to verify that the PCS that triggered
a link change is the one that is currently used by the phylink instance.

The .mac_select_pcs implementation is not changed but it's expected that
every MAC driver migrates to the new implementation to later deprecate
and remove .mac_select_pcs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 224 ++++++++++++++++++++++++++++++++------
 include/linux/phylink.h   |  16 +++
 2 files changed, 205 insertions(+), 35 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4d59c0dd78db..c38bcd43b8c8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,9 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* List of available PCS */
+	struct list_head pcs_list;
+
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
 	 */
@@ -154,6 +157,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
+static void phylink_run_resolve(struct phylink *pl);
+
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
  * @mask: ethtool link mode mask
@@ -518,12 +523,29 @@ static void phylink_validate_mask_caps(unsigned long *supported,
 	linkmode_and(state->advertising, state->advertising, mask);
 }
 
+static int phylink_validate_pcs_interface(struct phylink_pcs *pcs,
+					  phy_interface_t interface)
+{
+	/* If PCS define an empty supported_interfaces value, assume
+	 * all interface are supported.
+	 */
+	if (phy_interface_empty(pcs->supported_interfaces))
+		return 0;
+
+	/* Ensure that this PCS supports the interface mode */
+	if (!test_bit(interface, pcs->supported_interfaces))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int phylink_validate_mac_and_pcs(struct phylink *pl,
 					unsigned long *supported,
 					struct phylink_link_state *state)
 {
-	struct phylink_pcs *pcs = NULL;
 	unsigned long capabilities;
+	struct phylink_pcs *pcs;
+	bool pcs_found = false;
 	int ret;
 
 	/* Get the PCS for this interface mode */
@@ -531,9 +553,24 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
 		if (IS_ERR(pcs))
 			return PTR_ERR(pcs);
+
+		pcs_found = !!pcs;
+	/*
+	 * Find a PCS in available PCS list for the requested interface.
+	 *
+	 * Skip searching if the MAC doesn't require a dedicated PCS for
+	 * the requested interface.
+	 */
+	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
+		list_for_each_entry(pcs, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(pcs, state->interface)) {
+				pcs_found = true;
+				break;
+			}
+		}
 	}
 
-	if (pcs) {
+	if (pcs_found) {
 		/* The PCS, if present, must be setup before phylink_create()
 		 * has been called. If the ops is not initialised, print an
 		 * error and backtrace rather than oopsing the kernel.
@@ -545,13 +582,10 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 			return -EINVAL;
 		}
 
-		/* Ensure that this PCS supports the interface which the MAC
-		 * returned it for. It is an error for the MAC to return a PCS
-		 * that does not support the interface mode.
-		 */
-		if (!phy_interface_empty(pcs->supported_interfaces) &&
-		    !test_bit(state->interface, pcs->supported_interfaces)) {
-			phylink_err(pl, "MAC returned PCS which does not support %s\n",
+		/* Recheck PCS to handle legacy way for .mac_select_pcs */
+		ret = phylink_validate_pcs_interface(pcs, state->interface);
+		if (ret) {
+			phylink_err(pl, "selected PCS does not support %s\n",
 				    phy_modes(state->interface));
 			return -EINVAL;
 		}
@@ -965,12 +999,22 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 					 phy_interface_t interface)
 {
 	struct phylink_pcs *pcs;
+	bool pcs_found = false;
 
-	if (!pl->mac_ops->mac_select_pcs)
-		return 0;
+	if (pl->mac_ops->mac_select_pcs) {
+		pcs = pl->mac_ops->mac_select_pcs(pl->config,
+						  interface);
+		pcs_found = !!pcs;
+	} else if (test_bit(interface, pl->config->pcs_interfaces)) {
+		list_for_each_entry(pcs, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(pcs, interface)) {
+				pcs_found = true;
+				break;
+			}
+		}
+	}
 
-	pcs = pl->mac_ops->mac_select_pcs(pl->config, interface);
-	if (!pcs)
+	if (!pcs_found)
 		return 0;
 
 	return phylink_pcs_inband_caps(pcs, interface);
@@ -1265,10 +1309,36 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 			pl->major_config_failed = true;
 			return;
 		}
+	/* Find a PCS in available PCS list for the requested interface.
+	 * This doesn't overwrite the previous .mac_select_pcs as either
+	 * .mac_select_pcs or PCS list implementation are permitted.
+	 *
+	 * Skip searching if the MAC doesn't require a dedicated PCS for
+	 * the requested interface.
+	 */
+	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
+		bool pcs_found = false;
+
+		list_for_each_entry(pcs, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(pcs,
+							    state->interface)) {
+				pcs_found = true;
+				break;
+			}
+		}
+
+		if (!pcs_found) {
+			phylink_err(pl,
+				    "couldn't find a PCS for %s\n",
+				    phy_modes(state->interface));
 
-		pcs_changed = pl->pcs != pcs;
+			pl->major_config_failed = true;
+			return;
+		}
 	}
 
+	pcs_changed = pl->pcs != pcs;
+
 	phylink_pcs_neg_mode(pl, pcs, state->interface, state->advertising);
 
 	phylink_dbg(pl, "major config, active %s/%s/%s\n",
@@ -1295,13 +1365,15 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 	if (pcs_changed) {
 		phylink_pcs_disable(pl->pcs);
 
-		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+		if (pl->mac_ops->mac_select_pcs) {
+			if (pl->pcs)
+				pl->pcs->phylink = NULL;
 
-		if (pcs)
-			pcs->phylink = pl;
+			if (pcs)
+				pcs->phylink = pl;
+		}
 
-		pl->pcs = pcs;
+		WRITE_ONCE(pl->pcs, pcs);
 	}
 
 	if (pl->pcs)
@@ -1834,6 +1906,44 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static int phylink_fill_available_pcs(struct phylink *pl,
+				      struct phylink_config *config)
+{
+	struct phylink_pcs **pcss;
+	int i, ret;
+
+	if (!config->num_possible_pcs)
+		return 0;
+
+	if (!config->fill_available_pcs) {
+		dev_err(config->dev,
+			"phylink: error: num_possible_pcs defined but no fill_available_pcs\n");
+		return -EINVAL;
+	}
+
+	pcss = kzalloc_objs(*pcss, config->num_possible_pcs);
+	if (!pcss)
+		return -ENOMEM;
+
+	ret = config->fill_available_pcs(config, pcss, config->num_possible_pcs);
+	if (ret < 0)
+		goto out;
+
+	for (i = 0; i < config->num_possible_pcs; i++) {
+		struct phylink_pcs *pcs = pcss[i];
+
+		if (!pcs)
+			continue;
+
+		list_add(&pcs->list, &pl->pcs_list);
+	}
+
+out:
+	kfree(pcss);
+
+	return ret;
+}
+
 /**
  * phylink_create() - create a phylink instance
  * @config: a pointer to the target &struct phylink_config
@@ -1855,6 +1965,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 			       phy_interface_t iface,
 			       const struct phylink_mac_ops *mac_ops)
 {
+	struct phylink_pcs *pcs;
 	struct phylink *pl;
 	int ret;
 
@@ -1865,6 +1976,16 @@ struct phylink *phylink_create(struct phylink_config *config,
 		return ERR_PTR(-EINVAL);
 	}
 
+	/*
+	 * Make sure either PCS internal validation or .mac_select_pcs
+	 * is used. Return error if both are defined.
+	 */
+	if (config->num_possible_pcs && mac_ops->mac_select_pcs) {
+		dev_err(config->dev,
+			"phylink: error: either phylink_config .num_possible_pcs or .mac_select_pcs must be used\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	pl = kzalloc_obj(*pl);
 	if (!pl)
 		return ERR_PTR(-ENOMEM);
@@ -1872,10 +1993,26 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->phydev_mutex);
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
+	INIT_LIST_HEAD(&pl->pcs_list);
+
+	/* Fill the PCS list with available PCS from phylink config */
+	ret = phylink_fill_available_pcs(pl, config);
+	if (ret < 0)
+		goto free_pl;
+
+	/* Link available PCS to phylink */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		pcs->phylink = pl;
 
 	phy_interface_copy(pl->supported_interfaces,
 			   config->supported_interfaces);
 
+	/* Update supported interfaces */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -1883,8 +2020,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	} else if (config->type == PHYLINK_DEV) {
 		pl->dev = config->dev;
 	} else {
-		kfree(pl);
-		return ERR_PTR(-EINVAL);
+		goto unlink_pcs_list;
 	}
 
 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
@@ -1917,28 +2053,29 @@ struct phylink *phylink_create(struct phylink_config *config,
 	phylink_validate(pl, pl->supported, &pl->link_config);
 
 	ret = phylink_parse_mode(pl, fwnode);
-	if (ret < 0) {
-		kfree(pl);
-		return ERR_PTR(ret);
-	}
+	if (ret < 0)
+		goto unlink_pcs_list;
 
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
 		ret = phylink_parse_fixedlink(pl, fwnode);
-		if (ret < 0) {
-			kfree(pl);
-			return ERR_PTR(ret);
-		}
+		if (ret < 0)
+			goto unlink_pcs_list;
 	}
 
 	pl->req_link_an_mode = pl->cfg_link_an_mode;
 
 	ret = phylink_register_sfp(pl, fwnode);
-	if (ret < 0) {
-		kfree(pl);
-		return ERR_PTR(ret);
-	}
+	if (ret < 0)
+		goto unlink_pcs_list;
 
 	return pl;
+
+unlink_pcs_list:
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		pcs->phylink = NULL;
+free_pl:
+	kfree(pl);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(phylink_create);
 
@@ -1953,11 +2090,21 @@ EXPORT_SYMBOL_GPL(phylink_create);
  */
 void phylink_destroy(struct phylink *pl)
 {
+	struct phylink_pcs *pcs, *tmp;
+
 	sfp_bus_del_upstream(pl->sfp_bus);
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
 	cancel_work_sync(&pl->resolve);
+
+	/* Drop link between PCS and phylink */
+	/* Remove every PCS from phylink PCS list */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+		pcs->phylink = NULL;
+		list_del(&pcs->list);
+	}
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
@@ -2413,8 +2560,15 @@ void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
 	struct phylink *pl = pcs->phylink;
 
-	if (pl)
-		phylink_link_changed(pl, up, "pcs");
+	/*
+	 * Ignore PCS link state change if the PCS is not
+	 * attached to a phylink instance or the phylink
+	 * instance is not currently using this PCS.
+	 */
+	if (!pl || READ_ONCE(pl->pcs) != pcs)
+		return;
+
+	phylink_link_changed(pl, up, "pcs");
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 2bc0db3d52ac..ca9dfc142388 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -12,6 +12,7 @@ struct ethtool_cmd;
 struct fwnode_handle;
 struct net_device;
 struct phylink;
+struct phylink_pcs;
 
 enum {
 	MLO_PAUSE_NONE,
@@ -151,6 +152,8 @@ enum phylink_op_type {
  *		     if MAC link is at %MLO_AN_FIXED mode.
  * @supported_interfaces: bitmap describing which PHY_INTERFACE_MODE_xxx
  *                        are supported by the MAC/PCS.
+ * @pcs_interfaces: bitmap describing for which PHY_INTERFACE_MODE_xxx a
+ *		    dedicated PCS is required.
  * @lpi_interfaces: bitmap describing which PHY interface modes can support
  *		    LPI signalling.
  * @mac_capabilities: MAC pause/speed/duplex capabilities.
@@ -160,6 +163,10 @@ enum phylink_op_type {
  * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
  * @wol_phy_speed_ctrl: Use phy speed control on suspend/resume
  * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
+ * @num_possible_pcs: num of possible phylink_pcs PCS
+ * @fill_available_pcs: callback to fill the available PCS in the passed
+ *			array struct of phylink_pcs PCS available_pcs up to
+ *			num_possible_pcs.
  */
 struct phylink_config {
 	struct device *dev;
@@ -172,6 +179,7 @@ struct phylink_config {
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+	DECLARE_PHY_INTERFACE_MASK(pcs_interfaces);
 	DECLARE_PHY_INTERFACE_MASK(lpi_interfaces);
 	unsigned long mac_capabilities;
 	unsigned long lpi_capabilities;
@@ -182,6 +190,11 @@ struct phylink_config {
 	bool wol_phy_legacy;
 	bool wol_phy_speed_ctrl;
 	u32 wol_mac_support;
+
+	unsigned int num_possible_pcs;
+	int (*fill_available_pcs)(struct phylink_config *config,
+				  struct phylink_pcs **available_pcs,
+				  unsigned int num_possible_pcs);
 };
 
 void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
@@ -497,6 +510,9 @@ struct phylink_pcs {
 	struct phylink *phylink;
 	bool poll;
 	bool rxc_always_on;
+
+	/* private: */
+	struct list_head list;
 };
 
 /**
-- 
2.53.0


