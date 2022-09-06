Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0605EC6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j8g1Bnr+6pZN5e8l1pULIB1NdzlY/XxNs827UNskl70=; b=atZeQXo9hNFdBgIroCGvFUigwm
	BTO/O9VodIJlC4C9qoZzTmqLSM+0npaA3xQjxLbrVpCk9EWXs91jKB8eqmlFDSNcKv4Rl6wZ1WFcs
	88yxxJOsJXTObnoIpFW7JwPEsAor9e90WMDD3L3P9RYAvG9qR2t/FNBGoD/31nFQveQPBAFkpOBwg
	YS08vKEiLyLggV31iWiQgBayUFf5ngUhFj5qkljh1dMrjiX3BibC76WMUDvTVU542wWV1AqDhTM42
	ecFMeAZWOD5GVqyDQ4hMpR9M8B/ZpKlsvcDvcs+8nQz119WpNXbyDZP6FRZGMqFMHeD7ecL7hzUes
	Rq89DinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZLV-00EC9B-Jd; Tue, 06 Sep 2022 14:14:33 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYxo-00Dzol-13; Tue, 06 Sep 2022 13:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662472204; x=1694008204;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rwhdBcttY6XbD0bTBSztCf3q0tCwh4tn8f0UydnY7uY=;
  b=I3XaNi7c2m8COCsBTEU9J3QhDXT8V8Tp5/coAOxgUl4k05jEpHgBt+Us
   e9MsWSrq/kBDjG5yMGxA+CCy3brzN29my5g/yW8Twl0u8wv7BTKoJ6n6D
   GaJD1qr7kbRHI8fGFmUTD3dxtB1LNzgpTaUvCKRHQZe3x8LTQ+Z48ouB+
   iE75f8gUjApvIkOpCQ7MYOLu+m2TZaCPglNLiv979sSE908ZTvWIj29vE
   7ukQ+Zq21gKzyzbvWk2vHrc3BmmmfyCGVpfQJUTXIIe7IwfWyBUJjijic
   DZnvVJz8T2wRTPyUm8c/e/yFV/thaxeiXFk+o8NNYx/+Cd298C2T0ixwM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="322771120"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="322771120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 06:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="756372521"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2022 06:49:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 49DEC235; Tue,  6 Sep 2022 16:50:10 +0300 (EEST)
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
Subject: [PATCH v3 00/11] leds: deduplicate led_init_default_state_get()
Date: Tue,  6 Sep 2022 16:49:53 +0300
Message-Id: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_065004_150690_C3DACAF0 
X-CRM114-Status: GOOD (  10.31  )
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


