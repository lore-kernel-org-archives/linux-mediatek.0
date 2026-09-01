Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5C3C61DD3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgNAwW2BlGq0AAA4/ZvTmXt/lRmj3RQ9RMbCqvsLCVY=; b=E7SUScKaNQudjW8N7VKFOZJeLH
	d/fR7E9g5J+9mBa0KTo0YmxrX5qO5gSEIUbsuHe4xhYyNsQXmJ3u5TNLPG6DVjLMd5Pcx4bE8HlHJ
	h/Tpid4Mn/N+7+UvyDoFbAJmSJI7u4tprQe9zO0jhdRfPlzczSTcKdrwt44q1xI8RwYoUGhfjbX0J
	QbiRe/LHRq+3YX/v7hjg18sWZAJxYhKgy4lr5gQu6a/Edz8yQ2Zxi/2AClYbA3rwzw7LbIQ0oJHgg
	mIJUoFGcJupOxnjDivTXbUiVBLXNquJBTM3pO7keXMYgX6azGHu2dWtIj3d+5wxb9Uf7cSfl6a3w1
	xslF9JJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jt9-0000000BGxC-210T;
	Tue, 01 Sep 2026 08:30:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jt4-0000000BGnx-3WGE
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 08:30:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso51369745e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251433; x=1788856233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mgNAwW2BlGq0AAA4/ZvTmXt/lRmj3RQ9RMbCqvsLCVY=;
        b=OXR6SDhAFHY5sr2zP7hdLS1wLulnnr/TWljtqCTeWsp3lKZTwt/6Nrc7wq36OE78I4
         7HfToT5eMo1hS8B+6vZ44l+pPY/AF7rT77WGdya/lmsmd4HXgQOf9OaOOi3txSWHGdSd
         dlmU+CbaWHm8o01ItcT9Pz47Ac3HCz5jhBZqzdS6OnHNk0BIy7YsLoXCAy0I6UBBxqIk
         93yQ6ZIP7sDG3hW0zI9cHZHqrUtmAoSo9m/9dAeuTPBCpYHeS4h9l9Fo4jSN0nZ3AE+C
         D1mtnEpXE12rSFYhBeQ1NknU1WuyEmgkQKPQKJWwuqsk3D79/oairmcaYdrBn5arsJ2m
         0sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251433; x=1788856233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mgNAwW2BlGq0AAA4/ZvTmXt/lRmj3RQ9RMbCqvsLCVY=;
        b=A64Vi9R5mf+6JGYOO94BQ+KxOFj8A3uWgcxIlk282kwh+dXrsGdodgOyIYWrKuHJeQ
         NxMwNkiguUqikCo2okQATOBSAQGjelqYJWyRbdkwixwqehJKo/bW8XllqqLnY+v6vFHI
         XgV2jNBHUYIGn16O+Ud5rUiTAYnCAGbaONgltm2PvtM0j7Yovm7y+6lhMI0//+a/VXAQ
         Exijah4AmaWYybku4hCY4ZnWLCggrzgOe60ZVLAOqNcNUC78LzNjSPhcXMtJ2Y0Ab3IY
         VUKO4YKPN59FeAOA7uis8jHJSZtcDkMGymwiRU8kz2FY3/3GjWjq2NN86D6UnbIkDhDm
         95dw==
X-Forwarded-Encrypted: i=1; AHgh+Rrz+20IlDLPakBDiEFNYWBowxk2Y1Xk4qL0e1FsqwKKnvCOueZWDfm+Nt57cpArEGDN1pV4neHIXtipN37Siw==@lists.infradead.org
X-Gm-Message-State: AFuF++l+xY6ydP0U8yNl1ptF/Su1w3abwiiKC2JPRr/bbfMUjn9dEnAo
	+0MAEltfH8JJDqqrFA+/gJuecTCyo8oVsGVarkOiJCE7eVy6HEttAG9O
