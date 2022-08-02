Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0A0C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxEsyFSKIzPTV2NC2SKWoXV9WBqqaCkk0yCnS3OK70g=; b=rGlvFrpA4ZtBOT7oz1UWy9nklW
	XT6GBpldy7Jr4WyeEBpNbwzmjtL7HSlYifohVjW5jMdV1oGUPXm28nePYqGDBKj08QTLoixPwk3pf
	t29otip3/8mA829/vaV127Wm02eLQv1c1WWGPTHlqks6PdA1hwXyESxnSeDln4WcxrUm67mX53Dk7
	JASQPWmN6L6rSD4eiY0UbWutpvcCNM0zKKkyRbvylE41E4of1jXS2U28P/qu+kVTUmVKINddymOBB
	xg4AE1CRwlUvkYAvvgxbC8/g2KPmgkV0xFrbKhIs6qjUrTpmMjCHQvh3aMrgmbdHatPiJ1QmnVj/u
	AKspIllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIoG9-00CQOg-7F; Tue, 02 Aug 2022 09:32:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIoG5-00CQLV-Db; Tue, 02 Aug 2022 09:32:15 +0000
X-UUID: 5fd64b0ea1ac49b186f3a027d415bf97-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a34e17c6-375b-4f10-bf7d-164a2be52cd6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:69b50a25-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5fd64b0ea1ac49b186f3a027d415bf97-20220802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 328388604; Tue, 02 Aug 2022 02:32:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 16:51:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 2 Aug 2022 16:51:54 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, <hsinyi@chromium.org>, Allen-kh Cheng
	<allen-kh.cheng@mediatek.corp-partner.google.com>
Subject: [PATCH v13 0/1] Add basic node support for MediaTek MT8186 SoC
Date: Tue, 2 Aug 2022 16:51:51 +0800
Message-ID: <20220802085152.31284-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_023213_618965_35624ECD 
X-CRM114-Status: GOOD (  17.02  )
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

From: Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>

MT8186 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
and 2 CA76 cores. MT8186 share many HW IP with MT65xx series. This
patchset was tested on MT8186 evaluation board to shell.

This series is based on tag: next-20220728, linux-next/master
Since we have a another dts series of mt8195 [1] which is waiting for
review from maintainers. I remove power domains controller node from
this mt8186 series and will update in another patch.

There are some corrections in mt8186 hardware bindings. We need to
apply the below patches.
https://patchwork.kernel.org/project/linux-mediatek/patch/20220725110702.11362-2-allen-kh.cheng@mediatek.com/
https://patchwork.kernel.org/project/linux-mediatek/patch/20220725110702.11362-3-allen-kh.cheng@mediatek.com/
https://patchwork.kernel.org/project/linux-mediatek/patch/20220720130604.14113-2-allen-kh.cheng@mediatek.com/
https://patchwork.kernel.org/project/linux-mediatek/patch/20220721014845.19044-2-allen-kh.cheng@mediatek.com/

[1]
https://patchwork.kernel.org/project/linux-mediatek/list/?series=663978

changes since v12:
 - remove drive-strength fom i2c pins
 - use lowercase hex addresses in pinctrl node
 - correct clk order in xhci0
 - add clk26m for dma_ck

changes since v11:
 - add #cooling-cells in cpu nodes
 - add pmu nodes for mt8186
 - change #interrupt-cells from 3 to 4
 - correct interrupts property in each nodes for 4 interrupt cells
 - remove power domains controller node
 - move #address-cells and #size-cells into mt8186.dts
 - remove unused ahb_cg clock in mmc0
 - add efuse node
 - add dsi node and remove dpi node
 - move i2c status position in mt8186-evb.dts
 - change i2c child nodee name in pio node to *-pins
 - change property from mediatek,drive-strength-adv to drive-strength-microamp in i2c child nodes of pio
 - change drive-strength value from MTK_DRIVE_4mA to 4 in i2c child nodes of pio
 - change i2c child nodes from pins-sda-sc1 to pins-bus
 - correct pintctrl clk names

changes since v10:
 - remove merged PATCHes
 - add pmu nodes
 - add #cooling-cells
 - change #interrupt-cells number from 3 to 4
 - remove power domains controller node
 - move #address-cells/#size-cells into mt8186.dts from evb dts for i2c
 - move status = 'okay' position in i2cx
 - fix pinctrl patternproperties name in pio
 - add efuse node
 - fix dsi node
 - add #reset-cells in infracfg_ao: syscon

changes since v9:
 - remove some merged PATCHs from series
 - reorder nodes in dts (cpu-map)
 - remove okay status in auxadc
 - remove unnecessary suffix node name for i2c
 - add pwm node 
 - add dsi-phy node 
 - add dpi node 

changes since v9:
 - add one space before equal sign of drive-strength-adv
 - corect compatible name for big cores (ca76)
 - use upper case of address in pinctrl
 - add pwrap node
 - add pwm node

changes since v8:
 - change name from pins_bus to pins-sda-scl
 - correct email address
 - add capacity-dmips-mhz for each CPU
 - add ppi-partitions in gic node
 - change name to power-domain
 - remove status "okay" in scp node
 - update timer and pericfg compatible in series

changes since v7:
 - add scp&auxadc node

changes since v6:
 - remove unnecessary blank line

changes since v5:
 - replace Mediatek a to MediaTek
 - use GPL-2.0-only OR BSD-2-Clause

changes since v4:
 - correct driver clock of mt8186
 - add power domains controller and clock controllers
 - add pinctrl, usb host, spi and i2c nodes
 - add node status in mt8186-evb.dts
 - correct some dtbs_check warnings

changes since v3:
 - remove serial, mmc and phy patch from series. (already merged)
 - remove mcusysoff node
 - move oscillator nodes at the head of dts
 - change name from usb-phy to t-phy

changes since v2:
 - add soc {} in mt8186.dtsi

changes since v1:
 - add dt-bindings: arm: Add compatible for MediaTek MT8186

Allen-KH Cheng (1):
  arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile

 arch/arm64/boot/dts/mediatek/Makefile       |   1 +
 arch/arm64/boot/dts/mediatek/mt8186-evb.dts | 228 +++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi    | 875 ++++++++++++++++++++
 3 files changed, 1104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi

-- 
2.18.0


