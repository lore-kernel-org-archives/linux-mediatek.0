Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EEAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 12:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nx4+nyLkxHQqhY1VjCC3nHKw2zFWnqj8XE3636zvWbo=; b=exQoQ+z21fGHFc
	OBU5UUNeMm+Uj46LMC2bDvBi3Om/7TjriIg3tgxZizHWmZ4S0/Vnp3d7VbsI8JNzdP7UAUYzLk1iT
	hQokS42OYor5BtyF1jlTnnif8W0ivVFSYtJ2vpJIj17NifvHEVs3zMsSX174wKRXxNVfgM/ow7CQn
	gY419COPkLfcsoj7C9m5rrch1xAZxGQHi1HSYqJVeOEWuTW/QeV2xpsFfIlwU5PC6wsFilqKJa68+
	eQnzDEQ6mmQU5EhbaHQrnIiY2hJIfqcMXHdBnG4GR2gdwIA3MljDxADEaXjlHws8HS9UpYq/fjZ/H
	3Uu1EIftpMno4SXriKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk2zD-006inb-38; Thu, 28 Apr 2022 12:11:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk2uv-006gri-Di; Thu, 28 Apr 2022 12:06:43 +0000
X-UUID: bb925472259a4986a4fe47cd3a339048-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4b358a42-37dc-4bea-92ab-402bae6b1cf3, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:3ca0d4c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: bb925472259a4986a4fe47cd3a339048-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 985307781; Thu, 28 Apr 2022 05:06:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 04:56:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 19:56:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 19:56:23 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V5 13/16] dt-bindings: reset: mediatek: Add infra_ao reset bit
 for MT8192
Date: Thu, 28 Apr 2022 19:56:16 +0800
Message-ID: <20220428115620.13512-14-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
References: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_050641_497752_8B56EFCC 
X-CRM114-Status: UNSURE (   8.95  )
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

To support reset of infra_ao, add the bit definitions for MT8192.
There are 5 banks for infra reset and 32 bits for each bank.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 include/dt-bindings/reset/mt8192-resets.h | 163 ++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
index be9a7ca245b9..5863d138568a 100644
--- a/include/dt-bindings/reset/mt8192-resets.h
+++ b/include/dt-bindings/reset/mt8192-resets.h
@@ -7,6 +7,7 @@
 #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
 #define _DT_BINDINGS_RESET_CONTROLLER_MT8192
 
+/* TOPRGU resets */
 #define MT8192_TOPRGU_MM_SW_RST					1
 #define MT8192_TOPRGU_MFG_SW_RST				2
 #define MT8192_TOPRGU_VENC_SW_RST				3
@@ -27,4 +28,166 @@
 
 #define MT8192_TOPRGU_SW_RST_NUM				23
 
