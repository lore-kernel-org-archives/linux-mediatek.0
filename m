Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F67C53210
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t01MhE4mNgM5sHlz1lVIZJAYFzMiWDkEJ+tlKav/9LU=; b=PNSTthCKZme+f0PeS6kU5C3CfP
	62woqaQhLQURD69m+hJi4d/DPg+TYatWZ0jg9A03J0O4/i+FhG5UKAdX7wbuV2buvAfPX4vyDytrR
	F+UuMzv5ZU6ORxHy47Yzh3EsTDN/cUygv3QrfSvdt88Ppl2IpB21rN/mo8ddT0DQVCXq1ZApo896A
	+pch16wuXdZeUOnK2TSNHg2WlN1/EyovRa9iROYzfwxzuTBADDd7g5iA0ZIhOVRD5LZ12gE1fGCmz
	NfyKS9OTCh0aXmoSAQmM/P/fGeXombmSczQLm+qRobTAa879Eds1dTrypcHKO7tPXjYYXBgCq5v4J
	pK/T5BsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkBk-002wZP-Pt; Tue, 03 Jan 2023 16:30:56 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh66-001QzV-JU; Tue, 03 Jan 2023 13:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751574; x=1704287574;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=apcGmjYq/qVMK/WjGsO3bG5bvbvbn9MDx/JXtx/ypL0=;
  b=T+4mFXvQMg1DFp/VrzzdRe6dBlMXV1JOc76/naqBCqTPfpsgmxwh5LXY
   nqredOi4tY8w3uzuh4R30LbYNsmDIjKmbD3o9DSf5ctwphAno2stg+Lvu
   8ZbI2Tns4QRVV+xv8xefEcUcsQRrgJUQiXkMbb6ZVUHirf2miUVEH41Gg
   8npcCHlpKeMrGehUovcUCbPosiB0wmqK7AtP/NkcEJPDQSTbs7LhlF3/j
   +xV8bnd74Clce+9SUlZwZGLd5ao5RL/C+QpL87e3N66GHFjwLgHM+66k2
   ca3bmH+fu1e7P6P9rA1R59z05d1/Ku7NXv6PhCy5X7aS+aewyVhoDDrCs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="320367233"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="320367233"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="654781130"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="654781130"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 03 Jan 2023 05:12:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 70377162; Tue,  3 Jan 2023 15:13:00 +0200 (EET)
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
Subject: [PATCH v4 00/11] leds: deduplicate led_init_default_state_get()
Date: Tue,  3 Jan 2023 15:12:45 +0200
Message-Id: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051254_832650_7183DC7A 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

There are several users of LED framework that reimplement the
functionality of led_init_default_state_get(). In order to
deduplicate them move the declaration to the global header
(patch 2) and convert users (patche 3-11).

Changelog v4:
- added tags to patches 4, 5, 6, and 7 (Florian, AngeloGioacchino)
- resent with Lee included in the Cc list (Lee)

Changelog v3:
- added tag to patch 11 (Kurt)
- Cc'ed to Lee, who might help with LED subsystem maintenance

Changelog v2:
- added missed patch 2 and hence make it the series
- appended tag to patch 7
- new patch 1

Andy Shevchenko (11):
  leds: add missing includes and forward declarations in leds.h
  leds: Move led_init_default_state_get() to the global header
  leds: an30259a: Get rid of custom led_init_default_state_get()
  leds: bcm6328: Get rid of custom led_init_default_state_get()
  leds: bcm6358: Get rid of custom led_init_default_state_get()
  leds: mt6323: Get rid of custom led_init_default_state_get()
  leds: mt6360: Get rid of custom led_init_default_state_get()
  leds: pca955x: Get rid of custom led_init_default_state_get()
  leds: pm8058: Get rid of custom led_init_default_state_get()
  leds: syscon: Get rid of custom led_init_default_state_get()
  net: dsa: hellcreek: Get rid of custom led_init_default_state_get()

 drivers/leds/flash/leds-mt6360.c           | 38 +++--------------
 drivers/leds/leds-an30259a.c               | 21 ++--------
 drivers/leds/leds-bcm6328.c                | 49 +++++++++++-----------
 drivers/leds/leds-bcm6358.c                | 32 +++++++-------
 drivers/leds/leds-mt6323.c                 | 30 ++++++-------
 drivers/leds/leds-pca955x.c                | 26 +++---------
 drivers/leds/leds-pm8058.c                 | 29 ++++++-------
 drivers/leds/leds-syscon.c                 | 49 ++++++++++------------
 drivers/leds/leds.h                        |  1 -
 drivers/net/dsa/hirschmann/hellcreek_ptp.c | 45 ++++++++++----------
 include/linux/leds.h                       | 15 ++++---
 11 files changed, 143 insertions(+), 192 deletions(-)

-- 
2.35.1


