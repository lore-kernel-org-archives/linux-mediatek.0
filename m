Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98C2C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 01:19:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB112076C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 01:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AtssetPV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DIXfy89t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB112076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qz2WpSXy7W02blqRgfOZ5sL6K/9mw0roBDlSKguZMPQ=; b=AtssetPVr2UYIv
	+i3tRifsOPE9g/b/QeRRrTYXBQtliddYATfGnUhuQmsoG0UNJK3XfCdiZXVNXyDjbhG0zfPI/97sg
	R7SEnnpW67KaxotChnK5puFd+lrQG/WeFbXUpj2Jp53Ivj5+cXhnBYLj8JmQ3YVOsJQsTa2u3IzAT
	OyS5RHlWL6M+MZO8SdZBVH7agBhhkYQb66CWQ7P+dF48OaBIBv7DDP+XelA4Z8PecZk399QcvSYIN
	RUY9CPm4VF6faOilS0PWV9MtChE+DMc9OrAXgtgintP1mBrMXdoCMU8MGj0u/+/AABaXB8BG3DrmU
	+snhARA+SyD9m5uF0eog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiSv2-0002UL-47; Tue, 09 Jun 2020 01:19:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiSuc-00023X-9P; Tue, 09 Jun 2020 01:18:48 +0000
X-UUID: 2ba83f73f0564494a826e8927b6b04a6-20200608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0WegPlvM9vUi/d04qilRhSbRo+qKS3G08/0Uft4NY9Y=; 
 b=DIXfy89t42jmOiSyXyBEzAhusEY83G6oER3qJhjGUjJNNoxDJXy26YV+3QCN/x9LuNi3+xS5dIhgE1/bUCPGbH8uh6yaUwJoeIBMajOeMWkUBbTVSCVlO9lgn5ABKmlPMdSBjGKwpI0sXWEXjhZ2LkCBw4QbfBjNLoBwMCIN1FU=;
X-UUID: 2ba83f73f0564494a826e8927b6b04a6-20200608
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1136865740; Mon, 08 Jun 2020 17:18:38 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Jun 2020 18:18:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 09:18:32 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 9 Jun 2020 09:18:32 +0800
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
Subject: [PATCH v6 0/4] mmc: mediatek: add mmc cqhci support
Date: Tue, 9 Jun 2020 09:18:18 +0800
Message-ID: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: F4D6614A1A95732A3231291BAAF20B2BCD9D03A15DF698C063B4A42EA2E20AE42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_181846_341303_FD85DBC7 
X-CRM114-Status: UNSURE (   9.41  )
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

v5 -> v6:
  - Move CQE bindings back to vendor driver
  - Add mt6779 mmc support as an individual patch
  - Error handling for cq_host devm_kzallo()

Chun-Hung Wu (4):
  [1/4] mmc: mediatek: add MT6779 MMC driver support
  [2/4] mmc: mediatek: refine msdc timeout api
  [3/4] mmc: mediatek: command queue support
  [4/4] dt-bindings: mmc: mediatek: Add document for mt6779

 Documentation/devicetree/bindings/mmc/mtk-sd.txt |   4 +
 drivers/mmc/host/mtk-sd.c                        | 164 +++++++++++++++++++++--
 2 files changed, 158 insertions(+), 10 deletions(-)

-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
