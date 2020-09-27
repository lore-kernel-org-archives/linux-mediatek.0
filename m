Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CBBC4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 07:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E86A23977
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 07:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x+hWQbl7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ATR5yGWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E86A23977
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g9wtOEIzvdbUnN5Gt0GOwIOCQ39B68SKueK3xIJj1nI=; b=x+hWQbl7lDjA6UkPq0ka13QiU0
	ofgrePNKqh9W8uj+3BJuSBPqcbNVAS1xBve4z1WjT/47hUab7EuiInXffOypreEDHXBXV1X8wpuzE
	j0/uindPHKB0jGLDnWK6Lj3/NyRjgSqRIxnnRaEqhNU9G9wtL5+i88wUSex4hy7Y4lpJUg6tRu/Au
	0Bwp3k7oIDfA9+XHTvLBbmeYSLmKm6RsJsMUp5Cnx5coYYrU3kb1TfUJ4EXvUzbCNdvivIkAuN9Jr
	W/0yGDxrNiPLPSmL7eX0PMlHnHHHYTqBfHEVokyzXgcMu+mtKh7fY00osXzFVzM9GLFD2bQl7sOGo
	rfskPfBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMRQT-00043z-4l; Sun, 27 Sep 2020 07:48:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMRQP-00041C-He; Sun, 27 Sep 2020 07:48:51 +0000
X-UUID: f3cf13e1f0ce49c683b6b2720b365ebd-20200926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=d9lyIqtPvPXiR0F6KUQePPMfpcjXX/jEbkNNHhsMUyo=; 
 b=ATR5yGWRVyEyQggLTn+7RM1EyHlkycaN4PaS5p797y61SIzqgnDKq7dFwMkNynd1Nr7Z/voqZrIn7Dmixl4hgMyAeMWoPcSl7ZBoJJIxTxeUDZO7IRlIytWb5Wg5VtUkVwZJlqAAoOl0yFRuJm5lD+xwfEk0vPWL720OzlruQYY=;
X-UUID: f3cf13e1f0ce49c683b6b2720b365ebd-20200926
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 281352778; Sat, 26 Sep 2020 23:48:42 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 00:48:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 15:48:26 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 27 Sep 2020 15:48:25 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [v3,0/3] PCI: mediatek: Add new generation controller support
Date: Sun, 27 Sep 2020 15:45:52 +0800
Message-ID: <20200927074555.4155-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: FEC9D6A66C7B483EF0EF7CCF5000DE10A76B54A9207FFC0B54437214FC778F142000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_034849_710462_F3CE6053 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>,
 sin_jieyang@mediatek.com, Sj
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

Changes in v3:
1. Remove standard property in binding document
2. Return error number when get_optional* API throws an error
3. Use the bulk clk APIs

Changes in v2:
1. Fix the typo of dt-bindings patch
2. Remove the unnecessary properties in binding document
3. dispos the irq mappings of msi top domain when irq teardown

Jianjun Wang (3):
  dt-bindings: PCI: mediatek: Add YAML schema
  PCI: mediatek: Add new generation controller support
  MAINTAINERS: update entry for MediaTek PCIe controller

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  126 ++
 MAINTAINERS                                   |    1 +
 drivers/pci/controller/Kconfig                |   14 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-mediatek-gen3.c   | 1024 +++++++++++++++++
 5 files changed, 1166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
 create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
