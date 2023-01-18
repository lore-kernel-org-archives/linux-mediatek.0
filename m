Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6D5C00A5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQVMUD7okQLHVM5bRj5IZzkMbKVUxbpiSB0vJMJlbZA=; b=J2+nWb4HgbfC/TxOVLnTIvuG7N
	gLQS2HMl65EohxDqiGvwMB5h6OZdGsEK+0hWxFVNjCaQ7ihVhJqCiKAI5rgquGiUwE0s3uQr2xxxE
	tJCuiv3N9sQ61Z/0tA2F8TqXOuDW0S26YYmidwju/ch6PBp3IwHEwtJ6yAAhChsWf8IBuUxg3omz5
	cM2SOBn9rk5yp9DHRbaJJCP7u3rd5XpaZcB29A2bGhvLoUeLoH01TwGOtmetNCR8jkgzwowfog1Z5
	jd32d0d3kbqaQA/TcQhpn+0/QVUQdD4AiWDWfuz+4XV4wmFHT/QtjmpbykPEbqvDFAH8sNwrXM4nU
	NHT99APw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz22-00GiCr-Hj; Wed, 18 Jan 2023 03:22:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz1m-00Gi4F-Hc; Wed, 18 Jan 2023 03:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xQVMUD7okQLHVM5bRj5IZzkMbKVUxbpiSB0vJMJlbZA=; b=LA30wDWGghfmerQEWUCGzdp5bY
	uLsTW9ePjgBUBfxyPLkCVtGEUwj7FmJA5xYCUPifzKBfEH21TaCNLs2kRtETDdJRVj6qB2bJl4ssf
	mxPuX1DkTyFS1vfVCyxXhH/2RWL6lIa6dGasCCYo1ZeypePzwksvq/CLi8WF6X6Zil91I2qt/q2M9
	4hJ2b9HhDyAULMkFJNBmALSzPLXieZInBC8ZDBnP5DFNV71hzobjtJso/kkJin6i+G+p3MQUTGcgb
	urEYsFSXag4IaNAQ1nxUkj2gUAk31K1hpsQkrkbNZFhEuMYUw5QDpr2lCGqRYFmDIqSWAlOs1EQka
	GBojQjvQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHz1U-0068iE-2g;
	Wed, 18 Jan 2023 03:22:04 +0000
X-UUID: 44f47f3296df11eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xQVMUD7okQLHVM5bRj5IZzkMbKVUxbpiSB0vJMJlbZA=;
	b=e4d54YS/YkTw+L2mPsyWR5AxgBR917aUOPB3wtVEYxpswgUFbopPCrpX9okBQ3TqpT9fwafO0Y1/iEsOVF+wA3JPtLrVsZnvkakMp13LL0XqDcIt0lPZxAJRFYY+kpnMlcIOc/iBOjo+JCQcfPyDKQ/efohoFKhe2TJvX0MgfWM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:2573a045-734b-4225-abbe-8d7798c36ab4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:815ef654-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 44f47f3296df11eda08d4d6090ec5a5c-20230117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2000173133; Tue, 17 Jan 2023 20:21:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 11:21:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 11:21:23 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v6 3/6] arm64: dts: mediatek: mt8195: add MUTEX configuration for VPPSYS
Date: Wed, 18 Jan 2023 11:21:19 +0800
Message-ID: <20230118032122.29956-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118032122.29956-1-moudy.ho@mediatek.com>
References: <20230118032122.29956-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_032201_826805_EAB0FAB3 
X-CRM114-Status: GOOD (  11.45  )
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

In MT8195, the MMSYS has two Video Processor Pipepline Subsystems
named VPPSYS0 and VPPSYS1, each with specific MUTEX to control
Start of Frame(SOF) and End of Frame (EOF) signals.
Before working with them, the addresses, interrupts, clocks and power
domains need to be set up in dts.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8bc38700b945..206dd534c3f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1706,6 +1706,15 @@
 			#clock-cells = <1>;
 		};
 
+		mutex@1400f000 {
+			compatible = "mediatek,mt8195-vpp-mutex";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xf000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MUTEX>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
 		smi_sub_common_vpp0_vpp1_2x1: smi@14010000 {
 			compatible = "mediatek,mt8195-smi-sub-common";
 			reg = <0 0x14010000 0 0x1000>;
@@ -1811,6 +1820,15 @@
 			#clock-cells = <1>;
 		};
 
+		mutex@14f01000 {
+			compatible = "mediatek,mt8195-vpp-mutex";
+			reg = <0 0x14f01000 0 0x1000>;
+			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x1000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_DISP_MUTEX>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
 		larb5: larb@14f02000 {
 			compatible = "mediatek,mt8195-smi-larb";
 			reg = <0 0x14f02000 0 0x1000>;
-- 
2.18.0


