Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBD0C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HB9KhgbQmPRrv2byceZFPlvA6SZnIHNRkPBNlb9fOyk=; b=erN5Qq7CsIYDfu0hCB4PxAirk8
	k8QIfzzlA45rs4BStIyVgKhBvI8F6gzC/QQwe981BImHsAVY57cyGYe8zAE+AVvTWydfXjIrdqOj3
	2khNHnHd9oG1Ci4nSQzMFy3TmDICgRKwM27anEobeBUuUZPYCY5m2zKAgpRDPj+lXS1m6itdyVPAE
	cl3pyiE/URkSM35Rpx1WmEg/yWn/45jAqYyQvKHIvF97JBixiIRFGPoxQs2gPfcyBCrVZ33M3lvLE
	BTBXHckjr/oLadrQczV4SJDaukBR10R5SuCbe3y/96yw92HX729Ew4VdYg/iXFqjtoee1Yl6gWY+v
	B5B9l5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBd30-004FsS-Ok; Wed, 13 Jul 2022 14:09:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBd25-004F7Y-6l; Wed, 13 Jul 2022 14:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HB9KhgbQmPRrv2byceZFPlvA6SZnIHNRkPBNlb9fOyk=; b=rs9+ebeIQSqinnmcbq6hWPSjiv
	5stwlv0WE9pK1jRZtHW6TdZPLa5V6arHVkSOQDgr1Arnp+0Mm9LYJQ8cW3InPW8eDdjGkVPtkPPZ2
	yzD6FYzlz54q44rpXcOItfzJAI8ARHbJI254bgZOq4G+16BuAxd2y7LjRUzLY2tajpI14gTlGAjw/
	u97TjSnWtB5dL9vyzLtZ1Jt0pSsOt1w8y/Q44Y/n31e9UIH27pj4lIC6b8aAGYSeOqjMm7Ue3Gevg
	ZJ4t/L2ZMZel77uif4boMq+xEyRhp3C4NZaWttHmjrhIqXo7sBEQT7+0EsNU5DyMBFYy6vxJG8IJM
	3id+IkzA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37052 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oBd1o-0004ap-9u; Wed, 13 Jul 2022 15:07:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oBd1n-006UCq-JK; Wed, 13 Jul 2022 15:07:47 +0100
In-Reply-To: <Ys7RdzGgHbYiPyB1@shell.armlinux.org.uk>
References: <Ys7RdzGgHbYiPyB1@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next v2 2/6] software node: allow named software node
 to be created
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oBd1n-006UCq-JK@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Jul 2022 15:07:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_070805_270911_E851568F 
X-CRM114-Status: GOOD (  11.70  )
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


