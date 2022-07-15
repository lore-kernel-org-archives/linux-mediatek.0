Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 16:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XcgCX5IEnr5TgMlYC+cQseNSP2R9E/qzSlMeqbtQYw=; b=mtDFNd27prKrQnw3VFSkYwugs8
	Gigddkip3rEHSGveckFt5KVVkcM0CdySFL9i0wLVaxDCN38hnYjZFA9XtNN7eh+6Y3yE61ii5ulxM
	p6RN0XnHncn/Sds3q5F9z9aOdzFOLge3DczrmXoyYWNUVn1MwpXC6jQlb421KawRpH3IRE5Uo3tBR
	wRLnbUP6x7yApL+GAWK1Q06ppiiZGNG7gWZcfs3L37n0aNqRIPjCx2uRA4WNtlvlqRxKA24o6BZHT
	9YaZtSmxfNfAVzJ/7gqY7FjTB7PjLllnwpHIb2zQtYzGLFVSYZV+uevD4a/f3IP0yAz5JOX3szOJ5
	JGDruTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNlc-008bfZ-Rb; Fri, 15 Jul 2022 16:02:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNlE-008bWe-TO; Fri, 15 Jul 2022 16:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5XcgCX5IEnr5TgMlYC+cQseNSP2R9E/qzSlMeqbtQYw=; b=eAEe1dZ3dEKHvCC5x6n3Pkepcg
	4gsGy+Jcx5PFGq1jVI95XyMZoQ1qfUKvLAzMaJHHHnzHoV5PI6Q9If6eEvxRLH1AvWYF5PMhK4Nh0
	T6mCY30xODECmugUBgUp0Rcz9/ui0QRr7Nas1aRUaQPWZcUCIKSLNApXo0WcCwDxNOgzTlvW8T/fP
	ENn20uelVEro+PJ+kw4iNiexW7BWXh3Wc1oty0mQV438h0z/wj4XByw7mwDoaAaY2nVEWv1j21RqZ
	St36PWhGLazvW/1oy7zsxgUtQFsID21vU/CCanEltavXYBK2xyv5MpiIKR4914QLEYuS94t/RerIT
	+XnvAR7g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46048 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oCNkz-0007Cj-F1; Fri, 15 Jul 2022 17:01:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oCNky-006e3g-KA; Fri, 15 Jul 2022 17:01:32 +0100
In-Reply-To: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Alvin __ipraga" <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: [PATCH net-next 2/6] software node: allow named software node to be
 created
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oCNky-006e3g-KA@rmk-PC.armlinux.org.uk>
Date: Fri, 15 Jul 2022 17:01:32 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_090148_977469_A9AE58F1 
X-CRM114-Status: GOOD (  12.04  )
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Allow a named software node to be created, which is needed for software
nodes for a fixed-link specification for DSA.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/base/swnode.c    | 14 ++++++++++++--
 include/linux/property.h |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 0a482212c7e8..b2ea08f0e898 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -972,8 +972,9 @@ void software_node_unregister(const struct software_node *node)
 EXPORT_SYMBOL_GPL(software_node_unregister);
 
 struct fwnode_handle *
-fwnode_create_software_node(const struct property_entry *properties,
-			    const struct fwnode_handle *parent)
+fwnode_create_named_software_node(const struct property_entry *properties,
+				  const struct fwnode_handle *parent,
+				  const char *name)
 {
 	struct fwnode_handle *fwnode;
 	struct software_node *node;
@@ -991,6 +992,7 @@ fwnode_create_software_node(const struct property_entry *properties,
 		return ERR_CAST(node);
 
 	node->parent = p ? p->node : NULL;
+	node->name = name;
 
 	fwnode = swnode_register(node, p, 1);
 	if (IS_ERR(fwnode))
@@ -998,6 +1000,14 @@ fwnode_create_software_node(const struct property_entry *properties,
 
 	return fwnode;
 }
+EXPORT_SYMBOL_GPL(fwnode_create_named_software_node);
+
+struct fwnode_handle *
+fwnode_create_software_node(const struct property_entry *properties,
+			    const struct fwnode_handle *parent)
+{
+	return fwnode_create_named_software_node(properties, parent, NULL);
+}
 EXPORT_SYMBOL_GPL(fwnode_create_software_node);
 
 void fwnode_remove_software_node(struct fwnode_handle *fwnode)
diff --git a/include/linux/property.h b/include/linux/property.h
index a5b429d623f6..23330ae2b1fa 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -492,6 +492,10 @@ void software_node_unregister(const struct software_node *node);
 struct fwnode_handle *
 fwnode_create_software_node(const struct property_entry *properties,
 			    const struct fwnode_handle *parent);
+struct fwnode_handle *
+fwnode_create_named_software_node(const struct property_entry *properties,
+				  const struct fwnode_handle *parent,
+				  const char *name);
 void fwnode_remove_software_node(struct fwnode_handle *fwnode);
 
 int device_add_software_node(struct device *dev, const struct software_node *node);
-- 
2.30.2


