Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A8EC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 03:48:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6132C21D6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 03:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pcvGMFCq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sgrqUQ4D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6132C21D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=co70g2c5JZbYfqrM6VK5ikWpmHbVRQploQv/9HLSs6E=; b=pcvGMFCqR3Nn0d/n62nK9NC4On
	lJmuLp5fn3xEsUwHTPiB3Hawaa3lgvabNCy2l2rFVkheNLDnuZWbAV8vi6FdR6lWgvLaWO6Yu2Ny2
	7+IJTOJBX31qAtnf5ol0tJ0yOiUVz/DVv0Fd6T5ea8241TTajnx+zBryTA5jaFOpzVxR6Mtlnfaj+
	gyw+Z4IRKROZrWYGdIOYMPe4WOKTvcpLcLpvb5Y0X5nfUMj0sA1RbcDsSKuo5JG+QECbaykjJKkg2
	9r9VYgGAOkYUca2ytOkVn+4zLswNCpj2X489VsCV5zMvQwvxq5BzWe7LBpqAW3w4seFSquM6pGUE8
	Rr8rTtXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGDYx-0007MN-9R; Thu, 10 Sep 2020 03:47:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGDYu-0007Km-E4; Thu, 10 Sep 2020 03:47:53 +0000
X-UUID: c9e2c04aa36144e7af16f18727fd7821-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=i74HM4n2z7CpO2GU1v53gI/FrljpvWxIeevuuyVHQjk=; 
 b=sgrqUQ4Dc0/ZFHxToYjcckhZkrKIrAC8hTS15IeX18gtPKVgDSZg/NDJGBJucREpTcvep2vY7mM98rjRM2wT4OeL1o//F82iVH1tlWmxqRQ2DFroaLqQKhgqkiSzoAh586NuT0XGMrxmqXTLKqimr9ma83WF5t5498Skj18cX2o=;
X-UUID: c9e2c04aa36144e7af16f18727fd7821-20200909
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1059491346; Wed, 09 Sep 2020 19:47:44 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 20:47:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 11:47:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 11:47:40 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [v2,0/3] PCI: mediatek: Add new generation controller support
Date: Thu, 10 Sep 2020 11:45:33 +0800
Message-ID: <20200910034536.30860-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_234752_617870_7FEB246F 
X-CRM114-Status: GOOD (  11.47  )
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

Change in v2:
1. Fix the typo of dt-bindings patch
2. Remove the unnecessary properties in binding document
3. dispos the irq mappings of msi top domain when irq teardown

Jianjun Wang (3):
  dt-bindings: PCI: mediatek: Add YAML schema
  PCI: mediatek: Add new generation controller support
  MAINTAINERS: update entry for MediaTek PCIe controller

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  130 ++
 MAINTAINERS                                   |    1 +
 drivers/pci/controller/Kconfig                |   14 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-mediatek-gen3.c   | 1076 +++++++++++++++++
 5 files changed, 1222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
 create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
