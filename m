Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29839C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2GsIaaV3S3AmWqV/dns69KrZJTwRCMVFpMoGA+L9+/g=; b=WQbEtKeXqfbO4B
	gOtMtY1iRKTAF6tjW3vKGoOHur2uIFQPp1WCGusOc5FVY9OYfB3kS463z7E8dTJCYNOdvlf2eQDrR
	NU3ozsmcSm7+/OIDaOYkqM4QrQEEHCKcx9TNmKk4hggj0HcCDSXL4c68gOmucr5IetJQ7asa6akOs
	xwsnvJTDJOA1uB0GckF0mKP8cC9IHlFnLGC1gik1fhArqPUvXleVLJrMnvVim7k8O+yMEoec3SeGn
	3IkhV5uQEgBh6Eg0CylBl4Ag27CdqpN8IgZSvWJaD8fYwF6JjtmxwNacIaWw9c6YNHTQjQTriYOcs
	MR3GF+M3/FD23LIx9DIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMQy-00Fb31-3p; Wed, 01 Jun 2022 11:22:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMQb-00FauG-Vi; Wed, 01 Jun 2022 11:22:21 +0000
X-UUID: 5445d8d8536e43acac1a1d752a3ba8c7-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:ed61db41-eae9-4ede-8141-94b930b4b4c9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:fe90268a-32d7-4fc0-b2ef-8776ac194f8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 5445d8d8536e43acac1a1d752a3ba8c7-20220601
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2012019003; Wed, 01 Jun 2022 04:22:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 1 Jun 2022 19:22:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:04 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Prashant Malani <pmalani@chromium.org>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Brian Norris
	<briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v1 00/15] Add support for MT8195 SCP 2nd core
Date: Wed, 1 Jun 2022 19:21:46 +0800
Message-ID: <20220601112201.15510-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_042218_059008_7FD3C200 
X-CRM114-Status: GOOD (  12.16  )
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

The MT8195 System Companion Processor(SCP) is a dual-core RISC-V MCU.
Current mediatek remoteproc driver only supports bring-up single core 
SCP or the 1st core of a dual-core SCP. This series support to bring-up 
the 2nd core of a dual-core SCP.

Tinghan Shen (15):
  dt-binding: remoteproc: mediatek: Support dual-core SCP
  remoteproc: Kconfig: Add mt8195 SCP dual core configuration
  remoteproc: mediatek: Support hanlding scp core 1 wdt timeout
  remoteproc: mediatek: Add SCP core 1 register definitions
  remoteproc: mediatek: Add SCP core 1 driver for dual-core scp
  remoteproc: mediatek: Add SCP core 1 rproc operations
  remoteproc: mediatek: Add SCP core 1 reserved memory support
  remoteproc: mediatek: Add SCP core 1 interrupt support
  remoteproc: mediatek: Register SCP core 1 initialization ipi
  remoteproc: mediatek: Add chip dependent operations for SCP core 1
  remoteproc: mediatek: Add SCP core 1 SRAM offset
  remoteproc: mediatek: SCP core 1 as a rproc subdevice
  remoteproc: mediatek: Wait SCP core 1 probe done
  remoteproc: mediatek: Support rpmsg for SCP core 1
  mfd: cros_ec: Add SCP 2nd core as a new CrOS EC MCU

 .../bindings/remoteproc/mtk,scp.yaml          |  12 +
 drivers/mfd/cros_ec_dev.c                     |   5 +
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_common.h               |  50 +++
 drivers/remoteproc/mtk_scp.c                  |  92 ++++-
 drivers/remoteproc/mtk_scp_dual.c             | 320 ++++++++++++++++++
 drivers/remoteproc/mtk_scp_subdev.c           | 163 +++++++++
 .../linux/platform_data/cros_ec_commands.h    |   2 +
 include/linux/platform_data/cros_ec_proto.h   |   1 +
 10 files changed, 644 insertions(+), 12 deletions(-)
 create mode 100644 drivers/remoteproc/mtk_scp_dual.c
 create mode 100644 drivers/remoteproc/mtk_scp_subdev.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
