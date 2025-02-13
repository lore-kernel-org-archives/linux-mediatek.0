Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016B8C021A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L00yv+aCRPCy/uxHl9DwI+k9kYoRHtApHlRgkttTsCs=; b=rV5assi7WDNds2N89Jk/pr5Rot
	17IVtDc9iRYx6XUKy9CTOG6NJhMYFdtab00aVUUAMy3jecEnvL0ZF7yHWJi9z1KevRmpo5vRNIpWU
	PgV38Dt11aBAvNUXimo9TPOLHfnShIz0SYfeOkV9v2tNS+O5pDgZPTpSimh9vf3T9sxPm8sxp5YoS
	IUnKRJ43vXamd6x6nT44bGj77Y7ZFnE0g8YyrSGOhShkB3jjKTkWhF46g/YsUF4hmsNXD1+ZUad22
	h25I7nmwm0c6UyLoUsVZSiA/is6yKuBGVj1jQx2QPL6fdJdS4C4ZcdB7LSk0wGcdTl7C7NOZ1ji37
	3CS7s0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIN-0000000BL7y-2iPC;
	Thu, 13 Feb 2025 14:34:27 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvc-0000000BGnm-1ajB;
	Thu, 13 Feb 2025 14:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455857; x=1770991857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ayFkGzSgHATsYNHDJUcvnqqtd8yZvVr8eovxy/IOis=;
  b=PbPaKtj4tAQLjoB+RZXCuv+3pRIzr+MHkOXLU39X4WVqZOKi8hXScSui
   Iwjbeja7pLGCtYUKSg/hRJnEqD0Wuc14A9bs4p1P6H2Z9S/8bDw1A1Yzf
   VGWO0FS18yWzEYBhvjTO0X6Yvmaxu9PAPYABKRAbUL3aMyPQV4yj87buz
   FEKrx1HScHxhd34pXB3Zay8Erc/7bUrZks+qfqTBiSUJIafgvjV1z9h5M
   BE4NJ9JgGDNFrxxbqcO2QW1LRwep3JCyxi8PkmEGGq2bA89Kn38LLNcYq
   TfiWBLMH/F65Ltotov8unTmgFpDZoswZyeBkBwOre9HM3BasSg6IwFcsx
   g==;
X-CSE-ConnectionGUID: QmiibJ9EQWKL8dChP2HUgw==
X-CSE-MsgGUID: 8N5Luz4wSN2jLoR4SEalyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40273343"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40273343"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:54 -0800
X-CSE-ConnectionGUID: Fg6w4WWGQwiWwz3xKH3QUQ==
X-CSE-MsgGUID: jHiuxOpcTsq10u94SUHpXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113815325"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 431BF2CA; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 02/10] i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:16 +0200
Message-ID: <20250213141045.2716943-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061056_464282_5FA1C843 
X-CRM114-Status: GOOD (  12.44  )
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

Use i2c_10bit_addr_*_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-axxia.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 48916cf45ff7..50030256cd85 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -255,11 +255,6 @@ static int i2c_m_rd(const struct i2c_msg *msg)
 	return (msg->flags & I2C_M_RD) != 0;
 }
 
-static int i2c_m_ten(const struct i2c_msg *msg)
-{
-	return (msg->flags & I2C_M_TEN) != 0;
-}
-
 static int i2c_m_recv_len(const struct i2c_msg *msg)
 {
 	return (msg->flags & I2C_M_RECV_LEN) != 0;
@@ -439,20 +434,10 @@ static void axxia_i2c_set_addr(struct axxia_i2c_dev *idev, struct i2c_msg *msg)
 {
 	u32 addr_1, addr_2;
 
-	if (i2c_m_ten(msg)) {
-		/* 10-bit address
-		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
-		 *   addr_2: addr[7:0]
-		 */
-		addr_1 = 0xF0 | ((msg->addr >> 7) & 0x06);
-		if (i2c_m_rd(msg))
-			addr_1 |= 1;	/* Set the R/nW bit of the address */
-		addr_2 = msg->addr & 0xFF;
+	if (msg->flags & I2C_M_TEN) {
+		addr_1 = i2c_10bit_addr_hi_from_msg(msg);
+		addr_2 = i2c_10bit_addr_lo_from_msg(msg);
 	} else {
-		/* 7-bit address
-		 *   addr_1: addr[6:0] | (R/nW)
-		 *   addr_2: dont care
-		 */
 		addr_1 = i2c_8bit_addr_from_msg(msg);
 		addr_2 = 0;
 	}
-- 
2.45.1.3035.g276e886db78b


