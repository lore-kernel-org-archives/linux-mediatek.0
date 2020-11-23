Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC85C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:58:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42B3E2074B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oRQCELbj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Nsd4wEDt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42B3E2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gU55M4ubwdxks2Sz7C+lb6FYMuNdzEKkPO6ZxiVlmWo=; b=oRQCELbjmSahZNM3zsu2WYJqq
	84uBSrtgJ1Kcw+As/C5gGM69oiyBbAUSWhLzfw0p0AvrfiiwYEpisK8IN79g2W8Z7qsiI1VUSLtxW
	x3Xx+fFxuTt1KioHopS5wOa36ptqCmVjRxxqEWizsF+GhCs9tNiJPyThp+LY6oS83TM7K7AAPpcZ0
	pU4u2YWqPEiOOYVyQaoZ7pjv8XYTWJdYWcJ/OT045WbzWmtFq5V5OWpZw7eOIDTSndpxcE9fhS9mQ
	rt6eg+lYC9rQPFAYsItoneSOpTq+r/QdFN0R2ZR8IaoKWxbDCZg0izFwgiMxCblUYGFuJLbmTtIR9
	0+zTK427g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh2zr-000463-HT; Mon, 23 Nov 2020 03:58:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh2zo-00045A-SL; Mon, 23 Nov 2020 03:58:34 +0000
X-UUID: 02f3cf01f92b48fdb8da1f132b679be9-20201122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TkOFW18Z+cxU4ZVYNePbEzYRKaBzbbddQTteD30b9No=; 
 b=Nsd4wEDtWnEG6OkCku74o0hgXhTHOnq9m0QOm6DznuInz93WaFXzGuO1vhVvjps5fR4H9466UuDmwwrkb8VuhaeZs8js74VjA0skznhPfMXI4dVASezutYWTA9Df3Ll3ysNPGP+d2ERDiWOX6KOFw9Zxbrq2p8mUppERnr8NqUI=;
