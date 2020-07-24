Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77ACC433E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:52:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA882068F
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NeWJ2Y5F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETmX7RHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DA882068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+M2GWCQ8djBneMOP9l6OvkB2Uo+pB9LJdFRfJXBVWh8=; b=NeWJ2Y5FgaHW5KY9FD5N6GksEm
	UBbCkujoffL6EPP6JQgFejOAtgHcRe3AlFKqPEZhcZmUsFl+GI6Lz6ME0o9SeW67bXw8CoOqqIjJk
	QRg/7Gr0lzPSuaJgSP9O8NU/SVoNtiLXTARXPy217Mb4ix+OYieW8o4pnLXQy/CdtM1nfYbfiwLyu
	4IzZjTVdf0PH0dtWKR5ouTUZzRWyXsItvPFu/JMEqhEOQNS6V4rCwftEmv6WLP1/zvsu/ui9hr5Js
	ZOpu4RE9FjwWSq2eyrYJ1txq0ZzagcDOaAchyAbsVh/2wbd/+cYSvZ7/1J23yHWG+mN9SonCu20AQ
	AA5zbuog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysV5-00082B-A1; Fri, 24 Jul 2020 07:52:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysMZ-0002v9-Kw; Fri, 24 Jul 2020 07:43:28 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36E1E2076A;
 Fri, 24 Jul 2020 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576606;
 bh=KtM49i0V08bRy4KEevLt7MwZmAFXsueBkkylkf7FmD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ETmX7RHojUwKnONwYfzjhyrsaZYbAM/T/HeQn7dUgZMaQpjofjgd8OQWOFeFiRggO
 785drOokRYVsZt/75hNUwcI90V7jHkIfrHj8vUTu9hlbERhdeI7VBOJIkpF1y0Tv2v
 MZeaIC1ksmQbMU9OZRMb+bWCwoyPZElcWh9fD7rs=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 28/29] memory: Describe the MEMORY Kconfig entry
Date: Fri, 24 Jul 2020 09:40:37 +0200
Message-Id: <20200724074038.5597-29-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034327_903210_07AC8216 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Write short description about the entire memory controllers section.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/memory/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index c37752d5f26d..ec735794aeaf 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -5,6 +5,12 @@
 
 menuconfig MEMORY
 	bool "Memory Controller drivers"
+	help
+	  This option allows to enable specific memory controller drivers,
+	  useful mostly on embedded systems.  These could be controllers
+	  for DRAM (SDR, DDR), ROM, SRAM and others.  The drivers features
+	  vary from memory tuning and frequency scaling to enabling
+	  access to attached peripherals through memory bus.
 
 if MEMORY
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
