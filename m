Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A45C021A4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2025 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGwqRrngO2Foo2goMrz72HuW0nDLR4AAI41xs9dL7gU=; b=rgnfzo1qyQ7WJAwHtrtJO6T/Wq
	Djo/myIwMxbaIBM3KkwiSWObxDKmDBOs4qJ1Ln0yQ1CW/imaJhqGE9U2guBz9RGM96pe3iecDjqc7
	UE56H+5amf6EKAaf3e7VoOsjPfLNbcBWQKPqZVfxA+T0OT5AJLCJxMyXR4P3KxCxffUOIOD8QONBU
	8b4UwJMPyQayDV9NMckBrzpGTUF0QzWJ2sC8DyvTwiMHVquP5V9YTP27gbTPldUvX4AIeCAd/l/o6
	53ebKfHrCQ2w++XTzfyv6eTQDd+pILCAnVpy83D60capSd8iMc57fm9syMQIjUkPUvd9fU2gDG9LD
	YX8ijzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGF-00000008EZU-2X9J;
	Wed, 12 Feb 2025 17:10:55 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFgf-000000086Hu-3mNt;
	Wed, 12 Feb 2025 16:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378050; x=1770914050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cFAmhZLC1N9cY0krqeopnZfqHOnQfFAHi/9obr5Jw5o=;
  b=YnijgBndOLCFzg4f8Ux1HmfjEAZ/rtKMZhJELxQoMf/njunv/OZJvxtq
   tGmbWTO/wYsy66dD3OfL61oFhb2l1FoD2QUtlfXTN/fYlcd90OgAFv0hN
   H1G8dGDjyuDCknJOv2WGh1zJ13bByqoxLZMZy2SR8tUiXY6L0FKCRnzeo
   E1/fG0QWF1d30dhqV0UJcXt2/3f0dKh+4hPvHTYUIaaIe39u6g2Rx3w0p
   Rn66e4G960OcNEKGFy21JbtmG+8pFX2uLLqIscN/7ivCKiWKJz7T8gXCY
   PzK0wo7uLR2E5OINMigT0ptqVyrsQ13hxNdOum1VLRmCcS6m6lVMVa086
   g==;
X-CSE-ConnectionGUID: 6Jt1oqM1TxSWR6iXFnzDXg==
X-CSE-MsgGUID: Q1AZTA+/TqS81p1S6DWcYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032356"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: bkY3AmBeToa/2bmPgYXaGw==
X-CSE-MsgGUID: q1C7xXqvRNyam24tlM4+2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879146"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C33142CA; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 3/8] i2c: bcm-kona: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:28 +0200
Message-ID: <20250212163359.2407327-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083409_978614_D2279D6E 
X-CRM114-Status: GOOD (  11.90  )
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
 drivers/i2c/busses/i2c-bcm-kona.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 340fe1305dd9..f8826e2d3ec2 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -470,14 +470,14 @@ static int bcm_kona_i2c_do_addr(struct bcm_kona_i2c_dev *dev,
 	unsigned char addr;
 
 	if (msg->flags & I2C_M_TEN) {
+		addr = i2c_10bit_addr_from_msg(msg);
+
 		/* First byte is 11110XX0 where XX is upper 2 bits */
-		addr = 0xF0 | ((msg->addr & 0x300) >> 7);
-		if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
+		if (bcm_kona_i2c_write_byte(dev, addr & ~I2C_M_RD, 0) < 0)
 			return -EREMOTEIO;
 
 		/* Second byte is the remaining 8 bits */
-		addr = msg->addr & 0xFF;
-		if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
+		if (bcm_kona_i2c_write_byte(dev, msg->addr & 0xFF, 0) < 0)
 			return -EREMOTEIO;
 
 		if (msg->flags & I2C_M_RD) {
@@ -486,7 +486,6 @@ static int bcm_kona_i2c_do_addr(struct bcm_kona_i2c_dev *dev,
 				return -EREMOTEIO;
 
 			/* Then re-send the first byte with the read bit set */
-			addr = 0xF0 | ((msg->addr & 0x300) >> 7) | 0x01;
 			if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
 				return -EREMOTEIO;
 		}
-- 
2.45.1.3035.g276e886db78b


