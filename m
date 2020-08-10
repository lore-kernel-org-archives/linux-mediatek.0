Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1452C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 06:44:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCF420734
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 06:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lap9FKFb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qLKGYriw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CCF420734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Djt5I1H7wfVAPeFUByCewjrzUx8SbWVCxIunk6MLLWU=; b=lap9FKFbQ/reV0r8UccTZNHHvr
	ZTOFebLwm+x+PqrMnHHMxGrwQgaTtyR65NCRuc8IaDMR+hGXoArXJI/3mM32njEu4Qx0Kw2QfKBE0
	H+TN0//Cl/PJn3YejC3O8IsEbPUwpoVPn9OCYXe+jLNawz50LT2NOkE8OiRQLXb9xVQFinUQioCYk
	yuY/xKh0ZilqrKKUzTUNc86p1BLs0jNs8iuvpjpOR2ll2W2fT2t+KnYHa4fAmm6qs7Aes+a2IY03v
	5VBWwlhcxfRe7ou5fwwN6mfe9XNwJq4Sl4UCpPGoMR3deV/UGoiMUgRhX1dN3VyOFZhgUeZqBYZzf
	4xA9Vvdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k51Y4-0006Il-O3; Mon, 10 Aug 2020 06:44:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k51Y1-0006IG-H5; Mon, 10 Aug 2020 06:44:43 +0000
X-UUID: 4e83687bf66248fa83dd94d0a2900a64-20200809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8XxePLI7nFgfwgRBPMrxedK9zh1gfeaUqdGvz1nAhqo=; 
 b=qLKGYriwPiauQT8U/dE8nJsI9GyYyuiLC+YDovMBB/wsbvOLWkWH0Ut01AMtN4H0HY2cP4ADUV+J0Rb5vhowFpIlpFbkStj1rFleZ1p7HxutE6ih5B2+Et4xL1gVaCdFuRMh/yT2SXZgoygGhRmmDwAoHISVIerAdh84tboeINI=;
X-UUID: 4e83687bf66248fa83dd94d0a2900a64-20200809
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1417046659; Sun, 09 Aug 2020 22:44:31 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Aug 2020 23:44:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 14:44:28 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Aug 2020 14:44:22 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marco Felsch
 <m.felsch@pengutronix.de>
Subject: [PATCH v17] Add matrix keypad driver support for Mediatek SoCs 
Date: Mon, 10 Aug 2020 14:40:55 +0800
Message-ID: <20200810064058.6467-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1F61BB53A9223881FA07901E69688B6D5142A20DD83F6084DC1401474804DFFC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_024441_775740_3457C1CC 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Change since v16:
- list clock-names in devicetree binding documentation
- remove pinctrl in binding documentation
- add default value for keypad,num-columns and keypad,num-rows

fengping.yu (3):
  dt-bindings: Add bindings for Mediatek matrix keypad
  drivers: input: keyboard: Add mtk keypad driver
  configs: defconfig: Add CONFIG_KEYBOARD_MTK_KPD=m

 .../devicetree/bindings/input/mtk-kpd.yaml    |  87 ++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mtk-kpd.c              | 209 ++++++++++++++++++
 5 files changed, 309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
 create mode 100644 drivers/input/keyboard/mtk-kpd.c

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
