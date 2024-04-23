Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19467C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xi3tHaqsx2bqLHpP3fzfOXqy4xfh+LCWS9AnxQWtKfg=; b=aLlFfxlq8Er3oboGwlB1xiUfLB
	4fpsR6fhOsUXlYXSL1OuL0nlUdufgksUba3+ns1ao/VSlUq5FzDzAyCql6Ez2bKZAfdlJdOcDMH+M
	dKbPC2OT5nqcpc9CbDLy8ZLwCjD+t/7dJzVNFstareCVDgN8rqZYB1Hi4vRWs/mLe/itMy4LnYs4I
	geLxL0qR+FGcI7R7bLpJ/KGhEy9qy1470uxyO7SocyMe1mdmy3/aNHzWBQLixnASriNxlKeRagf0f
	/GYTkF3sd/UvL72HT9k2cE58Jk2Jofue6DZR8wpnWFs3YZrGxRac9b9wz7B9hTVDcqQhb6RGhh2Wj
	sT3VdGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLmJ-00000001H3z-2iY5;
	Tue, 23 Apr 2024 19:26:07 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLlu-00000001Goy-2QYP;
	Tue, 23 Apr 2024 19:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713900342; x=1745436342;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2bbhNMcCCiv6N+ewcEN+Y+F2rWYZystG+A1e4eVfob8=;
  b=B3QcU1ICIc3skCE27yz4X6KeH2legAC0YnAcOpeei0oljZwYn6BroGLr
   h9ezBPq0Ss/KcHv5zjoACXbRIx7sGlCuby7p3R/Lf5uAv6euYQozub3hH
   2VQe4H942Aw2pDN7TChljyCyl+ughG5O9zXAydABpkAXr1U9HzC21eOQL
   Bq2etOZrHSsnna4xUWKn/gbRjjRsqu7J6oxuM3Y/LMWKCgvA2dILLZCXz
   QJ9t8Km2DAKo7KuwlDPTwVZlhoTNQFBx9HJP73CY1VkXjcuW7oU/6nBLD
   zAtcd55MdFEd0b/rhVP9zrFrUivqBBmDny7qfu3/0+dBzofXATcWBkZNJ
   Q==;
X-CSE-ConnectionGUID: T0BvyQ4hQWaAdNeqw9l+wg==
X-CSE-MsgGUID: NKSCQFwdRBiYVfJq8NAQIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9613675"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9613675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:25:36 -0700
X-CSE-ConnectionGUID: W01uJp+jRGiHboM8QSfWyA==
X-CSE-MsgGUID: +a6k97EoTvq99nzBVT7nig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24440741"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 23 Apr 2024 12:25:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B1683192; Tue, 23 Apr 2024 22:25:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Sean Young <sean@mess.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stefani Seibold <stefani@seibold.net>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/3] kfifo: Clean up kfifo.h
Date: Tue, 23 Apr 2024 22:23:07 +0300
Message-ID: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_122542_667940_599A526F 
X-CRM114-Status: UNSURE (   8.64  )
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

To reduce a dependency hell degree, clean up kfifo.h
(mainly getting rid of kernel.h in the global header).

In v2:
- rebased on top of v6.9-rc5 (Andrew)
- retested again with `make allyesconfig` on x86_64,
  hence first two new patches

Andy Shevchenko (3):
  media: rc: Add missing io.h
  media: stih-cec: Add missing io.h
  kfifo: Don't use "proxy" headers

 drivers/media/cec/platform/sti/stih-cec.c |  1 +
 drivers/media/rc/mtk-cir.c                |  1 +
 drivers/media/rc/serial_ir.c              |  1 +
 drivers/media/rc/st_rc.c                  |  1 +
 drivers/media/rc/sunxi-cir.c              |  1 +
 include/linux/kfifo.h                     |  9 +++++++--
 lib/kfifo.c                               | 10 +++++-----
 samples/kfifo/dma-example.c               |  3 ++-
 8 files changed, 19 insertions(+), 8 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


