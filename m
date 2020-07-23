Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF56C433F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:43:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9CFA20714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:43:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JeSjpnVu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGZDJru6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9CFA20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Y0Goj0cV5NU42Ha9oIKYGJsNKHWZC6ViTnyzqYr34Y=; b=JeSjpnVu788rLPOV4tUGQyvnFU
	BPgHeee64fXfBRV60JPAFJSfuXVB9h/QCJH6kzpkzl0AY1h/FFuGm7tv621nd7XLcA7eUEg0duwVC
	fd3Qm42IS78VzD+s3XjdUw8AL0Pms8L3imNhdSHEN2ZxLPMOVoL8Efl7d8M6TYzNR0Hithyi3Isis
	vi9bLwHoHjWFwjpfKOgJ8sS/2ngrnkh5lVIX0fbkFlyBcB5zz7L3Mg+YUMVD1ZxmgkSn26uN2lVw0
	hc/64sdCii3Ogpef9qCYff1Rb5W8rzvLgiKUewoKzJCvT5R5DAbChv87avs3/d7n6Bd2emO6AZoMT
	bexs+N9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVt4-0007nZ-OI; Thu, 23 Jul 2020 07:43:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVpU-0005NM-Jy; Thu, 23 Jul 2020 07:39:49 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84D0E206F5;
 Thu, 23 Jul 2020 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489987;
 bh=+gFjDJ7e8jqodH9leHcZ6qQN7ZQWC5AX9izX5256A2o=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CGZDJru6XZ48EUhU5RmNl5E/jhoRB6YA/A7IrFAgGxDUy+/a0VEV4B3vpsRpZSLhL
 60jcFyrCWX5wmfWJB9K4p3Nfvkcyu4EIzraehjM1DQ/p/mgZfMI0f+QmgjmnU+al1z
 rq0erCoFDgVgyd9dhFd9cdar7pivpHcQrPGOL47s=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 21/23] memory: pl172: Add GPLv2 SPDX license header
Date: Thu, 23 Jul 2020 09:37:42 +0200
Message-Id: <20200723073744.13400-22-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033948_752344_22E9E8BC 
X-CRM114-Status: GOOD (  13.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add GPLv2 license header and remove GPL boiler plate text.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/pl172.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/memory/pl172.c b/drivers/memory/pl172.c
index ff57195b4e37..084891eb29cc 100644
--- a/drivers/memory/pl172.c
+++ b/drivers/memory/pl172.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Memory controller driver for ARM PrimeCell PL172
  * PrimeCell MultiPort Memory Controller (PL172)
@@ -6,10 +7,6 @@
  *
  * Based on:
  * TI AEMIF driver, Copyright (C) 2010 - 2013 Texas Instruments Inc.
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/amba/bus.h>
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
