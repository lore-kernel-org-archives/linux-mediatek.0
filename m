Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C608C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4872160F3A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 08:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4872160F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hV6g2xWDQ1/ALH7m6imsfdcwPLAITae9SPK7x0Va8zQ=; b=u2Hmw8ESazAGw+
	l4AgjotNBsrIInyikwsoLEp4RsgyhLsjTQzhw3Rqb2MH6mJwgIEiI3MjRYa+dl4tjS76SqOG/Bw3W
	m2uwbHxEtg7879tEARpdaHTcir/3iuPaDzMrLCvqnYGWxU4WRbJtIWpQxrGQTfCo/VgyCVbRDTHje
	gsnIzWP8TWNfeh4wg0oAbqn0/w1ufXYVLcIOdocKuJ1sq2Kl5/ByHbbrMcyZxBBRmVybZGg0NQPmt
	KRImX/WycNCtkWw6sJpvkY5IODdptY4aA5qNB1u+350rc1cXajVqkr+rlgTXzEtSe4yjHElWypRwK
	BhsczS5AlhX8w0plYgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTgEe-00DRET-3g; Fri, 24 Sep 2021 08:07:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTgEQ-00DRAE-0b; Fri, 24 Sep 2021 08:06:56 +0000
X-UUID: bda68a55adb1470ca2be8a2dfb3d7a23-20210924
X-UUID: bda68a55adb1470ca2be8a2dfb3d7a23-20210924
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1987324954; Fri, 24 Sep 2021 01:06:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 01:06:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 16:06:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 16:06:48 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>
Subject: [PATCH v14 4/5] pinctrl: mediatek: support rsel feature
Date: Fri, 24 Sep 2021 16:06:31 +0800
Message-ID: <20210924080632.28410-5-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_010654_094891_7E216743 
X-CRM114-Status: GOOD (  23.18  )
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

This patch supports rsel(resistance selection) feature for I2C pins.
It provides more resistance selection solution in different ICs.
It provides rsel define and si unit solution by identifying
"mediatek,rsel_resistance_in_si_unit" property in pio dtsi node.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 231 +++++++++++++++---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  46 ++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  60 +++--
 3 files changed, 289 insertions(+), 48 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 5b3b048725cc..e84001923aaf 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -661,6 +661,181 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
 	return err;
 }
 
