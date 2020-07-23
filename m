Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EE3C433E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:38:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FDC320714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gMo4gQvC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIBNePcf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FDC320714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QU7eskGvcLyytmRND3Am0JITCrN/j5KM7YdJJEa8H6Y=; b=gMo4gQvCrO3i0MnKozGavxu/RL
	/eufCPMb8mqsyO5H2flsHmSbHM6Cije1M3Lq0p3JmN+m2w1f8IF7g2pAHfvIhgYbJROoCsn6kiIqr
	SMuKGQdhMOiN100YkYrutU0WXh4hGHEJpHIcg4sXJ5gi583ieQFr1+YNo9wxn1qVSsbjoEywgSz8M
	ZOfw2yp+4ZWVrxzz2Q9xinOG93jTxKAp8nqrXb/K5EfgSTgVvo7X9JTW5khKZpqzi3OHghzQBiHwz
	2/l1eoT1rWfxonWOPNFJ8jJt8UnEpK0UUaXPs1Fn6mNGdeKMowMmfZpWgi21Kf1+xviIUZg8pCP8s
	7HUlkSXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVnu-0004ZS-12; Thu, 23 Jul 2020 07:38:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVnn-0004Vu-9s; Thu, 23 Jul 2020 07:38:04 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4AB0208E4;
 Thu, 23 Jul 2020 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489882;
 bh=YIxz/o253j44qkEYIrfeQA61qF/hiWPJNnP0C/MPLu4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LIBNePcfYyblAVEJonBePvIsCQV+OlxBUmLHx2LcCC9pa6sBZfMxsnKh8+jWL6cDs
 F5PKlmVwcThX6fGVXXJ8A1o32kAHafz0/aKEj+7osGz+zFMc6SmmUZ6OwKDWoX+lv4
 ZDtyTgRrDdhHaMtn+4RTrLXd6DRRyGks+ufgtZhM=
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
Subject: [RFT 01/23] memory: omap-gpmc: Remove unneeded asm/mach-types.h
 inclusion
Date: Thu, 23 Jul 2020 09:37:22 +0200
Message-Id: <20200723073744.13400-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
References: <20200723073744.13400-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033803_474532_AF38107B 
X-CRM114-Status: GOOD (  12.74  )
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

The driver does not use macros from asm/mach-types.h (neither MACH_TYPE
nor machine_is_xxx()).  Removal of this include allows compile testing
on non-ARM architectures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Please kindly test.

---
 drivers/memory/omap-gpmc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index eff26c1b1394..fc08b5292932 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -32,8 +32,6 @@
 
 #include <linux/platform_data/mtd-nand-omap2.h>
 
-#include <asm/mach-types.h>
-
 #define	DEVICE_NAME		"omap-gpmc"
 
 /* GPMC register offsets */
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