X-UUID: 02f3cf01f92b48fdb8da1f132b679be9-20201122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 95973404; Sun, 22 Nov 2020 19:58:11 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 Nov 2020 19:48:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Nov 2020 11:48:25 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 Nov 2020 11:48:25 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 6/8] regulator: mt6359: Set the enable time for LDOs
Date: Mon, 23 Nov 2020 11:48:08 +0800
Message-ID: <1606103290-15034-7-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_225833_147135_25077091 
X-CRM114-Status: GOOD (  13.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the enable time for LDOs.
This patch is preparing for adding mt6359p regulator support.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/mt6359-regulator.c | 65 ++++++++++++++++++----------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index 9746e2c281ae..6ce782723eba 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -114,7 +114,7 @@ struct mt6359_regulator_info {
 
 #define MT6359_LDO(match, _name, _volt_table,			\
 	_enable_reg, _enable_mask, _status_reg,			\
-	_vsel_reg, _vsel_mask)					\
+	_vsel_reg, _vsel_mask, _en_delay)			\
 [MT6359_ID_##_name] = {						\
 	.desc = {						\
 		.name = #_name,					\
@@ -129,6 +129,7 @@ struct mt6359_regulator_info {
 		.vsel_mask = _vsel_mask,			\
 		.enable_reg = _enable_reg,			\
 		.enable_mask = BIT(_enable_mask),		\
+		.enable_time = _en_delay,			\
 	},							\
 	.status_reg = _status_reg,				\
 	.qi = BIT(0),						\
@@ -516,15 +517,18 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_LDO("ldo_vsim1", VSIM1, vsim1_voltages,
 		   MT6359_RG_LDO_VSIM1_EN_ADDR, MT6359_RG_LDO_VSIM1_EN_SHIFT,
 		   MT6359_DA_VSIM1_B_EN_ADDR, MT6359_RG_VSIM1_VOSEL_ADDR,
-		   MT6359_RG_VSIM1_VOSEL_MASK << MT6359_RG_VSIM1_VOSEL_SHIFT),
+		   MT6359_RG_VSIM1_VOSEL_MASK << MT6359_RG_VSIM1_VOSEL_SHIFT,
+		   480),
 	MT6359_LDO("ldo_vibr", VIBR, vibr_voltages,
 		   MT6359_RG_LDO_VIBR_EN_ADDR, MT6359_RG_LDO_VIBR_EN_SHIFT,
 		   MT6359_DA_VIBR_B_EN_ADDR, MT6359_RG_VIBR_VOSEL_ADDR,
-		   MT6359_RG_VIBR_VOSEL_MASK << MT6359_RG_VIBR_VOSEL_SHIFT),
+		   MT6359_RG_VIBR_VOSEL_MASK << MT6359_RG_VIBR_VOSEL_SHIFT,
+		   240),
 	MT6359_LDO("ldo_vrf12", VRF12, vrf12_voltages,
 		   MT6359_RG_LDO_VRF12_EN_ADDR, MT6359_RG_LDO_VRF12_EN_SHIFT,
 		   MT6359_DA_VRF12_B_EN_ADDR, MT6359_RG_VRF12_VOSEL_ADDR,
-		   MT6359_RG_VRF12_VOSEL_MASK << MT6359_RG_VRF12_VOSEL_SHIFT),
+		   MT6359_RG_VRF12_VOSEL_MASK << MT6359_RG_VRF12_VOSEL_SHIFT,
+		   120),
 	MT6359_REG_FIXED("ldo_vusb", VUSB, MT6359_RG_LDO_VUSB_EN_0_ADDR,
 			 MT6359_DA_VUSB_B_EN_ADDR, 3000000),
 	MT6359_LDO_LINEAR("ldo_vsram_proc2", VSRAM_PROC2, 500000, 1293750, 6250,
@@ -539,11 +543,13 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_LDO("ldo_vio18", VIO18, volt18_voltages,
 		   MT6359_RG_LDO_VIO18_EN_ADDR, MT6359_RG_LDO_VIO18_EN_SHIFT,
 		   MT6359_DA_VIO18_B_EN_ADDR, MT6359_RG_VIO18_VOSEL_ADDR,
-		   MT6359_RG_VIO18_VOSEL_MASK << MT6359_RG_VIO18_VOSEL_SHIFT),
+		   MT6359_RG_VIO18_VOSEL_MASK << MT6359_RG_VIO18_VOSEL_SHIFT,
+		   960),
 	MT6359_LDO("ldo_vcamio", VCAMIO, volt18_voltages,
 		   MT6359_RG_LDO_VCAMIO_EN_ADDR, MT6359_RG_LDO_VCAMIO_EN_SHIFT,
 		   MT6359_DA_VCAMIO_B_EN_ADDR, MT6359_RG_VCAMIO_VOSEL_ADDR,
-		   MT6359_RG_VCAMIO_VOSEL_MASK << MT6359_RG_VCAMIO_VOSEL_SHIFT),
+		   MT6359_RG_VCAMIO_VOSEL_MASK << MT6359_RG_VCAMIO_VOSEL_SHIFT,
+		   1290),
 	MT6359_REG_FIXED("ldo_vcn18", VCN18, MT6359_RG_LDO_VCN18_EN_ADDR,
 			 MT6359_DA_VCN18_B_EN_ADDR, 1800000),
 	MT6359_REG_FIXED("ldo_vfe28", VFE28, MT6359_RG_LDO_VFE28_EN_ADDR,
@@ -551,19 +557,20 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_LDO("ldo_vcn13", VCN13, vcn13_voltages,
 		   MT6359_RG_LDO_VCN13_EN_ADDR, MT6359_RG_LDO_VCN13_EN_SHIFT,
 		   MT6359_DA_VCN13_B_EN_ADDR, MT6359_RG_VCN13_VOSEL_ADDR,
-		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT),
+		   MT6359_RG_VCN13_VOSEL_MASK << MT6359_RG_VCN13_VOSEL_SHIFT,
+		   240),
 	MT6359_LDO("ldo_vcn33_1_bt", VCN33_1_BT, vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_1_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_0_SHIFT,
 		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
-		   MT6359_RG_VCN33_1_VOSEL_SHIFT),
+		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
 	MT6359_LDO("ldo_vcn33_1_wifi", VCN33_1_WIFI, vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_1_EN_1_ADDR,
 		   MT6359_RG_LDO_VCN33_1_EN_1_SHIFT,
 		   MT6359_DA_VCN33_1_B_EN_ADDR, MT6359_RG_VCN33_1_VOSEL_ADDR,
 		   MT6359_RG_VCN33_1_VOSEL_MASK <<
-		   MT6359_RG_VCN33_1_VOSEL_SHIFT),
+		   MT6359_RG_VCN33_1_VOSEL_SHIFT, 240),
 	MT6359_REG_FIXED("ldo_vaux18", VAUX18, MT6359_RG_LDO_VAUX18_EN_ADDR,
 			 MT6359_DA_VAUX18_B_EN_ADDR, 1800000),
 	MT6359_LDO_LINEAR("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750,
@@ -579,49 +586,57 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_LDO("ldo_vefuse", VEFUSE, vefuse_voltages,
 		   MT6359_RG_LDO_VEFUSE_EN_ADDR, MT6359_RG_LDO_VEFUSE_EN_SHIFT,
 		   MT6359_DA_VEFUSE_B_EN_ADDR, MT6359_RG_VEFUSE_VOSEL_ADDR,
-		   MT6359_RG_VEFUSE_VOSEL_MASK << MT6359_RG_VEFUSE_VOSEL_SHIFT),
+		   MT6359_RG_VEFUSE_VOSEL_MASK << MT6359_RG_VEFUSE_VOSEL_SHIFT,
+		   240),
 	MT6359_LDO("ldo_vxo22", VXO22, vxo22_voltages,
 		   MT6359_RG_LDO_VXO22_EN_ADDR, MT6359_RG_LDO_VXO22_EN_SHIFT,
 		   MT6359_DA_VXO22_B_EN_ADDR, MT6359_RG_VXO22_VOSEL_ADDR,
-		   MT6359_RG_VXO22_VOSEL_MASK << MT6359_RG_VXO22_VOSEL_SHIFT),
+		   MT6359_RG_VXO22_VOSEL_MASK << MT6359_RG_VXO22_VOSEL_SHIFT,
+		   120),
 	MT6359_LDO("ldo_vrfck", VRFCK, vrfck_voltages,
 		   MT6359_RG_LDO_VRFCK_EN_ADDR, MT6359_RG_LDO_VRFCK_EN_SHIFT,
 		   MT6359_DA_VRFCK_B_EN_ADDR, MT6359_RG_VRFCK_VOSEL_ADDR,
-		   MT6359_RG_VRFCK_VOSEL_MASK << MT6359_RG_VRFCK_VOSEL_SHIFT),
+		   MT6359_RG_VRFCK_VOSEL_MASK << MT6359_RG_VRFCK_VOSEL_SHIFT,
+		   480),
 	MT6359_REG_FIXED("ldo_vbif28", VBIF28, MT6359_RG_LDO_VBIF28_EN_ADDR,
 			 MT6359_DA_VBIF28_B_EN_ADDR, 2800000),
 	MT6359_LDO("ldo_vio28", VIO28, vio28_voltages,
 		   MT6359_RG_LDO_VIO28_EN_ADDR, MT6359_RG_LDO_VIO28_EN_SHIFT,
 		   MT6359_DA_VIO28_B_EN_ADDR, MT6359_RG_VIO28_VOSEL_ADDR,
-		   MT6359_RG_VIO28_VOSEL_MASK << MT6359_RG_VIO28_VOSEL_SHIFT),
+		   MT6359_RG_VIO28_VOSEL_MASK << MT6359_RG_VIO28_VOSEL_SHIFT,
+		   240),
 	MT6359_LDO("ldo_vemc", VEMC, vemc_voltages,
 		   MT6359_RG_LDO_VEMC_EN_ADDR, MT6359_RG_LDO_VEMC_EN_SHIFT,
 		   MT6359_DA_VEMC_B_EN_ADDR, MT6359_RG_VEMC_VOSEL_ADDR,
-		   MT6359_RG_VEMC_VOSEL_MASK << MT6359_RG_VEMC_VOSEL_SHIFT),
+		   MT6359_RG_VEMC_VOSEL_MASK << MT6359_RG_VEMC_VOSEL_SHIFT,
+		   240),
 	MT6359_LDO("ldo_vcn33_2_bt", VCN33_2_BT, vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_2_EN_0_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_0_SHIFT,
 		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
-		   MT6359_RG_VCN33_2_VOSEL_SHIFT),
+		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
 	MT6359_LDO("ldo_vcn33_2_wifi", VCN33_2_WIFI, vcn33_voltages,
 		   MT6359_RG_LDO_VCN33_2_EN_1_ADDR,
 		   MT6359_RG_LDO_VCN33_2_EN_1_SHIFT,
 		   MT6359_DA_VCN33_2_B_EN_ADDR, MT6359_RG_VCN33_2_VOSEL_ADDR,
 		   MT6359_RG_VCN33_2_VOSEL_MASK <<
-		   MT6359_RG_VCN33_2_VOSEL_SHIFT),
+		   MT6359_RG_VCN33_2_VOSEL_SHIFT, 240),
 	MT6359_LDO("ldo_va12", VA12, va12_voltages,
 		   MT6359_RG_LDO_VA12_EN_ADDR, MT6359_RG_LDO_VA12_EN_SHIFT,
 		   MT6359_DA_VA12_B_EN_ADDR, MT6359_RG_VA12_VOSEL_ADDR,
-		   MT6359_RG_VA12_VOSEL_MASK << MT6359_RG_VA12_VOSEL_SHIFT),
+		   MT6359_RG_VA12_VOSEL_MASK << MT6359_RG_VA12_VOSEL_SHIFT,
+		   240),
 	MT6359_LDO("ldo_va09", VA09, va09_voltages,
 		   MT6359_RG_LDO_VA09_EN_ADDR, MT6359_RG_LDO_VA09_EN_SHIFT,
 		   MT6359_DA_VA09_B_EN_ADDR, MT6359_RG_VA09_VOSEL_ADDR,
-		   MT6359_RG_VA09_VOSEL_MASK << MT6359_RG_VA09_VOSEL_SHIFT),
+		   MT6359_RG_VA09_VOSEL_MASK << MT6359_RG_VA09_VOSEL_SHIFT,
+		   240),
 	MT6359_LDO("ldo_vrf18", VRF18, vrf18_voltages,
 		   MT6359_RG_LDO_VRF18_EN_ADDR, MT6359_RG_LDO_VRF18_EN_SHIFT,
 		   MT6359_DA_VRF18_B_EN_ADDR, MT6359_RG_VRF18_VOSEL_ADDR,
-		   MT6359_RG_VRF18_VOSEL_MASK << MT6359_RG_VRF18_VOSEL_SHIFT),
+		   MT6359_RG_VRF18_VOSEL_MASK << MT6359_RG_VRF18_VOSEL_SHIFT,
+		   120),
 	MT6359_LDO_LINEAR("ldo_vsram_md", VSRAM_MD, 500000, 1100000, 6250,
 			  0, mt_volt_range7, MT6359_RG_LDO_VSRAM_MD_EN_ADDR,
 			  MT6359_DA_VSRAM_MD_B_EN_ADDR,
@@ -634,15 +649,18 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_LDO("ldo_vufs", VUFS, volt18_voltages,
 		   MT6359_RG_LDO_VUFS_EN_ADDR, MT6359_RG_LDO_VUFS_EN_SHIFT,
 		   MT6359_DA_VUFS_B_EN_ADDR, MT6359_RG_VUFS_VOSEL_ADDR,
-		   MT6359_RG_VUFS_VOSEL_MASK << MT6359_RG_VUFS_VOSEL_SHIFT),
+		   MT6359_RG_VUFS_VOSEL_MASK << MT6359_RG_VUFS_VOSEL_SHIFT,
+		   1920),
 	MT6359_LDO("ldo_vm18", VM18, volt18_voltages,
 		   MT6359_RG_LDO_VM18_EN_ADDR, MT6359_RG_LDO_VM18_EN_SHIFT,
 		   MT6359_DA_VM18_B_EN_ADDR, MT6359_RG_VM18_VOSEL_ADDR,
-		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT),
+		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
+		   1920),
 	MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
 		   MT6359_RG_LDO_VBBCK_EN_ADDR, MT6359_RG_LDO_VBBCK_EN_SHIFT,
 		   MT6359_DA_VBBCK_B_EN_ADDR, MT6359_RG_VBBCK_VOSEL_ADDR,
