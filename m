Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADA1C021A4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV0p5iPcqkCpfpPYXywN3UKal1pFBhYVTMWN4O+ykYE=; b=Qrx2zEvYEOFLBZ3vAGqG1l5Krt
	SbXI00uXpOmR6ipx0DDMiHBP5JG62DPN1EJsEWeSEzwiQ575qQUdn7EpDT7QeNMXpLAZ8+rSbpqyM
	C279xrKDXmjZ4klgjiPjkMH+RgoLAwS8SrzjP1ebCfc9UXN+Ldj+TNvtk2ObnYn3hCvDDa6ktRIoK
	/fFxXgv6ghGOCLNDeZSb0+U2Rv9ZcS3pGEX5zW1994Mx3AO+RBKYRKEqrV+MptvMEQmk3eKLs5oZI
	eVtHnZwuPXBjtnNT54ZyN+NImAHyE7tkoiuQ5xZEvB2xucDGVxVTIsv+ltHy8mvcU94Nov4Q8k1Lo
	6gAteVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGJ-00000008EfY-0u3u;
	Wed, 12 Feb 2025 17:10:59 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFgi-000000086Hu-3ZX4;
	Wed, 12 Feb 2025 16:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378053; x=1770914053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R5mEhGWTo6M3w0F741dBYLgdNEX23+SYVxfBs3QbmrM=;
  b=R0IZX30lJn8LAjiaOSWEmlUvPrOTJpR1LRYdoe41TPMc4w1YPMoQqrMB
   pRzTxbMP5nMjPjTMH+uFbIir0683KT8+eYvUaq53xkYtSBX4Tnp4vH4BO
   qtcKTcm9kRcx/zZ/KgltjkoWFYSl/AFuZeJsEUdc6bT2gq7nDk50T/o1N
   xgxD5CipYe9vhYjphEuj06NlUCsRTnIJlk/IPLhUexgmJCGl/ovx6GjiH
   gUGIJMrbBdlwEWaL/azt4BtrlypQERTnWZjcaYmkLGSPfrIHQk2OJ7ulE
   jGWNmCStt8jE93tQnkcWPlluCIyfdF4txmtbOcYmC9LPFnLUfvS64lAZu
   g==;
X-CSE-ConnectionGUID: n9SzTDMbTAiUCpeJr2xywQ==
X-CSE-MsgGUID: W80sE5YvQ12MVxmT0d42dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032387"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032387"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:13 -0800
X-CSE-ConnectionGUID: jWJsVpz+S6CetFgqQaumcw==
X-CSE-MsgGUID: jyAYbCBiTU+yhgP+2k/P+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879159"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ED65B4AE; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v1 6/8] i2c: mt7621: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:31 +0200
Message-ID: <20250212163359.2407327-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083412_937100_A2729BF9 
X-CRM114-Status: UNSURE (   9.83  )
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

Use i2c_10bit_addr_from_msg() helper instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 2103f21f9ddd..125dc91fb329 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -164,10 +164,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		/* write address */
 		if (pmsg->flags & I2C_M_TEN) {
 			/* 10 bits address */
-			addr = 0xf0 | ((pmsg->addr >> 7) & 0x06);
+			addr = i2c_10bit_addr_from_msg(pmsg);
 			addr |= (pmsg->addr & 0xff) << 8;
-			if (pmsg->flags & I2C_M_RD)
-				addr |= 1;
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
 			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
 			if (ret)
-- 
2.45.1.3035.g276e886db78b


