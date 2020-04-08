Return-Path: <SRS0=Kof6=5Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CDDC2BA1B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 08:23:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A1E82075E
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 08:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0HgZvlA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sLpzE4De"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A1E82075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aqcr76gYSg6wlKkgko+g5bDQLgaTrrq2EXwLstwpr8c=; b=m0HgZvlAq/ykU+
	b90as1ZvLezvkv3iyOYvcOJBtpi8QeASa4EwqTE6vyCkfKCWRzpkHusP7qmGwGLilI/TZJGYacmnm
	lfivSrwz4B22O0W+ArpHsvDyOt58VPCYSahUxX51k6e23yojfGong9DnPaP2T0z/xRzlVa9vQDOoq
	UNseCTtBwdEY3RWxG6b5DdHN0gnx9WCXwq6Hfy+HVPZJitOM6lvUWUijXnAfYJp/rWiLeCQUCuzwp
	CI2rKtCWAgob82ggColCCw9mbKqkeha/10lvAejhyVuO2mZ+MgSwWPTowmo+VPhb6/opfc51f//Ef
	9Sk49KOjqLWmQdFuPFGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jM5ze-0006u1-9e; Wed, 08 Apr 2020 08:23:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM5zA-0006IA-0R; Wed, 08 Apr 2020 08:23:01 +0000
X-UUID: 7452fbf009e44b7c859e27c824ff8d1d-20200408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ReQScgLFJ9/68fAYgC7XYU0D88RS9Ej3AolLMr7k38s=; 
 b=sLpzE4DevyXyfkSapCKwfT1hm/NaKXxIuYhp+DxbmZKY7OLVgZKp5dWJCzhtPRPFnwWSpfcwsKDSJNgYUfKREl/RWkyuRYK1b94+MiXOsdGfCIhwRgE3LriIpuANeeqbb8HHco/NQ5dm1AMguq5dx9V8/k4BtAsxt9SiRRW3m18=;
X-UUID: 7452fbf009e44b7c859e27c824ff8d1d-20200408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1323983985; Wed, 08 Apr 2020 00:22:45 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 01:12:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 16:12:49 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Apr 2020 16:12:49 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: [PATCH v12 0/6] Add Support for MediaTek PMIC MT6358
Date: Wed, 8 Apr 2020 16:12:05 +0800
Message-ID: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1D8F51BD4EA362DB9AFC00BF572DE7769CFAA3A7B3B2B4FA91B9CCF20772BA492000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_012300_050880_25CB4579 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-rtc@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, Richard
 Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-pm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset including modifying suspend/resume behavior and trimming probe function add support to MT6358 PMIC.
MT6358 is the primary PMIC for MT8183 platform.

changes since v11:
- add a new patch to trim probe function more cleanly.
- fix some coverity defects.
- update some comment messages.
- fix wrong sizeof argument.

Hsin-Hsiung Wang (5):
  mfd: mt6397: Modify suspend/resume behavior
  mfd: mt6397: Trim probe function to support different chips more
    cleanly
  dt-bindings: mfd: Add compatible for the MediaTek MT6358 PMIC
  mfd: Add support for the MediaTek MT6358 PMIC
  arm64: dts: mt6358: add PMIC MT6358 related nodes

Ran Bi (1):
  rtc: mt6397: Add support for the MediaTek MT6358 RTC

 Documentation/devicetree/bindings/mfd/mt6397.txt |  14 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi         | 358 +++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts      |   1 +
 drivers/mfd/Makefile                             |   2 +-
 drivers/mfd/mt6358-irq.c                         | 235 +++++++++++++++
 drivers/mfd/mt6397-core.c                        | 101 ++++---
 drivers/mfd/mt6397-irq.c                         |  35 ++-
 drivers/power/reset/mt6323-poweroff.c            |   2 +-
 drivers/rtc/rtc-mt6397.c                         |  18 +-
 include/linux/mfd/mt6358/core.h                  | 158 ++++++++++
 include/linux/mfd/mt6358/registers.h             | 282 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h                  |   5 +
 include/linux/mfd/mt6397/rtc.h                   |   9 +-
 13 files changed, 1158 insertions(+), 62 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6358.dtsi
 create mode 100644 drivers/mfd/mt6358-irq.c
 create mode 100644 include/linux/mfd/mt6358/core.h
 create mode 100644 include/linux/mfd/mt6358/registers.h

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
