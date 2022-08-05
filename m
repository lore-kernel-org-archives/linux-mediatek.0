Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B230AC25B07
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N25w6OmKovzt8xuscAI6sK2bc+L8VWVuIc8dUanQTYo=; b=lJIJL8zJk0uz3KK+D1mWbR1ROY
	WSF2Fa2ZDbKilTN27SOvIi+H306DfmuzCOw3mPnt0PJPA+L0JlS3AzSRUUXLja+1+U3DHZVBgNnZC
	XBrj9kmx0FB7FH7RZvxnGmsV0+11P2EENrU6tq5w2zCCCGm138Y/9KZGDBHHWSygYNtq4lQTbQpRm
	gFJl6F3fB61Ko2/oxD1zkkHtgTwJ6UVgCxnHnvM/LGfLIXeJLv4WCNW6uUInVaJroc6deLqkPjqH9
	NLjP1LHmED6aqIWDjtshE8jOhy4U7W05xlaBIIQuxjgGSbLDGLgyxljGnYTUmiQdAenE6Gw9HR/ky
	ldpj3u0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzag-00GQrh-5f; Fri, 05 Aug 2022 15:50:22 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzZc-00GQAi-3M; Fri, 05 Aug 2022 15:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659714556; x=1691250556;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gqNuEVUhBCL0H7kHU+gOp/djo7FF1HWO1qrDMH826Oo=;
  b=a+BUL0yOVhI4SPOwciyEape8wW3CsaJErlUcNpLCLdS+gaF5C2BZHirc
   6yFEn3wwc31AZNHU/oFda1Hbn/zuDmI3QxwAzTYygYtGPEh1Gwr1OqDwH
   V6pXE1VVMiYY66+tPekuS9yys/iyiHjgOy+w6jYsLDTLbZ3YPMQz+pHTf
   lnGbJ4xQctFx9UDiwcCTGzaEns/7Hb4D9N90+LyvmAW1pOTFkjx0eWO/r
   7Ga68mFxWg9twNb4h64dYN7nYEQwkJUkLEDY44QjrjdYkour8DnyNGHyg
   ME4Jf82VksShd4vwhoV+afnz6DBT1yU6Ex21kjwZfrLzPTe3IRKZaVTdq
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="351943664"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="351943664"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 08:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="693037565"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2022 08:49:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 899CAF7; Fri,  5 Aug 2022 18:49:16 +0300 (EEST)
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
Subject: [PATCH v2 00/11] leds: deduplicate led_init_default_state_get()
Date: Fri,  5 Aug 2022 18:48:56 +0300
Message-Id: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_084916_230697_06EA721F 
X-CRM114-Status: UNSURE (   7.93  )
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

Chnagelog v2:
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


