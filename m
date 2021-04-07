Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA512C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 03:29:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94DEC613A7
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 03:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94DEC613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZuop/ygLidFFhltdvl1coeZ5Gb2VyPDCwq6jP1b08g=; b=NGnERYOUPcHAo0G3Bjj3XmFz4o
	b6nQEtdeOuhKYnYOSK1OoTTUK4X3Ngciuhnf/virLc2ydTULp0Ki2ggD1prONnHseyEkBMvh9r/Uv
	etHaATI3Ep+OolylFT426WAnQu0Z4UUj3Pn43Plzg2BKbz0HBx+G9rj6lrxJTdYciEKAapNZtv8/L
	R3KhEPM2LPBoS7tbur0g0ikr6oGji3twRHefhfA+Awv9rM+5Uamnr8Kc68VKi/6AvODx5abLMOXJX
	e0EJgTQA8aBkjRYy6bMUbBLvEgxo5SzxYgLJkGhCCqZ0b0ditXRW0lQRa1XoVb7Pf3qq0R6ZLiiHz
	f+BsqM6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTyru-003vk5-TT; Wed, 07 Apr 2021 03:28:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTyrh-003vfc-08; Wed, 07 Apr 2021 03:28:27 +0000
X-UUID: 9978af9d285940549b7e02be02c9a35d-20210406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=btCdYK1uxaFVAna3LzPtYOODxucFpp7QFPOo8BL8LUw=; 
 b=u859Cxec7hEaKLWf4wALREb8K31KwhsnodlGQF7EBP5OQcFCQ6qFcUO2odWveS4CP1qIhkr+QsEwTkbIK+64arOhRR81Z1Kj4uTvwS2iGqaHOsw/YEcqlXth3oLPUbjRt8hpZu48oEyQZizOnBxGQfmB0zc9YrU0HnjDr32PLYU=;
X-UUID: 9978af9d285940549b7e02be02c9a35d-20210406
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1696935754; Tue, 06 Apr 2021 20:28:17 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 20:28:15 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 11:28:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Apr 2021 11:28:14 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>
CC: Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH 0/8] Add Support for MediaTek MT8192 APU Power
Date: Wed, 7 Apr 2021 11:27:58 +0800
Message-ID: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_042825_810343_A1646948 
X-CRM114-Status: GOOD (  14.10  )
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

The MediaTek AI Processing Unit (APU) is a proprietary hardware
in the SoC to support AI operations.
The series is to create apusys in the SoC folder for developing
the related drivers. Add the apu clocks, basic apu nodes and the
power domain to provide the power controller of APU subsystem.

This series is based on MT8192 clock[1] and PMIC[2] patches.
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=454523
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=458733

Flora Fu (8):
  dt-bindings: clock: Add MT8192 APU clock bindings
  clk: mediatek: mt8192: Add APU clocks support
  dt-bindings: apu: Add MT8192 APU power domain
  dt-bindings: arm: mediatek: Add new document bindings for APU
  dt-bindings: soc: mediatek: apusys: Add new document for APU power
    domain
  soc: mediatek: apu: Add apusys and add apu power domain driver
  arm64: dts: mt8192: Add APU node
  arm64: dts: mt8192: Add APU power domain node

 .../arm/mediatek/mediatek,apusys.yaml         |  56 ++
 .../soc/mediatek/mediatek,apu-pm.yaml         | 146 +++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |   7 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  46 ++
 drivers/clk/mediatek/clk-mt8192.c             |  91 +++
 drivers/soc/mediatek/Kconfig                  |  10 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/apusys/Makefile          |   2 +
 drivers/soc/mediatek/apusys/mtk-apu-pm.c      | 613 ++++++++++++++++++
 include/dt-bindings/clock/mt8192-clk.h        |  14 +-
 include/dt-bindings/power/mt8192-apu-power.h  |  11 +
 11 files changed, 995 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
 create mode 100644 drivers/soc/mediatek/apusys/Makefile
 create mode 100644 drivers/soc/mediatek/apusys/mtk-apu-pm.c
 create mode 100644 include/dt-bindings/power/mt8192-apu-power.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
