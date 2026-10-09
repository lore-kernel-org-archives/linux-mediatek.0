Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E477CA601E
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgVxN7jjDBBi7QLO/S2lw+BavtVzIiBwIreDYz7qKS8=; b=qkzNym9L9oQFUFtp6eoKOFJZTB
	ZABqaR59v1tL9ccQYnnqIE5rIQ+M/vRtnJLvgBvnMiddlA6WCg0BIoWE3FtYK6Xy6uqAKmxbCpwHH
	U+2DIR6JqPTP5bckfnjuL90gz93UlYDKZ68IBNl791aglBDMlXgoUR3Ubl8Rt1iiZnJBSQW6Mi2JZ
	wMxwLrxRwtVQNc/Ae/TGXhXcB1CrdCX/iSBF3Aw6WzlaDaSqHakqAvGAlp0rvvnSbEXk2gytKzzYB
	X8/eTSY1qm4ry7tFgwiRrm7wbVYhAqDLxeFTRsLRCkBtF/pnw9T/Zv0Boz7dtmllsbp3OHnQE7FcW
	maCZXGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLG-00000006xdQ-11op;
	Fri, 09 Oct 2026 18:29:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLC-00000006xXK-46kj
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48bbb06e746so52450f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570549; x=1792175349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zgVxN7jjDBBi7QLO/S2lw+BavtVzIiBwIreDYz7qKS8=;
        b=QkZX+qRJm7+2BJY45ZMEEsE7VJG+gcs+mlyFK+RtMWAAL6gbd7ITMrIVXsEfkjTnn6
         qA91BHLScWyN52dt5/A0+hDYFrvGlRRG/OktSWLfYiB6lZn9wqi9D6kfGL5Rx89obWat
         GpbbH9kZngBcE8VDd3Z3LhTXNFCVzlPm0YdYC/HvwATBetRVNlXSnqUI+E911QDRJAIe
         e2QeA5HfynKuXVrZ8BspcqRS6A2hesddoxtEKUo48lbfcYKG+IWI6zWmhzfdFMyZ8l/9
         RTziDCDsvydI6kjwgkED/QykIew+ec56C1u+AncnkTdIZwN4qN6l1qU6XdReuhM9m6Ty
         Afmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570549; x=1792175349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zgVxN7jjDBBi7QLO/S2lw+BavtVzIiBwIreDYz7qKS8=;
        b=wPbp42iFZg27eNYh4rKLcxTPeptkpQ00pbIjQSatAji0J/VqFGLS1XXPDevowf6J9v
         fE6LNeV9DOMAmcxmV23aI7CuEWN8+gWJUdQrFahFiZKz/GJwRtFh8FKp3YFVYJsf1M+0
         9ogwp6C8MXougoWJF5wWuTYUKf2bIkyZ6fvLgzd+cTPceeAyXLH07Wz5ySIBPUvKDGB3
         hZ2nDyIHW8gqTF0AUP/BcurnMgOArrAdWGuMYoFiwWhDhg8ZvjRIy1csOUNwfaxnwUuu
         KLHGnCaMZFvrtTip2+kmKYWdz+1SLr1K5GHf9NjZL3cCztjWIGfNlnENElLIbyDaSQhw
         unLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5SPhuiBb7ipOuQWGtmvSaX/XDae3OmbgmhJafSTFaVvWLBpQERAgOxJTdAZhhxQW/kPwapu7P/0XLsU3tXA==@lists.infradead.org
X-Gm-Message-State: AFq9FYK594DeNoYgUMTGRVMf21kGGBJmPRqYd7Qn/2hyi0pDfCthzY+F
	amr97obO7ZYU/a6WNKK8ttjOBGlUwdXrbUwqGqqlj0VP/qvNMBIEwvO1yVwsCg==
X-Gm-Gg: AYBFou2ZLFSqk1eFsWZkgh64D7Kjpjgx0+D2aZST0eN+/bashDLKVvjtN+V0Z3RHqVu
	bUtq1Zt1q2Li/HsFodyJm1kcgUvE0hajDO0ME3qq7rXIg6EoE0MswJ/EZ74+94bjuwUyBsngeF6
	gKdkbXEl41HvZKLusk7bjbirKtRGlk2x9EYwgAIgdieN1r7HNLoNUM5e01fky0LmEFxmPYq3D/T
	JMbgcVbMH/YkpPXwQ4YqH3kB7cEBq+fF2g8fIpjQ0N4aJy5HMIplO4mk9JbpUWvJsIbEPxBYQxD
	lrXGiTZ/PsxKO+BR99X2K5Oi6lCQIP88cK0zHxhYAW30/YXdHijaQKcPvd+ADakXf25Jjorkjhl
	rpVXugPQNyUDZUtmV2P0PiRTVvXconc7W3gw2ZldYDh7YkaQnpAm7FnW6OBqObA3cKdE2er+IdO
	ms2FU4a/Hktn2NXr0Fh1pBg705MTNOUNLyJCH+uIzOuYpNRujFl9yeGdjdUsxFibvY/M9qSLems
	/JEoQl/OPZdlReMn4BAAZOov/5KjtheoCg2vrF05XUVTqswgF9u4D4S1P3wgRZOwboeVf0m4hZS
	yCaCmdq7E952HdYLyDhRKoWqgfiq
