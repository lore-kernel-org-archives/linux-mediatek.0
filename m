Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066D9C47420
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:02:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96DC5208C7
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ma1A5CuR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96DC5208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j9OyN8TpnzZvwzrBj/IFYBu8OJtP/JNYYZwNP8+sijc=; b=ma1A5CuRK1O986NR8xjZVBLF4O
	MhHMGdN25aLAZhwzI7nvuG0Dl5ZIyTL/LdWtgHO/573Tol4fHN1oeEhtksUxgCl/GFKm1eZvrG15Q
	tByLZFVyA4p20Vs1nqvcMKAVWO4Qqa1oJ3ju0EmuNRx/ANxGTCdXyIqRIznDxuvsxO9GhDNOZscnO
	eaodloP8K+SPsusNqmViZGHSN9N4dM0WOMOeTYXNaep9WBAZUg+G+cw1FkaOiJMfnTi05zOHYiJb9
	3exGSH08Orq6RgsQvu3D9AIgrx6Kr5fus3SFX+D3WICgBnCcMXJJVCeABCyNAGoZVJu+PDd4EinsI
	S09hkE7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO122-0008QV-FT; Thu, 01 Oct 2020 16:02:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO11v-0008Mn-BQ; Thu, 01 Oct 2020 16:02:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 910D529D755
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/12] soc: mediatek: pm-domains: Add new driver for SCPSYS
 power domains controller
Date: Thu,  1 Oct 2020 18:01:42 +0200
Message-Id: <20201001160154.3587848-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_120203_475668_57D35C7D 
X-CRM114-Status: GOOD (  17.36  )
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

Note that the MT8183 support is not ready to land yet because has some
dependencies, i.e. mmsys support is still missing. So, only patches from
1 to 9 are ready, the others are provided for reference and test.

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

 .../power/mediatek,power-controller.yaml      |  184 +++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  164 ++-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  162 +++
 drivers/soc/mediatek/Kconfig                  |   13 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mtk-infracfg.c           |    5 -
 drivers/soc/mediatek/mtk-mmsys.c              |    4 -
 drivers/soc/mediatek/mtk-pm-domains.c         | 1019 +++++++++++++++++
 include/dt-bindings/power/mt8183-power.h      |   26 +
 include/linux/soc/mediatek/infracfg.h         |   57 +
 10 files changed, 1577 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
 create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
 create mode 100644 include/dt-bindings/power/mt8183-power.h

-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
