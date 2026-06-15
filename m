Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19589CD98DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tjTiOW8L5XMvZNg9p3Y/5l4xg/YCEGSjiRSop5LAtE=; b=rJ7Q6vR7Bvt2eLMlrePdqONol4
	CP65ec90m9tj8RPXaJFrxrPtMqMCMoJ+50AIbrquYrIncPYZDc8ID3LXBgNRF995UUTZnxR2zdlse
	5ugttnThgfajaw9iun38pvN66qHXhgDt9IW77ciYwFqoWcAG+mbOvqZl/UPZfxhHmWUpuvQaccnmK
	Jvq6QFU4KGC5+aTtXM7ZPPg9M/l3gZGAFwXP9Z6jbEdC7EUt0e75NfEWbAuWk2VHH3Y+DtChdDddY
	UV13sG9DkYUTykdiMFpNf+XzG4m96PkbFMqwECHUfwbQzLVijxO0gfkSaex9Kr0ZDiZF0dYVUVCxQ
	c7o+eCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Sz-0000000EBgw-0GRx;
	Mon, 15 Jun 2026 12:31:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Sj-0000000EBPF-3xMp
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so21352865e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526644; x=1782131444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tjTiOW8L5XMvZNg9p3Y/5l4xg/YCEGSjiRSop5LAtE=;
        b=RcHTV671SGKlOUC/z8lC1KYUO1x2Cxn2OUJrf3KLshy4jYfAXuITSZ1QfRHv9V1195
         C2H0lkRhuJJAXr4k0r5gmRsTf1WYym4CNM/UOtEX9QR9gkyVjXfPxeWPbzw2P6sNgBYh
         55u7FzQvoX8pcnSsz5t0SYji3KqOekqzJ8SynhOoMpC5/q2bYp+3ERNGFwoyV0Zh5YyX
         bjpdSMB8alFJxd46ze3fZfOzNOU1dVW85FKnejWKAovwdYMafsBclM/kuBE612XdCMhF
         wRc0WyLrbtGIA29HZTT4zsoYVV5SG0zx+HfP5XKcaMuh2jQw1qxm7IDIRF9pwYxaBwwM
         aoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526644; x=1782131444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tjTiOW8L5XMvZNg9p3Y/5l4xg/YCEGSjiRSop5LAtE=;
        b=ZaS/aG3Oyl0xJcTUSlxciJTRSMxBSzdjSRzCZN5uSgcqy0BX0kc88Fvj+HBYyTWaic
         OkWn8/ZKR1WeEmTKCj1K1oenpxgC3ThTktq8WZljFNLns3NnnkzUi0J9RHH4dn1HvoZx
         dZSARhOFXlA/zXeIhEy9mnqdGvHJfbbVVCvMm+bmyu10On+fatm/1iyo/cYUzcv46ixf
         axkNtccY6kdLUpIQKYwszIxWgVvGC6DFSqw+5vgJa71sOJKPcRvLsaNuEiv1H6VX0eKa
         3FCPyfLW3aw1kbegsMwsX59YwOKi7Mk58hJksamDoPJEBO8b/1QsMiQyRJkcNapxx7XW
         ujLw==
X-Forwarded-Encrypted: i=1; AFNElJ8c870lyQMQ73XqbfXHgS3A6THym4YOgpv9bwC/j3zCYAsU73aLDI1RB9y44AciAN39K3SpcysMSEXv4x8nXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOySWNkKe7w9mdAFygVwj6utAlZGej5g7rs6AMDJLECdSY6hc2
	Ap78/r+bqNSpbQvc2o9fwfFhV5mjGRH3UKusICf808nU6JUiRhoDVptc
X-Gm-Gg: Acq92OFkjlmsQNlY3pIEyDKbkGJRNdvhmCFRD8foLuDjtT+wcN17waJ2+58WKGciw3S
	IzVQkDmqtctR7AIsJu92y+E/U2ZE18uzpJQtkCz8F6yiSP5OGLesEhr494hmmMpbVn83WQmsSyU
	E9ig7vylwu5FOPSPzPQenzgCVOOByn8tUNo2/1L67jDCLbiicwALWhrpXvKS+mT6WZZ+23qekvQ
	aY4uyJ1PbVvYEgj/FMB+QygelxVlG/binRa6UW+GzuMh7oiCSjb/HUg8nuV0Rr6D7HgbmTvnDx9
	TSy6CIyakIho+QHaHDkoidIcIfM7IMtyEXkxxJ1CKFOb/GN15T9/DrnL2ICENGXbdJTiekiLfqG
	QDvwUihgNHOtfBtTi/+GzBLTjkm1YBCDZjzhcuQ4ygON6qE9ClI+fz0qvqItRumiq/kVRmwnvK8
	VZmxM9WK4CaVNOA8V55n91UGkxXCwwKWshCiePTIDlL0JRC5E51N6bG/0=
