Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374DAC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7PYeSbs1rJ/yIu6lL50fcsiJCbAbHIheAPMIeRRMdDA=; b=cOinDr8Tp/gheRWK4hxN4BWH2U
	CFO0Ut+lXTDHQ6BtNvssXcROP8/+1mqQ473YSnqYHxUqG0Z1aLZKk3i1+KPgQRMFUR9sDQAfyk1yM
	DL85Xb9/N9Q0KRKYoPfM4GHduoLBaUmTPINEO0YS0SvZH3VBoY/Z3jGzDifw2vUaFYvHPCECLGfXs
	ef7BizeqDPNqKHbs42hM914QJLvwgTjYNj+uUIdJVbG9spfAfbutLfWJMxnhLv2z60WkPoFOzPN5r
	wP/WuiwE2o5vX85PoGZA6MFSM65qojkjm96lQpreQxTtV2n1OAPz5AF/qmTUmivE+oJpEFwqpha5Q
	57DZz5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5UX-00HOTM-FO; Wed, 19 Oct 2022 09:36:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5UT-00HORd-KY; Wed, 19 Oct 2022 09:35:59 +0000
X-UUID: 9148efe5768f4441861c392a9adad702-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7PYeSbs1rJ/yIu6lL50fcsiJCbAbHIheAPMIeRRMdDA=;
	b=mvHx6cltk6O2/41eJEo462t/zsdjV32ufzZLzwQ7wtLnm7ttPPchtOkILVMHFtRwqxSOZPzTKsZ9zY57+BXZo/JZQkrkwUfEfMVvJSzo+5hexbgDTv2+RAdVrRJeeAFLoA0ISwe1CJk9La/Ig+L+d/6EyjZFe5XSvyKZp7Vrri0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:0ee51dd1-912e-42d0-bb02-b8cdbb3b7792,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:2070c5ee-314c-4293-acb8-ca4299dd021f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9148efe5768f4441861c392a9adad702-20221019
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1665763523; Wed, 19 Oct 2022 02:35:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Oct 2022 17:15:18 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Oct 2022 17:15:17 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Biao
 Huang <biao.huang@mediatek.com>, <macpaul.lin@mediatek.com>
Subject: [PATCH v2 0/1] arm64: dts: mt8195: Add Ethernet controller
Date: Wed, 19 Oct 2022 17:15:14 +0800
Message-ID: <20221019091515.21878-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_023557_953167_B398F412 
X-CRM114-Status: UNSURE (   8.27  )
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

Changes in v2:
1. modify pinctrl node used by ethernet to match rules in pinctrl-mt8195.yaml,
as comments from Krzysztof.
2. remove "mac-address" property in ethernet node as comments from Krzysztof.

Changes in v1:
add dts node for MT8195 Ethernet controller

Biao Huang (1):
  arm64: dts: mt8195: Add Ethernet controller

 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 86 +++++++++++++++++++
 2 files changed, 174 insertions(+)

-- 
2.18.0