+/* INFRA RST0 */
+#define MT8192_INFRA_RST0_THERM_CTRL_SWRST	0
+#define MT8192_INFRA_RST0_USB_TOP_SWRST		1
+#define MT8192_INFRA_RST0_AP_MD_CCIF_4_SWRST	2
+#define MT8192_INFRA_RST0_MM_IOMMU_SWRST	3
+#define MT8192_INFRA_RST0_MSDC3_SWRST		4
+#define MT8192_INFRA_RST0_MSDC2_SWRST		5
+#define MT8192_INFRA_RST0_MSDC1_SWRST		6
+#define MT8192_INFRA_RST0_MSDC0_SWRST		7
+#define MT8192_INFRA_RST0_AP_DMA_SWRST		8
+#define MT8192_INFRA_RST0_MIPI_D_SWRST		9
+#define MT8192_INFRA_RST0_MIPI_C_SWRST		10
+#define MT8192_INFRA_RST0_BTIF_SWRST		11
+#define MT8192_INFRA_RST0_SSUSB_TOP_SWRST	12
+#define MT8192_INFRA_RST0_DISP_PWM_SWRST	13
+#define MT8192_INFRA_RST0_AUXADC_SWRST		14
+#define MT8192_INFRA_RST0_RSV0			15
+#define MT8192_INFRA_RST0_RSV1			16
+#define MT8192_INFRA_RST0_RSV2			17
+#define MT8192_INFRA_RST0_RSV3			18
+#define MT8192_INFRA_RST0_RSV4			19
+#define MT8192_INFRA_RST0_RSV5			20
+#define MT8192_INFRA_RST0_RSV6			21
+#define MT8192_INFRA_RST0_RSV7			22
+#define MT8192_INFRA_RST0_RSV8			23
+#define MT8192_INFRA_RST0_RSV9			24
+#define MT8192_INFRA_RST0_RSV10			25
+#define MT8192_INFRA_RST0_RSV11			26
+#define MT8192_INFRA_RST0_RSV12			27
+#define MT8192_INFRA_RST0_RSV13			28
+#define MT8192_INFRA_RST0_RSV14			29
+#define MT8192_INFRA_RST0_RSV15			30
+#define MT8192_INFRA_RST0_RSV16			31
+
+/* INFRA RST1 */
+#define MT8192_INFRA_RST1_IRTX_SWRST	32
+#define MT8192_INFRA_RST1_SPI0_SWRST	33
+#define MT8192_INFRA_RST1_I2C0_SWRST	34
+#define MT8192_INFRA_RST1_I2C1_SWRST	35
+#define MT8192_INFRA_RST1_I2C2_SWRST	36
+#define MT8192_INFRA_RST1_I2C3_SWRST	37
+#define MT8192_INFRA_RST1_UART0_SWRST	38
+#define MT8192_INFRA_RST1_UART1_SWRST	39
+#define MT8192_INFRA_RST1_UART2_SWRST	40
+#define MT8192_INFRA_RST1_PWM_SWRST	41
+#define MT8192_INFRA_RST1_SPI1_SWRST	42
+#define MT8192_INFRA_RST1_I2C4_SWRST	43
+#define MT8192_INFRA_RST1_DVFSP_SWRST	44
+#define MT8192_INFRA_RST1_SPI2_SWRST	45
+#define MT8192_INFRA_RST1_SPI3_SWRST	46
+#define MT8192_INFRA_RST1_UFSHCI_SWRST	47
+#define MT8192_INFRA_RST1_RSV0		48
+#define MT8192_INFRA_RST1_RSV1		49
+#define MT8192_INFRA_RST1_RSV2		50
+#define MT8192_INFRA_RST1_RSV3		51
+#define MT8192_INFRA_RST1_RSV4		52
+#define MT8192_INFRA_RST1_RSV5		53
+#define MT8192_INFRA_RST1_RSV6		54
+#define MT8192_INFRA_RST1_RSV7		55
+#define MT8192_INFRA_RST1_RSV8		56
+#define MT8192_INFRA_RST1_RSV9		57
+#define MT8192_INFRA_RST1_RSV10		58
+#define MT8192_INFRA_RST1_RSV11		59
+#define MT8192_INFRA_RST1_RSV12		60
+#define MT8192_INFRA_RST1_RSV13		61
+#define MT8192_INFRA_RST1_RSV14		62
+#define MT8192_INFRA_RST1_RSV15		63
+
+/* INFRA RST2 */
+#define MT8192_INFRA_RST2_PMIC_WRAP_SWRST	64
+#define MT8192_INFRA_RST2_SPM_SWRST		65
+#define MT8192_INFRA_RST2_USBSIF_SWRST		66
+#define MT8192_INFRA_RST2_RSV0			67
+#define MT8192_INFRA_RST2_KP_SWRST		68
+#define MT8192_INFRA_RST2_APXGPT_SWRST		69
+#define MT8192_INFRA_RST2_CLDMA_AO_SWRST	70
+#define MT8192_INFRA_RST2_UNIPRO_UFS_AO_SWRST	71
+#define MT8192_INFRA_RST2_DX_CC_AO_SWRST	72
+#define MT8192_INFRA_RST2_UFSPHY_AO_SWRST	73
+#define MT8192_INFRA_RST2_RSV1			74
+#define MT8192_INFRA_RST2_INFRACFG_AO_MEM_SWRST	75
+#define MT8192_INFRA_RST2_PWM_AO_SWRST		76
+#define MT8192_INFRA_RST2_TIA_AO_SWRST		77
+#define MT8192_INFRA_RST2_PMIFSPMI_SWRST	78
+#define MT8192_INFRA_RST2_PEXTP_PHY_SWRST	79
+#define MT8192_INFRA_RST2_RSV2			80
+#define MT8192_INFRA_RST2_RSV3			81
+#define MT8192_INFRA_RST2_RSV4			82
+#define MT8192_INFRA_RST2_RSV5			83
+#define MT8192_INFRA_RST2_RSV6			84
+#define MT8192_INFRA_RST2_RSV7			85
+#define MT8192_INFRA_RST2_RSV8			86
+#define MT8192_INFRA_RST2_RSV9			87
+#define MT8192_INFRA_RST2_RSV10			88
+#define MT8192_INFRA_RST2_RSV11			89
+#define MT8192_INFRA_RST2_RSV12			90
+#define MT8192_INFRA_RST2_RSV13			91
+#define MT8192_INFRA_RST2_RSV14			92
+#define MT8192_INFRA_RST2_RSV15			93
+#define MT8192_INFRA_RST2_RSV16			94
+#define MT8192_INFRA_RST2_RSV17			95
+
+/* INFRA RST3 */
+#define MT8192_INFRA_RST3_DX_CC_SEC_SWRST	96
+#define MT8192_INFRA_RST3_GCE_SWRST		97
+#define MT8192_INFRA_RST3_CLDMA_SWRST		98
+#define MT8192_INFRA_RST3_TRNG_SWRST		99
+#define MT8192_INFRA_RST3_MFG_CBIP_P2P_TX_SWRST	100
+#define MT8192_INFRA_RST3_THERM_CTRL_PTP_SWRST	101
+#define MT8192_INFRA_RST3_RSV0			102
+#define MT8192_INFRA_RST3_AP_MD_CCIF_1_SWRST	103
+#define MT8192_INFRA_RST3_AP_MD_CCIF_SWRST	104
+#define MT8192_INFRA_RST3_I2C1_IMM_SWRST	105
+#define MT8192_INFRA_RST3_I2C1_ARB_SWRST	106
+#define MT8192_INFRA_RST3_I2C2_IMM_SWRST	107
+#define MT8192_INFRA_RST3_I2C2_ARB_SWRST	108
+#define MT8192_INFRA_RST3_I2C5_SWRST		109
+#define MT8192_INFRA_RST3_I2C5_IMM_SWRST	110
+#define MT8192_INFRA_RST3_I2C5_ARB_SWRST	111
+#define MT8192_INFRA_RST3_SPI4_SWRST		112
+#define MT8192_INFRA_RST3_SPI5_SWRST		113
+#define MT8192_INFRA_RST3_INFRA2MFGAXI_CBIP_GLAS_IN_SWRST_B	114
+#define MT8192_INFRA_RST3_MFGAXI2INFRA_M0_CBIP_GLAS_OUT_SWRST_B	115
+#define MT8192_INFRA_RST3_MFGAXI2INFRA_M1_CBIP_GLAS_OUT_SWRST_B	116
+#define MT8192_INFRA_RST3_UFS_AES_SWRST		117
+#define MT8192_INFRA_RST3_CCU_I2C_IRQ_SWRST	118
+#define MT8192_INFRA_RST3_CCU_I2C_DMA_SWRST	119
+#define MT8192_INFRA_RST3_I2C6_SWRST		120
+#define MT8192_INFRA_RST3_CCU_GALS_SWRST	121
+#define MT8192_INFRA_RST3_IPU_GALS_SWRST	122
+#define MT8192_INFRA_RST3_CONN2AP_GALS_SWRST	123
+#define MT8192_INFRA_RST3_AP_MD_CCIF2_SWRST	124
+#define MT8192_INFRA_RST3_AP_MD_CCIF3_SWRST	125
+#define MT8192_INFRA_RST3_I2C7_SWRST		126
+#define MT8192_INFRA_RST3_I2C8_SWRST		127
+
+/* INFRA RST4 */
+#define MT8192_INFRA_RST4_FLASHIF_TOP_SWRST			128
+#define MT8192_INFRA_RST4_PCIE_TOP_SWRST			129
+#define MT8192_INFRA_RST4_AXI2ACP_SWRST				130
+#define MT8192_INFRA_RST4_VPU_IOMMU_SWRST			131
+#define MT8192_INFRA_RST4_SPI6_SWRST				132
+#define MT8192_INFRA_RST4_SPI7_SWRST				133
+#define MT8192_INFRA_RST4_APU0_GALS_SWRST			134
+#define MT8192_INFRA_RST4_APU1_GALS_SWRST			135
+#define MT8192_INFRA_RST4_XPU2APU_SWRST				136
+#define MT8192_INFRA_RST4_MCUPM_SWRST				137
+#define MT8192_INFRA_RST4_TIA_SWRST				138
+#define MT8192_INFRA_RST4_THERM_CTRL_PTP_MCU_SWRST		139
+#define MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST			140
+#define MT8192_INFRA_RST4_MD2AP_GALS_OUT_SWRST			141
+#define MT8192_INFRA_RST4_AP2MP_GALS_IN_SWRST			142
+#define MT8192_INFRA_RST4_MDHW2EMI_GALS_OUT_SWRST		143
+#define MT8192_INFRA_RST4_MDMCU2EMI_GALS_OUT_SWRST		144
+#define MT8192_INFRA_RST4_CCIF_MD2CONN_BGF_SWRST		145
+#define MT8192_INFRA_RST4_INFRA2APU_APB_TX_SWRST		146
+#define MT8192_INFRA_RST4_APU2INFRA_APB_RX_SWRST		147
+#define MT8192_INFRA_RST4_DFD_ISO1_INFRA2DRAMC_APB_TX_SWRST	148
+#define MT8192_INFRA_RST4_INFRA2SUBINFRA_APB_TX_SWRST		149
+#define MT8192_INFRA_RST4_MDP_GCE_SWRST				150
+#define MT8192_INFRA_RST4_MSDC2INFRA_CBIP_GALS_OUT_SWRST	151
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
