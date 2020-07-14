Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334BDC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:31:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C937D20EDD
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BhIV0rlb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TAGZxmMV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C937D20EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2OoyjNjQG6SgAzCOoLhPEgipVP9QIU4FhJ530Thxoss=; b=BhIV0rlbVxbmYKr7NOt/dlz7wi
	qDiz0spWn86YAFlpeC8X3QUprzGEtcxoN8mIkmEnT8nFqdna2CFBOtYjAL83YsOtuTlNxn7FeZEY7
	UzeWsVvJcXQ5vzWTSmtZtgJkvUK7h39lJWnJy0IYWJLMCFGSMidwyQgjw7hEd36GG0AqFeqEfKn74
	FWOd3QTptEWnQ2BJgxYhcHzckYztwIAuxs8KKBdCEKRP+AzAz5sT6vyRL6IxBqp+cmvOyc60fryY4
	xp34T7TZ2Xwj5BtEKRlIsSKeD0dDv2wY2axnri2Cw5RJbOuf9/xen1sFbjl1dUvl6u4+laWGoLBf7
	eGM9jX7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHHg-0002OO-Kw; Tue, 14 Jul 2020 09:31:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHGU-0001kJ-LB; Tue, 14 Jul 2020 09:30:20 +0000
X-UUID: 2fa6a4f7c0bd451c83994c5219bf1f4b-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xsOBFtDX2zzdwsWEy4DmEh6sQCZBGIkRn1wJVvBBCdQ=; 
 b=TAGZxmMVttZ/HmYnBPJqpLpHzuw6+P0dwV6m3XZElOffk0qEXdZy1TMaV0WdOEU1i/u0HIEUYinbuhUZrbwTFPGomgLRZk1N57tq/J3YKMlvxNjbIdRuG9Kto4oTOwxvNZfpw5nI7eeS4LqSL1lN+AZ/MKChHOjagCPpGhbUYG0=;
X-UUID: 2fa6a4f7c0bd451c83994c5219bf1f4b-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1000550384; Tue, 14 Jul 2020 01:30:15 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 02:22:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:22:38 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 17:22:38 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Marco Felsch
 <m.felsch@pengutronix.de>
Subject: [PATCH v14] Add matrix keypad driver support Mediatek SoCs 
Date: Tue, 14 Jul 2020 17:20:50 +0800
Message-ID: <20200714092053.16067-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 79AE5D1AD6DEE60D16E09EE0A5304D7B54A6050E17675433065CC2E6E59410502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_053018_949907_501F913F 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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


Change since v13:
- remove defconfig and mtk-kpd.yaml files reviewed-by tag

fengping.yu (3):
  dt-bindings: Add keypad devicetree documentation
  drivers: input: keyboard: Add mtk keypad driver
  configs: defconfig: Add CONFIG_KEYBOARD_MTK_KPD=m

 .../devicetree/bindings/input/mtk-kpd.yaml    |  96 ++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mtk-kpd.c              | 209 ++++++++++++++++++
 5 files changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
 create mode 100644 drivers/input/keyboard/mtk-kpd.c

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