X-Received: by 2002:a05:6000:400d:b0:487:b2b:457b with SMTP id ffacd0b85a97d-48dba9bda77mr5891329f8f.15.1791570549146;
        Fri, 09 Oct 2026 11:29:09 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 06/12] net: phylink: support late PCS provider attach
Date: Fri,  9 Oct 2026 20:28:02 +0200
Message-ID: <20261009182836.50631-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112911_083322_22B60853 
X-CRM114-Status: GOOD (  26.99  )
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

Add support for late PCS provider attachment to a phylink instance.
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Such PCS is then linked to the phylink instance and the supported
interfaces of the phylink instance get refreshed.

If we are in a major_config_failed scenario an interface reconfiguration
is triggered in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 22 ++++++++++++
 drivers/net/phy/phylink.c | 72 +++++++++++++++++++++++++++++++--------
 include/linux/pcs/pcs.h   | 31 +++++++++++++++++
 3 files changed, 111 insertions(+), 14 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 25b3248e8b93..fef560eddf2a 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     pp);
+
 	pr_debug("Added pcs provider from %pfwf\n", fwnode);
 
 	return pp;
@@ -201,6 +205,24 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+	fwnode_handle_put(pcsspec.fwnode);
+	return pcs;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get_from_provider);
+
 bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 				 const struct fwnode_handle *fwnode,
 				 struct phylink_pcs *pl_pcs)
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 019ce3d89da0..59283564f72e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1928,6 +1928,30 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static bool phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	struct phylink_pcs *tmp;
+
+	/*
+	 * Make sure state mutex is locked to protect concurrent
+	 * access to phylink instance PCS list from
+	 * initial fill_available_pcs and late PCS attach
+	 */
+	lockdep_assert_held(&pl->state_mutex);
+
+	/* Make sure PCS is not already in the list */
+	list_for_each_entry(tmp, &pl->pcs_list, list)
+		if (tmp == pcs)
+			return false;
+
+	list_add_tail(&pcs->list, &pl->pcs_list);
+
+	/* Link PCS to phylink */
+	pcs->phylink = pl;
+
+	return true;
+}
+
 static int phylink_fill_available_pcs(struct phylink *pl,
 				      struct phylink_config *config)
 {
@@ -1960,7 +1984,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 out:
@@ -2006,27 +2030,51 @@ static int pcs_provider_notify(struct notifier_block *self,
 	struct fwnode_pcs_provider *pp = data;
 	struct phylink_pcs *pcs, *tmp;
 	bool resolve = false;
+	int count, i;
 
 	rtnl_lock();
 
 	mutex_lock(&pl->state_mutex);
 
-	/*
-	 * Loop all the PCS for phylink instance and check if
-	 * this notification is relevant for some of them.
-	 */
-	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
-		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
-			continue;
+	switch (val) {
+	case FWNODE_PCS_PROVIDER_ADD:
+		count = fwnode_phylink_pcs_count(pl->fwnode);
+		for (i = 0; i < count; i++) {
+			pcs = fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
+			if (IS_ERR(pcs))
+				continue;
+
+			/* Trigger a resolve only if a PCS is actually added */
+			if (phylink_add_pcs(pl, pcs))
+				resolve = true;
+		}
+
+		/* Force an interface reconfig if major config fail */
+		if (resolve && pl->major_config_failed)
+			pl->force_major_config = true;
+
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		/*
+		 * Loop all the PCS for phylink instance and check if
+		 * this notification is relevant for some of them.
+		 */
+		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+				continue;
 
-		phylink_del_pcs(pl, pcs);
-		resolve = true;
+			phylink_del_pcs(pl, pcs);
+			resolve = true;
+		}
+		break;
 	}
 
 	/* Exit early if nothing has changed */
 	if (!resolve) {
 		mutex_unlock(&pl->state_mutex);
+
 		rtnl_unlock();
+
 		return NOTIFY_DONE;
 	}
 
@@ -2274,10 +2322,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		pcs->phylink = pl;
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index 83e0a2ad4b09..00a636c82c65 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -5,6 +5,7 @@
 #include <linux/phylink.h>
 
 enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
 	FWNODE_PCS_PROVIDER_DEL,
 };
 
@@ -50,6 +51,28 @@ int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_get_from_provider() - Retrieve a PCS from a specific provider
+ * @provider: PCS provider to use
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index specifically provided by
+ * passed PCS provider.
+ *
+ * Unlike fwnode_pcs_get(), this function does not search the global list of
+ * PCS providers. The caller must provide the provider responsible for the
+ * referenced PCS.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative error pointer. Can
+ * return -ENODEV if the PCS is not present in global providers list (either
+ * due to driver still needs to be probed or it failed to probe/removed) or
+ * can return -EINVAL if the PCS provider doesn't expose any PCS for the fwnode.
+ */
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index);
+
 /**
  * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
  * @provider: PCS provider to check
@@ -120,6 +143,14 @@ static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwn
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+			     const struct fwnode_handle *fwnode,
+			     int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 					       const struct fwnode_handle *fwnode,
 					       struct phylink_pcs *pl_pcs)
-- 
2.55.0


