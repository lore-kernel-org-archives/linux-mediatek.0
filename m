Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962B9CE7B1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/i9DeA8LdPwAdmE9HcBWTajPCE+8XABsIEkcwpo4eO4=; b=uqu1255CiGnfm3+wwQNUz+JDSr
	xREB3Rjf9PVxTIgS6tQ4/9Zi5rqETKeqrotcpopgZv3btd4s/88OhUBgRU/MMFLCZlinWrp2uggff
	+ccE6ymCCi8ntUvox/rw+bY0fzmyKn2LTHlJOXF4ZnsnOu4BfYKBvjwOus5ZXzr/ImerXvMjDdYON
	3OVZxL+fEoY5ERcZ4XerGO3HQBLsLIrLMXr7Qc4ay6z9r0u5etfE2zbrct/1GZUe0t0dQA0VzV9mS
	t4zP3sGV3WrWYaJoBFPG/NN21Vl4J29XuKwdOVnJRPskxB1dj4XQ5Q4phtKw5Os3uLgDiC6P17mNY
	Pn9ykQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloju-0030hO-2c;
	Thu, 28 Sep 2023 10:59:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlojj-0030UX-0Z;
	Thu, 28 Sep 2023 10:59:19 +0000
X-UUID: 0bf96cf25dee11ee9b7791016c24628a-20230928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/i9DeA8LdPwAdmE9HcBWTajPCE+8XABsIEkcwpo4eO4=;
	b=d49GEh2VrxaOlvBDj1+tZy2FbyAuL6iiWb5iSzv5wRjFQIM9ulIwoV/FCTd890kWTmsQqxrfZRyfYfbIVf0/Ibh0ufHNOv1JmboF5shhlYfbtpP9b+rijl33WnIMLjlWV5/tdswR2oKajbe0IjdYTWU84lABp6p7YS/chxqJfsU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:498ecb5f-d630-44db-8b4f-765e73b11f91,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:9ad03df0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0bf96cf25dee11ee9b7791016c24628a-20230928
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2110320746; Thu, 28 Sep 2023 03:59:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Sep 2023 18:58:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Sep 2023 18:58:31 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Rob Herring <robh@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Chuanjia.Liu@mediatek.com>, <Jieyy.Yang@mediatek.com>,
	<Qizhong.Cheng@mediatek.com>, <Jian.Yang@mediatek.com>, Jian Yang
	<jian.yang@mediatek.com>
Subject: [PATCH v3 0/2] PCI: mediatek-gen3: Support controlling power supplies
Date: Thu, 28 Sep 2023 18:58:18 +0800
Message-ID: <20230928105819.5161-1-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_035915_260385_15B838AF 
X-CRM114-Status: UNSURE (   7.56  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These series patches is based on linux-next, tag: next-20230921.
Add support for controlling power supplies and reset GPIO of a downstream
component in Mediatek's PCIe GEN3 controller driver.

Changes in v3:
1. Modify description of power supply properties in DT binding.
2. Remove unused header files.
3. Use 'device_wakeup_path' to determine whether the downstream component
needs to skip the reset process in system suspend scenarios.

jian.yang (2):
  dt-bindings: PCI: mediatek-gen3: Add support for controlling power and
    reset
  PCI: mediatek-gen3: Add power and reset control feature for downstream
    component

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 25 +++++
 drivers/pci/controller/pcie-mediatek-gen3.c   | 93 ++++++++++++++++++-
 2 files changed, 117 insertions(+), 1 deletion(-)

-- 
2.18.0


