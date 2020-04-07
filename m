Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FBCC2BA16
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 05:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64169206F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 05:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rYec6yfe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GgR9B7y9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64169206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bjYV836dsntWXlnNPVNimjCn2WLtTK9x3Vag0sr7JWE=; b=rYec6yfes5dRa9
	dIbx9WkM88H/2c2JMwmceDEtrma+Dsnfb97lBI/OYqdkHqa5eh+ElqOgRlQgVGF5/fscJpSt95yHk
	zvVwgAwP4Q+urEWJMFMQ/rloG2nK6WGfkaJMq16603RUJXh8drzUOti/exfoy+1MDuugsb+PkPDi0
	74tvFai0YGPx6bSIPAaImKMwZDEXpkbfmj9w3nX2rE/9Jg/+YabSXoiLkRaMcfOXLSaPeDwu8o87P
	aMVLNqB6yTiCsbNEZP5UNIeU0dBEAN+vjJendhdheIIWF7qjve6dsGsbyDJuNUbctB9LSjO9//zZG
	mfdYFvFF4850QqOwy+BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLgxk-0007dl-3g; Tue, 07 Apr 2020 05:39:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLgxf-0007d7-PX
 for linux-mediatek@lists.infradead.org; Tue, 07 Apr 2020 05:39:49 +0000
X-UUID: 68396cd29f084d6eb7a8a769f8f39bf3-20200406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=O2o43k14xlejaS3ceaxlrwDivs/SbOA913cIeBStoZE=; 
 b=GgR9B7y9G/54eiYxNuvAZG0SVfoHzp+PkU24GooowJRj05LBGwnfLyNpBpobxIq7YEH51UF3hzXLMjpfg7S5VxeL4G3oi7Z/BPyLT0KI/KtfgJuPnTL3zob6Wm3hTL5cGoA8a2CTjJJ/bUFIGjlMrxWIWG1SARw5AoIM12X83WA=;
X-UUID: 68396cd29f084d6eb7a8a769f8f39bf3-20200406
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1490518270; Mon, 06 Apr 2020 21:39:42 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 22:39:38 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 13:39:28 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 13:39:30 +0800
From: Fengping yu <fengping.yu@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Yingjoe Chen
 <yingjoe.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v3] drivers:input:keyboard: add mtk keypad driver 
Date: Tue, 7 Apr 2020 13:36:09 +0800
Message-ID: <20200407053610.20996-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9C2F0DBEA935612CFC96B21F5282E409AABF91147DF33EF885EB4B82EDEFAFE82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_223947_830711_0941FBDA 
X-CRM114-Status: UNSURE (   7.15  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This patchset add support to MediaTek matrix keypad.

Change since v2:
- remove extra space and redundant lines
- remove useless code
- update keypad devicetree document debounce time unit
- change to use devm_platform_ioremap_resource() to simplify resource management
- use bitmap to store and check keypad state

fengping.yu (2):
  add dt-binding document for MediaTek Keypad
  add MediaTek keypad driver

 .../devicetree/bindings/input/mtk-kpd.txt     |  61 +++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |   7 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mtk-kpd.c              | 258 ++++++++++++++++++
 5 files changed, 328 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
 create mode 100644 drivers/input/keyboard/mtk-kpd.c

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
