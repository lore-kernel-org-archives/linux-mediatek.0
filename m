Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AA6C369AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=37F1OHaShuh5YOl5yr/QWDxroLyh6khCJ1bm+0dqZBA=; b=2WLsilgmQbiZ/c5OUJnruW7BX7
	/EobpOZ2EKEKiu7AylXuSF0y1x79OW8QOQjPfujRCJWENjn5HbW1h/eGLi9IzyChW/mWGZ2HOr3Qp
	LWSM3W0aOdfuy+EX4b03C9FprnW9Y1+SmZqTCA+lGllP+ULIZKWjKySZUi37x46Jzij1Do5Let1UI
	P3h/oMOEQgEtbr7k0owPT+Yf/UZRfS24u2bhVquMtH+B3/8Dbka6YK4h3UV60D4iNMWnWojTOT9tD
	ecWizh2h8MyacMABsP6DkCwjozHaN+ovirDMzrzbJBqPQmb5YXC3e0AZMDypxCaUAH/a9uFXsFYcB
	0cOoA/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stN4a-00000004SfO-3HNz;
	Wed, 25 Sep 2024 08:08:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stN1h-00000004Ryi-0eFF;
	Wed, 25 Sep 2024 08:05:35 +0000
X-UUID: edd0cc267b1411efb3adad29d29602c1-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=37F1OHaShuh5YOl5yr/QWDxroLyh6khCJ1bm+0dqZBA=;
	b=pGOLeaArNmPatkzqpBux6QUDa46KJXDCaIoj6Ifb472qF4cMqMXTSDpiZ1R7+k3unBoYLgXAU6uNLWEjw/qeT7UGQM68F7MQawg14NVJhn4RsdlW/AwdH3Be45pUC1Kto1zQJ8nTgyde6Qe8tAJGbiXEG7WY4eD/5YsixIhrabA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4a7643e8-ba1c-46c3-bcd6-ce680183c18f,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:96eb889e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: edd0cc267b1411efb3adad29d29602c1-20240925
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1784097261; Wed, 25 Sep 2024 01:05:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 16:05:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 16:05:19 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Tommy Chen <tommyyl.chen@mediatek.com>
Subject: [PATCH v3] arm64: dts: mediatek: mt8195: Add power domain for dp_intf0
Date: Wed, 25 Sep 2024 16:05:15 +0800
Message-ID: <20240925080515.16377-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.739500-8.000000
X-TMASE-MatchedRID: SlB0fb4khOUZ7Eu9TqPx8ED6z8N1m1ALQBnqdxuJ5SA4YKAM3oRt9g2f
	2+c5equm0OsI7hqGDS1Mn6L65ug232QexWkOikPfGVyS87Wb4lwNgFUqZt55AxjQD3m2MCf7tTq
	5wzqAYJijtBJIHld7XYgmzRSnu+RYr78SC5iivxwURSScn+QSXgGlEJORGTlJ+gtHj7OwNO0X9r
	pBZuBDbcFmQGkpeAqhUvhqE0gbH574d28m8PV9uo59ndbLaFhyBITe/0ZtGOk3wa44Od3MjvQPW
	lg2m8guqzTXpO4+RaKcjwfT+qpWaaMnTJRI0XInfXwUEm1ouDzLDYxFC1/7rn6GdNk4NWmA
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.739500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1342942027DFC659AEEAF3ABAF9BB25373D93F3CED4C7E0BD352FAF4A3F0B46E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_010534_029601_DDD7BDED 
X-CRM114-Status: GOOD (  10.31  )
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

During inspecting dtbs_check errors, we found the power domain
setting of DPI node "dp_intf0" is missing. Add power domain setting
to "MT8195_POWER_DOMAIN_VDOSYS0" for "dp_intf0"

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Tommy Chen <tommyyl.chen@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

Changes for v1:
 - This patch is related to adding mt8195-dp-intf to DT schema fix for
  - http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml 
  - patch: https://lore.kernel.org/all/20240924103156.13119-6-macpaul.lin@mediatek.com/

Changes for v2:
 - Fix typo for Tommy's email address. Others remains no change.

Changes for v3:
 - Added Suggested-by: and Reviewed-by: tags. Thanks!

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ade685ed2190..6218bd7abb05 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3252,6 +3252,7 @@ dp_intf0: dp-intf@1c015000 {
 			compatible = "mediatek,mt8195-dp-intf";
 			reg = <0 0x1c015000 0 0x1000>;
 			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
 			clocks = <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
 				 <&vdosys0  CLK_VDO0_DP_INTF0>,
 				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
-- 
2.45.2


