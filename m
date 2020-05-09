Return-Path: <SRS0=UIhI=6X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95857C38A2A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 02:10:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622B1218AC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 02:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/4rZ0sx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WVPofjpp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622B1218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sFD5jElCGXFNVyPjSpM9Hk8ig8ipYfq3IIPpkLgrnyU=; b=G/4rZ0sxT81LEB
	izkv+syyuzq1OytyyJ1bdfXwptBKaIDQGlXtHr5MRZI3WbQiR+cYVypWAKlvZZfg+IWX0XasQKAHX
	nNH6W+8rM59nHhreV8tysqX/k3FTeg89iHafj7ahDC4Kt4R2nSBZg0UfHKa6qdohtYp2uyb+vBmDa
	NIKcez1XW/1E6YfxAU06lr3ahtRcgpE2k+smlkWin4Uc4N5cfZCRGpAI3t11XxGguX53NkWnKBFyX
	qoxBHMWLwM2oi2mTNl4CUQZsQ4N+ooc+nbW6P1IvpM+Klrw8lk5rRHHQajnXUpEodnQBWp2XnCHqw
	tprXG6v9r2BbYtFXGFhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXEwV-0003g8-MA; Sat, 09 May 2020 02:10:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXEwC-00017p-Gl; Sat, 09 May 2020 02:10:03 +0000
X-UUID: f97ec90435d743c2bc57d1ed1fb37359-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1B+choKMEWf5xgsDH1Xvz4r98si4Toef2xxzNstIEMc=; 
 b=WVPofjpp0VLBguQpJu5sO7PG4xp585zhHL5kaY5GN4ax6yZyup7ckNf1CfzJCQp/XLQthBFtWydoIccdvERs23acVXpSpUglCYB8UH7mrTzk761XMMrKpPJbKs76zGETv/kNtGgEyB5KaCYcKNJXhpsh9zjT5mi3gzPS7/aqn4o=;
X-UUID: f97ec90435d743c2bc57d1ed1fb37359-20200508
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 403766129; Fri, 08 May 2020 18:09:49 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 19:09:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 10:09:23 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 10:09:17 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Marco Felsch <m.felsch@pengutronix.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v6] Add mtk matrix keypad driver for keypad on MTK SoC
Date: Sat, 9 May 2020 10:04:56 +0800
Message-ID: <20200509020458.8359-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_191000_556749_7187CFE9 
X-CRM114-Status: UNSURE (   7.41  )
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
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change since v5:
- remove unnecessary include files
- remove redundant comments and newlines
- use local irqnr variable instead of member variable of mtk_keypad struct
- use regmap to read and write registers
- drop kpd_get_dts_info directly into probe function
- use devm_add_action_or_reset to avoid goto error handling when do clk setting
- use devm_request_threaded_irq api to request irq
- remove platform_set_drvdata

fengping.yu (3):
  dt-bindings: Change keypad documentation schema
  drivers: input: keyboard: Add mtk keypad driver
  configs: defconfig: Add CONFIG_KEYBOARD_MTK_KPD=y

 .../devicetree/bindings/input/mtk-kpd.txt     |  61 -------
 .../devicetree/bindings/input/mtk-kpd.yaml    |  93 +++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |   5 +-
 drivers/input/keyboard/mtk-kpd.c              | 151 ++++++++----------
 5 files changed, 163 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml

--
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
