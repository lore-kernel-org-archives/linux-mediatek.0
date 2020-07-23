Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD35EC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:38:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB6920714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 07:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j7Uftq7s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZC43wIu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EB6920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RtUtjf5FLAk56nT3MdI9Gogur7dJA7ceka3UtUlLEEw=; b=j7Uftq7suWulpfZC5CFCblrC0B
	1md0KhDrtB88cLIscnSU8V5qpX3xZexK5n1Xz/aqGRj4W0y7lECs4PnJSBJE1PcYJyObERGzn/5/S
	KtxvOqbDwfn4m0oLKVXiVfUARF0L0RsE+llCaBmxPjhwl6YmQFzpCvMROXlrmGyVP33+nRUZQ5Njy
	fdQAWwfOFBqF3J13IqQGdVMIj/3uicVY2yzPSveX0cBx7SsmVedhcstURqT7ADu2LsBxZ/hhkF0nL
	fbfkcvtPqQ5y0ygdrj4RAd53tbJez4QNKkWekd0jsNlwU7BPgAYh9CACB7Hehe+Glr9v+46OkjBg+
	WWDc0iKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyVno-0004WP-5W; Thu, 23 Jul 2020 07:38:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyVnj-0004Tf-4c; Thu, 23 Jul 2020 07:38:00 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88516206C1;
 Thu, 23 Jul 2020 07:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595489877;
 bh=Ciivqi1xJsZET2zM3H0pNzeI383fCtgsFNzrdVXmrTM=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=AZC43wIunLm58pMDuE93IO2B+r0bwRnN8wTs1Fe0MDBs0Qp7tiWzueFhqbEM3KEEv
 IqpwR82NiQ+fnFf2vLOxPPfa0+hwpZibikOWK8tedJJiMWcEp8dpzvCUDR0TDNWb3x
 9amCeceyTgua+quMlBq2PNlRh0ZK/7j5hPz1/WEI=
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
Subject: [RFC PATCH 00/23] memory: Cleanup,
 improve and compile test memory drivers
Date: Thu, 23 Jul 2020 09:37:21 +0200
Message-Id: <20200723073744.13400-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_033759_390344_B243305C 
X-CRM114-Status: GOOD (  14.48  )
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

Dear All,

The drivers/memory directory contains generic code (of_memory.c) and a
bunch of drivers.  Changes to generic code were coming usually through
different trees with the driver code.

Over last days, memory drivers grew in numbers but not necessarily in
quality.  They lacked compile testing and code cleanup.  Also lacked
maintainer.

I would be happy to take care about this part.

If there are no objections, the patches could go either to Linus or to
arm-soc (most of drivers are ARM specific).

Driver-specific changes in the patchset were only compile-tested. Tests
are welcome. The generic code was tested on ARMv7 Exynos based boards
with a exynos5422-dmc memory controller driver.

Best regards,
Krzysztof


Krzysztof Kozlowski (23):
  memory: omap-gpmc: Remove unneeded asm/mach-types.h inclusion
  memory: omap-gpmc: Remove unused file-scope phys_base and mem_size
  memory: omap-gpmc: Include <linux/sizes.h> for SZ_16M
  memory: ti-aemif: Rename SS to SSTROBE to avoid name conflicts
  memory: Enable compile testing for most of the drivers
  memory: of: Remove unused headers
  memory: of: Remove __func__ in device related messages
  memory: of: Correct indentation
  memory: of: Remove unneeded extern from function declarations
  memory: emif-asm-offsets: Add GPLv2 SPDX license header
  memory: emif: Put constant in comparison on the right side
  memory: emif: Fix whitespace coding style violations
  memory: emif: Silence platform_get_irq() error in driver
  memory: ti-emif-pm: Fix cast to iomem pointer
  memory: renesas-rpc-if: Simplify with PTR_ERR_OR_ZERO
  memory: brcmstb_dpfe: Constify the contents of string
  memory: brcmstb_dpfe: Remove unneeded braces
  memory: mtk-smi: Add argument to function definition
  memory: omap-gpmc: Enclose macro statements in do-while
  memory: omap-gpmc: Fix whitespace issue
  memory: pl172: Add GPLv2 SPDX license header
  memory: tegra: tegra210-emc: Fix indentation
  MAINTAINERS: Add Krzysztof Kozlowski as maintainer of memory
    controllers

 MAINTAINERS                                   |  7 +++++
 drivers/memory/Kconfig                        | 31 +++++++++++--------
 drivers/memory/brcmstb_dpfe.c                 |  5 ++-
 drivers/memory/emif-asm-offsets.c             | 10 +-----
 drivers/memory/emif.c                         | 23 ++++++--------
 drivers/memory/mtk-smi.c                      |  2 +-
 drivers/memory/of_memory.c                    | 28 ++++++++---------
 drivers/memory/of_memory.h                    | 21 +++++++------
 drivers/memory/omap-gpmc.c                    | 21 ++++++-------
 drivers/memory/pl172.c                        |  5 +--
 drivers/memory/renesas-rpc-if.c               |  4 +--
 drivers/memory/tegra/tegra210-emc-cc-r21021.c |  2 +-
 drivers/memory/ti-aemif.c                     | 16 +++++-----
 drivers/memory/ti-emif-pm.c                   |  2 +-
 14 files changed, 84 insertions(+), 93 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
