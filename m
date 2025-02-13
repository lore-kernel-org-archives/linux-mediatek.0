Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23532C0219D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibk3pm/8Z7R5Zv+AvpY7KcpCbq5aAL+yQrjPGu6Mm3s=; b=ExNp6GYZ3jpK+1gk4scCw++Vjw
	k9Hjlxc39E5jhcnNVvrgHZGG4u9JhJsmxtR/YrCMUdQHZlMMJb4iVhYbVF89KR0MV581N3WTu5u98
	i56zuuyYxbgGPHrqNgNvxK51FjcYQGH9/6gFUtclyA1w69l2pctfVyafC9+GPfney49cgrz7Uy6+h
	N2tDiT6CqBsKv5y6PK0y3Pum0Ee85SOIVfIWakHIes/A7zmkg2slMdS4vndYWQ1d2awomc5Dmxg0X
	x4Om0vy3ZXW0fGiIF8ONogjLD2shxs/03aE+w2I3wuIJasvDMn2fLOEKuL8QPI8fqslzn0rVk9Gp7
	AAuYvtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIh-0000000BLjg-3X3j;
	Thu, 13 Feb 2025 14:34:47 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvh-0000000BGrf-1w3w;
	Thu, 13 Feb 2025 14:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455862; x=1770991862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lv1tv82hXtQIfwGuvcKrMPsoiMB8uNGpqj8IbWXXAh0=;
  b=lxeu3qN7+kP72Xz4ley2I6YzHvJfNS9/0N6OWfI+CQyMJLLrvb0GjLQe
   B69PiAmOoKoPE9NJBbSjFPO8IWivftoZDCh+Hgak8NOI8wPTaTYll7fEs
   gIiwQr0Paw+YCLg3rFAPzulZILUqheURygK36KtOk0smDc/rWfYhBmxZq
   8kSU5uaiSccN+StOXouVYnIzQEPl5TMjl1qHwSQRl5O/8fYAXC4l0KeFT
   w1OycDcuRwSKEdYR+SEFsicqEWheYEC+OIlwIh5xQ0+0CjPuyhZiaFV/q
   h9PlkwsviLGUiNBMJ23yR9Ekaz1AVg8BDWlb+T/zqwk3Y/i7sIwxMCWD8
   g==;
X-CSE-ConnectionGUID: XgKRpdTKQnavhODkrMNalw==
X-CSE-MsgGUID: S2RWKCdVTk2/EtCF1OUe3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40022183"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40022183"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: n3V6PYqWS0S8C5PXMH2KjA==
X-CSE-MsgGUID: g0HtOaHJSpCzdWcGox5aEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117777629"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9E6334D1; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 09/10] i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:23 +0200
Message-ID: <20250213141045.2716943-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061101_537896_8BBE090F 
X-CRM114-Status: UNSURE (   9.91  )
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

Use i2c_*bit_addr*_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-ibm_iic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index c76c4116ddc7..6bf45d752ff9 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -512,19 +512,17 @@ static int iic_xfer_bytes(struct ibm_iic_private* dev, struct i2c_msg* pm,
 static inline void iic_address(struct ibm_iic_private* dev, struct i2c_msg* msg)
 {
 	volatile struct iic_regs __iomem *iic = dev->vaddr;
-	u16 addr = msg->addr;
 
 	DBG2("%d: iic_address, 0x%03x (%d-bit)\n", dev->idx,
-		addr, msg->flags & I2C_M_TEN ? 10 : 7);
+		msg->addr, msg->flags & I2C_M_TEN ? 10 : 7);
 
-	if (msg->flags & I2C_M_TEN){
+	if (msg->flags & I2C_M_TEN) {
 	    out_8(&iic->cntl, CNTL_AMD);
-	    out_8(&iic->lmadr, addr);
-	    out_8(&iic->hmadr, 0xf0 | ((addr >> 7) & 0x06));
-	}
-	else {
+	    out_8(&iic->lmadr, i2c_10bit_addr_lo_from_msg(msg));
+	    out_8(&iic->hmadr, i2c_10bit_addr_hi_from_msg(msg) & ~I2C_M_RD);
+	} else {
 	    out_8(&iic->cntl, 0);
-	    out_8(&iic->lmadr, addr << 1);
+	    out_8(&iic->lmadr, i2c_8bit_addr_from_msg(msg) & ~I2C_M_RD);
 	}
 }
 
-- 
2.45.1.3035.g276e886db78b


