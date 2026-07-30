Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F3BC55160
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygLCcEH9Kw2h3BH8ouS5V8px5nNHCFAB+/RAPvnQGdM=; b=hk3rbgfqahcgnumebIyQKdHxH1
	9wN25LewOx/TLQxm8hBHfmVH9f77a9hzjeYKsMyS6E7VDE3j2KhFQr0oD2yPFCFWNOnLJX/2yDspi
	TZu145GqritnxkB7jZ4IZis8r6tyen4HWs+d+ET4aNGFdZqhmWix3uFqPe3Gx8SicVIGA2h3WUbSG
	AJf7siQrRFCwJVxsRj3uGsd2HLufM7QCcR2iGKVc0LS3312hgjfY8bfN4NSphGErpbnDefmYF7ub1
	0uqWD+LGV8bJwsO3y5vDtRrZJKCBdswEubeHK+tNQmTnW5MOb0jjAqZbCH1UNaH7TrJ35A/JXmDac
	1Nifd5iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNxB-0000000ABqU-2ybq;
	Thu, 30 Jul 2026 10:25:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNwn-0000000ABVQ-2PSI
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jul 2026 10:25:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso17366475e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2026 03:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407104; x=1786011904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygLCcEH9Kw2h3BH8ouS5V8px5nNHCFAB+/RAPvnQGdM=;
        b=a8WKRKwtpoGSAZwwAG7Ja5rmCmYsbmhLGKpro/ei5Wzrb319Jcy4ZxN/8Mwl18e9fS
         8GrEKLWs3Oex0pBAPuCgS+LH1316Dp8GSzEoponNVKjJptLKsQWRk7uBfyPtBPBUbqP2
         gGiDeS10TSvrWci12hY/cqB7hjWxBZK01xdsTlVANbQU9AhXdeO9frc4Vi45O4hnEhSE
         vps/mN0+vi46beVze4tpA/S7YtM3dHL5luRnxgjqzens92aEYdo2rMf3gwup1jRZElK+
         t2y0sfLOD82ZHYXdjkzUWR+4y8YvVkiFaua8dn4MzaZazAU11giWe4sdgCHa5/8B6M1T
         fDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407104; x=1786011904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygLCcEH9Kw2h3BH8ouS5V8px5nNHCFAB+/RAPvnQGdM=;
        b=Q7GBooLd7G+pe9+aiMlywkhtabCyEIG8L1NeGWb2udSyfkr7cqRMFKD5vOaQV+jySj
         pnHkFpMhIhJAUvrloNeXBLRwPwIdoLtbcWtzRaQh5cNevyB5a10iQYRLJpArdUJ1JL4J
         gmVV19KgYVM2nqBnmTlgHJP2f2YsdA+4cjLNdWCLjHGO42CmALQz9WeGo7Y6tOCeKRtU
         2uP9tXiTU0b4dyRp67i3fqgycOJTd8qZbLptYawA0ies83xtQWXoati6FLh0rPbqeAYi
         xBVa/4dVnhwdRqirzBmbeHV0Ae5EGNdksB/7Om2GtQkZwXfKPZ7vrBQKiaL4RUtStdkD
         Ea/A==
X-Forwarded-Encrypted: i=1; AHgh+RoaDHo6j0UhpzfUiG6tuCkkimcgbfBQdhP9MLj71Z8Smy1XC8n7QQj+R9vD8DM8Vt+1B1gMWK7xdLkmhyGR/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRmMnvkKNDGRlTGQ/dGD5dmTJYQ4Vu2s6JPhsFKGTE61hmVdY/
	a90Prw5EUKlQrDIwnyGU0Ubz4H/hpafklYwQQHFmq2U0pcyizCDOVLbM
