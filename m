Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC453C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 06:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fjPhyM0ETWURr4gOHa0K/Dc6pqcNM8k4+6w2fVMFVvo=; b=JcPRmy8I//rHN0GVS08L+0bV+Q
	oBqmqD4fb5YO79YrALVmUVyXOEuV1qrpdH8vY0SFnTQTUPReJ+lWc0i8gpzuEdF/UKM9ry+ive1jh
	7at9cg+d05gCYm4zlUPmqyo5tkqrSl8T1ODqe9NgA+qsTahMfbbpFBcOJYkG4FPKvlAGMYmQkioLL
	wLbXfs6eagi4FkHyuss42Z171K54MJtzKosCeTVB+DYy3GDeT4BaXz3KKYPVZq92dPnHSDzPdePt9
	orXGL5V5FfZlCfToaMYgCCL4yfRLCUiMcIfJcYFcRaVwwMsXksVVKjNd9i6yEa5VVAStNpWsoAkLZ
	5BsadUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ4Xr-00BYcC-8m; Mon, 06 Mar 2023 06:42:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ4Xd-00BYWb-4W; Mon, 06 Mar 2023 06:41:50 +0000
X-UUID: f375f6ecbbe911eda08d4d6090ec5a5c-20230305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fjPhyM0ETWURr4gOHa0K/Dc6pqcNM8k4+6w2fVMFVvo=;
	b=sL2Q7IsoUuzZojF4WviiUJGgVD8xGHjaWdxOF0A8vQSwE+Mp7A53Nh3RJIsoEomGFAVeKR8vFjj52fdIA7meIZ3f1fiMfS7lnpXWKkHWxXpaXPP87Z9AUpAEaQCqoR3a5u5bVy9qdexRWPsDsIhA2Hva9qFm/Y/JlqCzuAvBagg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:d7e459e4-8863-4b58-9f2a-39e180058108,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:4f5a7027-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: f375f6ecbbe911eda08d4d6090ec5a5c-20230305
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 404165824; Sun, 05 Mar 2023 23:41:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 6 Mar 2023 14:41:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 6 Mar 2023 14:41:06 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Rob
 Herring <robh@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jian.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
	<jieyy.yang@mediatek.com>, <qizhong.cheng@mediatek.com>
Subject: [PATCH v2 0/2] PCI: mediatek-gen3: Support controlling power and
Date: Mon, 6 Mar 2023 14:40:57 +0800
Message-ID: <20230306064059.7239-1-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_224149_224106_B5BC93C1 
X-CRM114-Status: UNSURE (   7.35  )
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

From: "jian.yang" <jian.yang@mediatek.com>

These series patches add support for controlling power supplies and reset
GPIO of a downstream component in Mediatek's PCIe GEN3 controller driver.

Changes in v2:
1. Remove an unnecessary property in dt-bindings file.
2. Use the flag 'GPIOD_OUT_LOW' to set initial state of a downstream
component's reset GPIO.
3. Keep downstream component powered on in suspend state if it need to
wakeup the system.

jian.yang (2):
  dt-bindings: PCI: mediatek-gen3: Add support for controlling power and
    reset
  PCI: mediatek-gen3: Add power and reset control feature for downstream
    component

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 17 ++++
 drivers/pci/controller/pcie-mediatek-gen3.c   | 86 ++++++++++++++++++-
 2 files changed, 102 insertions(+), 1 deletion(-)

-- 
2.18.0


