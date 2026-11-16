Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5B606A885
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EtioMvC7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hinhyG5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hn7S5+QcCKJrPBJMt03O9LQ9GGpdeorHkycI7ucrGRk=; b=EtioMvC7yV40rG
	svhmIIXZpYq/fVkRXnqJibEI/ykrpoDxzJk1D4XOHGPNz5zit3YjmT0/jEJildELgA6zWj83skDrj
	Tfhq0JuqgJBdkHIITen1zIgAoXvGXAXdsUGOY5DoSZyJs+rjtoNzXDZL8PVmXe3XY4J5pPRvyUbth
	0bVTkOij/XStsicjO2/cmn+v9L8x/Wbq3rh5w8gkwMY6iNI3y/5mOV7jjxCK1lnwmOEyktlKURPOj
	F7AMikYfc6TL0iy1qMMEQycHKMqMOyeSxb9BLnA/WVapBfIOucmjIWsvdRkh51pB8Tj0h+AXBUY3U
	YQqFEzHYE3KXsCKv7xNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfE-00000003FJV-0LHb;
	Mon, 16 Nov 2026 16:34:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf3-00000003F7s-2ohM
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso38395715e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 08:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846868; x=1795451668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hn7S5+QcCKJrPBJMt03O9LQ9GGpdeorHkycI7ucrGRk=;
        b=hinhyG5SDM30YWOCsF4BgZLDxs68xmfrvJ42SsO7/n+q3bVBcZWZMfoZi8IdH4vJrK
         DlgWrEOMl3h0JpoZmdPRTDdVNxmSije9fRiV36Jvb/Uvr0kNsSoAj0jTzEoy/ScWdVhV
         BlQx1+wJoUd+yJg1EOyBRrsPFIwKvwV0KM9JF5iC7fYQJFySs52g+5fmT1EH0GlnmCNJ
         DkLWkIF6pv9eTOsDe0ECBm7r9ErtpM4xf6lFtVIIqeU0eG0zdjRTrFIhnSKqWzZGCZ+P
         RZXaHf0RPGQgIbT9ejVrtp04WEdu+7Nzmpev/gfG0a+QVprC5XbB5F/X+CxhsCnXUqwP
         SyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846868; x=1795451668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hn7S5+QcCKJrPBJMt03O9LQ9GGpdeorHkycI7ucrGRk=;
        b=H7/8UkcEKBSV4JE638dHYucBpfWqKVL5TC1d5p0WbpMgAVPRTMXHV5PtpyYonP+bPA
         sApwwsxMs2bgY15rY9FomttPu20Nz1BXPDu7W7cEPd218hHxWFe+QJFeim9bG3CIg13F
         M110wGlOA4SgAfz1Xr0Lmr0AD/qdx7FrqYTPEuqj3sU4WJ58/1+CjzpkVcD8r/hKELJO
         6Pnd30F9PdA0IJNz0Yemyfp+8pzplQbvJy7dJn4PxVB3yNo5LyHx4qcI93iGqS58gu9I
         YLK2v78PKwQ2pGi4ZKdVFcgCumbtVRCveAXqIAhskabz4lVxlYhXnD75+IqT+Iqov0ML
         RkbA==
X-Forwarded-Encrypted: i=1; AL+hErGL0mER5f1F4Rd22zgKJMwI13V8pmwbP327HscctnuJhfw0cQ1N+AGFc6ToYGPhrd2KQSNPL2YAIg41+J6NMw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8fSgGABf98UdwhYxuwFTGdTEeDz280xRKwoXn9ywil1kW8EGpD
	LT5b2IlhAZ/KCXJkw16/rCve1DreXpHAulNKxcik6kLyAkQnFHphyzD6
