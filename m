Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A652CD98F3
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWBKkXCPnVX9y0NE85TytOyaJugeSr3Fnil+IDh5DbM=; b=WzQcm7hviRBLOwBtGKQUj3alii
	kZKlFwhBOPNR0muL8wTuz2wER+aKPV/Z4/TYdiIegzPhlb9sDO9JqYBTBjkofvyN6X6GoqD2mEom/
	EGj1pqZABDn9cWvhNzAg8oiNoeDx8sUPaOSu5aDbs2C45FQ74hJHoe8T78ULwMuyx/DtC5Nj7EhK5
	Bb1pIoQWfKJSO1Iwmdt7UA7pmR//MkEtnl8S50+gb/wZQig1P2IQGIfjmf7EADoZUq5/Ymz9PxfMz
	/mQkjGgyz2ZRhfgpRO03S98TigWgNuxOy+ynbKOvjvYP+qzK2V6Me+TjvNLxXZVuRv5HMMIFl8JiA
	3XmNWiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKC-00000001IQv-04ZP;
	Thu, 18 Jun 2026 12:58:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCK9-00000001IM1-0Wxw
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490b7866869so8332785e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787503; x=1782392303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWBKkXCPnVX9y0NE85TytOyaJugeSr3Fnil+IDh5DbM=;
        b=ocjqNm7oJxKbk5buS7vNmBTUFfUNyfULwAb25sDOXnaC42UXgmIb0npdAi0RoPI+o3
         ttTGGEWnWSs6+Ss6cAEmarmiJNxfYnhGtMUM0Jm9iKoM/cxMhFngOoQv5u9GcRC2RJeR
         cy1DqQtUWvvdQ14C4SBtbhlssMRplpeBgdh5iXYsv3Svl9ISOwpC+vgX4/WUYxDRI3tY
         YKWlr+J+XrVkOrhsEEg+JYCrAG8a95ERI3JrmoLn10WahweKqsS4VHdhxACpXpR9JmJo
         FT6cq99DFnDzTyEyWLgBY+4pUzNCtmn7XQWHQDMofLEDC/2W8rheivGtnrnGuITvOu5D
         TtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787503; x=1782392303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWBKkXCPnVX9y0NE85TytOyaJugeSr3Fnil+IDh5DbM=;
        b=rQP4sY/TZD193OzYEEbY0ttOHBmaJsrCDcpM8l2r8ZiTsoYi9Fc85nI9AFGOr4+xBS
         stiL+Ijui1LgbUomEpsZZvR/MbqiCJOMz/KpsdiGlkJT8zfbQqf46H+YA7tfHMpppXsZ
         y/Shr4jZkTpBs4+UAR7Txozk5O28LtD6O58datglIs7IWgFt+FIXLnhWdHWaKFOuMvsX
         rR4vS/fmYJfaIe8lCr68iJQ87EjnU6wktN4wmxuf2FzRe/ksHA+gAHsYmvD4w4VrI4PC
         UxFUMhk2hVZgq+0nc0fYhRWWtiPCsMfyRTAmGMNOTdFiC3/bV4BAzpnPxBxcmaNPRAV8
         EKfw==
X-Forwarded-Encrypted: i=1; AFNElJ8zO9t90BTegCKPFa3J/j66qhlcr0ryC7Fq9J/bzCUX3NYfpjNXjTSXALCvAdm96k3tPGQXTTIRbUXZ2+NIjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuS2VSzgFHomN53nhOxD3S1EJ3vVhnGVHOn/cI0XjLnBl6WuMK
	MiiI0Znv94wSt3/lxOoVj7AUygz1JPAubS6GenwQGWgn/QhIuly7qzl4kvWGBA==
X-Gm-Gg: AfdE7ckQRrovdjzV76aYk6oHAP7zwZLY8K7w0DS/Wj8y/cqEuM+I8Dx5I5sRW3ZK92j
	m7UGzuUvfl4qrfnJ+8TfPT2B5GXMzkWuyJigu8fdF3HpWGFg1mKSFe3p7wiqVrS2J5ERZ6N0N+F
	gyeMhVrtKLnI/LokY2YucZjNvLxFcWyDTbvKllZKCue4PQBP8OBCh/SvT0M6sgiXT/y8d13z0Lr
	eQ0bTUOeXZtdt/KdFUQYp0SX+iFT+IR65D7N+42ZnrUz4rqDxHeAS8X5/xByRmW/U5CzLY7/O7T
	USQ/dc3TvlcFuQA8IqH6bXcURJvDdYasL/iJB7xseeeARn2DMwdH4/v/MALO9+pW5P9Dqtf/JEn
	lS9Ec6C/J3PlMGkZxLow2s7A6wqobxBEzFKWqiR41C7szqspD3IEpyycKUPirNurkHw46xZmBwW
	HrdTF2wwRIhJWmMseLSUtkkCmPN7mygeGN0AWIaqDh557vw7RjcKK+CjyCVaVsvA==
X-Received: by 2002:a05:600c:3b9b:b0:492:3445:ecf8 with SMTP id 5b1f17b1804b1-4923445efbdmr126249705e9.3.1781787503384;
        Thu, 18 Jun 2026 05:58:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:22 -0700 (PDT)
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
Subject: [RFC PATCH net-next v8 06/12] net: Document PCS subsystem
Date: Thu, 18 Jun 2026 14:57:14 +0200
Message-ID: <20260618125752.1223-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055825_231815_1EB4CEAE 
X-CRM114-Status: GOOD (  33.66  )
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/networking/index.rst |   1 +
 Documentation/networking/pcs.rst   | 229 +++++++++++++++++++++++++++++
 2 files changed, 230 insertions(+)
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
index 000000000000..98592cdee3ef
--- /dev/null
+++ b/Documentation/networking/pcs.rst
@@ -0,0 +1,229 @@
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
+1. MAC OP struct .mac_select_pcs (considered legacy)
+2. firmware node (fwnode) PCS entirely handled by phylink
+
+Implementation 1 leaves the entire handling of the PCS to the MAC
+driver with the selection of the PCS driven by .mac_select_pcs.
+Custom implementations are required if the PCS is external to the MAC
+and needs to be handled by a separate driver.
+
+This implementation is considered legacy and it's suggested to
+switch to the new fwnode PCS.
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
+is held by phylink and :c:func:`phylink_release_pcs` should be used to release
+them.
+
+Writing PCS Drivers
+-------------------
+
+To write a PCS driver, first implement :c:struct:`phylink_pcs_ops`. Then,
+register your PCS in your probe function using :c:func:`fwnode_pcs_add_provider`.
+The :c:func:`fwnode_pcs_add_provider` takes three arguments, the fwnode where
+the PCS provider should be registered to, a get function to return the requested
+PCS based on ``#pcs-cells`` and a pointer to reference private data for the get
+function.
+
+The PCS will then be registered to a global list of PCS provider that the
+PCS fwnode implementation will use to parse it.
+
+For the simple case where the PCS driver expose a single PCS,
+:c:func:`fwnode_pcs_simple_get` can be used as the get function.
+
+You must call :c:func:`fwnode_pcs_del_provider` from your remove function and
+release the PCS from any phylink instance under RTNL lock with
+:c:func:`phylink_release_pcs`::
+
+   fwnode_pcs_del_provider(dev_fwnode(&pdev->dev));
+
+	rtnl_lock();
+
+	for (i = 0; i < data->num_port; i++) {
+		struct pcs_port *port = &priv->ports[i];
+
+		phylink_release_pcs(&port->pcs);
+	}
+
+	rtnl_unlock();
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
-- 
2.53.0


