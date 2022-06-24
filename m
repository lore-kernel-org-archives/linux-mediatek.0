Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67928C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=douI2RD9g7Yi0i0Mc6KqgQaBSLJDfwjCE4ya8+44wfk=; b=gSjr4Ol2Kv8RscLz2zf+QnWgoM
	uKDXUsZkeE0gNmOtz3vVYJB0iFknqXsSyTQEKULVWTLNCyENxzptgFhUmDRJLBn+NUi1eBejNSJus
	Ep4dN3D9kfPJVHoXimYHw2JdkQLgIRnB9flQlt3b2y0L9Yo+5y8PxSU0gAxMV68A9MvUP/1Hsa48y
	fzGMj6rWNCNWR2OijTnLhD4rOw1wsBG7wYcbekkvK3f3yeCLVaBUxESMsWTM23+HT/F16+ke2UQOY
	HYQXq2RmluEno/4tBjyZcqN1j2N4MO12dA53oLd6phlZwHSp84uHdSb+hzMoOllBTL+KOoXbGjgHb
	Qlfr010g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jfk-002Sun-Dl; Fri, 24 Jun 2022 13:48:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jej-002SRL-Df; Fri, 24 Jun 2022 13:47:35 +0000
X-UUID: ba55bc31cc464a059eba6d1a7deffbb5-20220624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:c055b623-4989-48f5-87d7-969baf352e32,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:671170ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ba55bc31cc464a059eba6d1a7deffbb5-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1753265450; Fri, 24 Jun 2022 06:47:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 06:37:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 24 Jun 2022 21:37:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jun 2022 21:37:15 +0800
From: Guodong Liu <guodong.liu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
	<zhiyong.tao@mediatek.com>,
	=?UTF-8?q?N=EDcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Guodong Liu
	<guodong.liu@mediatek.com>
Subject: [PATCH v2 3/5] pinctrl: mediatek: add rsel setting on mt8192
Date: Fri, 24 Jun 2022 21:36:58 +0800
Message-ID: <20220624133700.15487-4-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624133700.15487-1-guodong.liu@mediatek.com>
References: <20220624133700.15487-1-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_064729_598252_55CE027F 
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

1. I2C pins's resistance value can be controlled by rsel register.
This patch provides rsel (resistance selection) setting on mt8192.
2. Also add the missing pull type array for mt8192 to document the
pull type of each pin and prevent invalid pull type settings.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8192.c | 136 ++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
index efabeb422aea..ffb0b04f0e3c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
@@ -1285,7 +1285,141 @@ static const struct mtk_pin_field_calc mt8192_pin_drv_adv_range[] = {
 	PIN_FIELD_BASE(205, 205, 8, 0x0010, 0x10, 6, 3),
 };
 
