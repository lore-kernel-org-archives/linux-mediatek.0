Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517D4C433FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:41:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0D52074F
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:41:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vhaibDQd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ja5QYC4l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B0D52074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o/rw8iZs/0gIkPNfv/VnN42b7hxuq1EG9y2tvyY1l10=; b=vhaibDQd2/3hJkM29zyU0PG0tN
	oSfSuDvaYdkqeVRjuNJzZBTOttMLfEcw26pcxBi5tqwiCEglTDvlWtxZGqKAwNijFG8lVwWkSie7v
	XabriWk8h9t0aY8AjtT7bVMi5a2ApCc/z80fDLPCB12qdKbD3Mw1wk9toNzNJtPvaNF7lTCerMill
	8RUogMaVsvLlWI6zDsATq96/1Md/QCIXePI2PEFc2/usdS4hbB3QvfIsbElNzMr3EEMWFzwKsYIOI
	mxYtCBCnyZ5xsWfvV5lJ/ba/bfo+Ur1C6GJ7KsKixroaEMgiZMO+cRrpyNkkHrUnn9YKtolF1ywHk
	4pQvovUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysKX-0001rs-Vu; Fri, 24 Jul 2020 07:41:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysKM-0001lS-SG; Fri, 24 Jul 2020 07:41:11 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BD6A20748;
 Fri, 24 Jul 2020 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576469;
 bh=3lgctBuMSwmCcemQq9jFrUjrBOpIeyognmI/+EIutJk=;
 h=From:To:Cc:Subject:Date:From;
 b=Ja5QYC4lOamnyMBLRzYV7lqWcyvxxoSz4naHQr9MzmU8VPlgpt3l3b4AbU+pq5tH8
 lwYyAGpX5tMvECUQMPk9rwgzpJDXtR+uq7qRzkvT7hHmo5qpSqOPR1565SdXmpbV1v
 Rxb7lvvMZAuo/08hNQtrOp84yzNRnN9V16KXMGwY=
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
Subject: [PATCH v2 00/29] *memory: Cleanup,
 improve and compile test memory drivers
Date: Fri, 24 Jul 2020 09:40:09 +0200
Message-Id: <20200724074038.5597-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034111_112456_B1167562 
X-CRM114-Status: GOOD (  15.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear All,

Changes since v1:
1. Few new patches,
2. Please see individual logs (per patch).


The drivers/memory directory contains generic code (of_memory.c) and a
bunch of drivers.  Changes to generic code were coming usually through
different trees with the driver code.

Over last days, memory drivers grew in numbers but not necessarily in
quality.  They lacked compile testing and code cleanup.  Also lacked
maintainer.

I would be happy to take care about this part.

If there are no objections, I will collect the patches and push them
through arm-soc maintainers.

Driver-specific changes in the patchset were only compile-tested. Tests
are welcome. The generic code was tested on ARMv7 Exynos based boards
with a exynos5422-dmc memory controller driver.

Best regards,
Krzysztof


Krzysztof Kozlowski (29):
  memory: omap-gpmc: Remove unneeded asm/mach-types.h inclusion
  memory: omap-gpmc: Remove unused file-scope phys_base and mem_size
  memory: omap-gpmc: Include <linux/sizes.h> for SZ_16M
  memory: ti-aemif: Rename SS to SSTROBE to avoid name conflicts
  memory: jz4780-nemc: Do not enable by default on every compile test
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
  memory: mtk-smi: Add argument to function pointer definition
  memory: omap-gpmc: Return meaningful error codes in
    gpmc_cs_set_timings()
  memory: omap-gpmc: Remove GPMC_SET_ONE_CD_MAX macro for safety
  memory: omap-gpmc: Fix whitespace issue
  memory: pl172: Add GPLv2 SPDX license header
  memory: tegra: tegra210-emc: Fix indentation
  MAINTAINERS: Add Krzysztof Kozlowski as maintainer of memory
    controllers
  memory: fsl_ifc: Fix whitespace issues
  memory: da8xx-ddrctl: Remove unused 'node' variable
  memory: Describe the MEMORY Kconfig entry
  memory: samsung: exynos-srom: Describe the Kconfig entry

 MAINTAINERS                                   |   7 +
 drivers/memory/Kconfig                        |  47 ++++--
 drivers/memory/brcmstb_dpfe.c                 |   5 +-
 drivers/memory/da8xx-ddrctl.c                 |   2 -
 drivers/memory/emif-asm-offsets.c             |  10 +-
 drivers/memory/emif.c                         |  23 +--
 drivers/memory/fsl_ifc.c                      |  30 ++--
 drivers/memory/mtk-smi.c                      |   2 +-
 drivers/memory/of_memory.c                    |  28 ++--
 drivers/memory/of_memory.h                    |  21 +--
 drivers/memory/omap-gpmc.c                    | 155 +++++++++++-------
 drivers/memory/pl172.c                        |   5 +-
 drivers/memory/renesas-rpc-if.c               |   4 +-
 drivers/memory/samsung/Kconfig                |   7 +
 drivers/memory/tegra/tegra210-emc-cc-r21021.c |   2 +-
 drivers/memory/ti-aemif.c                     |  16 +-
 drivers/memory/ti-emif-pm.c                   |   2 +-
 17 files changed, 208 insertions(+), 158 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
