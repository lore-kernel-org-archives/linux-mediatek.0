Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49111C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmLKp7FVT23rM1wZEsmfnt5tkjZaymDOMcMzkzhwsRk=; b=A1t8ATMMesrFfD
	5orsxiC+pzPNz5BtAFqokxLXEPqBMMasSoocRnK98mlATAY349tHfQuRb93HGqIb/99dKncQWUiU5
	0xkbdzAZP4g0RuCM1iSbPxSGXq0fI+gcPqTMCpgheua+erA9931NnY6wyrOGL1PbULcLKlNiGh5nZ
	FJvG0L0jcF+YlsyYS17+Vk6NKWcKWGlEQQDmr/lIavkfnUI66ZBq/UgCdPTRfFrwq/DDo5oJEAhbv
	JPpnvHQ8jc2stnxCQhTsc7Qy3wVr14eShwrJkjC5KzP2zlM17cJdm9NoOfWnmTyfsntvqulFRcWIh
	TrFhENCrrkOiMl16qimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAAHQ-005Ri7-Dz; Wed, 19 Jan 2022 12:41:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAAHN-005Rgg-RF; Wed, 19 Jan 2022 12:41:35 +0000
X-UUID: a5d25a3c209e48839d5693f80df34ef2-20220119
X-UUID: a5d25a3c209e48839d5693f80df34ef2-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1714538481; Wed, 19 Jan 2022 05:41:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 04:37:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 20:37:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 20:37:14 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH 1/1] clk: mediatek: relicense mt7986 clock driver to GPL-2.0
Date: Wed, 19 Jan 2022 20:36:58 +0800
Message-ID: <20220119123658.10095-2-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220119123658.10095-1-sam.shih@mediatek.com>
References: <20220119123658.10095-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_044133_909668_925C463E 
X-CRM114-Status: GOOD (  13.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The previous mt7986 clock drivers were incorrectly marked as GPL-1.0.
This patch changes the driver to the standard GPL-2.0 license.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 drivers/clk/mediatek/clk-mt7986-apmixed.c  | 2 +-
 drivers/clk/mediatek/clk-mt7986-infracfg.c | 2 +-
 drivers/clk/mediatek/clk-mt7986-topckgen.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index 76c8ebdeae96..98ec3887585f 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-1.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2021 MediaTek Inc.
  * Author: Sam Shih <sam.shih@mediatek.com>
diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index 3be168c34fc0..f209c559fbc3 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-1.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2021 MediaTek Inc.
  * Author: Sam Shih <sam.shih@mediatek.com>
diff --git a/drivers/clk/mediatek/clk-mt7986-topckgen.c b/drivers/clk/mediatek/clk-mt7986-topckgen.c
index 8550e2be7773..8f6f79b6e31e 100644
--- a/drivers/clk/mediatek/clk-mt7986-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7986-topckgen.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-1.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2021 MediaTek Inc.
  * Author: Sam Shih <sam.shih@mediatek.com>
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
