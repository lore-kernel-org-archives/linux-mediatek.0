Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50387C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 06:02:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C932161453
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 06:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C932161453
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PxgichU+7ycRmtVJyfDZWzbUCNB9DDQLIrdJSzomLmQ=; b=HRcOwMlsctvshqnWcQMQralvAa
	R72KMD71XxCQpJwFkNOuc9SVsNR/7NEDGo32DBs4ZC9ITkVZ/oOwojJD2jmxo1Slum9rQMECERbUA
	3ePNRLRYNtinFfQLKRbDyUImlCmVJriK5zPAigcVpGnI21nenwgfugj/sTPvz8TR9hcC0JRLPi9AM
	oEePyLFQUxgysTfCRHUchwg79vDQGjfDHletxJXytXNs/gPT1xWFSQ00X3J7QfSSQjcN8Z4qEGk6O
	A0vbj2xSYvoMFVgRQHSQtCH3AQ3FAcL3ZP/qaAonALBIQXNiHJOZQgZSMNWv98okfe90hUaxjTZYs
	PEoiR7DA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWv54-00EzHJ-CE; Thu, 15 Apr 2021 06:02:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv4L-00Ez7o-5g; Thu, 15 Apr 2021 06:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+qoqSQ6BG061EGk2yCW459rHcB/yTkXjMUrXR0JdT0E=; b=yzihDVDlDCMC7qksUvE7EYyT2+
 y4QcwpFJFRZr6bT6qUgQb5Z7RNFIl/GOWCVmAaE+Q2bUOaUXBKjxwIoMM9K/imkEou65pgh6rr0Po
 1A3e9BevEdt9w4MA3gbVhzQnuYePTDqi84Op5Y+4zs445Zf3OUMSDLru9BO+Cgq9ANtE6LMHdVWnJ
 zLXdrLQoO0Iz7dF/A8ioxQ8NatAyQqNo3DPBmpVGK4A4hBbgA9/LhjQ3Wa4Pa3z/6aNTqvIW8QOxu
 INd+o1INby5FUD609AbvY1r+5ajLmB3ylJrdtz7MJ3knAy01D+Uc/Gu4X1oDqINPOW1HLnzGMqnf6
 op6UFYhQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv4I-008IO8-GK; Thu, 15 Apr 2021 06:01:36 +0000
X-UUID: bfa0253d7d024ff391b81be78576c127-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+qoqSQ6BG061EGk2yCW459rHcB/yTkXjMUrXR0JdT0E=; 
 b=O3OgA6/49FVN7Q51BnG/1OU+kr4hKXEnYjt3jjx1uyYEoM9DE9Y1dMHIu4QgIGhlGeY5qdoOHLqJy6UxJaBNb0uiMlp5cmnpkUhOfI4yDfp0YCRPFJ11yoh7Fm5nHfFFZCUU/61mjIeEi+tBNXL6XBdIhQpPo5ykmmbGD9ftfqw=;
X-UUID: bfa0253d7d024ff391b81be78576c127-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 944253237; Wed, 14 Apr 2021 23:01:27 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 22:52:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 13:52:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 13:52:41 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, 
 Chiawen Lee <chiawen.lee@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v2 0/7] Add Support for MediaTek MT8192 APU Power
Date: Thu, 15 Apr 2021 13:52:33 +0800
Message-ID: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 55F8CAFCAE7B42F408EA77F2DA84EEC679C4F95FB05FECA62F3CF3DEC733908C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_230134_558775_FF62808A 
X-CRM114-Status: GOOD (  13.01  )
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

Change notes:
v1->v2:
  1) update expression "s/_/-/" in dt-bindings documents.
  2) drop apu power domain header file for mt8192.

v1: https://patchwork.kernel.org/project/linux-mediatek/list/?series=461999

Flora Fu (7):
  dt-bindings: clock: Add MT8192 APU clock bindings
  clk: mediatek: mt8192: Add APU clocks support
  dt-bindings: arm: mediatek: Add new document bindings for APU
  dt-bindings: soc: mediatek: apusys: Add new document for APU power
    domain
  soc: mediatek: apu: Add apusys and add apu power domain driver
  arm64: dts: mt8192: Add APU node
  arm64: dts: mt8192: Add APU power domain node

 .../arm/mediatek/mediatek,apusys.yaml         |  56 ++
 .../soc/mediatek/mediatek,apu-pm.yaml         | 145 +++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |   7 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  45 ++
 drivers/clk/mediatek/clk-mt8192.c             |  91 +++
 drivers/soc/mediatek/Kconfig                  |  10 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/apusys/Makefile          |   2 +
 drivers/soc/mediatek/apusys/mtk-apu-pm.c      | 612 ++++++++++++++++++
 include/dt-bindings/clock/mt8192-clk.h        |  14 +-
 10 files changed, 981 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
 create mode 100644 drivers/soc/mediatek/apusys/Makefile
 create mode 100644 drivers/soc/mediatek/apusys/mtk-apu-pm.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