+static int mtk_hw_pin_rsel_lookup(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc,
+				  u32 pullup, u32 arg, u32 *rsel_val)
+{
+	const struct mtk_pin_rsel *rsel;
+	int check;
+	bool found = false;
+
+	rsel = hw->soc->pin_rsel;
+
+	for (check = 0; check <= hw->soc->npin_rsel - 1; check++) {
+		if (desc->number >= rsel[check].s_pin &&
+		    desc->number <= rsel[check].e_pin) {
+			if (pullup) {
+				if (rsel[check].up_rsel == arg) {
+					found = true;
+					*rsel_val = rsel[check].rsel_index;
+					break;
+				}
+			} else {
+				if (rsel[check].down_rsel == arg) {
+					found = true;
+					*rsel_val = rsel[check].rsel_index;
+					break;
+				}
+			}
+		}
+	}
+
+	if (!found) {
+		dev_err(hw->dev, "Not support rsel value %d Ohm for pin = %d (%s)\n",
+			arg, desc->number, desc->name);
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int mtk_pinconf_bias_set_rsel(struct mtk_pinctrl *hw,
+				     const struct mtk_pin_desc *desc,
+				     u32 pullup, u32 arg)
+{
+	int err, rsel_val;
+
+	if (hw->rsel_si_unit) {
+		/* find pin rsel_index from pin_rsel array*/
+		err = mtk_hw_pin_rsel_lookup(hw, desc, pullup, arg, &rsel_val);
+		if (err)
+			goto out;
+	} else {
+		if (arg < MTK_PULL_SET_RSEL_000 ||
+		    arg > MTK_PULL_SET_RSEL_111) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		rsel_val = arg - MTK_PULL_SET_RSEL_000;
+	}
+
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL, rsel_val);
+	if (err)
+		goto out;
+
+	err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, MTK_ENABLE);
+
+out:
+	return err;
+}
+
+int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc,
+			       u32 pullup, u32 arg)
+{
+	int err = -ENOTSUPP;
+	u32 try_all_type;
+
+	if (hw->soc->pull_type)
+		try_all_type = hw->soc->pull_type[desc->number];
+	else
+		try_all_type = MTK_PULL_TYPE_MASK;
+
+	if (try_all_type & MTK_PULL_RSEL_TYPE) {
+		err = mtk_pinconf_bias_set_rsel(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
+		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PULLSEL_TYPE) {
+		err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc,
+							  pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PUPD_R1R0_TYPE)
+		err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
+
+	if (err)
+		dev_err(hw->dev, "Invalid pull argument\n");
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
+
+static int mtk_rsel_get_si_unit(struct mtk_pinctrl *hw,
+				const struct mtk_pin_desc *desc,
+				u32 pullup, u32 rsel_val, u32 *si_unit)
+{
+	const struct mtk_pin_rsel *rsel;
+	int check;
+
+	rsel = hw->soc->pin_rsel;
+
+	for (check = 0; check <= hw->soc->npin_rsel - 1; check++) {
+		if (desc->number >= rsel[check].s_pin &&
+		    desc->number <= rsel[check].e_pin) {
+			if (rsel_val == rsel[check].rsel_index) {
+				if (pullup)
+					*si_unit = rsel[check].up_rsel;
+				else
+					*si_unit = rsel[check].down_rsel;
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
+				     const struct mtk_pin_desc *desc,
+				     u32 *pullup, u32 *enable)
+{
+	int pu, pd, rsel, err;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL, &rsel);
+	if (err)
+		goto out;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PU, &pu);
+	if (err)
+		goto out;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
+
+	if (pu == 0 && pd == 0) {
+		*pullup = 0;
+		*enable = MTK_DISABLE;
+	} else if (pu == 1 && pd == 0) {
+		*pullup = 1;
+		if (hw->rsel_si_unit)
+			mtk_rsel_get_si_unit(hw, desc, *pullup, rsel, enable);
+		else
+			*enable = rsel + MTK_PULL_SET_RSEL_000;
+	} else if (pu == 0 && pd == 1) {
+		*pullup = 0;
+		if (hw->rsel_si_unit)
+			mtk_rsel_get_si_unit(hw, desc, *pullup, rsel, enable);
+		else
+			*enable = rsel + MTK_PULL_SET_RSEL_000;
+	} else {
+		err = -EINVAL;
+		goto out;
+	}
+
+out:
+	return err;
+}
+
 static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
 				u32 *pullup, u32 *enable)
@@ -742,44 +917,40 @@ static int mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,
 	return err;
 }
 
-int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
-				const struct mtk_pin_desc *desc,
-				u32 pullup, u32 arg)
-{
-	int err;
-
-	err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
-	if (!err)
-		goto out;
-
-	err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc, pullup, arg);
-	if (!err)
-		goto out;
-
-	err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
-
-out:
-	return err;
-}
-EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
-
 int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc,
 			      u32 *pullup, u32 *enable)
 {
-	int err;
+	int err = -ENOTSUPP;
+	u32 try_all_type;
 
-	err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
-	if (!err)
-		goto out;
+	if (hw->soc->pull_type)
+		try_all_type = hw->soc->pull_type[desc->number];
+	else
+		try_all_type = MTK_PULL_TYPE_MASK;
 
-	err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc, pullup, enable);
-	if (!err)
-		goto out;
+	if (try_all_type & MTK_PULL_RSEL_TYPE) {
+		err = mtk_pinconf_bias_get_rsel(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
 
-	err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
+	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
+		err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PULLSEL_TYPE) {
+		err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc,
+							  pullup, enable);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PUPD_R1R0_TYPE)
+		err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
 
-out:
 	return err;
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index a6f1bdb2083b..23688ca6d04e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -17,6 +17,22 @@
 #define MTK_ENABLE     1
 #define MTK_PULLDOWN   0
 #define MTK_PULLUP     1
+#define MTK_PULL_PU_PD_TYPE		BIT(0)
+#define MTK_PULL_PULLSEL_TYPE		BIT(1)
+#define MTK_PULL_PUPD_R1R0_TYPE		BIT(2)
+/* MTK_PULL_RSEL_TYPE can select resistance and can be
+ * turned on/off itself. But it can't be selected pull up/down
+ */
+#define MTK_PULL_RSEL_TYPE		BIT(3)
+/* MTK_PULL_PU_PD_RSEL_TYPE is a type which is controlled by
+ * MTK_PULL_PU_PD_TYPE and MTK_PULL_RSEL_TYPE.
+ */
+#define MTK_PULL_PU_PD_RSEL_TYPE	(MTK_PULL_PU_PD_TYPE \
+					| MTK_PULL_RSEL_TYPE)
+#define MTK_PULL_TYPE_MASK	(MTK_PULL_PU_PD_TYPE |\
+				 MTK_PULL_PULLSEL_TYPE |\
+				 MTK_PULL_PUPD_R1R0_TYPE |\
+				 MTK_PULL_RSEL_TYPE)
 
 #define EINT_NA	U16_MAX
 #define NO_EINT_SUPPORT	EINT_NA
@@ -42,6 +58,14 @@
 	PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs, _s_bit,	\
 		       _x_bits, 32, 1)
 
