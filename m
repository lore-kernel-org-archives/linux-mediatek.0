Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E210C18E72
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUVZ0wFrqJikE0QtLq1GH8srmMlSSJirhm+9jh0ToEM=; b=cFrDT6nZfWOCqRpMJt8XK4h5eZ
	m6+0VlePqVJ9SsmoQ+6fSeXaTjJkFao2cp50XCcRpN9zJlkWeKeSUREDGIBr3zLj+gMinl/czA6jC
	Tc7H7ro2GgyVSGwPDTSRo0+WHi2FS15BjryLxbNkDdYbXaqnE1qmAt1otzoPvGnkVCgdhJeGcd93x
	8m+oKbSOlZ6RdNoEanx5XijC8jaNWV+stFk82fry9ROq+Q+ZdHCAIR13GatuFNPP9QJl6EBmBvyGY
	LY/hEj3Mrzd5c5aB8r1ORytSynJaLAqOirYVN8A/obAIiVBbq1L7xiUpD76duxp8b4NodmLaktxuL
	qeK0c3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLmK-00000001H4O-01xZ;
	Tue, 23 Apr 2024 19:26:08 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLlu-00000001Gr4-3FIF;
	Tue, 23 Apr 2024 19:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713900342; x=1745436342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HTsoFANv6JLEmjESsOo2isIzkzhPyuPDbVVy0uob3Zc=;
  b=SeafgxBZNbCLOkYSfxmGaSXFGJzexGrCr0KETGfmc0OQhrttQNwqqaLn
   oLbqQJS+bqhyiPmquj9h6QSNNWmh0GT2+/gZpq3SCx7CDagIn/IHljC7N
   lxOSi9kM7axMP64TeJkKsgShzsfyVCUFnzpr3aEoNZYNR/5wG3KpnrAqT
   COpcY3/o7qIH041PGaYs4Gw5R29veRFqfzO0bWUP6O0GabAXeNsALH0HJ
   IEibvAiMUc7vVS1tELr4rcNN4X8ff2VJuF4w449PEbdvwRQZOoPQ7rEkr
   yYX8a+lY4f81Sn34gLdfXBPts4goY2R+nHhq9eTrbBjV9TZgcnwI42wFx
   w==;
X-CSE-ConnectionGUID: J+yMBAVtQoKNJO+co/F1+g==
X-CSE-MsgGUID: fTt2qPqPSSOkxCSAe1eT1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9613695"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9613695"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:25:36 -0700
X-CSE-ConnectionGUID: jU9dTxssRxCDT9Y4mI+TiA==
X-CSE-MsgGUID: owZMSlD9QfSf3MU/LQ5KuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24440743"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 23 Apr 2024 12:25:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CA0E244E; Tue, 23 Apr 2024 22:25:30 +0300 (EEST)
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
Subject: [PATCH v2 2/3] media: stih-cec: Add missing io.h
Date: Tue, 23 Apr 2024 22:23:09 +0300
Message-ID: <20240423192529.3249134-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
References: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_122542_904931_DAC6FF77 
X-CRM114-Status: UNSURE (   9.96  )
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

In the driver the io.h is implied by others. This is not good as
it prevents from cleanups done in other headers. Add missing include.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/platform/sti/stih-cec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/platform/sti/stih-cec.c b/drivers/media/cec/platform/sti/stih-cec.c
index a20fc5c0c88d..99978a7c8d9b 100644
--- a/drivers/media/cec/platform/sti/stih-cec.c
+++ b/drivers/media/cec/platform/sti/stih-cec.c
@@ -6,6 +6,7 @@
  */
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac


