Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56840C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 02:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSZzjnX7VdcU1wAob5NemccccXeWVgUtTTSjp0uhbQI=; b=lxXPtdOjNdtN4zWRZ4Gt93u7/p
	Uolr0cfaAAw+qxAZ/rKUvGir2680rqwGVHGYyoj66duZgEpcncoUbWTUAlfNyv4yoPGPWuDcnimIo
	54VpOvzTy70xhwfsvZoknXT2O1Fx1jV9KIbrol8FL4VgFNTR8n5keVlcX9z/P2b50W0TbLBW/BtQT
	f4SLcYqfjRnbbtsPI821Q7SDC6xd5J5m+CCL2UX2GbYCNlX900pInKgQz/5OhokJH3142MCY/0Lpe
	9TxKKA5AF3VZKFBIuoEVVKU8FV2ekwrKFSgFU5Zh0q1grBRA97hrhAgA/t7LPUdnxSPjugiUlO2lY
	Mi1ebmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWwq-003M7U-2r;
	Fri, 24 Mar 2023 02:14:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWwf-003M3Z-0L;
	Fri, 24 Mar 2023 02:14:22 +0000
X-UUID: 7c14fc98c9e911edb7d8d11f642b8e78-20230323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zSZzjnX7VdcU1wAob5NemccccXeWVgUtTTSjp0uhbQI=;
	b=Y/o+oigH1BnxaOCwnOkZI253fxTqJw2Bw3qQE1hldSCs2pWiaipuoHuCmuzPsJLdzeIAx7SlFt28/g+zAxs+859NDl6arX3sVYpoVMkeDyALX8XxJ7nrs5rF7+TNhaullcIsXi6FoEJAGdRNh6x5HxwT1RT3kqid/9ig99ZIxuk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:9d0af4d4-4bfa-4756-a0a2-6f69b1778b1f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:9d0af4d4-4bfa-4756-a0a2-6f69b1778b1f,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:f1495329-564d-42d9-9875-7c868ee415ec,B
	ulkID:2303241013056U4OF2IX,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 7c14fc98c9e911edb7d8d11f642b8e78-20230323
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1430553437; Thu, 23 Mar 2023 19:13:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 24 Mar 2023 10:13:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 10:13:02 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 5/6] arm64: dts: mediatek: mt8186: Add GCE node
Date: Fri, 24 Mar 2023 10:12:57 +0800
Message-ID: <20230324021258.15863-6-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
References: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_191421_154716_08EC8B52 
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

Add the Global Command Engine (GCE) node for MT8186 SoC

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 337bcf3c1571..0d1ff5bb9526 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include <dt-bindings/clock/mt8186-clk.h>
+#include <dt-bindings/gce/mt8186-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/memory/mt8186-memory-port.h>
@@ -625,6 +626,15 @@
 			clocks = <&clk13m>;
 		};
 
+		gce: mailbox@1022c000 {
+			compatible = "mediatek,mt8186-gce";
+			reg = <0 0X1022c000 0 0x4000>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+			clock-names = "gce";
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+		};
+
 		scp: scp@10500000 {
 			compatible = "mediatek,mt8186-scp";
 			reg = <0 0x10500000 0 0x40000>,
-- 
2.18.0


