Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6E2C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVArDv0lIfvc7Grsn0zO3GkVHpa3SVAzDsMkv50A9yY=; b=BePmvhhh2GLp6a1+pvlgKv23xP
	WfUrbPDYG4dNVHmwyMKccqWD4BGbY43Xu8UBrteWUUfPrCzu2sZO2mMBC+XzmnN/7IM4Zw1953zz5
	kwdtDjpp6RoC4wDzInrrxnXHgVa0ju59I9VSJO9XwRp2cYlNsITRqwicw2IU/tqS+vbyFDYBlquP5
	b7wq+9gMisSKwNhmok+mti3otU/4Bf+oPxa+B6cQlS6xma++KRBWSPlb2ZMQvooF4ja9wAe2B1omt
	+lNcKgWkqQF4wqKRz2ONYaQg4NFVxIlj1TsiQROG2Zw2OQ26Rqz7ohP+ey13S1P4seNhntf6MydsL
	Kw9yb2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJza4-00GQTD-Ev; Fri, 05 Aug 2022 15:49:44 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzZa-00GQAi-Ck; Fri, 05 Aug 2022 15:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659714554; x=1691250554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NEeFuL7s2HGlJGPjMrfp/6jwPjBk7uYpbdHP2kx39AA=;
  b=UN85D6cedeSjCr0zZI1HJkONBXtj8G011ePFStuqLv0y8TTLLPQqh2JG
   yDselZhjQs25kAr7Hmu0eU0seAP8pJbj9KSkNDTPQ7nZqzl/z19mz3mX1
   kKo5vbTZF3Q2f217WSjTfWotuFzrx3b4vKOCzaZgzyRUDqjJKQsjg6ut3
   DAz8ieweQOVf/L7zubqOILHcNyN6b9Vv/iMdnJeIKL91qz6GwrpAsQC4O
   R0pQFbSOjHMDohdlMhk6998kUCkKdxiOMtP3roerV+RSyG8MPgOXscET6
   PcKC0xL0i+57T/BBT8R0llbTvrJAPy72PXlcmS59n1PGT1hMzTsQeafb7
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="351943660"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="351943660"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 08:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="693037566"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2022 08:49:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9D8FC11C; Fri,  5 Aug 2022 18:49:16 +0300 (EEST)
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
Subject: [PATCH v2 02/11] leds: Move led_init_default_state_get() to the global header
Date: Fri,  5 Aug 2022 18:48:58 +0300
Message-Id: <20220805154907.32263-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
References: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_084914_496054_C4954562 
X-CRM114-Status: GOOD (  12.95  )
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

There are users inside and outside LED framework that have implemented
a local copy of led_init_default_state_get(). In order to deduplicate
that, as the first step move the declaration from LED header to the
global one.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds.h  | 1 -
 include/linux/leds.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index aa64757a4d89..345062ccabda 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -27,7 +27,6 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			struct bin_attribute *bin_attr, char *buf,
 			loff_t pos, size_t count);
-enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 499aea1e59b9..b96feacc73f8 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -67,6 +67,8 @@ struct led_init_data {
 	bool devname_mandatory;
 };
 
+enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode);
+
 struct led_hw_trigger_type {
 	int dummy;
 };
-- 
2.35.1


