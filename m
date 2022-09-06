Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169B0C6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5tHmAq8XEUna0E5RSbSOZ4xapHQ0h6yyTb36gWfi4Y=; b=JFnMNYsmDpxXLeb8GK3s2lyKVy
	oJPyJ/GX4C2flO4zdDH45rZ8yaTVdD8pOoFVvlDqOg6zOa63MrqGd7njcDYy+F/iF+9glCMCtDzxP
	6CoqxAp/ShSaNVEi9x4oq4xUQlbP3EMiQnvXuDnqDaTTbFIK1Y6LaAHZ+J8pD6fbTIctCuaRsuZuM
	EZTRQocUG+h4F2RVxL7LwX9qpofKMKeoMXthN+O+NGH2xaRfSIMZ1PqWVUbVmM4JrmBvl8AmGrm03
	aAyjUZmDdrgaXfwpCsUWR+4n6vottHrn3+fnn23qm5lrUdMWRxo77zjaQ9S1VVnR1aJTwhcycv9q7
	gqlN2Mgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZFH-00E9Wq-Ro; Tue, 06 Sep 2022 14:08:07 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYxl-00Dzmz-50; Tue, 06 Sep 2022 13:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662472201; x=1694008201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b85nclneF9BX61RtcZxdbpTMJV7DSQfjZ+m4p4X2wC0=;
  b=k7+zBNLN9DNJmQ1oavKZvswx/BN+WKryBrJn67S6KqDYuIdRCRSdyFCh
   phtDeeiq6aHwSL3WIUM1HTc3UzklOOYif+Fu1hr3FTt0Ljpj9yDwYl+2T
   DneM8tHgoA59oQKxb1Y92sybgoxWYi0bzpLcgcsCJleSSOIOupL2HkHWn
   vvkpMENKddo6wd/Ssy5hdK2NW6eVB41rCyVlig9z+niDB9kGf6VHkquCB
   7vh2Zdut050xNI/2ZhnJftXhqWe8z/RnKCLrRDGkZyhQOdB7nIC8oW8X+
   S0fI0Skg7JO1MJVDAI4jge/yKiqhH18sfJmV/EJXTWMVGM0bMDAec3++D
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="322771118"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="322771118"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 06:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="756372522"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2022 06:49:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5469186; Tue,  6 Sep 2022 16:50:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gene Chen <gene_chen@richtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v3 01/11] leds: add missing includes and forward declarations in leds.h
Date: Tue,  6 Sep 2022 16:49:54 +0300
Message-Id: <20220906135004.14885-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_065001_315167_D10EF4EC 
X-CRM114-Status: GOOD (  14.67  )
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


