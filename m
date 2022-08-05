Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B79DC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5tHmAq8XEUna0E5RSbSOZ4xapHQ0h6yyTb36gWfi4Y=; b=wgrTzchGqDmimYTNKWVimn1dKV
	+qIBXimXFea3nr7GxoVo8fOlG5it5U/DXKGjE8YHW9riEPP81xVEnS842cwiK55phkB6EP8wisCna
	lc3/7YNM9rlMShVkREcxFk1KCyh2PzVmIqmoJBikvLu8Iambgd/yXATIduPrwWLfzQi1EJ5TTlXs4
	VXOUSGSeKVioCiKk7SDAydpIcXam41kzRmRGSzVqzOW7lqErKWZV1l2Errec6rzQtSSyMKekoBfne
	aA4obI9MMsrG8OmahnessrL2PBy7uubqgdfZ9p0MSXT6YYutOn9fe/1S2jVenIpvv3dwxdoQmXc63
	iUoKFDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzcb-00GSJ4-KF; Fri, 05 Aug 2022 15:52:21 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzZc-00GQAu-9m; Fri, 05 Aug 2022 15:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659714556; x=1691250556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b85nclneF9BX61RtcZxdbpTMJV7DSQfjZ+m4p4X2wC0=;
  b=YMcgYAjR2DYR4apILOKV1JBUokCKRLklir3fEnab/QV+UTWqBEVCAbWj
   EwN3U/9jczfqCMFkr9VXehhCsLhWUwra+zEH/xXZvkXgDreavvAvs+WJg
   B32z0w0Hug751kQrf+PYp7FnkM2qwJ68nBBEfjnz+52KeXr2LmbWxVfqW
   +Cl2/mpurAT+OW+Wylc9eFW7Xn8+pPMAWXx9bV3bMKKppqmMBGDaqPWlX
   4EHNlSvztsu+cZJuDgqPYbRJmV9YrZkMmVUiP3GLnrzlzyXOvTgBDa0J3
   q6gKIDww7pxtwwLXIDT5AK1BMIIKJHElMzXViajtooIx6xQEjwWsl5ehB
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="316120606"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="316120606"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 08:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="931271130"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2022 08:49:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 94660D9; Fri,  5 Aug 2022 18:49:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gene Chen <gene_chen@richtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Eddie James <eajames@linux.ibm.com>,
	Denis Osterland-Heim <Denis.Osterland@diehl.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 01/11] leds: add missing includes and forward declarations in leds.h
Date: Fri,  5 Aug 2022 18:48:57 +0300
Message-Id: <20220805154907.32263-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
References: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_084916_458470_2F751650 
X-CRM114-Status: GOOD (  12.77  )
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


