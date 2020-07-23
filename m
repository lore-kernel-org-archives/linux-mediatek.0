Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A3CC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 13:09:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E700E20714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 13:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V3VTjdKy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KftOPWyO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E700E20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qdi3l/N8kqtUZl3ugxW0nnnO9R1gmFhyKsMpSPfjTxQ=; b=V3VTjdKybpPoQQxfxOrGgRWcYm
	S7MfqvGaUbgO4MvA3kg29epVtoxUw8twzCT07fMYoF+b//tik3aPw7PgSfT0/Nm5G+1mwWdOKxm7s
	t0xpCBSAYgeRCq5EoPrpixBn6FUFcsAcGb0bfM3+KqdnmBkn9UD79mEzjn8HLgKZ4ygXhKgBCD2Or
	LVtY4deoEzVZsBS+K4qcVCmOjBChfO6tVJAkn7yCtEnLy/nr4a1GOVHHn5UuDHjlBMXHwQ3q0Zc1A
	YJLpxgULeoN94l9DZPOFlNQaYdW5G1Q8cZriVxGYQaHbenrp3oT61qmrL+T8Zp/Wi59LnbN2YfRuK
	oTcgZ4Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyayJ-0002rm-Pu; Thu, 23 Jul 2020 13:09:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyayH-0002qf-Fd; Thu, 23 Jul 2020 13:09:14 +0000
X-UUID: 11bdbd167fb749f084700b91ca325e20-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/rExF285VSbk1mjvljQ5FLR36AFJHuvXyBHgEJEnBpU=; 
 b=KftOPWyOqj/G7abGXcy5754zHifOID0/b51oLzVZJSu5Rp+fcwgUt+D55RQTvWj+GW0Fu6W74yHLOHssZ5vho8r2JK+tSQn4o3taNPtptUhRbyRrAcd12XV0bxzcvxvkjoSJahI30oC3JzMDbIqRKJT6A7bgl8aeKGlALmP9+cU=;
X-UUID: 11bdbd167fb749f084700b91ca325e20-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 304057537; Thu, 23 Jul 2020 05:09:07 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 05:59:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 20:59:04 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 20:59:05 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/8] Add Support for MediaTek PMIC MT6359
Date: Thu, 23 Jul 2020 20:58:45 +0800
Message-ID: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_090913_723403_21779364 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset includes refactoring interrupt and adding support to MT6359 PMIC.
MT6359 is the primary PMIC for MT6779 and probably other SOCs.
The series[1] sent by Wen will continue to upstream in this patchset afterwards.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=306579

Hsin-Hsiung Wang (5):
  mfd: mt6358: refine interrupt code
  dt-bindings: mfd: Add compatible for the MediaTek MT6359 PMIC
  mfd: Add support for the MediaTek MT6359 PMIC
  regulator: mt6359: Set the enable time for LDOs
  regulator: mt6359: Add support for MT6359P regulator

Wen Su (3):
  dt-bindings: regulator: Add document for MT6359 regulator
  regulator: mt6359: Add support for MT6359 regulator
  arm64: dts: mt6359: add PMIC MT6359 related nodes

 Documentation/devicetree/bindings/mfd/mt6397.txt   |    8 +-
 .../bindings/regulator/mt6359-regulator.txt        |   58 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |  296 +++++
 drivers/mfd/mt6358-irq.c                           |   89 +-
 drivers/mfd/mt6397-core.c                          |   23 +
 drivers/regulator/Kconfig                          |    9 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/mt6359-regulator.c               | 1136 ++++++++++++++++++++
 include/linux/mfd/mt6358/core.h                    |    8 +-
 include/linux/mfd/mt6359/core.h                    |  133 +++
 include/linux/mfd/mt6359/registers.h               |  529 +++++++++
 include/linux/mfd/mt6359p/registers.h              |  246 +++++
 include/linux/mfd/mt6397/core.h                    |    1 +
 include/linux/regulator/mt6359-regulator.h         |   59 +
 14 files changed, 2563 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.txt
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