+#define PIN_RSEL(_s_pin, _e_pin, _rsel_index, _up_resl, _down_rsel) {	\
+		.s_pin = _s_pin,					\
+		.e_pin = _e_pin,					\
+		.rsel_index = _rsel_index,				\
+		.up_rsel = _up_resl,					\
+		.down_rsel = _down_rsel,				\
+	}
+
 /* List these attributes which could be modified for the pin */
 enum {
 	PINCTRL_PIN_REG_MODE,
@@ -67,6 +91,7 @@ enum {
 	PINCTRL_PIN_REG_DRV_E0,
 	PINCTRL_PIN_REG_DRV_E1,
 	PINCTRL_PIN_REG_DRV_ADV,
+	PINCTRL_PIN_REG_RSEL,
 	PINCTRL_PIN_REG_MAX,
 };
 
@@ -129,6 +154,22 @@ struct mtk_pin_field_calc {
 	u8  fixed;
 };
 
+/**
+ * struct mtk_pin_rsel - the structure that provides bias resistance selection.
+ * @s_pin:		the start pin within the rsel range
+ * @e_pin:		the end pin within the rsel range
+ * @rsel_index:	the rsel bias resistance index
+ * @up_rsel:	the pullup rsel bias resistance value
+ * @down_rsel:	the pulldown rsel bias resistance value
+ */
+struct mtk_pin_rsel {
+	u16 s_pin;
+	u16 e_pin;
+	u16 rsel_index;
+	u32 up_rsel;
+	u32 down_rsel;
+};
+
 /* struct mtk_pin_reg_calc - the structure that holds all ranges used to
  *			     determine which register the pin would make use of
  *			     for certain pin attribute.
@@ -206,6 +247,9 @@ struct mtk_pin_soc {
 	bool				ies_present;
 	const char * const		*base_names;
 	unsigned int			nbase_names;
+	const unsigned int		*pull_type;
+	const struct mtk_pin_rsel	*pin_rsel;
+	unsigned int			npin_rsel;
 
 	/* Specific pinconfig operations */
 	int (*bias_disable_set)(struct mtk_pinctrl *hw,
@@ -254,6 +298,8 @@ struct mtk_pinctrl {
 	const char          **grp_names;
 	/* lock pin's register resource to avoid multiple threads issue*/
 	spinlock_t lock;
+	/* identify rsel setting by si unit or rsel define in dts node */
+	bool rsel_si_unit;
 };
 
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 38aec0177d15..d4e02c5d74a8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -579,8 +579,9 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	unsigned int gpio, char *buf, unsigned int buf_len)
 {
-	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
+	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1, rsel = -1;
 	const struct mtk_pin_desc *desc;
+	u32 try_all_type;
 
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
@@ -591,24 +592,39 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 		pinmux -= hw->soc->nfuncs;
 
 	mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
-	if (pullen == MTK_PUPD_SET_R1R0_00) {
-		pullen = 0;
-		r1 = 0;
-		r0 = 0;
-	} else if (pullen == MTK_PUPD_SET_R1R0_01) {
-		pullen = 1;
-		r1 = 0;
-		r0 = 1;
-	} else if (pullen == MTK_PUPD_SET_R1R0_10) {
-		pullen = 1;
-		r1 = 1;
-		r0 = 0;
-	} else if (pullen == MTK_PUPD_SET_R1R0_11) {
+
+	if (hw->soc->pull_type)
+		try_all_type = hw->soc->pull_type[desc->number];
+
+	if (hw->rsel_si_unit && (try_all_type & MTK_PULL_RSEL_TYPE)) {
+		rsel = pullen;
 		pullen = 1;
-		r1 = 1;
-		r0 = 1;
-	} else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
-		pullen = 0;
+	} else {
+		/* Case for: R1R0 */
+		if (pullen == MTK_PUPD_SET_R1R0_00) {
+			pullen = 0;
+			r1 = 0;
+			r0 = 0;
+		} else if (pullen == MTK_PUPD_SET_R1R0_01) {
+			pullen = 1;
+			r1 = 0;
+			r0 = 1;
+		} else if (pullen == MTK_PUPD_SET_R1R0_10) {
+			pullen = 1;
+			r1 = 1;
+			r0 = 0;
+		} else if (pullen == MTK_PUPD_SET_R1R0_11) {
+			pullen = 1;
+			r1 = 1;
+			r0 = 1;
+		}
+
+		/* Case for: RSEL */
+		if (pullen >= MTK_PULL_SET_RSEL_000 &&
+		    pullen <= MTK_PULL_SET_RSEL_111) {
+			rsel = pullen - MTK_PULL_SET_RSEL_000;
+			pullen = 1;
+		}
 	}
 	len += scnprintf(buf + len, buf_len - len,
 			"%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
@@ -626,6 +642,8 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	if (r1 != -1) {
 		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
 			r1, r0);
+	} else if (rsel != -1) {
+		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
 	} else {
 		len += scnprintf(buf + len, buf_len - len, "\n");
 	}
@@ -970,6 +988,12 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
 	hw->nbase = hw->soc->nbase_names;
 
+	if (of_find_property(hw->dev->of_node,
+			     "mediatek,rsel_resistance_in_si_unit", NULL))
+		hw->rsel_si_unit = true;
+	else
+		hw->rsel_si_unit = false;
+
 	spin_lock_init(&hw->lock);
 
 	err = mtk_pctrl_build_state(pdev);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