-		   MT6359_RG_VBBCK_VOSEL_MASK << MT6359_RG_VBBCK_VOSEL_SHIFT),
+		   MT6359_RG_VBBCK_VOSEL_MASK << MT6359_RG_VBBCK_VOSEL_SHIFT,
+		   240),
 	MT6359_LDO_LINEAR("ldo_vsram_proc1", VSRAM_PROC1, 500000, 1293750, 6250,
 			  0, mt_volt_range6, MT6359_RG_LDO_VSRAM_PROC1_EN_ADDR,
 			  MT6359_DA_VSRAM_PROC1_B_EN_ADDR,
@@ -655,7 +673,8 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_LDO("ldo_vsim2", VSIM2, vsim2_voltages,
 		   MT6359_RG_LDO_VSIM2_EN_ADDR, MT6359_RG_LDO_VSIM2_EN_SHIFT,
 		   MT6359_DA_VSIM2_B_EN_ADDR, MT6359_RG_VSIM2_VOSEL_ADDR,
-		   MT6359_RG_VSIM2_VOSEL_MASK << MT6359_RG_VSIM2_VOSEL_SHIFT),
+		   MT6359_RG_VSIM2_VOSEL_MASK << MT6359_RG_VSIM2_VOSEL_SHIFT,
+		   480),
 	MT6359_LDO_LINEAR("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
 			  500000, 1293750, 6250, 0, mt_volt_range6,
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_EN_ADDR,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