X-Gm-Gg: AYBFou2NDkKREKVKkI8gnS4Y9+hj6sI4ndGdkIR/qxhwh6/S8KoIQJ6lYpJWOfmnwdI
	uCcNQj5idYLrzogu7nKScAlClGrqaCXgBL1iysWNkp/8Hma66jOy+hV3c2M+oCWvdtkCUU/mv52
	cY+2hOfAvtEJxyEojyhrpIAemiQc6/d6AU3akxRQJCbf11noU/hToem6+vhm+YQ6DRNQDI13M9J
	cBp/GjxncaJsqJAfMDfm6blJM+6IR6Kv7Bh5lADjXnfIYOCSyQPd119JXA8osPjq/7IY2Ta7vyl
	2g/yInlGUUbB2G2a+fN7M8thiguS3q6hlUN2OyEpp6sK4bHX6bec7NJvsd9zdwMHAO9dCajk3wZ
	2BISKMkPiLsemF7La3TBBng6cGurzOMPAbSXUVdzvdLB1PZvyRFmjWyglh3JapiX99zRAj2rwZ2
	SfnrsHfx6PCJrURU9nSKusJDHiXmh73XffPMebFUePdRp+ZJ9J50gbwH+tAaW+zdlueP7CqK64z
	XV8cFtmTcqn5M7KYfGZUjZYVoXZffII1ggnfeaPlDjAqSPXQUzhz8zfJOqOSRSjgOJ9yMQM5phw
	Z7pLhuMaXVhiJ5vrweusHn3ZMh5Rdj0zXj4Bdu0DHKkYkEALqYzJui+InRN4Rz1+VMRhq9onWdW
	lLFYCKb79UO/FMvfmS4FE5Oyw+EP9mKHZHA==
X-Received: by 2002:a05:600c:3111:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb61184db8mr199081205e9.30.1794846867775;
        Mon, 16 Nov 2026 08:34:27 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:27 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 03/15] net: phylink: introduce internal phylink PCS handling
Date: Mon, 16 Nov 2026 17:33:46 +0100
Message-ID: <20261116163412.551438-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083430_329801_D7CFDE57 
X-CRM114-Status: GOOD (  36.85  )
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
 drivers/net/phy/phylink.c | 201 ++++++++++++++++++++++++++++++++++----
 include/linux/phylink.h   |  16 +++
 2 files changed, 196 insertions(+), 21 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index f482dc608810..e8ba906cfba6 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -63,6 +63,9 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* List of available PCS */
+	struct list_head pcs_list;
+
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
 	 */
