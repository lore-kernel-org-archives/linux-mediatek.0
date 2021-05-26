Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53113C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 07:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 130F0613EC
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 07:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 130F0613EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V6ifkTYppzn/Bu7xVWMDlhwuglFtG1fxfhxEwtIvIIw=; b=V9Lc3FV9i7OjVf
	Cm58Ta7mw2pZOm2Sul2wazgB5X9eXMJfU50gEw/9r+L7dgexy/YjFfBoUG/3CwGHTmxxpeU8TaC5y
	xUxB2xTIewZh1S8wEVSUh91ii411guDqyo2RjGh1XkJCzuU+AFghmWBQVPO4AQEfrhtMQNrF7SGQQ
	wQiqlyd2imjV8xKO9vVY1b9fKwfNShoKePG615WFjxyOda3ufouGzuYiy0szgyF1TC36cbnZazD8K
	AwMOv/t5cTd+o4cmKbp97wgjGOIuAWjdTXgbR2pvtIH+cI1yljtVMhDUdQCy5Qf2owdAhn6d9Ym0/
	BG/TK7juQ9W5XI028W2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llnbp-00BsmZ-1c; Wed, 26 May 2021 07:05:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llnam-00BsLo-4M; Wed, 26 May 2021 07:04:38 +0000
X-UUID: 7e338ae0402544eab25a06f489d78437-20210526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZYrF8Oqbkf6WwxMx2ZkxzRlUFhdl50IbRIE4eE9e878=; 
 b=ah3zWdMmSBAmf4ephpLIB2V4uum4Q2qYIwz4bGCn2z9kj4mxkpfeqZYZpuyUjIUydwmxdxSbHlbIpb6w9D4NKhownu7u5qqBPkk0s9GwZ/i5vCpblSznmNlNnFV/lWxxoC/IjFJXpk45js9s/OEg2Mnt6YsfL/Mb6ZrSGjKUzSw=;
X-UUID: 7e338ae0402544eab25a06f489d78437-20210526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 740565633; Wed, 26 May 2021 00:02:15 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 23:52:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 14:52:12 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 May 2021 14:52:11 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Eddie Huang
 <eddie.huang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Fei Shao
 <fshao@chromium.org>
CC: Sean Wang <sean.wang@mediatek.com>, Hsin-Hsiung Wang
 <hsin-hsiung.wang@mediatek.com>, Yuchen Huang <yuchen.huang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 0/8] Add Support for MediaTek PMIC MT6359
Date: Wed, 26 May 2021 14:51:59 +0800
Message-ID: <1622011927-359-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_000436_219372_990725BB 
X-CRM114-Status: GOOD (  15.14  )
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

changes since v7:
- rebase to Linux 5.13.

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

 Documentation/devicetree/bindings/mfd/mt6397.txt   |    1 +
 .../bindings/regulator/mt6359-regulator.yaml       |  385 ++++++++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |  298 ++++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts        |    1 +
 drivers/mfd/mt6358-irq.c                           |   89 +-
 drivers/mfd/mt6397-core.c                          |   24 +
 drivers/regulator/Kconfig                          |    9 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/mt6359-regulator.c               | 1036 ++++++++++++++++++++
 drivers/rtc/rtc-mt6397.c                           |    2 +-
 include/linux/mfd/mt6358/core.h                    |    8 +-
 include/linux/mfd/mt6359/core.h                    |  133 +++
 include/linux/mfd/mt6359/registers.h               |  529 ++++++++++
 include/linux/mfd/mt6359p/registers.h              |  249 +++++
 include/linux/mfd/mt6397/core.h                    |    1 +
 include/linux/mfd/mt6397/rtc.h                     |    1 +
 include/linux/regulator/mt6359-regulator.h         |   59 ++
 17 files changed, 2793 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
 create mode 100644 drivers/regulator/mt6359-regulator.c
 create mode 100644 include/linux/mfd/mt6359/core.h
 create mode 100644 include/linux/mfd/mt6359/registers.h
 create mode 100644 include/linux/mfd/mt6359p/registers.h
 create mode 100644 include/linux/regulator/mt6359-regulator.h

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
