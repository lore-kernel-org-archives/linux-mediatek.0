Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0562C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:13:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6408961878
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6408961878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+/EwvIS57kwrxTxycvnlqCIAEtacDmKS1B7aN76RfK4=; b=O+zk5i2UNrZDUej2jZ3b6ivZBD
	jhwaEoaRvWpfHInXqnTJ1RUjT44ZhprtZH+SQsRW9Flr9jA+pff0Y1MwlPxpIgIZGnDeSQz4KnnFF
	2ihKUrmxrIWNVqHbAxr42ULd8/lzAM0l9DDzmkJc58KIM7C/Ds085O9d5M4W2SGYd4q6/LO2pOhLJ
	aO2L8ZGdeTffyfvGr5g76F3soX859Jr4fEP5rA7lNEMLSWEx3G5DhfKB+0qAljyBjS1XPzghLF3Ge
	1cGf+5vumR759r85pDwGRlW4OdOJKzx4sTrR0AGTOp0XXLqEFAVPeL4xThTVdqJLzBEGEB0APWYA0
	wwYGBBDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRYmy-006ODr-3J; Wed, 31 Mar 2021 11:13:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRYcH-006KCk-Gf; Wed, 31 Mar 2021 11:02:38 +0000
X-UUID: 58911e93b3ba4b27a308a3fedc1c81e1-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=llApVHdwje+SP0FSU9FtAqRNWdAGxXmv6+ORnFE2TQY=; 
 b=S9pEH0DZXW5BRuJSNWtfc60gEAl2fpd3HqO17Yc1nMWnoLh61lzutqYvr0bbXurz8tyemHds2+E1yrdXAiA0TrBQPQFdumnvdhcWNqShXE20RgFIUXxC4HrIOsZpRUaSg3GbWC2km3w02y7cYR88S+ZbcCyGwGbYYh/7hAzI/Lg=;
X-UUID: 58911e93b3ba4b27a308a3fedc1c81e1-20210331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 307730697; Wed, 31 Mar 2021 04:02:22 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 04:02:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 19:02:18 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 31 Mar 2021 19:02:18 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Fei Shao <fshao@chromium.org>
CC: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 0/8] Add Support for MediaTek PMIC MT6359
Date: Wed, 31 Mar 2021 19:01:59 +0800
Message-ID: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-TM-SNTS-SMTP: 63A0CDBCB393E619655A56490683616F326E31817C2EB8EE35491081AD9163292000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_120230_145164_DB816BF6 
X-CRM114-Status: GOOD (  14.35  )
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

This patchset includes refactoring interrupt and adding support to MT6359 PMIC.
MT6359 is the primary PMIC for MT6779 and probably other SOCs.
The series[1] sent by Wen will continue to upstream in this patchset afterwards.
This patchset is based on the pmic wrapper patchset[2].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=306579
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=447127

changes since v6:
- fix yaml error.
- update dts node.

Hsin-Hsiung Wang (6):
  mfd: mt6358: refine interrupt code
  rtc: mt6397: refine RTC_TC_MTH
  dt-bindings: mfd: Add compatible for the MediaTek MT6359 PMIC
  dt-bindings: regulator: Add document for MT6359 regulator
  mfd: Add support for the MediaTek MT6359 PMIC
  regulator: mt6359: Add support for MT6359P regulator

Wen Su (2):
  regulator: mt6359: Add support for MT6359 regulator
  arm64: dts: mt6359: add PMIC MT6359 related nodes

 .../devicetree/bindings/mfd/mt6397.txt        |    1 +
 .../bindings/regulator/mt6359-regulator.yaml  |  385 ++++++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      |  298 +++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |    1 +
 drivers/mfd/mt6358-irq.c                      |   89 +-
 drivers/mfd/mt6397-core.c                     |   24 +
 drivers/regulator/Kconfig                     |    9 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/mt6359-regulator.c          | 1036 +++++++++++++++++
 drivers/rtc/rtc-mt6397.c                      |    2 +-
 include/linux/mfd/mt6358/core.h               |    8 +-
 include/linux/mfd/mt6359/core.h               |  133 +++
 include/linux/mfd/mt6359/registers.h          |  529 +++++++++
 include/linux/mfd/mt6359p/registers.h         |  249 ++++
 include/linux/mfd/mt6397/core.h               |    1 +
 include/linux/mfd/mt6397/rtc.h                |    1 +
 include/linux/regulator/mt6359-regulator.h    |   59 +
 17 files changed, 2793 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
 create mode 100644 drivers/regulator/mt6359-regulator.c
 create mode 100644 include/linux/mfd/mt6359/core.h
 create mode 100644 include/linux/mfd/mt6359/registers.h
 create mode 100644 include/linux/mfd/mt6359p/registers.h
 create mode 100644 include/linux/regulator/mt6359-regulator.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
