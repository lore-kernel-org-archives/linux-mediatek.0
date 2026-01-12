Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D93C9EC91
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TX2J8YYBdlEdPvmwWWqCg70CNGlWkbtViC4+wM130ig=; b=mFJhbw6FLxzaAH0wirMwQg8tyJ
	aUPqpqiA7ReJbNR2ur8+OSZP0bGHmYR1R1/2Q3oel519aDoc8yozSNMG3nX/gNibb899f9NpHPhPi
	McMjh/vY2x4dncL59UYnIcjLHadVyuqJHoO7KF1oObIdgAMputR39leI4OSKfQHpBs1xQ6AC3Eoqf
	dfYEV7apTAnGGhouIlJi0o0xDaQxge/n3enNZGG38U/Wmu2yUwhAd+/HRu/7tWY7w7+a9piUweuKZ
	1HBbrKc5z4VxV7rAh+o+UhDSmuf7jebHWnrem38X2ZLTWsS5ENtM3/S9NTY9DVPRIZmP2UFRJeMyK
	u7JMT2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIN-00000005Rdr-1JCM;
	Mon, 12 Jan 2026 13:49:23 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIID-00000005RSu-3kYz;
	Mon, 12 Jan 2026 13:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225754; x=1799761754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QQ0qqH3VNmZu+wMQEzW+Nf85tDjOXZ++eEjaIO+FgcA=;
  b=kzK6gpft/gJqPCMc+m/q4Epj05AZPepfNxRQpnH4XzYWqXKYZQ4++Y6v
   advRO5MqXBZw1Dn7xQC46VcQo/rT5kl6SBcwydVREYXX02FHfBkeSci1H
   V/of1q2uGCfiJzCH96fH8m/JOeh72ZkaheddYKr78xvMSWRJGo1dkQ7pK
   8YgmR7TVu2kSdYy/mYfxYU8YQdHrduT9LcJyChcOXK3NdQiTax83JRUS0
   02HbTRpC53ucnLkHl4sQR7c3YtvOepQVU1t8xZmhKKUuksb93PcMKVssu
   LP4uOrxjGNV481FeF6jL/9YXp4FQZpgHBlxlFB3YmNqSi+8rlDWjQ0pa6
   w==;
X-CSE-ConnectionGUID: fyn/f/HHQTuLQlrZhkmAgw==
X-CSE-MsgGUID: M+yYJnAuTX+V5dDCr2gDNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048293"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048293"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:12 -0800
X-CSE-ConnectionGUID: noLH1GPoT2e5iwBFL7qsDg==
X-CSE-MsgGUID: TPNbfTbKTRWsr+6apHjc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618613"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B87469B; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi@smida.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v1 2/7] i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
Date: Mon, 12 Jan 2026 14:46:10 +0100
Message-ID: <20260112134900.4142954-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054913_946775_5F4C6E10 
X-CRM114-Status: GOOD (  11.92  )
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

Use HZ_PER_GHZ constant instead of custom one. No functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 8345f7e6385d..746f65989138 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/string_choices.h>
+#include <linux/units.h>
 
 /* Defines what functionality is present. */
 #define MLXBF_I2C_FUNC_SMBUS_BLOCK \
@@ -72,8 +73,6 @@
 /* Constant used to determine the PLL frequency. */
 #define MLNXBF_I2C_COREPLL_CONST    16384ULL
 
-#define MLXBF_I2C_FREQUENCY_1GHZ  1000000000ULL
-
 /* PLL registers. */
 #define MLXBF_I2C_CORE_PLL_REG1         0x4
 #define MLXBF_I2C_CORE_PLL_REG2         0x8
@@ -1083,7 +1082,7 @@ static u32 mlxbf_i2c_get_ticks(struct mlxbf_i2c_priv *priv, u64 nanoseconds,
 	 *         Frequency
 	 */
 	frequency = priv->frequency;
-	ticks = div_u64(nanoseconds * frequency, MLXBF_I2C_FREQUENCY_1GHZ);
+	ticks = div_u64(nanoseconds * frequency, HZ_PER_GHZ);
 	/*
 	 * The number of ticks is rounded down and if minimum is equal to 1
 	 * then add one tick.
-- 
2.50.1


