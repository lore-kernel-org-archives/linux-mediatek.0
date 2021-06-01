Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4B0C47080
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 02:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0561061186
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 02:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0561061186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grOnfDN7vzRBTxa8I+c4MOGW6hgrTbiTwQGBM6ab7d4=; b=altDu4uyAkU7Ch
	I4/yqRUrW412aCF4JBMNBmYZtJLVz154aUAjwYUdqxezPNPwTLZ6lNruA/DFFpdtGBX0nagFaVG1h
	AhIgdYyDcTgVTGAZBfS302SbkfhvXqE4odDj0LuowTN/uFb1FnwfM+Xgx1TVjEEhACnw4AdS/4zib
	2yM1Pm7FCkuYYxClTlPeNf4GyIR/kkgPHhG8MVJLu/nQnFjLn7LAkHMkce3UZeHpgFllic94c4Fy0
	HESKCD8xRmWjTuWAx1tT36wZ1l/LR2qMhwKxXrkrri8uMeMxXGn783JTbQ+WESBfH4XURIOe7KRui
	qFeVCn7EY9FrOIg8L7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnuY6-00EKI8-Ng; Tue, 01 Jun 2021 02:54:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnuXt-00EKFp-I8; Tue, 01 Jun 2021 02:54:22 +0000
X-UUID: 7f0d17f337f34c57a02fd586d734a4f4-20210531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2ito/yfQcpRVgcldpMr5Qe1mRG2tPF6gOat2WLctyMU=; 
 b=uqNPCNs8Rr7ZOjo4zMMf2SJsGwTRs91A7xTwOtCXrDZu48I10QSpuxgXGUWefLoYcf1okpqIoOT3L0HEt78eJl/WkZu/ZIazG2adLp4FrWhFZ9FAAS/WuflZl7ABkTrDlxO16DfSIsFaijBLgNzZ/bTGIc+rLEpLxGghyPr87MM=;
X-UUID: 7f0d17f337f34c57a02fd586d734a4f4-20210531
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1057463808; Mon, 31 May 2021 19:54:19 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 19:44:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 10:44:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Jun 2021 10:44:10 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Randy Wu <Randy.Wu@mediatek.com>,
 <youlin.pei@mediatek.com>
Subject: [PATCH 0/2] PCI: mediatek-gen3: Add controller support for MT8195
Date: Tue, 1 Jun 2021 10:44:06 +0800
Message-ID: <20210601024408.24485-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_195421_629588_3968954F 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These series patches modify pcie-mediatek-gen3.c and dt-bindings compatible
string to support the PCIe controller for MT8195.

Jianjun Wang (2):
  dt-bindings: PCI: mediatek-gen3: Add support for MT8195
  PCI: mediatek-gen3: Add controller support for MT8195

 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
 drivers/pci/controller/pcie-mediatek-gen3.c                   | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