X-Received: by 2002:a05:600c:628f:b0:492:1e36:85dc with SMTP id 5b1f17b1804b1-4922017b005mr124400735e9.36.1781526642421;
        Mon, 15 Jun 2026 05:30:42 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:41 -0700 (PDT)
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
Subject: [PATCH net-next v7 05/12] net: phylink: support late PCS provider attach
Date: Mon, 15 Jun 2026 14:29:41 +0200
Message-ID: <20260615122950.22281-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053046_025120_072E6AA6 
X-CRM114-Status: GOOD (  27.29  )
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
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

phylink will then react to this event and will call the new function
fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
provided by the event is present in the pcs-handle property of the
phylink instance.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Then we link the PCS to the phylink instance and we refresh the supported
interfaces of the phylink instance.

Finally we check if we are in a major_config_failed scenario and trigger
an interface reconfiguration in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 49 ++++++++++++++++++++++++++++++++
 drivers/net/phy/phylink.c | 57 +++++++++++++++++++++++++++++++++++++
 include/linux/pcs/pcs.h   | 60 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 67f9716f48fd..713b2ec22c97 100644
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
 
 struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
 					  void *data)
@@ -55,6 +68,10 @@ int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	fwnode_dev_initialized(fwnode, true);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     fwnode);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
@@ -150,6 +167,38 @@ struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode, unsigned int in
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode)
+{
+	struct fwnode_reference_args pcsspec;
+	int index = 0;
+	int ret;
+
+	/* Loop until we find a matching PCS node or
+	 * fwnode_parse_pcsspec() returns error
+	 * if we don't have any other PCS reference to check.
+	 */
+	while (true) {
+		ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+		if (ret)
+			return ERR_PTR(ret);
+
+		/* Exit loop if we found the matching PCS node */
+		if (pcsspec.fwnode == pcs_fwnode) {
+			fwnode_handle_put(pcsspec.fwnode);
+			break;
+		}
+
+		/* Check the next PCS reference */
+		fwnode_handle_put(pcsspec.fwnode);
+		index++;
+	}
+
+	return fwnode_pcs_get(fwnode, index);
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_get_from_fwnode);
+
 unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	struct fwnode_reference_args out_args;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index ca4dad4b140a..0734c98498a9 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -12,6 +12,7 @@
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/pcs/pcs.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
 #include <linux/phylink.h>
@@ -62,6 +63,7 @@ struct phylink {
 
 	/* List of available PCS */
 	struct list_head pcs_list;
+	struct notifier_block fwnode_pcs_nb;
 
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
@@ -1997,6 +1999,51 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	return ret;
 }
 
+static int pcs_provider_notify(struct notifier_block *self,
+			       unsigned long val, void *data)
+{
+	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
+	struct fwnode_handle *pcs_fwnode = data;
+	struct phylink_pcs *pcs;
+
+	/* Check if the just added PCS provider is
+	 * in the phylink instance pcs-handle property.
+	 */
+	pcs = fwnode_phylink_pcs_get_from_fwnode(dev_fwnode(pl->config->dev),
+						 pcs_fwnode);
+	if (IS_ERR(pcs))
+		return NOTIFY_DONE;
+
+	/* Add the PCS */
+	rtnl_lock();
+
+	mutex_lock(&pl->state_mutex);
+
+	/* Link PCS with phylink */
+	list_add(&pcs->list, &pl->pcs_list);
+	pcs->phylink = pl;
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	/* Force an interface reconfig if major config fail */
+	if (pl->major_config_failed)
+		pl->force_major_config = true;
+
+	mutex_unlock(&pl->state_mutex);
+
+	rtnl_unlock();
+
+	phylink_run_resolve(pl);
+
+	return NOTIFY_OK;
+}
+
 /**
  * phylink_create() - create a phylink instance
  * @config: a pointer to the target &struct phylink_config
@@ -2068,6 +2115,12 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
+	/* Register notifier for late PCS attach */
+	if (!phy_interface_empty(config->pcs_interfaces)) {
+		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
+		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	}
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2151,6 +2204,10 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	/* Unregister notifier for late PCS attach */
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+
 	/* Drop link between PCS and phylink */
 	list_for_each_entry(pcs, &pl->pcs_list, list)
 		pcs->phylink = NULL;
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index df1e6f32cfad..9de3f273428e 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,36 @@
 
 #include <linux/phylink.h>
 
+enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
+};
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
@@ -20,6 +49,25 @@
 struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_phylink_pcs_get_from_fwnode - Retrieves the PCS provided
+ *					by the firmware node from a
+ *					firmware node
+ * @fwnode: firmware node
+ * @pcs_fwnode: PCS firmware node
+ *
+ * Parse 'pcs-handle' in 'fwnode' and get the PCS that match
+ * 'pcs_fwnode' firmware node.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative
+ * error pointer. Can return -EPROBE_DEFER if the PCS is not
+ * present in global providers list (either due to driver
+ * still needs to be probed or it failed to probe/removed)
+ */
+struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode);
+
 /**
  * fwnode_phylink_pcs_count - count PCS entries described in firmware node
  * @fwnode: firmware node
@@ -53,12 +101,24 @@ int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 			     struct phylink_pcs **available_pcs,
 			     unsigned int num_pcs);
 #else
+static inline int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
 						 int index)
 {
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
+				   struct fwnode_handle *pcs_fwnode)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	return 0;
-- 
2.53.0


