Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58861C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 09:42:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236CC20738
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 09:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R9d0THV2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="C4v00vqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 236CC20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mxbIbOp1enFvm1WTxBhl2vsGJDRchoBJ2qaBpvTd9oo=; b=R9d0THV2FYUW9++AWoy+xUkzA1
	/Xw+yKx2qe0JUT0igH+ES7IY0xheqRLRbbMkpu9HVudnOz0dPJa8uGNNA/4fcqUJ3IWzjeGxanfOn
	uNadcAsRtrmsZSbykATvWP/UHtV64qSqVSPiCLEtdR6z5FWPxOcBfeAUau098/rz3k5oqovc5ews7
	va50gTz2Za2AMRoTXEaJtWXTniji9WMYdQeP0QPerxzJzSZjLwcTi9slbsnr3cvxYhPxROu6ITbQX
	Vc0iWZSwqVBIPozlb2MT2ufKtNaK6DBq9j4NTWn0VUUQSkPiRrmCLCX+QNVWkaStb3VbW1a3vIMtu
	Cc7hIxAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBEQT-0000ED-IR; Thu, 27 Aug 2020 09:42:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBEQK-0000Bj-Ap; Thu, 27 Aug 2020 09:42:25 +0000
X-UUID: 6ee1616e72934431a2c63fb1d90fc228-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GDw8qw5Cf2+oW80aLaeL2MYzA4FJZY4c7yqCaOQfvls=; 
 b=C4v00vqraEkJP6iTDwbKjoUkocv5apQRDdHi0fEsZD1wIGiHvKwVyBMqN/vufKyFFJ0KtGNeLdwQJIreqXr+0XHt9gHxQdOJ//u79PqpshSTPT2XRvfu8ddkQm6lD0lV70gXO/zdZawxJqvTyRywLp1+kxMvumVR3mzwC5hBx+Q=;
X-UUID: 6ee1616e72934431a2c63fb1d90fc228-20200827
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 245930674; Thu, 27 Aug 2020 01:40:14 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 02:33:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 17:33:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 27 Aug 2020 17:33:05 +0800
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>, "Al
 Cooper" <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek
 <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Mao Yong <yong.mao@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, "Kate
 Stewart" <kstewart@linuxfoundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Pan Bian <bianpan2016@163.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 "Mathieu Malaterre" <malat@debian.org>, Asutosh Das
 <asutoshd@codeaurora.org>, "Ritesh Harjani" <riteshh@codeaurora.org>, Stanley
 Chu <stanley.chu@mediatek.com>, Kuohong Wang <kuohong.wang@mediatek.com>
Subject: [PATCH v1 0/2] mmc: cqhci: Add pre_enable() and post_disable() hook
 function
Date: Thu, 27 Aug 2020 17:33:01 +0800
Message-ID: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: CCF1C9EE5CC8277C1A06A622833D52EA4C4DF2634262C08F134094BB2ABF89472000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_054224_561293_F5BACD94 
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series provides MediaTek cqhci implementations as below:
  - Add cqhci_host_ops->pre_enable() and cqhci_host_ops->post_disable()
  - Implement MediaTek's hook functions

Chun-Hung Wu (2):
  mmc: cqhci: add new cqhci_host_ops pre_enable() and post_disable()
  mmc: mediatek: add pre_enable() and post_disable() hook function

 drivers/mmc/host/cqhci.c  |    6 ++++++
 drivers/mmc/host/cqhci.h  |    2 ++
 drivers/mmc/host/mtk-sd.c |   22 ++++++++++++++++++++++
 3 files changed, 30 insertions(+)

-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
