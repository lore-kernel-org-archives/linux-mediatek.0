Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18F9C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVArDv0lIfvc7Grsn0zO3GkVHpa3SVAzDsMkv50A9yY=; b=xWpWrQkWKVKd4RsXCyrKi/oiuX
	c/srMJiutZzwh4KVHzWp2EE05mQoKiP+3E3zdqePf4FhxeVJNRXa+lXXWrIEGrFeWYDIELCzwXecy
	qjIkO1s1J2aKTpZdNU01SIO6T0/WQqi/TL1yrXz17dEppXbjs7jFbK0WJXY+sBGoVxCEq+YeW+Fp+
	TQkLrWBRKmQWvcUem3+eJCgRXYdGY/88gm90uvcKBJJQJjBup2jwYOUwQZ30oHu0MHWQoW09R7OyB
	ioHVpbBkbUXvhmkVQ1rPQT/e0WGn6AmWUcu1nUFUN05L9edThfYdC1t/Vf6axYpyUvHv8IWh+KQrO
	m5D/CV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjvI-002op8-2S; Tue, 03 Jan 2023 16:13:56 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh5o-001R07-1I; Tue, 03 Jan 2023 13:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751556; x=1704287556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NEeFuL7s2HGlJGPjMrfp/6jwPjBk7uYpbdHP2kx39AA=;
  b=N74I6rDUI5LY4crRUGj9Iw/6qTocz4VKc5ogvmNc/Hr4AU7ArIHGxlnt
   kFnPQ6i/q48IrbAq4rul2XqQlX2K8GptalEIOZVC4eSBTWxxoX3l9LPxA
   yCL3wfdc7iwnphLOBnCg9i3ACyoLjZ0aTWhuRBjZr6B8x8TCmrKqOvWaW
   yWXcCLqJZPjsTD+/od2Es9fdfcUfqu3TTAZWOihJMgvasNwQe6tqzO+0I
   p+YujOSlXFquA/REbNRHPIrt3lPVvWObr1yFLw3l9pr+GSQKGD3Bijdpw
   p+KB5AU1a8ON3jj370R38G/H1mu9IbC+f/AyPou16ki0jc4SB+XtaMHeF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="322887895"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="322887895"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="685397925"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="685397925"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2023 05:12:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 85BF21CA; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
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
Subject: [PATCH v4 02/11] leds: Move led_init_default_state_get() to the global header
Date: Tue,  3 Jan 2023 15:12:47 +0200
Message-Id: <20230103131256.33894-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051236_451789_5B80A6AA 
X-CRM114-Status: GOOD (  12.67  )
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


