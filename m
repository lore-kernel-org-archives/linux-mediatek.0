Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E87BC433FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 00:43:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F7E02250E
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 00:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dLaw/NMl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RD1Ew2Bz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F7E02250E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UmR1X4siqOT6HjC3SCwxuu9oH+2CCMfh6V6yjzrSygY=; b=dLaw/NMlnRb7B1ExpnbsDqTwNm
	1YQ43DUJrgEXxNXkPOsKGc7CpZW3oPzr5cK3qwL8pme04Hg9RweEnD5Lkq2HWI6m0rWQboNxgYZAc
	5PcU5pXp30MgapSOlJ1zwOAKG7Ul5nvi6QgQJyZg7yFfOJhjUvuC7qOLSGJ125nxHJTozay954iwa
	ZqXSHI3cg+2blKZjRRe7HGUzHiyDnoxkB7CvbnlXdZNtE+weAIRqg0W+KkBXKplz13yryU6WiFANU
	ckDMKXGY+aaplcK/UDy8dVuJS19lwhcmCDP4DqFqYRqX6qTAZwWsU801g9ioSaxtpjxb2IVHw++P4
	0i/RCo8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxJta-0005LC-Bz; Mon, 20 Jul 2020 00:43:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxJtS-0005IS-3W; Mon, 20 Jul 2020 00:42:59 +0000
X-UUID: 036e2af3d93a49348945af296b9f1cad-20200719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FaqUdYxqi1XjkwCj1byDtXnVHu3nPZv58uEtqHctoQA=; 
 b=RD1Ew2BzBDEjLs0b+l4Vn+FmhGp67RZ18oVDX8cwJcmdkA+wItOi/U9iwxJvNp6gCudRP7XsbABxCwp0CI9ZYNIWNGUKyuxFt5MLUxSGd0nKdiOD4urkQm4tC+B4OHkYgrhjnaMnrx/wJ9K4Di8ZDAki/Z2YDuqEreEhdOtRuQc=;
X-UUID: 036e2af3d93a49348945af296b9f1cad-20200719
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 827403839; Sun, 19 Jul 2020 16:42:46 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jul 2020 17:42:45 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 08:42:42 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 20 Jul 2020 08:42:42 +0800
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
 <stanley.chu@mediatek.com>, "Kuohong Wang" <kuohong.wang@mediatek.com>
Subject: [PATCH v7 0/4] mmc: mediatek: add mmc cqhci support
Date: Mon, 20 Jul 2020 08:42:35 +0800
Message-ID: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1F865C90232599EFD426CA02B8A9A03CDAD99D6D654D6106C365D8346E3413832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_204258_300565_EC5CB476 
X-CRM114-Status: GOOD (  13.39  )
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

v5 -> v6:
  - Move CQE bindings back to vendor driver
  - Add mt6779 mmc support as an individual patch
  - Error handling for cq_host devm_kzallo()

v6 -> v7:
  - Select MMC_CQHCI for MMC_MTK
  - Remove unnecessary option MMC_CQHCI in mtk-sd.c
  - Add error handling for cqhci_init()
  - Use native cqhci dt-bindings 'supports-cqe'

Chun-Hung Wu (4):
  [1/4] mmc: mediatek: add MT6779 MMC driver support
  [2/4] mmc: mediatek: refine msdc timeout api
  [3/4] mmc: mediatek: command queue support
  [4/4] dt-bindings: mmc: mediatek: Add document for mt6779

 Documentation/devicetree/bindings/mmc/mtk-sd.txt |   1 +
 drivers/mmc/host/Kconfig                         |   1 +
 drivers/mmc/host/mtk-sd.c                        | 160 +++++++++++++++++++++--
 3 files changed, 152 insertions(+), 10 deletions(-)

-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