+static const struct mtk_pin_field_calc mt8192_pin_rsel_range[] = {
+	PIN_FIELD_BASE(118, 118, 4, 0x00e0, 0x10, 0, 2),
+	PIN_FIELD_BASE(119, 119, 4, 0x00e0, 0x10, 12, 2),
+	PIN_FIELD_BASE(120, 120, 4, 0x00e0, 0x10, 10, 2),
+	PIN_FIELD_BASE(121, 121, 4, 0x00e0, 0x10, 22, 2),
+	PIN_FIELD_BASE(122, 122, 4, 0x00e0, 0x10, 8, 2),
+	PIN_FIELD_BASE(123, 123, 4, 0x00e0, 0x10, 20, 2),
+	PIN_FIELD_BASE(124, 124, 4, 0x00e0, 0x10, 6, 2),
+	PIN_FIELD_BASE(125, 125, 4, 0x00e0, 0x10, 18, 2),
+	PIN_FIELD_BASE(139, 139, 4, 0x00e0, 0x10, 4, 2),
+	PIN_FIELD_BASE(140, 140, 4, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(141, 141, 4, 0x00e0, 0x10, 2, 2),
+	PIN_FIELD_BASE(142, 142, 4, 0x00e0, 0x10, 14, 2),
+	PIN_FIELD_BASE(160, 160, 7, 0x00f0, 0x10, 0, 2),
+	PIN_FIELD_BASE(161, 161, 7, 0x00f0, 0x10, 2, 2),
+	PIN_FIELD_BASE(200, 200, 8, 0x0070, 0x10, 2, 2),
+	PIN_FIELD_BASE(201, 201, 8, 0x0070, 0x10, 6, 2),
+	PIN_FIELD_BASE(202, 202, 5, 0x0070, 0x10, 0, 2),
+	PIN_FIELD_BASE(203, 203, 5, 0x0070, 0x10, 2, 2),
+	PIN_FIELD_BASE(204, 204, 8, 0x0070, 0x10, 0, 2),
+	PIN_FIELD_BASE(205, 205, 8, 0x0070, 0x10, 4, 2),
+};
 
+static const unsigned int mt8192_pull_type[] = {
+	MTK_PULL_PU_PD_TYPE,/*0*/ MTK_PULL_PU_PD_TYPE,/*1*/
+	MTK_PULL_PU_PD_TYPE,/*2*/ MTK_PULL_PU_PD_TYPE,/*3*/
+	MTK_PULL_PU_PD_TYPE,/*4*/ MTK_PULL_PU_PD_TYPE,/*5*/
+	MTK_PULL_PU_PD_TYPE,/*6*/ MTK_PULL_PU_PD_TYPE,/*7*/
+	MTK_PULL_PU_PD_TYPE,/*8*/ MTK_PULL_PU_PD_TYPE,/*9*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*10*/ MTK_PULL_PUPD_R1R0_TYPE,/*11*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*12*/ MTK_PULL_PUPD_R1R0_TYPE,/*13*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*14*/ MTK_PULL_PUPD_R1R0_TYPE,/*15*/
+	MTK_PULL_PU_PD_TYPE,/*16*/ MTK_PULL_PU_PD_TYPE,/*17*/
+	MTK_PULL_PU_PD_TYPE,/*18*/ MTK_PULL_PU_PD_TYPE,/*19*/
+	MTK_PULL_PU_PD_TYPE,/*20*/ MTK_PULL_PU_PD_TYPE,/*21*/
+	MTK_PULL_PU_PD_TYPE,/*22*/ MTK_PULL_PU_PD_TYPE,/*23*/
+	MTK_PULL_PU_PD_TYPE,/*24*/ MTK_PULL_PU_PD_TYPE,/*25*/
+	MTK_PULL_PU_PD_TYPE,/*26*/ MTK_PULL_PU_PD_TYPE,/*27*/
+	MTK_PULL_PU_PD_TYPE,/*28*/ MTK_PULL_PU_PD_TYPE,/*29*/
+	MTK_PULL_PU_PD_TYPE,/*30*/ MTK_PULL_PU_PD_TYPE,/*31*/
+	MTK_PULL_PU_PD_TYPE,/*32*/ MTK_PULL_PU_PD_TYPE,/*33*/
+	MTK_PULL_PU_PD_TYPE,/*34*/ MTK_PULL_PU_PD_TYPE,/*35*/
+	MTK_PULL_PU_PD_TYPE,/*36*/ MTK_PULL_PU_PD_TYPE,/*37*/
+	MTK_PULL_PU_PD_TYPE,/*38*/ MTK_PULL_PU_PD_TYPE,/*39*/
+	MTK_PULL_PU_PD_TYPE,/*40*/ MTK_PULL_PU_PD_TYPE,/*41*/
+	MTK_PULL_PU_PD_TYPE,/*42*/ MTK_PULL_PU_PD_TYPE,/*43*/
+	MTK_PULL_PU_PD_TYPE,/*44*/ MTK_PULL_PUPD_R1R0_TYPE,/*45*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*46*/ MTK_PULL_PUPD_R1R0_TYPE,/*47*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*48*/ MTK_PULL_PUPD_R1R0_TYPE,/*49*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*50*/ MTK_PULL_PUPD_R1R0_TYPE,/*51*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*52*/ MTK_PULL_PUPD_R1R0_TYPE,/*53*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*54*/ MTK_PULL_PUPD_R1R0_TYPE,/*55*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*56*/ MTK_PULL_PU_PD_TYPE,/*57*/
+	MTK_PULL_PU_PD_TYPE,/*58*/ MTK_PULL_PU_PD_TYPE,/*59*/
+	MTK_PULL_PU_PD_TYPE,/*60*/ MTK_PULL_PU_PD_TYPE,/*61*/
+	MTK_PULL_PU_PD_TYPE,/*62*/ MTK_PULL_PU_PD_TYPE,/*63*/
+	MTK_PULL_PU_PD_TYPE,/*64*/ MTK_PULL_PU_PD_TYPE,/*65*/
+	MTK_PULL_PU_PD_TYPE,/*66*/ MTK_PULL_PU_PD_TYPE,/*67*/
+	MTK_PULL_PU_PD_TYPE,/*68*/ MTK_PULL_PU_PD_TYPE,/*69*/
+	MTK_PULL_PU_PD_TYPE,/*70*/ MTK_PULL_PU_PD_TYPE,/*71*/
+	MTK_PULL_PU_PD_TYPE,/*72*/ MTK_PULL_PU_PD_TYPE,/*73*/
+	MTK_PULL_PU_PD_TYPE,/*74*/ MTK_PULL_PU_PD_TYPE,/*75*/
+	MTK_PULL_PU_PD_TYPE,/*76*/ MTK_PULL_PU_PD_TYPE,/*77*/
+	MTK_PULL_PU_PD_TYPE,/*78*/ MTK_PULL_PU_PD_TYPE,/*79*/
+	MTK_PULL_PU_PD_TYPE,/*80*/ MTK_PULL_PU_PD_TYPE,/*81*/
+	MTK_PULL_PU_PD_TYPE,/*82*/ MTK_PULL_PU_PD_TYPE,/*83*/
+	MTK_PULL_PU_PD_TYPE,/*84*/ MTK_PULL_PU_PD_TYPE,/*85*/
+	MTK_PULL_PU_PD_TYPE,/*86*/ MTK_PULL_PU_PD_TYPE,/*87*/
+	MTK_PULL_PU_PD_TYPE,/*88*/ MTK_PULL_PU_PD_TYPE,/*89*/
+	MTK_PULL_PU_PD_TYPE,/*90*/ MTK_PULL_PU_PD_TYPE,/*91*/
+	MTK_PULL_PU_PD_TYPE,/*92*/ MTK_PULL_PU_PD_TYPE,/*93*/
+	MTK_PULL_PU_PD_TYPE,/*94*/ MTK_PULL_PU_PD_TYPE,/*95*/
+	MTK_PULL_PU_PD_TYPE,/*96*/ MTK_PULL_PU_PD_TYPE,/*97*/
+	MTK_PULL_PU_PD_TYPE,/*98*/ MTK_PULL_PU_PD_TYPE,/*99*/
+	MTK_PULL_PU_PD_TYPE,/*100* MTK_PULL_PU_PD_TYPE,/*101*/
+	MTK_PULL_PU_PD_TYPE,/*102* MTK_PULL_PU_PD_TYPE,/*103*/
+	MTK_PULL_PU_PD_TYPE,/*104* MTK_PULL_PU_PD_TYPE,/*105*/
+	MTK_PULL_PU_PD_TYPE,/*106* MTK_PULL_PU_PD_TYPE,/*107*/
+	MTK_PULL_PU_PD_TYPE,/*108* MTK_PULL_PU_PD_TYPE,/*109*/
+	MTK_PULL_PU_PD_TYPE,/*110* MTK_PULL_PU_PD_TYPE,/*111*/
+	MTK_PULL_PU_PD_TYPE,/*112* MTK_PULL_PU_PD_TYPE,/*113*/
+	MTK_PULL_PU_PD_TYPE,/*114* MTK_PULL_PU_PD_TYPE,/*115*/
+	MTK_PULL_PU_PD_TYPE,/*116* MTK_PULL_PU_PD_TYPE,/*117*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*118*/ MTK_PULL_PU_PD_RSEL_TYPE,/*119*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*120*/ MTK_PULL_PU_PD_RSEL_TYPE,/*121*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*122*/ MTK_PULL_PU_PD_RSEL_TYPE,/*123*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*124*/ MTK_PULL_PU_PD_RSEL_TYPE,/*125*/
+	MTK_PULL_PU_PD_TYPE,/*126*/ MTK_PULL_PU_PD_TYPE,/*127*/
+	MTK_PULL_PU_PD_TYPE,/*128*/ MTK_PULL_PU_PD_TYPE,/*129*/
+	MTK_PULL_PU_PD_TYPE,/*130*/ MTK_PULL_PU_PD_TYPE,/*131*/
+	MTK_PULL_PU_PD_TYPE,/*132*/ MTK_PULL_PU_PD_TYPE,/*133*/
+	MTK_PULL_PU_PD_TYPE,/*134*/ MTK_PULL_PU_PD_TYPE,/*135*/
+	MTK_PULL_PU_PD_TYPE,/*136*/ MTK_PULL_PU_PD_TYPE,/*137*/
+	MTK_PULL_PU_PD_TYPE,/*138*/ MTK_PULL_PU_PD_RSEL_TYPE,/*139*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*140*/ MTK_PULL_PU_PD_RSEL_TYPE,/*141*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*142*/ MTK_PULL_PU_PD_TYPE,/*143*/
+	MTK_PULL_PU_PD_TYPE,/*144*/ MTK_PULL_PU_PD_TYPE,/*145*/
+	MTK_PULL_PU_PD_TYPE,/*146*/ MTK_PULL_PU_PD_TYPE,/*147*/
+	MTK_PULL_PU_PD_TYPE,/*148*/ MTK_PULL_PU_PD_TYPE,/*149*/
+	MTK_PULL_PU_PD_TYPE,/*150*/ MTK_PULL_PU_PD_TYPE,/*151*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*152*/ MTK_PULL_PUPD_R1R0_TYPE,/*153*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*154*/ MTK_PULL_PUPD_R1R0_TYPE,/*155*/
+	MTK_PULL_PU_PD_TYPE,/*156*/ MTK_PULL_PU_PD_TYPE,/*157*/
+	MTK_PULL_PU_PD_TYPE,/*158*/ MTK_PULL_PU_PD_TYPE,/*159*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*160*/ MTK_PULL_PU_PD_RSEL_TYPE,/*161*/
+	MTK_PULL_PU_PD_TYPE,/*162*/ MTK_PULL_PU_PD_TYPE,/*163*/
+	MTK_PULL_PU_PD_TYPE,/*164*/ MTK_PULL_PU_PD_TYPE,/*165*/
+	MTK_PULL_PU_PD_TYPE,/*166*/ MTK_PULL_PU_PD_TYPE,/*167*/
+	MTK_PULL_PU_PD_TYPE,/*168*/ MTK_PULL_PU_PD_TYPE,/*169*/
+	MTK_PULL_PU_PD_TYPE,/*170*/ MTK_PULL_PU_PD_TYPE,/*171*/
+	MTK_PULL_PU_PD_TYPE,/*172*/ MTK_PULL_PU_PD_TYPE,/*173*/
+	MTK_PULL_PU_PD_TYPE,/*174*/ MTK_PULL_PU_PD_TYPE,/*175*/
+	MTK_PULL_PU_PD_TYPE,/*176*/ MTK_PULL_PU_PD_TYPE,/*177*/
+	MTK_PULL_PU_PD_TYPE,/*178*/ MTK_PULL_PU_PD_TYPE,/*179*/
+	MTK_PULL_PU_PD_TYPE,/*180*/ MTK_PULL_PU_PD_TYPE,/*181*/
+	MTK_PULL_PU_PD_TYPE,/*182*/ MTK_PULL_PUPD_R1R0_TYPE,/*183*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*184*/ MTK_PULL_PUPD_R1R0_TYPE,/*185*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*186*/ MTK_PULL_PUPD_R1R0_TYPE,/*187*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*188*/ MTK_PULL_PUPD_R1R0_TYPE,/*189*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*190*/ MTK_PULL_PUPD_R1R0_TYPE,/*191*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*192*/ MTK_PULL_PUPD_R1R0_TYPE,/*193*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*194*/ MTK_PULL_PU_PD_TYPE,/*195*/
+	MTK_PULL_PU_PD_TYPE,/*196*/ MTK_PULL_PU_PD_TYPE,/*197*/
+	MTK_PULL_PU_PD_TYPE,/*198*/ MTK_PULL_PU_PD_TYPE,/*199*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*200*/ MTK_PULL_PU_PD_RSEL_TYPE,/*201*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*202*/ MTK_PULL_PU_PD_RSEL_TYPE,/*203*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*204*/ MTK_PULL_PU_PD_RSEL_TYPE,/*205*/
+	MTK_PULL_PU_PD_TYPE,/*206*/ MTK_PULL_PU_PD_TYPE,/*207*/
+	MTK_PULL_PU_PD_TYPE,/*208*/ MTK_PULL_PU_PD_TYPE,/*209*/
+	MTK_PULL_PU_PD_TYPE,/*210*/ MTK_PULL_PU_PD_TYPE,/*211*/
+	MTK_PULL_PU_PD_TYPE,/*212*/ MTK_PULL_PU_PD_TYPE,/*213*/
+	MTK_PULL_PU_PD_TYPE,/*214*/ MTK_PULL_PU_PD_TYPE,/*215*/
+	MTK_PULL_PU_PD_TYPE,/*216*/ MTK_PULL_PU_PD_TYPE,/*217*/
+	MTK_PULL_PU_PD_TYPE,/*218*/ MTK_PULL_PU_PD_TYPE,/*219*/
+};
 
 static const char * const mt8192_pinctrl_register_base_names[] = {
 	"iocfg0", "iocfg_rm", "iocfg_bm", "iocfg_bl", "iocfg_br",
@@ -1314,6 +1448,7 @@ static const struct mtk_pin_reg_calc mt8192_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8192_pin_r0_range),
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8192_pin_r1_range),
 	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8192_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8192_pin_rsel_range),
 };
 
 static const struct mtk_pin_soc mt8192_data = {
@@ -1323,6 +1458,7 @@ static const struct mtk_pin_soc mt8192_data = {
 	.ngrps = ARRAY_SIZE(mtk_pins_mt8192),
 	.base_names = mt8192_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt8192_pinctrl_register_base_names),
+	.pull_type = mt8192_pull_type,
 	.eint_hw = &mt8192_eint_hw,
 	.nfuncs = 8,
 	.gpio_m = 0,
-- 
2.25.5


