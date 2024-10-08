Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29440CED270
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uoyI+nVkYzrj6lLhx8WQAuejk7KwoCBnxwU+9IsqgPw=; b=U/yAdi+wWYK71fh5OrcL/6CIoZ
	xDMvnxLMgcRM0aanccCtpgeJ0a6yyvDA7mNkga3WkTj0hcwiz2vafq69FBQuuL4mCU97sxiHuY6No
	wahf1jESMILztvxKzUR5BBkL8VH3cJgZgFNOVSQB0Ny/9fBrKWmHgOeXd3Qlr5E8evX23bM3Yt/Oh
	Hdke2nMxy4oRSQ6+HV3DeqUzacl/J1GmqDzFpwLvjH5L3gxn6ZHFJChThi4cqGWSyj/Z/t/5K9FwM
	pwSBI66WSB0mPafPGrnQbOm+Hp17cvoCoSLcMsP9qtEZWR/YXnWZfLMtF3+RveK7kR5Xl/rEfyj7T
	Ti1Sxo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4UI-00000004lcA-01yM;
	Tue, 08 Oct 2024 07:18:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4Rn-00000004lNh-0zY6;
	Tue, 08 Oct 2024 07:15:56 +0000
X-UUID: 25bd5250854511efb3adad29d29602c1-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uoyI+nVkYzrj6lLhx8WQAuejk7KwoCBnxwU+9IsqgPw=;
	b=VRL022xjvG2XR5m947070JkYnaGEfD5J+9Q9hOJAX73kd20ylvJR7xx2fYAF+FDSORNsiHf1/n6sKi2KcIByCUuGw2RaPEKerUAtRCxgx2B33ccrvLNAvvdzXcLb1if9F0rU3PIkkmB3B+NY8QnGrjBPjGtkOS0+ckYtUVEwslw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:887c9fe6-c1fe-4197-b3ab-617b94145e0a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:49cc7526-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 25bd5250854511efb3adad29d29602c1-20241008
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2036881206; Tue, 08 Oct 2024 00:15:50 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Oct 2024 15:15:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Oct 2024 15:15:47 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Seiya Wang <seiya.wang@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen
 Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v2] arm64: dts: mediatek: mt8195: Fix dtbs_check error for tphy
Date: Tue, 8 Oct 2024 15:15:40 +0800
Message-ID: <20241008071540.32607-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_001555_308838_27764D87 
X-CRM114-Status: GOOD (  11.65  )
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

The u3phy1 node in mt8195.dtsi was triggering a dtbs_check error.
The error message was:
  t-phy@11e30000: 'power-domains' does not match any of the regexes:
    '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
Fix this issue by dropping 'power-domains' of u3phy1 node.

This is because MediaTek tphy dose not need to add mtcmos.  It is not
necessary to add 'power-domains'. If the power of the tphy is turned off,
it will affect other functions. From the current USB hardware design
perspective, even if mtcmos is added to the phy, it is always on.

Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 -
 1 file changed, 1 deletion(-)

Changes for v2:
 - Add detail description of the tphy design for explaining the reason
   of this change.

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ade685ed2190..1c6f08dde31c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1920,7 +1920,6 @@ u3phy1: t-phy@11e30000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0 0x11e30000 0xe00>;
-			power-domains = <&spm MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
 			status = "disabled";
 
 			u2port1: usb-phy@0 {
-- 
2.45.2


