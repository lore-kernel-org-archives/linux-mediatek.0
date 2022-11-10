Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E40C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 06:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=84saUm07sHkS+69W4QOppbFpU/x8JAb9SSJ/c2QTrG4=; b=gw3g1NykJDO9xdT/99uDTqUlOC
	0/N5gxKqg/VxtgBeARFH0AkfLotFxI5WePPNB5iTHhohS80zCguQ8y+TxTkhMdzwRQlPZIXCd0FE1
	pgNhdklrG3wkd7zJ7oeDmVT8NDibii+4nkACZpGCWh/0NUuk2aASbgN1EuIPcAMJ17toU9e+dgGlz
	L2KOSFOWmXrn9Q1rduQmhbDLNHGx9XdwGiRTXOIM34/iz9jIlVXGZtjDHxlFKyjPabztAgTUhRCBS
	GDDlmiltC+2xvLkDoUgyb45x9mQTE0F5y7waXH53mXYSa6iRdP9PHbiSDb7M/FoPu+ftg2ZPkmahn
	7f0DKDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1Cj-003SMP-W8; Thu, 10 Nov 2022 06:38:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1CO-003QO5-H6; Thu, 10 Nov 2022 06:38:07 +0000
X-UUID: 178ed4d5b0784033837c90b5a3b71edf-20221109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=84saUm07sHkS+69W4QOppbFpU/x8JAb9SSJ/c2QTrG4=;
	b=FsCj7fpZ6foYA3h9EsTkPY4MaQVs2cUZRMrajoRaKhfF+U6sCelRP7XZKBydNScifut+LdlDsVcfObZGZY+R7BKdW4ycz+juVZbQFtnPp7a9FQRSohtvC/LiPNyqm4kFg6KgVuU7sg00F8OesAMM0Hsvi1dKi06pAb4zvxc7ljw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:0c3e481d-b763-41ed-a9c3-ec6763dec51c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:cd17e350-b7af-492d-8b40-b1032f90ce11,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 178ed4d5b0784033837c90b5a3b71edf-20221109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 209208318; Wed, 09 Nov 2022 23:37:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 14:37:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 14:37:17 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v4 0/4] Add dp-intf and dp nodes
Date: Thu, 10 Nov 2022 14:37:12 +0800
Message-ID: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_223804_586457_91B67109 
X-CRM114-Status: UNSURE (   6.78  )
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

This series add MediaTek dp-intf nodes and dp nodes.
This series is based on linux-next-20220915.

Changes for v4:
1. Rebase to linux-next 20221109.

Changes for v3:
1. Update commit message for "arm64: dts: mediatek: cherry: Add edptx and dptx support".

Changes for v2:
1. Update commit messages.
2. reorder the place of "status = "disabled";"
3. reorder the place of dp-intf.

Bo-Chen Chen (4):
  arm64: dts: mt8195: Add dp-intf nodes
  arm64: dts: mt8195: Add edptx and dptx nodes
  arm64: dts: mediatek: cherry: Add dp-intf ports
  arm64: dts: mediatek: cherry: Add edptx and dptx support

 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 86 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 48 +++++++++++
 2 files changed, 134 insertions(+)

-- 
2.18.0


