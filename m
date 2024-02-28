Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F6EC54E55
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hwkAdrwRbHNCg5KLb9w/kCADl9Kl97anrzYkBA0r/Ns=; b=e9D64v7ATY1F3AjdJQiYEWHht/
	XoEudbFIIEeq749Hi1neyS0m/Mz4zhVkeeDzBoJwDzy7opdWGvGaM+3IjpDcXg3/tlzXWOw7eH2EE
	MMezodtckScBUNw/yJTqIWyNXsRV7k96A1Ob3h84KggaaiB4rzPyTtEGG7iNxxVIzZvF/Y56fe6ep
	POmtO7h0BpEF7x4K+CvuEIF3Y1lwgRtCcO0IBRkWZnRrgp/rIaM/yJJr3w31RhLhm6uPIMnVDaLF7
	JJ6duCOwKSbolZBKyRxHXfMNpGvjQTJDbo+boBjVRAMQu1rCZWpnWFlW+iTLiDD9gAJABGqtjwzqU
	SlkRHhtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfQ9U-0000000AnDN-0p4X;
	Wed, 28 Feb 2024 20:03:40 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfQ9Q-0000000AnBx-13r5;
	Wed, 28 Feb 2024 20:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709150616; x=1740686616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vtCymdQDVWcDC54rcsZA1PscbDVRCdc3nAdb+7GntDA=;
  b=IOfSTkI8fRF/ZiGGfJgY3hn2r5e17mR42/9Yj/ANqfE9vlyaZBIti8zr
   fYVPKcpoZdLj04kBonpZpdy2HKX/6iK2s74cXGoH2940M1FQSyRYXypIl
   lF/dDX2nNqWEIr5PMzeORirDBaOMw3ZcODAcI+xXleoLIXsfqD5UculCH
   VKUIB8k4tcky18lPrZrVfX9iKO5hh8GS8Cy9e185mW8zj1hJ3MmNawI00
   Kwknfi6bUHUM6dY9IGZTDIE3rv+45t/VMMSWKn/z6f1+OGbM05ZwHi6NP
   PuO2+vnQgBq7EK+dF+p9rsD7hHmxdqf4OmvNPKR3VsW+W1rw5W3wJEjIz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21122846"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="21122846"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 12:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937034615"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="937034615"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2024 12:03:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9F62E1C5; Wed, 28 Feb 2024 22:03:28 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Felix Fietkau <nbd@nbd.name>,
	Alexander Couzens <lynxis@fe80.eu>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH wireless-next v1 1/1] wifi: mt76: mt7915: Remove unused of_gpio.h
Date: Wed, 28 Feb 2024 22:03:21 +0200
Message-ID: <20240228200321.3607764-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_120336_324644_0BAC30D0 
X-CRM114-Status: UNSURE (   9.82  )
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

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it, simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index f5b99917c08e..90a6f61d1089 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -7,7 +7,6 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/of.h>
 #include <linux/of_reserved_mem.h>
-#include <linux/of_gpio.h>
 #include <linux/iopoll.h>
 #include <linux/reset.h>
 #include <linux/of_net.h>
-- 
2.43.0.rc1.1.gbec44491f096


