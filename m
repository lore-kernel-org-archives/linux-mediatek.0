Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B27C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 17:56:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E849720791
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 17:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PB1YWJ8u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E849720791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8jbD/b7jmBw6FwvTOwFoZYX7Yy8YDi2/FVS+t+ImM0=; b=PB1YWJ8u4Wp0K66Bj0NlZpvAFh
	nvwR2eAUXMoaEz2UyDg7aL6VTuoPpgF8c5sbUHcoLM/A2o2ypIp+v2c0ZHdzu5aV4Mt7EZVscbprX
	atDSt71fTHNZE/jzmS8BOl7DyzB0UZex8ucm8zCcPpVjs+kJuZ9lXvwNya8e8d9bszXc/Om5EgRIz
	8zhrhFOXtwPEp4ycPW7yE5LH8SPdnZac1Zc6R3hhll03FOcyCaZ66B3FyScbodi3v1QWQGy+amWlG
	UcP6PZVUQmDso51HyQko7IhLTMuiwYD6pdmR1YOFTw7+ACBa/o0Z5fQXX4SGwc5Tt4P6w/6MCSjGi
	J8zLU9vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6ik-0007z9-08; Mon, 26 Oct 2020 17:55:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6iU-0007rt-9d; Mon, 26 Oct 2020 17:55:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 89D8B1F44FC8
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/16] soc: mediatek: pm-domains: Add new driver for SCPSYS
 power domains controller
Date: Mon, 26 Oct 2020 18:55:09 +0100
Message-Id: <20201026175526.2915399-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_135534_500462_2F393DA7 
X-CRM114-Status: GOOD (  18.37  )
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
 Rob Herring <robh+dt@kernel.org>, fparent@baylibre.com,
 Miles Chen <miles.chen@mediatek.com>, Joerg Roedel <jroedel@suse.de>,
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

Two important notes:

1. Support for MT8183 is not ready to land yet because has some
   dependencies, i.e mmsys support is still missing.

2. Support for MT8192. I picked the patches [1] from Weiyi Lu and
   adapted to this new series. I posted only for reference due that this
   new version has some changes that affects that patchset.

Only patches from 1 to 9 are ready, the others are provided for reference and test.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=368821

Best regards,
  Enric

Enric Balletbo i Serra (5):
  dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains
    controller
  soc: mediatek: Add MediaTek SCPSYS power domains
  arm64: dts: mediatek: Add mt8173 power domain controller
  dt-bindings: power: Add MT8183 power domains
  arm64: dts: mediatek: Add smi_common node for MT8183

Matthias Brugger (8):
  soc: mediatek: pm-domains: Add bus protection protocol
  soc: mediatek: pm_domains: Make bus protection generic
  soc: mediatek: pm-domains: Add SMI block as bus protection block
  soc: mediatek: pm-domains: Add extra sram control
  soc: mediatek: pm-domains: Add subsystem clocks
  soc: mediatek: pm-domains: Allow bus protection to ignore clear ack
  soc: mediatek: pm-domains: Add support for mt8183
  arm64: dts: mediatek: Add mt8183 power domains controller

Weiyi Lu (3):
  dt-bindings: power: Add MT8192 power domains
  soc: mediatek: pm-domains: Add default power off flag
  soc: mediatek: pm-domains: Add support for mt8192

 .../power/mediatek,power-controller.yaml      | 293 +++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 164 +++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 172 +++++
 drivers/soc/mediatek/Kconfig                  |  13 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mt8173-pm-domains.h      |  94 +++
 drivers/soc/mediatek/mt8183-pm-domains.h      | 221 +++++++
 drivers/soc/mediatek/mt8192-pm-domains.h      | 292 +++++++++
 drivers/soc/mediatek/mtk-infracfg.c           |   5 -
 drivers/soc/mediatek/mtk-pm-domains.c         | 615 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.h         | 102 +++
 include/dt-bindings/power/mt8183-power.h      |  26 +
 include/dt-bindings/power/mt8192-power.h      |  32 +
 include/linux/soc/mediatek/infracfg.h         | 107 +++
 14 files changed, 2083 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
 create mode 100644 drivers/soc/mediatek/mt8173-pm-domains.h
 create mode 100644 drivers/soc/mediatek/mt8183-pm-domains.h
 create mode 100644 drivers/soc/mediatek/mt8192-pm-domains.h
 create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
 create mode 100644 drivers/soc/mediatek/mtk-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt8183-power.h
 create mode 100644 include/dt-bindings/power/mt8192-power.h

-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
