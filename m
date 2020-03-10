Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BEEC18E5A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 07:40:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF83E2467C
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 07:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+OCfK4J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ta1LeOoR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF83E2467C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zd4ywcqnG2spdmsAj36ETZsqDN2GRhExqTLkkNx/dGM=; b=O+OCfK4Jk5ec6w
	Cj5V/U/ofR3LI7S6LI6DpycJu7MVLe1r/77hKyANyJIa53+M/PuP/aaUFWfBcxWLjl+xZ2Ca6TgQe
	B3SHNjxnY06TG9VW59roXCV3/6UtQuh5fqvCsUWrmpE+/Qct1AzmX0nkjSszmeAPz8FPngbpAzg/B
	kkvsJLIUiqW13KFR8M8Uttwp4+p47li961P5FEqCgiOpqBSSNZkY9fk2gxgj+IKGXxpEssK06soQ9
	NIpxk80G5QT+kZW+cemSnkELw6Fk/gAkwyTpqW4tFo+0m6f1EvQ7o0to8xsd71EVEbE98uGAHh+3p
	gURhlvRkXuC4pyYuA1jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBZUm-0000CU-VW; Tue, 10 Mar 2020 07:40:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBZUi-00006r-Bz
 for linux-mediatek@lists.infradead.org; Tue, 10 Mar 2020 07:40:06 +0000
X-UUID: 65fbc026e77a40d1a81e23d1abef0778-20200309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NYAYLiqknTa8F+ltVJIHSI4VfwyoRZFMoaTE2/jt4QE=; 
 b=Ta1LeOoRKAQcjyBOsiUndEVSIzcXXOyYPEEjMx0E2NlQo4MfbxmBTOYgml3i8ueeWONY4MLlnzLgPA9qyLIsjYMej2t0g0gnOrIlSAfb12VOu4ukyrK9yAzLsz48MliPfYHRYh7LlZrLWvfdgb/yAVxMU2bSCwsMzq1fQie8ccw=;
X-UUID: 65fbc026e77a40d1a81e23d1abef0778-20200309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1447582087; Mon, 09 Mar 2020 23:39:56 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 00:39:54 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 15:37:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Mar 2020 15:40:05 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v4 0/2] pinctrl: make MediaTek pinctrl v2 driver and MT6765
 pinctrl driver ready for building loadable module
Date: Tue, 10 Mar 2020 15:39:44 +0800
Message-ID: <1583825986-8189-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4F31806DE4A9A9017B0C66F63ACC6A2852320298527D30BE3BF7D8E1FC65B3552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_004004_413844_91F98CB3 
X-CRM114-Status: UNSURE (   9.09  )
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

In the future we want to be able to build the MediaTek pinctrl driver, based on paris, as kernel module. This patch allows pinctrl-paris.c, the external interrupt controller mtk-eint.c, and pinctrl-mtk-common-v2.c to be loadable as module.

The following is the rationale for determining whether mtk-eint.c, pinctrl-mtk-common-v2.c, and pinctrl-paris.c are built as loadable module:

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
  pinctrl: make MediaTek pinctrl v2 driver ready for buidling loadable
    module
  pinctrl: make MediaTek MT6765 pinctrl ready for buidling loadable
    module

 drivers/pinctrl/mediatek/Kconfig                 | 15 ++++++++++++---
 drivers/pinctrl/mediatek/Makefile                |  5 +++--
 drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
 drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c         |  6 ++++++
 drivers/pinctrl/pinconf-generic.c                |  1 +
 7 files changed, 59 insertions(+), 5 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
