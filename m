Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD547C2D0A7
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:17:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3574E2177B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pM7Cd+bl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gbwJCdDt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3574E2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VtV5Ph9qKmp4dlkNcsBIOkPYDYaqRsndnzZh+90bVmE=; b=pM7Cd+blgyRmNrjH9w9vjxK4sj
	j0USzHuD1Gdr134vz1G3Atbgth0DpPOovuzO6DSzhJQoQ8JgCKbh19wDN0Opbtgt6vc/Ya14jC/Re
	Wvt02gP1G5xos18AwbhBIjaJoiLA2z+QKg+Cxmt10TGmbnRnzD/FAVGQPaevjv6w5mUACtxDUotwK
	OBL0mOC/tgTETjl4rMRv+xwonFcoxezvGBRGX2GX6ioetM/sM+eQ8bnihm/ymE7ukVtn5oB0Qpxh6
	OHlIUt8FCGH2u9lnWdT9ByzpS8Z/gPz8+yUabh5FhiOdrqh8HkYzktgwAKuD7mIXWoc2o/w3tnpzz
	Ir7IRfAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFG5Q-00071q-44; Mon, 07 Sep 2020 12:17:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFG59-0006tx-UV; Mon, 07 Sep 2020 12:17:13 +0000
X-UUID: f423433588e54de5aa22b9078a8b6385-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mWs1TicmUihewvCBjVKC06mEcTl47586ruiLpRjWtf0=; 
 b=gbwJCdDtVsk9PRBGGM7+6KGiNX2/4DJvkYqRFU/EQSWEpGvESN0i9nHEpq8iyuzV2hoGdFt7PD/B8vyDPbdiL+F18a+R6s7uhrYsJdjZpCFvzIZR3JXeaWMFmUwwis3UhW2NLg9D4TaYnENMkXNnyTPuoNXi91w8L7YnzZu+NQA=;
X-UUID: f423433588e54de5aa22b9078a8b6385-20200907
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1172452470; Mon, 07 Sep 2020 04:10:55 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 05:10:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 20:10:45 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Sep 2020 20:10:45 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [v1,0/3] PCI: mediatek: Add new generation controller support
Date: Mon, 7 Sep 2020 20:08:49 +0800
Message-ID: <20200907120852.12090-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_081712_164549_13BA056C 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Sj
 Huang <sj.huang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These series patches add pcie-mediatek-gen3.c and dt-bindings file to
support new generation PCIe controller.

Jianjun Wang (3):
  dt-bindings: Add YAML schemas for Gen3 PCIe controller
  PCI: mediatek: Add new generation controller support
  MAINTAINERS: update entry for MediaTek PCIe controller

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  158 +++
 MAINTAINERS                                   |    1 +
 drivers/pci/controller/Kconfig                |   14 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-mediatek-gen3.c   | 1063 +++++++++++++++++
 5 files changed, 1237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
 create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
