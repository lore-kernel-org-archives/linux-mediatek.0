Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A7DC46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5tHmAq8XEUna0E5RSbSOZ4xapHQ0h6yyTb36gWfi4Y=; b=YLmXM2LepP5vRMH3DXuBx1gc7g
	xm17ybCYHMzjSCOhtg5pHbpy6QGIVomNnYmIwrn638KLHtqbQEgIDHwEQs1zXoDqbnDWuCcRsaIMN
	yKLPeIV0H0y/40W18TtPF8+ohA2mD2JujsUpyVhAd3AdRZ81dCmhqz18CuWNRM/kVyqRZOc3Ko490
	f1JAMh2zIIISK/8yXWeZWsv1fIn+isCDTZXgTFYi62dY5B9CUdctwCX/b56mPRc+YmdhOVFXDatNk
	0KM1E3OEAq21vP18Nkz+LiJ85Qbp6A8D6qwB95kQjNDau90pS4sJfd3LSwJ/5PIZp8XcxUVDsshh2
	DAi8bLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCk5C-002tSw-1n; Tue, 03 Jan 2023 16:24:10 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh5r-001R20-Mw; Tue, 03 Jan 2023 13:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751559; x=1704287559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b85nclneF9BX61RtcZxdbpTMJV7DSQfjZ+m4p4X2wC0=;
  b=fTIZe9aNy6RlDEJ2dosTDkemOOhQZBg2kmGLeHTv2D48jiUmHnCMzHAK
   fXqadW7G51Lp48NpfDHyGJllNLMXdR7oTyxDAo0gfZR0Hpy3tAABj+R0P
   bCofY5u+Yjah6cBZzq9b1BEXSQ6essmSXw+PhZgnXi3yqUO8BpnkKXWsc
   h+P62jnsQaEtHgz6Yf/FZRUOVmJO+kfkdCDUzTDwdtJT7BaRS/UFB6MAm
   VNq/V+fno4uuQkqsQNqE3v9+CWITsEQqD+FVxj31SeLee43REJkuvKo3f
   o3fkitV43+6LvWg7FaMEYwSyz1DNRW/eQxQjmSw4Ye520u3t3FruACZ91
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="322887921"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="322887921"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="685397926"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="685397926"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2023 05:12:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 79000F4; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Gene Chen <gene_chen@richtek.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v4 01/11] leds: add missing includes and forward declarations in leds.h
Date: Tue,  3 Jan 2023 15:12:46 +0200
Message-Id: <20230103131256.33894-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051239_968526_781C57A4 
X-CRM114-Status: GOOD (  11.81  )
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

Add missing includes and forward declarations to leds.h. While at it,
replace headers by forward declarations and vise versa.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/leds.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index ba4861ec73d3..499aea1e59b9 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -10,17 +10,21 @@
 
 #include <dt-bindings/leds/common.h>
 #include <linux/device.h>
-#include <linux/kernfs.h>
-#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
+#include <linux/types.h>
 #include <linux/workqueue.h>
 
-struct device;
-struct led_pattern;
+struct attribute_group;
 struct device_node;
+struct fwnode_handle;
+struct gpio_desc;
+struct kernfs_node;
+struct led_pattern;
+struct platform_device;
+
 /*
  * LED Core
  */
@@ -508,7 +512,6 @@ struct led_properties {
 	const char	*label;
 };
 
-struct gpio_desc;
 typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
 				unsigned long *delay_on,
 				unsigned long *delay_off);
-- 
2.35.1


