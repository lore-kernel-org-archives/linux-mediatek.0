Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CE2C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:29:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B2D208E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:29:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pf6PDXmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01B2D208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vfoyDVT3w6+ZqVaHa6jLPZiaTBDkWnO2nxuZXS+bMR4=; b=pf6PDXmP/nxhV0b+WYVAzLIu26
	F8Ipbv6Ed2hQEFOy05CGpziWBj2kpkKH3a7UO2WQvIGY02NxArZQoYoolPvHFaTsPrJ5XxmBjuAxz
	9MjV5XahYzTPIOCQXuCmzLIHE3/gzoeGQIIxl0QstctQjY6eb0Pb0TryUvZBVGyQ99gxvin0fn+2Y
	wZIjcAVA6GGpEgFZDPXowFa+w4Bg90V9WHmJKI+D1DhzITDpVX/5B8ocZr4hwIFjb1ANgj9lAOX4c
	+ICAK40IawujRCo4wwEUyk0syD1ll33KyySk2kLXg+tqIvuEPAs8NzFUjO2+tO6UwEKOC/7a7Hiyq
	B1C3UHWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQNN-0004EH-OV; Thu, 10 Sep 2020 17:28:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQNE-00049H-MF; Thu, 10 Sep 2020 17:28:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 3C01029BB05
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] soc: mediatek: pm-domains: Add new driver for SCPSYS
 power domains controller
Date: Thu, 10 Sep 2020 19:28:14 +0200
Message-Id: <20200910172826.3074357-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_132840_807607_F177C2FB 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 fparent@baylibre.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear all,

This is a new driver with the aim to deprecate the mtk-scpsys driver.
The problem with that driver is that, in order to support more Mediatek
SoCs you need to add some logic to handle properly the power-up
sequence of newer Mediatek SoCs, doesn't handle parent-child power
domains and need to hardcode all the clocks in the driver itself. The
result is that the driver is getting bigger and bigger every time a
new SoC needs to be supported.

All this information can be getted from a properly defined binding, so
can be cleaner and smaller, hence, we implemented a new driver. For
now, only MT8173 and MT8183 is supported but should be fairly easy to
add support for new SoCs.

Best regards,
  Enric

Enric Balletbo i Serra (4):
  dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains
    controller
  soc: mediatek: Add MediaTek SCPSYS power domains
  arm64: dts: mediatek: Add mt8173 power domain controller
  dt-bindings: power: Add MT8183 power domains

Matthias Brugger (8):
  soc: mediatek: pm-domains: Add bus protection protocol
  soc: mediatek: pm_domains: Make bus protection generic
  soc: mediatek: pm-domains: Add SMI block as bus protection block
  soc: mediatek: pm-domains: Add extra sram control
  soc: mediatek: pm-domains: Add subsystem clocks
  soc: mediatek: pm-domains: Allow bus protection to ignore clear ack
  soc: mediatek: pm-domains: Add support for mt8183
  arm64: dts: mediatek: Add mt8183 power domains controller

 .../power/mediatek,power-controller.yaml      | 173 ++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  78 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 160 +++
 drivers/soc/mediatek/Kconfig                  |  13 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-infracfg.c           |   5 -
 drivers/soc/mediatek/mtk-pm-domains.c         | 952 ++++++++++++++++++
 include/dt-bindings/power/mt8183-power.h      |  26 +
 include/linux/soc/mediatek/infracfg.h         |  39 +
 9 files changed, 1433 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
 create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
 create mode 100644 include/dt-bindings/power/mt8183-power.h

-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
