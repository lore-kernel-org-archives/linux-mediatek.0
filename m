Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B1DC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=El1GKLp+WHT5eBOYelh41HPdJnJnhv3QxP1VgLX4sjE=; b=PThf88xAjdbvMN
	IV/dIi79puJ1IdxqbEzazXbsLQfh/DpLDO/nf3nwvaOWuV4uBNF8zaea2bBpuP9np2yd3pk1OpPSH
	Z2Hg5dTuqjirx3a9hJMZW7Hze4EdJWceYes6ioljZvnyk4MNldWtvMdG1Cu/iwAwQvxdGKbuKatUv
	/DYMFNxUWXUec4PDJo1tKBblW2I5C0ZnhS4TD1+HP4ZiPDLormzlJlrlhg/ZwtN1CrIEMQZeI4HkN
	aWN9EephriytIx7YY0j20+jmzEr0YZpgEtNW4f47xqmQUmMnnjOpa4GuVWx4V/iwvXteYIsFFUwUF
	Ysa2FdZgK6BHChnmWwEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oracF-007eZ6-9O; Sun, 06 Nov 2022 08:02:51 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oraaz-007dw9-QJ; Sun, 06 Nov 2022 08:01:35 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 3158D10077E;
	Sun,  6 Nov 2022 08:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667721692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=El1GKLp+WHT5eBOYelh41HPdJnJnhv3QxP1VgLX4sjE=;
	b=QqwGZJNVCarkqfKXJrYzkxHf4BpJO/wWU6Yi8JVnKKu1QuBlOAeoeFFWjaE6yIb0awivtq
	Ab2ZeINUwtdrMtWM3SYGP1wntJxXd54H76SmKIaaiQJvGbR+c+L5wizdk4l8A7tW1p8/yG
	v35raMlc5Qb8rdkhin8LMFKXXdgGEs8=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 8820E360707;
	Sun,  6 Nov 2022 08:01:31 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 6/6] pinctrl: mediatek: add pull_type attribute for mediatek MT7986 SoC
Date: Sun,  6 Nov 2022 09:01:13 +0100
Message-Id: <20221106080114.7426-7-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106080114.7426-1-linux@fw-web.de>
References: <20221106080114.7426-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 1833dc4d-5032-4cbc-ab32-c25b5990d83b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_010134_178723_C7FEE30D 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

Commit fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
add SoC specify 'pull_type' attribute for bias configuration.

This patch add pull_type attribute to pinctrl-mt7986.c, and make
bias_set_combo and bias_get_combo available to mediatek MT7986 SoC.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- fix odd numbers in comments
---
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 56 +++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index d13c59510468..db3497d6787a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -407,6 +407,60 @@ static const struct mtk_pin_field_calc mt7986_pin_r1_range[] = {
 	PIN_FIELD_BASE(66, 68, IOCFG_LB_BASE, 0x60, 0x10, 2, 1),
 };
 
+static const unsigned int mt7986_pull_type[] = {
+	MTK_PULL_PUPD_R1R0_TYPE,/*0*/ MTK_PULL_PUPD_R1R0_TYPE,/*1*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*2*/ MTK_PULL_PUPD_R1R0_TYPE,/*3*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*4*/ MTK_PULL_PUPD_R1R0_TYPE,/*5*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*6*/ MTK_PULL_PUPD_R1R0_TYPE,/*7*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*8*/ MTK_PULL_PUPD_R1R0_TYPE,/*9*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*10*/ MTK_PULL_PUPD_R1R0_TYPE,/*11*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*12*/ MTK_PULL_PUPD_R1R0_TYPE,/*13*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*14*/ MTK_PULL_PUPD_R1R0_TYPE,/*15*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*16*/ MTK_PULL_PUPD_R1R0_TYPE,/*17*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*18*/ MTK_PULL_PUPD_R1R0_TYPE,/*19*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*20*/ MTK_PULL_PUPD_R1R0_TYPE,/*21*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*22*/ MTK_PULL_PUPD_R1R0_TYPE,/*23*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*24*/ MTK_PULL_PUPD_R1R0_TYPE,/*25*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*26*/ MTK_PULL_PUPD_R1R0_TYPE,/*27*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*28*/ MTK_PULL_PUPD_R1R0_TYPE,/*29*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*30*/ MTK_PULL_PUPD_R1R0_TYPE,/*31*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*32*/ MTK_PULL_PUPD_R1R0_TYPE,/*33*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*34*/ MTK_PULL_PUPD_R1R0_TYPE,/*35*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*36*/ MTK_PULL_PUPD_R1R0_TYPE,/*37*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*38*/ MTK_PULL_PUPD_R1R0_TYPE,/*39*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*40*/ MTK_PULL_PUPD_R1R0_TYPE,/*41*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*42*/ MTK_PULL_PUPD_R1R0_TYPE,/*43*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*44*/ MTK_PULL_PUPD_R1R0_TYPE,/*45*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*46*/ MTK_PULL_PUPD_R1R0_TYPE,/*47*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*48*/ MTK_PULL_PUPD_R1R0_TYPE,/*49*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*50*/ MTK_PULL_PUPD_R1R0_TYPE,/*51*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*52*/ MTK_PULL_PUPD_R1R0_TYPE,/*53*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*54*/ MTK_PULL_PUPD_R1R0_TYPE,/*55*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*56*/ MTK_PULL_PUPD_R1R0_TYPE,/*57*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*58*/ MTK_PULL_PUPD_R1R0_TYPE,/*59*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*60*/ MTK_PULL_PUPD_R1R0_TYPE,/*61*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*62*/ MTK_PULL_PUPD_R1R0_TYPE,/*63*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*64*/ MTK_PULL_PUPD_R1R0_TYPE,/*65*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*66*/ MTK_PULL_PUPD_R1R0_TYPE,/*67*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*68*/ MTK_PULL_PU_PD_TYPE,/*69*/
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
+	MTK_PULL_PU_PD_TYPE,/*100*/
+};
+
 static const struct mtk_pin_reg_calc mt7986_reg_cals[] = {
 	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt7986_pin_mode_range),
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt7986_pin_dir_range),
@@ -866,6 +920,7 @@ static struct mtk_pin_soc mt7986a_data = {
 	.ies_present = false,
 	.base_names = mt7986_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt7986_pinctrl_register_base_names),
+	.pull_type = mt7986_pull_type,
 	.bias_set_combo = mtk_pinconf_bias_set_combo,
 	.bias_get_combo = mtk_pinconf_bias_get_combo,
 	.drive_set = mtk_pinconf_drive_set_rev1,
@@ -887,6 +942,7 @@ static struct mtk_pin_soc mt7986b_data = {
 	.ies_present = false,
 	.base_names = mt7986_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt7986_pinctrl_register_base_names),
+	.pull_type = mt7986_pull_type,
 	.bias_set_combo = mtk_pinconf_bias_set_combo,
 	.bias_get_combo = mtk_pinconf_bias_get_combo,
 	.drive_set = mtk_pinconf_drive_set_rev1,
-- 
2.34.1