@@ -522,6 +525,22 @@ static void phylink_validate_mask_caps(unsigned long *supported,
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
@@ -535,6 +554,21 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
 		if (IS_ERR(pcs))
 			return PTR_ERR(pcs);
+	/*
+	 * Find a PCS in available PCS list for the requested interface.
+	 *
+	 * Skip searching if the MAC doesn't require a dedicated PCS for
+	 * the requested interface.
+	 */
+	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
+		struct phylink_pcs *tmp;
+
+		list_for_each_entry(tmp, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(tmp, state->interface)) {
+				pcs = tmp;
+				break;
+			}
+		}
 	}
 
 	if (pcs) {
@@ -549,13 +583,10 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
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
@@ -968,12 +999,22 @@ static void phylink_pcs_enable_eee(struct phylink_pcs *pcs)
 static unsigned int phylink_inband_caps(struct phylink *pl,
 					 phy_interface_t interface)
 {
-	struct phylink_pcs *pcs;
+	struct phylink_pcs *pcs = NULL;
 
-	if (!pl->mac_ops->mac_select_pcs)
-		return 0;
+	if (pl->mac_ops->mac_select_pcs) {
+		pcs = pl->mac_ops->mac_select_pcs(pl->config,
+						  interface);
+	} else if (test_bit(interface, pl->config->pcs_interfaces)) {
+		struct phylink_pcs *tmp;
+
+		list_for_each_entry(tmp, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(tmp, interface)) {
+				pcs = tmp;
+				break;
+			}
+		}
+	}
 
-	pcs = pl->mac_ops->mac_select_pcs(pl->config, interface);
 	if (IS_ERR_OR_NULL(pcs))
 		return 0;
 
@@ -1270,10 +1311,36 @@ static void phylink_major_config(struct phylink *pl, bool restart,
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
+		struct phylink_pcs *tmp;
+
+		list_for_each_entry(tmp, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(tmp,
+							    state->interface)) {
+				pcs = tmp;
+				break;
+			}
+		}
+
+		if (!pcs) {
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
@@ -1300,13 +1367,15 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 	if (pcs_changed) {
 		phylink_pcs_disable(pl->pcs);
 
-		if (pl->pcs)
-			rcu_assign_pointer(pl->pcs->phylink, NULL);
+		if (pl->mac_ops->mac_select_pcs) {
+			if (pl->pcs)
+				rcu_assign_pointer(pl->pcs->phylink, NULL);
 
-		if (pcs)
-			rcu_assign_pointer(pcs->phylink, pl);
+			if (pcs)
+				rcu_assign_pointer(pcs->phylink, pl);
+		}
 
-		pl->pcs = pcs;
+		WRITE_ONCE(pl->pcs, pcs);
 	}
 
 	if (pl->pcs)
@@ -1901,6 +1970,49 @@ int phylink_set_fixed_link(struct phylink *pl,
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
+		if (WARN(rcu_access_pointer(pcs->phylink),
+			 "%s: PCS already attached to a phylink instance\n",
+			 __func__))
+			continue;
+
+		list_add_tail(&pcs->list, &pl->pcs_list);
+	}
+
+out:
+	kfree(pcss);
+
+	return ret;
+}
+
 /**
  * phylink_update_pause_state() - Update the phylink pause frame configuration
  * @pl: a pointer to a &struct phylink instance
@@ -2042,9 +2154,20 @@ struct phylink *phylink_create(struct phylink_config *config,
 			       phy_interface_t iface,
 			       const struct phylink_mac_ops *mac_ops)
 {
+	struct phylink_pcs *tmp, *pcs;
 	struct phylink *pl;
 	int ret;
 
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
 	/* Validate the supplied configuration */
 	if (phy_interface_empty(config->supported_interfaces)) {
 		dev_err(config->dev,
@@ -2059,6 +2182,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->phydev_mutex);
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
+	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
@@ -2096,16 +2220,31 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	/* Fill the PCS list with available PCS from phylink config */
+	ret = phylink_fill_available_pcs(pl, config);
+	if (ret < 0)
+		goto free_pl;
+
+	/* Link available PCS to phylink */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		rcu_assign_pointer(pcs->phylink, pl);
+
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
+	/* Update supported interfaces */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
-		goto free_pl;
+		goto unlink_pcs_list;
 
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
 		ret = phylink_parse_fixedlink(pl, fwnode);
@@ -2124,6 +2263,14 @@ struct phylink *phylink_create(struct phylink_config *config,
 release_link_gpio:
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
+unlink_pcs_list:
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		rcu_assign_pointer(pcs->phylink, NULL);
+
+	synchronize_rcu();
+
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
+		list_del(&pcs->list);
 free_pl:
 	kfree(pl);
 	return ERR_PTR(ret);
@@ -2141,17 +2288,29 @@ EXPORT_SYMBOL_GPL(phylink_create);
  */
 void phylink_destroy(struct phylink *pl)
 {
+	struct phylink_pcs *pcs, *tmp;
+
 	sfp_bus_del_upstream(pl->sfp_bus);
 	phylink_destroy_sfp_cage_port(pl);
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
-	if (pl->pcs) {
+	/* Remove phylink instance from every PCS */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		rcu_assign_pointer(pcs->phylink, NULL);
+
+	if (pl->pcs)
 		rcu_assign_pointer(pl->pcs->phylink, NULL);
+
+	if (pl->pcs || !list_empty(&pl->pcs_list))
 		synchronize_rcu();
-	}
 
 	cancel_work_sync(&pl->resolve);
+
+	/* Remove every PCS from phylink PCS list */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
+		list_del(&pcs->list);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
@@ -2620,7 +2779,7 @@ void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 	rcu_read_lock();
 
 	pl = rcu_dereference(pcs->phylink);
-	if (pl)
+	if (pl && READ_ONCE(pl->pcs) == pcs)
 		phylink_link_changed(pl, up, "pcs");
 
 	rcu_read_unlock();
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 4a0dc6fa8010..418e8bec311d 100644
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
 	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
+
+	/* private: */
+	struct list_head list;
 };
 
 /**
-- 
2.55.0


