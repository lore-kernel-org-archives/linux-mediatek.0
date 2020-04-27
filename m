Return-Path: <SRS0=gkfg=6L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E707EC83003
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2020 23:59:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FA820775
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2020 23:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xl1cC2Qo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MNpXtV4H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1FA820775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NQXLHJFrwYrkwEMoiJO3Q0CqwqBmaxAezY4zGop6evQ=; b=Xl1cC2QofkmkNN
	KTPAHhaBpgcqha8HPbeztZUHaet43BJQY8op7UtOqz9n2ZnOHjeUWw/SZ+MDkRx9J9hIJWZ8QYZa1
	Fx101+ndkXYme99Q151zyZgZERjbggQu6HrW7h/fN1lqoEG45gZwSrTv2brlEfYYxqPoorlrUjzUQ
	KsJHOFiFdSOx3irfsklu5c7nVmoWqHUtQtm5D94Y/0V7WxJ9m1DRiXh6IUC8DZnqjIN8RY7mY6CtK
	/wNIrO1G1aaoHtSG60VTSRHatS+bbG1aZxJyd/gOpIzMDGXQsKm7gavw6iY5iNoYPMtLAaitqrFca
	Qkgmg0rUxgkVxYyASgHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTDeH-0001cL-Ni; Mon, 27 Apr 2020 23:58:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTDcn-0000Cn-Ap; Mon, 27 Apr 2020 23:57:23 +0000
X-UUID: fe401303cf564a6db9aa622036f99095-20200427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aI88OR5SoOs9oP8eEG6yM2tCCWEGm3PDTnuHvBFnmpg=; 
 b=MNpXtV4Hi3HmuHHkkvUwJF5agIVCYq3l53uNtTP5aW9rPdmThk2iLIBT4JT+PW2n+51ZqEc/ToeBaPmrmuBF0LB3yOqdFVCnJM5K8i6fXDvs2x36VE2oTq4fM2VzfLc67knoJi67hUbgeRObcPF7kFGxNv2sjCUBohZW5b3htuY=;
X-UUID: fe401303cf564a6db9aa622036f99095-20200427
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1288457455; Mon, 27 Apr 2020 15:57:16 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Apr 2020 16:57:14 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 07:57:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Apr 2020 07:56:09 +0800
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>, "Al
 Cooper" <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek
 <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate
 Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Pan Bian <bianpan2016@163.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 "Mathieu Malaterre" <malat@debian.org>, Stanley Chu
 <stanley.chu@mediatek.com>, "Kuohong Wang" <kuohong.wang@mediatek.com>, Yong
 Mao <yong.mao@mediatek.com>
Subject: [PATCH v5 0/5] mmc: mediatek: add mmc cqhci support
Date: Tue, 28 Apr 2020 07:56:03 +0800
Message-ID: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_165721_405423_5B8560B9 
X-CRM114-Status: GOOD (  10.84  )
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
  - Extend mmc_of_parse() to parse CQE bindings
  - Remove redundant host CQE bindings
  - Refine msdc timeout api to reduce redundant code
  - MediaTek command queue support
  - dt-bindings for mt6779

v1 -> v2:
  - Add more patch details in commit message
  - Separate msdc timeout api refine to individual patch

v2 -> v3:
  - Remove CR-Id, Change-Id and Feature in patches
  - Add Signed-off-by in patches

v3 -> v4:
  - Refine CQE bindings in mmc_of_parse (Ulf Hansson)
  - Remove redundant host CQE bindings (Linux Walleij)

v4 -> v5:
  - Add Acked-by and more maintainers

Chun-Hung Wu (5):
  [1/5] mmc: core: Extend mmc_of_parse() to parse CQE bindings
  [2/5] mmc: host: Remove redundant CQE bindings
  [3/5] mmc: mediatek: refine msdc timeout api
  [4/5] mmc: mediatek: command queue support
  [5/5] dt-bindings: mmc: mediatek: Add document for mt6779

 Documentation/devicetree/bindings/mmc/mtk-sd.txt |   1 +
 drivers/mmc/core/host.c                          |   5 +
 drivers/mmc/host/mtk-sd.c                        | 151 +++++++++++++++++++++--
 drivers/mmc/host/sdhci-brcmstb.c                 |  11 +-
 drivers/mmc/host/sdhci-msm.c                     |   3 +-
 drivers/mmc/host/sdhci-of-arasan.c               |   3 -
 drivers/mmc/host/sdhci-tegra.c                   |   2 +-
 7 files changed, 155 insertions(+), 21 deletions(-)

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