X-Gm-Gg: AR+sD13kk28OOH9Fmum/S8s0Z1UWJAkdOQlQbWXwpATEGjEZSQWob8ghCfBBXegVyIu
	J1T8f3SYSJcy7jF5odf7aioPpjDH1+OWDKyBQzw76+bQEumMDIDCHXF9ymGFp/Y4z2I6tMAUyyE
	pt3hWfmJP+mjk36H4bvvE5Ab1n+0tBHMOS0SMI5l+utr4F2nad+0xCcR4Ub7BneaK1tmTbOL5fE
	dXRt9pgjvY8HUfraXELtD5/uMeedxirv33DjHY0RDKod4HJmWimdzJgnKqRbU8pO6udKSfO8xlW
	pYX0wzQ2MrO7NWwXH1tgxFTP2iYQgLApBpVeqHiI5oDNKieyvB8NK1+SEh5H9g5HRtJizgq6Spo
	L62XDHfwCCcEsXiwksUTLqHFOgxVbFvvEl60fX7dUuycaNLHLyxwQ2Fzk6+rMeIqO6q+gm+VCf0
	3gh6xlUVZ4XOkJUgq9ouzrhDu3ekvVv9w7SwnO/ubZCNvr/1OGIZsCe3RlmRG6uwyDTxxquZJ7j
	qgabzhni5/Ex86eGL17YzEV30taYPfVN26sw1TmGoRuVSIDA6FjcQ==
X-Received: by 2002:a05:600c:8105:b0:495:641a:bd3f with SMTP id 5b1f17b1804b1-49800e7afa1mr25944545e9.13.1785407103441;
        Thu, 30 Jul 2026 03:25:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:03 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Cc: Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH net-next v10 04/11] net: pcs: implement Firmware node support for PCS driver
Date: Thu, 30 Jul 2026 12:24:15 +0200
Message-ID: <20260730102444.1967900-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032505_690636_5ECB6B53 
X-CRM114-Status: GOOD (  35.93  )
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

Implement the foundation of Firmware node support for PCS driver.

To support this, implement a simple Provider API where a PCS driver can
expose multiple PCS with an xlate .get function.

PCS driver will have to call fwnode_pcs_add_provider() and pass the
firmware node pointer and a xlate function to return the correct PCS for
the passed #pcs-cells.

This will register the PCS in a global list of providers so that
consumer can access it.

The consumer will then use fwnode_pcs_get() to get the actual PCS by
passing the firmware node pointer and the index for #pcs-cells.

For a simple implementation where #pcs-cells is 0 and the PCS driver
expose a single PCS, the xlate function fwnode_pcs_simple_get() is
provided.

For an advanced implementation a custom xlate function is required.

On removal the PCS driver should first delete itself from the provider
list using fwnode_pcs_del_provider() and then call phylink_release_pcs()
on every PCS the driver provides.

Generic functions fwnode_phylink_pcs_count() and fwnode_phylink_pcs_parse()
are provided for MAC driver that will declare PCS in DT (or ACPI).

Function fwnode_phylink_pcs_count() will parse "pcs-handle" property and
will return the number of PCS entries described in the passed firmware
node.

Function fwnode_phylink_pcs_parse() will parse "pcs-handle" property and
fill the passed available_pcs array with the available PCS found up to
passed num_pcs value. It's worth to mention that this function will ignore
PCS that still needs to be probed (returning -ENODEV) and such PCS won't be
added to the available_pcs array.

Co-developed-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/Kconfig          |   6 +
 drivers/net/pcs/Makefile         |   1 +
 drivers/net/pcs/pcs.c            | 212 +++++++++++++++++++++++++++++++
 include/linux/pcs/pcs-provider.h |  41 ++++++
 include/linux/pcs/pcs.h          |  75 +++++++++++
 5 files changed, 335 insertions(+)
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
index e417fd66f660..2ce89d4bff6b 100644
--- a/drivers/net/pcs/Kconfig
+++ b/drivers/net/pcs/Kconfig
@@ -5,6 +5,12 @@
 
 menu "PCS device drivers"
 
+config FWNODE_PCS
+	bool "PCS Firmware Node"
+	depends on (ACPI || OF)
+	help
+		Firmware node PCS accessors
+
 config PCS_XPCS
 	tristate "Synopsys DesignWare Ethernet XPCS"
 	select PHYLINK
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b90..3005cdd89ab7 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
+obj-$(CONFIG_FWNODE_PCS)	+= pcs.o
 pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
 				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
 
diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
new file mode 100644
index 000000000000..fa8ab67076e2
--- /dev/null
+++ b/drivers/net/pcs/pcs.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/phylink.h>
+#include <linux/pcs/pcs.h>
+#include <linux/pcs/pcs-provider.h>
+
+MODULE_DESCRIPTION("PCS library");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+
+struct fwnode_pcs_provider {
+	struct list_head link;
+
+	struct fwnode_handle *fwnode;
+	struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
+				   void *data);
+
+	void *data;
+};
+
+static LIST_HEAD(fwnode_pcs_providers);
+static DEFINE_MUTEX(fwnode_pcs_mutex);
+
+struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
+					  void *data)
+{
+	return data;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_simple_get);
+
+int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			    struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
+						       void *data),
+			    void *data)
+{
+	struct fwnode_pcs_provider *pp;
+
+	if (!fwnode)
+		return 0;
+
+	pp = kzalloc_obj(*pp);
+	if (!pp)
+		return -ENOMEM;
+
+	pp->fwnode = fwnode_handle_get(fwnode);
+	pp->data = data;
+	pp->get = get;
+
+	mutex_lock(&fwnode_pcs_mutex);
+	list_add(&pp->link, &fwnode_pcs_providers);
+	mutex_unlock(&fwnode_pcs_mutex);
+	pr_debug("Added pcs provider from %pfwf\n", fwnode);
+
+	fwnode_dev_initialized(fwnode, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
+
+void fwnode_pcs_del_provider(struct fwnode_handle *fwnode)
+{
+	struct fwnode_pcs_provider *pp;
+
+	if (!fwnode)
+		return;
+
+	mutex_lock(&fwnode_pcs_mutex);
+	list_for_each_entry(pp, &fwnode_pcs_providers, link) {
+		if (pp->fwnode == fwnode) {
+			list_del(&pp->link);
+			fwnode_dev_initialized(pp->fwnode, false);
+			fwnode_handle_put(pp->fwnode);
+			kfree(pp);
+			break;
+		}
+	}
+	mutex_unlock(&fwnode_pcs_mutex);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_del_provider);
+
+static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode,
+				int index, const char *name,
+				struct fwnode_reference_args *out_args)
+{
+	int ret;
+
+	if (!fwnode)
+		return -EINVAL;
+
+	if (name) {
+		index = fwnode_property_match_string(fwnode, "pcs-names",
+						     name);
+		if (index < 0)
+			return index;
+	}
+
+	ret = fwnode_property_get_reference_args(fwnode, "pcs-handle",
+						 "#pcs-cells", 0, index,
+						 out_args);
+	if (ret || (name && index < 0))
+		return ret;
+
+	return 0;
+}
+
+static struct phylink_pcs *
+fwnode_pcs_get_from_pcsspec(struct fwnode_reference_args *pcsspec)
+{
+	struct fwnode_pcs_provider *provider;
+	struct phylink_pcs *pcs = ERR_PTR(-ENODEV);
+
+	if (!pcsspec)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&fwnode_pcs_mutex);
+	list_for_each_entry(provider, &fwnode_pcs_providers, link) {
+		if (provider->fwnode == pcsspec->fwnode) {
+			pcs = provider->get(pcsspec, provider->data);
+			if (!IS_ERR(pcs))
+				break;
+		}
+	}
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	return pcs;
+}
+
+static struct phylink_pcs *__fwnode_pcs_get(struct fwnode_handle *fwnode,
+					    unsigned int index, const char *con_id)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, con_id, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = fwnode_pcs_get_from_pcsspec(&pcsspec);
+	fwnode_handle_put(pcsspec.fwnode);
+
+	return pcs;
+}
+
+struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode, unsigned int index)
+{
+	return __fwnode_pcs_get(fwnode, index, NULL);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get);
+
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	struct fwnode_reference_args out_args;
+	int index = 0;
+	int ret;
+
+	while (true) {
+		ret = fwnode_property_get_reference_args(fwnode, "pcs-handle",
+							 "#pcs-cells", 0, index,
+							 &out_args);
+		/* We expect to reach an -ENOENT error while counting */
+		if (ret)
+			break;
+
+		fwnode_handle_put(out_args.fwnode);
+		index++;
+	}
+
+	return index;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_count);
+
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs)
+{
+	unsigned int i, found = 0;
+
+	if (!available_pcs)
+		return -EINVAL;
+
+	if (!fwnode_property_present(fwnode, "pcs-handle"))
+		return -ENODEV;
+
+	for (i = 0; i < num_pcs; i++) {
+		struct phylink_pcs *pcs;
+
+		pcs = fwnode_pcs_get(fwnode, i);
+		if (IS_ERR(pcs)) {
+			/* Exit early if no PCS remain.*/
+			if (PTR_ERR(pcs) == -ENOENT)
+				break;
+
+			/*
+			 * Ignore -ENODEV error for PCS that still
+			 * needs to probe.
+			 */
+			if (PTR_ERR(pcs) == -ENODEV)
+				continue;
+
+			return PTR_ERR(pcs);
+		}
+
+		available_pcs[found] = pcs;
+		found++;
+	}
+
+	return found;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_parse);
diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-provider.h
new file mode 100644
index 000000000000..ae51c108147e
--- /dev/null
+++ b/include/linux/pcs/pcs-provider.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_PROVIDER_H
+#define __LINUX_PCS_PROVIDER_H
+
+/**
+ * fwnode_pcs_simple_get - Simple xlate function to retrieve PCS
+ * @pcsspec: reference arguments
+ * @data: Context data (assumed assigned to the single PCS)
+ *
+ * Returns: the PCS pointed by data.
+ */
+struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
+					  void *data);
+
+/**
+ * fwnode_pcs_add_provider - Registers a new PCS provider
+ * @fwnode: Firmware node
+ * @get: xlate function to retrieve the PCS
+ * @data: Context data
+ *
+ * Register and add a new PCS to the global providers list
+ * for the firmware node. A function to get the PCS from
+ * firmware node with the use fwnode reference arguments.
+ * To the get function is also passed the interface type
+ * requested for the PHY. PCS driver will use the passed
+ * interface to understand if the PCS can support it or not.
+ *
+ * Returns: 0 on success or -ENOMEM on allocation failure.
+ */
+int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			    struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
+						       void *data),
+			    void *data);
+
+/**
+ * fwnode_pcs_del_provider - Removes a PCS provider
+ * @fwnode: Firmware node
+ */
+void fwnode_pcs_del_provider(struct fwnode_handle *fwnode);
+
+#endif /* __LINUX_PCS_PROVIDER_H */
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
new file mode 100644
index 000000000000..b7cfdd680b2a
--- /dev/null
+++ b/include/linux/pcs/pcs.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_H
+#define __LINUX_PCS_H
+
+#include <linux/phylink.h>
+
+#if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * fwnode_pcs_get - Retrieves a PCS from a firmware node
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative
+ * error pointer. Can return -ENODEV if the PCS is not
+ * present in global providers list (either due to driver
+ * still needs to be probed or it failed to probe/removed).
+ */
+struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
+				   unsigned int index);
+
+/**
+ * fwnode_phylink_pcs_count - count PCS entries described in firmware node
+ * @fwnode: firmware node
+ *
+ * Helper function to count the number of PCS entries referenced by the
+ * "pcs-handle" property in a firmware node.
+ *
+ * Note that this function counts all PCS references in the firmware node,
+ * regardless of whether the corresponding PCS devices are already probed.
+ *
+ * Returns: number of PCS entries described in the firmware node.
+ */
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode);
+
+/**
+ * fwnode_phylink_pcs_parse - parse available PCS from firmware node
+ * @fwnode: firmware node
+ * @available_pcs: pointer to preallocated array of PCS
+ * @num_pcs: maximum number of PCS entries to scan
+ *
+ * Helper function that parses PCS references from the "pcs-handle"
+ * property of a firmware node and fills @available_pcs with PCS that are
+ * currently available up to @num_pcs.
+ *
+ * Only PCS that are currently available are stored in @available_pcs.
+ * PCS that returns -ENODEV are skipped.
+ *
+ * Returns: number of PCS stored in @available_pcs, or negative error code.
+ */
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs);
+#else
+static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
+						 unsigned int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
+static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	return 0;
+}
+
+static inline int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+					   struct phylink_pcs **available_pcs,
+					   unsigned int num_pcs)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* __LINUX_PCS_H */
-- 
2.53.0


