Return-Path: <SRS0=Fjxk=5P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F5AC43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 12:11:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C766520776
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 12:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aS3Lhs/A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="us9yw9J8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C766520776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OCDoeavKq9NpvEenG4zVdtNtkT0MpAlio6EKTn1KYs4=; b=aS3Lhs/A9OMDD2
	dBXOUeJeNfNbibXd6/ytynPCrsLBwcZ8OU0+rgDxO7Ir25jxLNvxgKfnz1160z0X9r108Cn8sWCwT
	sUW4JDrMRXI5yBk0k8fvcVak0ANm4uh9dlRZOyVyPzeMi1s3QR5s9gPzPcBFSGyvQBS6TnVYmDuyM
	1GRGU2EF18v+hNEZ9TX68BpPywGyLDMAZ2oNQR3+u5FUm6IgyjO/Gnk3r5Cj/Uj9KMlvMS8AQzYLH
	pvFFpjY05RCLe5D4KMhSG/MUEY7/YdT9NtrjSwFi0NybhBa/0KT6Mkmr4C0fpH/ESkjCO9mWB+z7t
	wgHJ0qy7KSWVa66Cr2Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jItFx-0002KM-0N; Mon, 30 Mar 2020 12:11:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jItFt-0002Jr-Ux
 for linux-mediatek@lists.infradead.org; Mon, 30 Mar 2020 12:11:03 +0000
X-UUID: eb5383d162864b6b921c8725a496a9a1-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aHZOu1UIhdMUGeaAiOn3YyNfGHs7OeO5XFt+0Uq4sc8=; 
 b=us9yw9J8WW4Sv0PHVq/VyFDo4EvKhHGlEKiTGnBO2RLFuTQX8sTKDQVqHHV+Q1UoPOJSrZ7HPGnG6LTvNCKFxdcoKXG5pNgXgvZbC3X1J8b9fYYtx7PabKyzzJObzlCzUBcEndJ8zG5mOIk4tY5aTGUAzp85w2n/PkCPFykcwzI=;
X-UUID: eb5383d162864b6b921c8725a496a9a1-20200330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 963058671; Mon, 30 Mar 2020 04:11:03 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 05:00:57 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 20:00:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 30 Mar 2020 20:00:47 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v5 0/2] pinctrl: mediatek: make MediaTek pinctrl v2 driver
 ready for buidling loadable module
Date: Mon, 30 Mar 2020 20:00:46 +0800
Message-ID: <1585569648-14017-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: F8C29F2B654CA22D3A890F74A392E3A3A920FDA8CE8213DE8FECC487E85F8B462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_051102_010873_8B796687 
X-CRM114-Status: UNSURE (   7.86  )
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
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

In the future we want to be able to build the MediaTek pinctrl driver,
based on paris, as kernel module. This patch allows pinctrl-paris.c, the
external interrupt controller mtk-eint.c, and pinctrl-mtk-common-v2.c to
be loadable as module.

The following is the rationale for determining whether mtk-eint.c,
pinctrl-mtk-common-v2.c, and pinctrl-paris.c are built as loadable module:

1. drivers/pinctrl/mediatek/Kconfig:
1.1 PINCTRL_MTXXXX: change from bool to tristate. It is specified in
        defconfig file. MTXXXX can only be the user of pinctrl-paris,
        which can MT6765 or MT8183. The patch for changing
        PINCTRL_MT6765 from bool to tristate will be given as the next
        patch of the patch series.
1.2 PINCTRL_MTK_PARIS: change from bool to tristate and select
        PINCTRL_MTK_V2. No need to specify in defconfig file.
      * PINCTRL_MTK_PARIS will be y if any PINCTRL_MTXXXX selecting
        PINCTRL_MTK_PARIS is y.
      * PINCTRL_MTK_PARIS will be n if all PINCTRL_MTXXXX selecting
        PINCTRL_MTK_PARIS is n.
      * PINCTRL_MTK_PARIS will be m if some PINCTRL_MTXXXX selecting
        PINCTRL_MTK_PARIS are m and other PINCTRL_MTXXXX selecting
        PINCTRL_MTK_PARIS are n.
1.3 PINCTRL_MTK_MOORE: select EINT_MTK and PINCTRL_MTK_V2. It is make
        to be ready for building as loadable kernel module because it
        is not used on Android kernel.        
1.4 PINCTRL_MTK_V2: add this tristate config which depends on
        PINCTRL_MTK_PARIS and PINCTRL_MTK_MOORE. No need to specify in 
        defconfig file.
      * PINCTRL_MTK_V2 will be y if either PINCTRL_MTK_PARIS or
        PINCTRL_MTK_MOORE is y.
      * PINCTRL_MTK_V2 will be n if both PINCTRL_MTK_PARIS and
        PINCTRL_MTK_MOORE are n.
      * PINCTRL_MTK_V2 will be m if PINCTRL_MTK_PARIS is m and
        PINCTRL_MTK_MOORE is n.
1.5 EINT_MTK: change from bool to tristate and add rule for default.
        No need to specify in defconfig file.
      * First rule: determine if EINT_MTK is y or n according to 
        selection of PINCTRL_MTK or PINCTRL_MTK_MORE.
      * Second rule: determine if EINT_MTK is y, m, or n according to
        selection of PINCTRL_MTK_PARIS.

2. drivers/pinctrl/mediatek/Makefile: Use PINCTRL_MTK_V2 to determine
        if pinctrl-mtk-common-v2.c is built as loadable module or
        built-in.


Light Hsieh (2):
  pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling
    loadable module
  pinctrl: mediatek: make MediaTek MT6765 pinctrl ready for buiding
    loadable module

 drivers/pinctrl/mediatek/Kconfig                 | 13 ++++++++++---
 drivers/pinctrl/mediatek/Makefile                |  5 +++--
 drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
 drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c         |  6 ++++++
 6 files changed, 56 insertions(+), 5 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