X-Gm-Gg: AR+sD12c5CZF7FxBNxJ35axmxTNOWr4gKKauLGbYoHVIMW4s09UyTdOPRt9cG5gyBa1
	fJuudbipKq0tdY0yPsKXbyxi+CmpQZKtv/61tg+i8UIxiykHEFuDi5lsilnJUJte3hnqHFk1EmT
	s/wQnsx9v+wiliE4hsmyw832XqlSr566NRSCQ7JPW2JdhKAJN494NNaPeD+8Hf5gnim7oUNiEfK
	yk+7080/m4xOwlRtu6GQhcIr3sB+YvXGaFwEc5gUaKRqeWrL5XeQglc8PROZi+9pHvcU1YqCV5X
	R/+tylvSPSbP3S21/ZpHBnWYpJaYFefbXSeOfPpMV3tz+zwZnSev6+BqrCFAFm3V0kATmUw4+W7
	1xQ3gIWgvoU16mOEbKWetNPSb4H5E2KW/pb0PdNsVcSkLhSvSLYXJl+X42XMLUYxCyHzo/hq1xA
	QaEWB9N56L/UetVJlnwgv42gXHr0BFrX+TiyfzweqJbMaXd0JFUnTT12XkfbSaoctQNIcjAGhpm
	ZLomBPFqmKUvuLDHqzeBOtcILwVrt3vRsudv1xjjdud60Gg4Vb/
X-Received: by 2002:a05:600c:3f10:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49cd01972c9mr330795615e9.0.1788251432530;
        Tue, 01 Sep 2026 01:30:32 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:31 -0700 (PDT)
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
Subject: [PATCH net-next v15 07/12] net: Document PCS subsystem
Date: Tue,  1 Sep 2026 10:29:22 +0200
Message-ID: <20260901083001.8044-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013034_959695_233E2A08 
X-CRM114-Status: GOOD (  33.84  )
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

Add extensive documentation of the new PCS subsystem and the fwnode
implementation with producer/consumer API.

Also update the sfp-phylink migration guide.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/networking/index.rst       |   1 +
 Documentation/networking/pcs.rst         | 234 +++++++++++++++++++++++
 Documentation/networking/sfp-phylink.rst |  35 ++--
 3 files changed, 246 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/networking/pcs.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 44a422ad3b05..3fce8f6ac089 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -28,6 +28,7 @@ Contents:
    net_failover
    page_pool
    phy
+   pcs
    sfp-phylink
    alias
    bridge
diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/pcs.rst
new file mode 100644
index 000000000000..2cae70231948
--- /dev/null
+++ b/Documentation/networking/pcs.rst
@@ -0,0 +1,234 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+PCS Subsystem
+=============
+
+The PCS (Physical Coding Sublayer) subsystem handles the registration and lookup
+of PCS devices. These devices contain the upper sublayers of the Ethernet
+physical layer, generally handling framing, scrambling, and encoding tasks. PCS
+devices may also include PMA (Physical Medium Attachment) components. PCS
+devices transfer data between the Link-layer MAC device, and the rest of the
+physical layer, typically via a serdes. The output of the serdes may be
+connected more-or-less directly to the medium when using fiber-optic or
+backplane connections (1000BASE-SX, 1000BASE-KX, etc). It may also communicate
+with a separate PHY (such as over SGMII) which handles the connection to the
+medium (such as 1000BASE-T).
+
+Remark on usage of .mac_select_pcs and fw_node PCS
+--------------------------------------------------
+
+There are generally two ways to look up a PCS device.
+
+1. MAC OP struct .mac_select_pcs (considered deprecated)
+2. Internal PCS handling with ``num_possible_pcs`` and ``fill_available_pcs``
+
+Implementation 1 leaves the entire handling of the PCS to the MAC
+driver with the selection of the PCS driven by .mac_select_pcs.
+Custom implementations are required if the PCS is external to the MAC
+and needs to be handled by a separate driver.
+
+Implementation 2 makes the phylink core code to select the PCS
+provided by ``num_possible_pcs`` and ``fill_available_pcs`` either
+via internal MAC handling or firmware node (fwnode)
+
+Implementation 1 is considered deprecated and it's suggested to
+switch to implementation 2 and where possible switch to firmware
+node design.
+
+.. _pcs_fwnode:
+
+Looking up PCS Devices (fwnode implementation)
+-----------------------------------------------
+
+The lookup of a PCS device follows the common producer/consumer implementation
+used by similar subsystems with a ``#pcs-cells`` on the producer and a
+``pcs-handle`` property on the consumer::
+
+    pcs: pcs {
+        // ...
+        #pcs-cells = <0>;
+    };
+
+    ethernet-controller {
+        // ...
+        pcs-handle = <&pcs>;
+    };
+
+On :c:func:`phylink_create`, phylink will use the ``num_possible_pcs``
+value and ``fill_available_pcs`` helper function in
+:c:struct:`phylink_config` to compose the list of available PCS that can be
+used for the phylink instance.
+
+Phylink will then internally handle the selection of the correct PCS for
+the requested interface mode based on the interface modes configured in
+``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+A PCS is considered eligible when the requested interface mode is present
+in both ``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+``supported_interfaces`` describes all interface modes supported by the MAC,
+whereas ``pcs_interfaces`` identifies the subset that require PCS selection.
+
+For the special implementation where the PCS is internal or part of the MAC
+and a dedicated driver is not needed, it's possible to leave the implementation
+of the PCS to the MAC driver and just implement the ``num_possible_pcs``
+value and ``fill_available_pcs`` helper  function in
+:c:struct:`phylink_config` referencing the local :c:struct:`phylink_pcs`
+struct allocated from the MAC driver.
+
+.. _pcs_consumer:
+
+Using PCS Devices
+-----------------
+
+It's mandatory to either implement the ``mac_select_pcs`` callback
+of :c:struct:`phylink_mac_ops` or ``num_possible_pcs`` and ``fill_available_pcs``
+of :c:struct:`phylink_config` to use a PCS for a MAC.
+
+The fwnode implementation exposes simple helpers to parse the PCS from
+the fwnode :c:func:`fwnode_phylink_pcs_count` and
+:c:func:`fwnode_phylink_pcs_parse`. The :c:func:`fwnode_phylink_pcs_count` helper
+takes the fwnode where the ``pcs-handle`` should be parsed and return the
+number of PCS entries described in the fwnode.
+The :c:func:`fwnode_phylink_pcs_parse` helper takes three arguments,
+the fwnode where the ``pcs-handle`` should be parsed, an allocated array
+of :c:struct:`phylink_pcs` pointer where to put the parsed PCS from the fwnode
+and the maximum number of PCS to parse.
+Contrary to :c:func:`fwnode_phylink_pcs_count`, :c:func:`fwnode_phylink_pcs_parse`
+helper fills the allocated array with ONLY the available PCS and return the
+number of available PCS found. PCS that returns -ENODEV will be skipped and
+won't be inserted in the allocated array.
+
+A phylink instance may use multiple PCS devices. The maximum number is reported
+through ``num_possible_pcs``.
+
+It's mandatory to specify for what interface a PCS is needed. This can be done
+by filling the ``pcs_interfaces`` in :c:struct:`phylink_config` struct.
+If the requested interface mode is not present in this bitmask, phylink does
+not search for a PCS for  that specific mode. (example MAC doesn't need a PCS
+for SGMII but require one for USXGMII)
+
+With the use of the :c:func:`fwnode_phylink_pcs_parse` a common implementation
+is the following::
+
+   static int mac_fill_available_pcs(struct phylink_config *config,
+   				                      struct phylink_pcs **available_pcs,
+					                      unsigned int num_possible_pcs)
+   {
+   	struct device *dev = config->dev;
+
+   	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+						                    num_possible_pcs);
+   }
+
+   static int mac_setup_phylink(struct net_device *netdev)
+   {
+      struct phylink_config *config;
+
+      // ...
+
+      config->dev = &netdev->dev;
+
+      // ...
+
+      // Parse possible PCS and fill num_possible_pcs.
+      config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(&netdev->dev));
+      config->fill_available_pcs = mac_fill_available_pcs;
+
+      __set_bit(PHY_INTERFACE_MODE_INTERNAL, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_SGMII, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_1000BASEX, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->supported_interfaces);
+
+      // PCS required only for USXGMII
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->pcs_interfaces);
+
+      phylink = phylink_create(config, //...
+
+It's worth to mention that it's phylink code that takes care of allocating
+the array of :c:struct:`phylink_pcs` pointer for ``fill_available_pcs``
+callback based on the value set in ``num_possible_pcs`` for
+:c:struct:`phylink_config` struct.
+
+The ``fill_available_pcs`` callback must not write more than
+``num_possible_pcs`` entries. The third argument may be used to validate
+that there is enough space to fill all the available PCS in the passed array
+of :c:struct:`phylink_pcs` pointer.
+
+The ``fill_available_pcs`` callback is called only on :c:func:`phylink_create`
+and is used only to compose the initial available PCS list. Ownership of PCS
+is held by phylink.
+
+.. _pcs_producer:
+
+Writing PCS Drivers
+-------------------
+
+To write a PCS driver, first implement :c:struct:`phylink_pcs_ops`. Then,
+register your PCS in your probe function using :c:func:`fwnode_pcs_add_provider`.
+The :c:func:`fwnode_pcs_add_provider` takes three arguments, the fwnode where
+the PCS provider should be registered to, a xlate function to return the requested
+PCS based on ``#pcs-cells`` and a pointer to reference private data for the xlate
+function.
+
+The PCS will then be registered to a global list of PCS provider that the
+PCS fwnode implementation will use to parse it.
+
+For the simple case where the PCS driver expose a single PCS,
+:c:func:`fwnode_pcs_simple_xlate` can be used as the xlate function.
+
+You must call :c:func:`fwnode_pcs_del_provider` from your remove function
+on driver detach.
+
+A devm variant, :c:func:`devm_fwnode_pcs_add_provider`, is available to
+automatically release the PCS provider on driver detach.
+
+It's worth to mention that xlate function MUST reference already allocated
+:c:struct:`phylink_pcs` pointer and MUST NOT dynamically allocate new PCS.
+The returned pointer is used to identify the PCS across provider lookup and
+removal notifications.
+
+Late PCS registration handling
+------------------------------
+
+It's possible that a PCS becomes available after the MAC finished probing.
+Contrary to the usual producer/consumer implementation, when a PCS is not
+registered and can't be found, the fwnode parser helper returns ``-ENODEV``
+instead of ``-EPROBE_DEFER``.
+
+This is to prevent race condition with particular devices that register
+MAC and PCS with USB or PCIe and require the MAC to be registered before
+the PCS.
+
+The phylink logic correctly handle this special case and keep the phylink
+instance in a fail condition.
+
+The PCS fwnode implementation provides a notifier to which each phylink
+instance with a non-empty ``pcs_interfaces`` in :c:type:`phylink_config`
+registers. When a new PCS provider is registered, the notifier is called
+triggering the :c:func:`pcs_provider_notify` function.
+
+Function :c:func:`pcs_provider_notify` will check if the just added PCS
+should be used by the phylink instance. If it should be used then,
+it's added to the internal list of available PCS and a phylink major
+config is forced.
+
+If a phylink instance was in a failure state, with the just added PCS
+now part of the available PCS internal phylink list, provided all other
+conditions are satisfied, the configuration is retried and the failure
+condition is cleared.
+
+API Reference
+-------------
+
+.. kernel-doc:: include/linux/phylink.h
+   :identifiers: phylink_pcs
+
+.. kernel-doc:: include/linux/pcs/pcs.h
+   :internal:
+
+.. kernel-doc:: include/linux/pcs/pcs-provider.h
+   :internal:
diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
index 5bf285d73e8a..306505118eba 100644
--- a/Documentation/networking/sfp-phylink.rst
+++ b/Documentation/networking/sfp-phylink.rst
@@ -311,33 +311,20 @@ this documentation.
 
         priv->pcs = lynx_pcs_create_mdiodev(bus, 0);
 
-    Some PCS can be recovered based on firmware information:
+    PCS that should be recovered based on firmware information should implement
+    the external PCS as a :ref:`PCS provider <pcs_producer>` and reference it
+    with the use of PCS fwnode helper :ref:`PCS fwnode helper <pcs_fwnode>`.
 
-    .. code-block:: c
-
-        priv->pcs = lynx_pcs_create_fwnode(of_fwnode_handle(node));
-
-12. Populate the :c:func:`mac_select_pcs` callback and add it to your
-    :c:type:`struct phylink_mac_ops <phylink_mac_ops>` set of ops. This function
-    must return a pointer to the relevant :c:type:`struct phylink_pcs <phylink_pcs>`
-    that will be used for the requested link configuration:
-
-    .. code-block:: c
-
-        static struct phylink_pcs *foo_select_pcs(struct phylink_config *config,
-                                                  phy_interface_t interface)
-        {
-                struct foo_priv *priv = container_of(config, struct foo_priv,
-                                                     phylink_config);
-
-                if ( /* 'interface' needs a PCS to function */ )
-                        return priv->pcs;
+12. Populate the :c:var:`num_possible_pcs` value and
+    :c:func:`fill_available_pcs` callback and add it to your
+    :c:type:`struct phylink_config <phylink_config>`.
 
-                return NULL;
-        }
+    Refer to :ref:`Documentation/networking/pcs.rst <pcs_consumer>` for
+    further details and examples.
 
-    See :c:func:`mvpp2_select_pcs` for an example of a driver that has multiple
-    internal PCS.
+    Notice that the previous implementation of populating
+    :c:func:`mac_select_pcs` is considered deprecated in favor of the new
+    described above.
 
 13. Fill-in all the :c:type:`phy_interface_t <phy_interface_t>` (i.e. all MAC to
     PHY link modes) that your MAC can output. The following example shows a
-- 
2.53.0


