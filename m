Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D64C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 05:37:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 473D3204FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 05:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i6PI7Fi0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FhlbflNr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 473D3204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sqZJ9aLB4s5PyxMm9PpYCdTvlgjPOfB24usMHA1ncZI=; b=i6PI7Fi0PnmI30
	Bp1wk99w2iR76jR5Jc2Hi6TR3SbPv18JMz0IvEtknV8xq0jcCWLZys9ZWXDIINR9ELAIERUVYhxhc
	QiT5UPyOF/spCRIf8zMgEUtwENl7Igq6sNgXHBSR5cmBLCgy4e1HBasHgLQq9ub2SO59HPf9DAEyi
	fJ2nd829T/4pru+sxlXx4Z2JhhnRn7uMtGWWo82W6cwAOLSPG7OlNvzsg9+Aopk0RbXjEmGDd+Ti6
	tR76tavEpq8trnsGkfxsBOooxIwssNM3oEonNaFfViqdm8VAuMBsWUou5R9ECueIw8eO5JQaTfQFY
	ZgtkTi48LHDp3cTAEKqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZTXD-0004Al-Fd; Tue, 26 Nov 2019 05:37:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZTX9-000478-8p; Tue, 26 Nov 2019 05:37:09 +0000
X-UUID: bafad12b4c3a4a3684387fc4ec8e28f1-20191125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PGHAjeNFj61JuQZqzPm0qOjVOVPlbCv9F5NL4JCmFUs=; 
 b=FhlbflNrqT0mPEQx/nAIsSi4t5cEhAjHxVUiphH/Q9tVgKiRK+nxjIA6po2ShhyWbVfh/BzqXob0gnEEOMz7ikLoTN9iWkABemf/FxOVoI0Klo0EfCAxLqvKhTlY7EEo+whpsDlheONn/9gY1FRCMPsJUfw1O2ruqdxkZJzJHBM=;
X-UUID: bafad12b4c3a4a3684387fc4ec8e28f1-20191125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1163091736; Mon, 25 Nov 2019 21:36:48 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 25 Nov 2019 21:35:02 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 13:34:50 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 26 Nov 2019 13:34:34 +0800
From: <freddy.hsin@mediatek.com>
To: <sre@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
 <linux@roeck-us.net>, <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 0/4] Support MTK reboot mode driver 
Date: Tue, 26 Nov 2019 13:34:46 +0800
Message-ID: <1574746490-625-1-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_213707_320009_9252C79F 
X-CRM114-Status: UNSURE (   7.84  )
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
Cc: Chang-An.Chen@mediatek.com, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This driver parses the reboot commands like "reboot bootloader"
 and "reboot recovery" to get a boot mode described in the
 device tree , then call the write interfae to store the boot
 mode in mtk RGU (reset generation unit) non-volatile register,
 which can be read by the bootloader after system reboot, then
 the bootloader can take different action according to the mode
 stored.
 
 Freddy Hsin (4):
  power: reset: add reboot mode driver
  watchdog: populate reboot mode node in toprgu node of MTK RGU (Reset
    Generation Unit)
  soc: mediatek: add reboot-mode header
  dt-binding: power: reset: Add documentation for MTK RGU (Reset
    Gernation Unit) reboot driver

 .../devicetree/bindings/power/reset/mtk-reboot.txt |   30 +++++
 drivers/power/reset/Kconfig                        |   11 ++
 drivers/power/reset/Makefile                       |    1 +
 drivers/power/reset/mtk-reboot.c                   |  116 ++++++++++++++++++++
 drivers/watchdog/mtk_wdt.c                         |    3 +
 include/dt-bindings/soc/mediatek,boot-mode.h       |   17 +++
 6 files changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/mtk-reboot.txt
 create mode 100644 drivers/power/reset/mtk-reboot.c
 create mode 100644 include/dt-bindings/soc/mediatek,boot-mode.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
