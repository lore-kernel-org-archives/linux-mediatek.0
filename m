Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EC8C07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:47:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E7C611ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E7C611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0UitsQHRX7CddBvjnyKHiHCo8rz1xjeiCLZNEHzhAs=; b=Jsy1j2nQNIYegI
	XX7dKu/2RqDyawRSf99CVHiJqd88da1U3qnI5SGJKf1Bai9X62+gPE2iXyubBQCcGH8/PuquBjSJC
	o7sKuO1QySBuGBgdwMOxSDvQBjEmMp+SYcJo9yfx2Fv+sg7536fhuXcoOo7GEAmswxK/eUCcL2LtW
	JZUxpzZEGHErjc2UjT2F537ohqbuodccH8wbTtvIwOdCon6K/ELt+TqjrRtnkboi3gFJ/WFVY1EdX
	I95g0Hx08Yzecm87EH5iJm2VGOiQQe1fAB/ErW/8eV+fUrISfU30DZco53Jbihs1Y9KHveUxur5pf
	/FnOWouFwZ2iz/hgm83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m27hi-003Hzh-BN; Sat, 10 Jul 2021 07:47:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m27he-003HxV-GS; Sat, 10 Jul 2021 07:47:13 +0000
X-UUID: 3e440d55c54647e7b67d894fd054abd8-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=H1jmB4wal+z/z6qs0ffhL1rv2I2iSR2NzNq+Hgi0rdc=; 
 b=SaVsRB3SEydULnBxe8u7NV+3wPKXeu1bRS/f568qse4/HCo0gnHRtARcZC8snsKrlApEOG2zIGRi9PV0ff2GhG8hnp2NtSBpN/IPiEHzq114JOgtkIgiM166GAHG/NW8gn4RDha47bEt11mfElAF0T7SjTwre78mmyrqXmCOfNY=;
X-UUID: 3e440d55c54647e7b67d894fd054abd8-20210710
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 874538281; Sat, 10 Jul 2021 00:46:57 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 00:46:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 15:46:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 15:46:46 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
 <light.hsieh@mediatek.com>, <biao.huang@mediatek.com>,
 <hongzhou.yang@mediatek.com>, <sean.wang@mediatek.com>,
 <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v9 2/2] pinctrl: mediatek: add rsel setting on MT8195
Date: Sat, 10 Jul 2021 15:46:42 +0800
Message-ID: <20210710074642.1052-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210710074642.1052-1-zhiyong.tao@mediatek.com>
References: <20210710074642.1052-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_004710_779477_D49A1408 
X-CRM114-Status: GOOD (  15.28  )
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

This patch provides rsel setting on MT8195

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  96 +++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 134 +++++++++++++++---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  10 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  23 ++-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   2 +-
 5 files changed, 238 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index a7500e18bb1d..ccfdbac94544 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -779,6 +779,100 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
 	PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
 };
 
+static const struct mtk_pin_field_calc mt8195_pin_rsel_range[] = {
+	PIN_FIELD_BASE(8, 8, 4, 0x0c0, 0x10, 15, 3),
+	PIN_FIELD_BASE(9, 9, 4, 0x0c0, 0x10, 0, 3),
+	PIN_FIELD_BASE(10, 10, 4, 0x0c0, 0x10, 18, 3),
+	PIN_FIELD_BASE(11, 11, 4, 0x0c0, 0x10, 3, 3),
+	PIN_FIELD_BASE(12, 12, 4, 0x0c0, 0x10, 21, 3),
+	PIN_FIELD_BASE(13, 13, 4, 0x0c0, 0x10, 6, 3),
+	PIN_FIELD_BASE(14, 14, 4, 0x0c0, 0x10, 24, 3),
+	PIN_FIELD_BASE(15, 15, 4, 0x0c0, 0x10, 9, 3),
+	PIN_FIELD_BASE(16, 16, 4, 0x0c0, 0x10, 27, 3),
+	PIN_FIELD_BASE(17, 17, 4, 0x0c0, 0x10, 12, 3),
+	PIN_FIELD_BASE(29, 29, 2, 0x080, 0x10, 0, 3),
+	PIN_FIELD_BASE(30, 30, 2, 0x080, 0x10, 3, 3),
+	PIN_FIELD_BASE(34, 34, 1, 0x0e0, 0x10, 0, 3),
+	PIN_FIELD_BASE(35, 35, 1, 0x0e0, 0x10, 3, 3),
+	PIN_FIELD_BASE(44, 44, 1, 0x0e0, 0x10, 6, 3),
+	PIN_FIELD_BASE(45, 45, 1, 0x0e0, 0x10, 9, 3),
+};
+
+static const unsigned int mt8195_pull_type[] = {
+	MTK_PULL_PUPD_R1R0_TYPE /* 0 */, MTK_PULL_PUPD_R1R0_TYPE /* 1 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 2 */, MTK_PULL_PUPD_R1R0_TYPE /* 3 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 4 */, MTK_PULL_PUPD_R1R0_TYPE /* 5 */,
+	MTK_PULL_PU_PD_TYPE /* 6 */, MTK_PULL_PU_PD_TYPE /* 7 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 8 */, MTK_PULL_PU_PD_RSEL_TYPE /* 9 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 10 */, MTK_PULL_PU_PD_RSEL_TYPE /* 11 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 12 */, MTK_PULL_PU_PD_RSEL_TYPE /* 13 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 14 */, MTK_PULL_PU_PD_RSEL_TYPE /* 15 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 16 */, MTK_PULL_PU_PD_RSEL_TYPE /* 17 */,
+	MTK_PULL_PU_PD_TYPE /* 18 */, MTK_PULL_PU_PD_TYPE /* 19 */,
+	MTK_PULL_PU_PD_TYPE /* 20 */, MTK_PULL_PU_PD_TYPE /* 21 */,
+	MTK_PULL_PU_PD_TYPE /* 22 */, MTK_PULL_PU_PD_TYPE /* 23 */,
+	MTK_PULL_PU_PD_TYPE /* 24 */, MTK_PULL_PU_PD_TYPE /* 25 */,
+	MTK_PULL_PU_PD_TYPE /* 26 */, MTK_PULL_PU_PD_TYPE /* 27 */,
+	MTK_PULL_PU_PD_TYPE /* 28 */, MTK_PULL_PU_PD_RSEL_TYPE /* 29 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 30 */, MTK_PULL_PU_PD_TYPE /* 31 */,
+	MTK_PULL_PU_PD_TYPE /* 32 */, MTK_PULL_PU_PD_TYPE /* 33 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 34 */, MTK_PULL_PU_PD_RSEL_TYPE /* 35 */,
+	MTK_PULL_PU_PD_TYPE /* 36 */, MTK_PULL_PU_PD_TYPE /* 37 */,
+	MTK_PULL_PU_PD_TYPE /* 38 */, MTK_PULL_PU_PD_TYPE /* 39 */,
+	MTK_PULL_PU_PD_TYPE /* 40 */, MTK_PULL_PU_PD_TYPE /* 41 */,
+	MTK_PULL_PU_PD_TYPE /* 42 */, MTK_PULL_PU_PD_TYPE /* 43 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 44 */, MTK_PULL_PU_PD_RSEL_TYPE /* 45 */,
+	MTK_PULL_PU_PD_TYPE /* 46 */, MTK_PULL_PU_PD_TYPE /* 47 */,
+	MTK_PULL_PU_PD_TYPE /* 48 */, MTK_PULL_PU_PD_TYPE /* 49 */,
+	MTK_PULL_PU_PD_TYPE /* 50 */, MTK_PULL_PU_PD_TYPE /* 51 */,
+	MTK_PULL_PU_PD_TYPE /* 52 */, MTK_PULL_PU_PD_TYPE /* 53 */,
+	MTK_PULL_PU_PD_TYPE /* 54 */, MTK_PULL_PU_PD_TYPE /* 55 */,
+	MTK_PULL_PU_PD_TYPE /* 56 */, MTK_PULL_PU_PD_TYPE /* 57 */,
+	MTK_PULL_PU_PD_TYPE /* 58 */, MTK_PULL_PU_PD_TYPE /* 59 */,
+	MTK_PULL_PU_PD_TYPE /* 60 */, MTK_PULL_PU_PD_TYPE /* 61 */,
+	MTK_PULL_PU_PD_TYPE /* 62 */, MTK_PULL_PU_PD_TYPE /* 63 */,
+	MTK_PULL_PU_PD_TYPE /* 64 */, MTK_PULL_PU_PD_TYPE /* 65 */,
+	MTK_PULL_PU_PD_TYPE /* 66 */, MTK_PULL_PU_PD_TYPE /* 67 */,
+	MTK_PULL_PU_PD_TYPE /* 68 */, MTK_PULL_PU_PD_TYPE /* 69 */,
+	MTK_PULL_PU_PD_TYPE /* 70 */, MTK_PULL_PU_PD_TYPE /* 71 */,
+	MTK_PULL_PU_PD_TYPE /* 72 */, MTK_PULL_PU_PD_TYPE /* 73 */,
+	MTK_PULL_PU_PD_TYPE /* 74 */, MTK_PULL_PU_PD_TYPE /* 75 */,
+	MTK_PULL_PU_PD_TYPE /* 76 */, MTK_PULL_PUPD_R1R0_TYPE /* 77 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 78 */, MTK_PULL_PUPD_R1R0_TYPE /* 79 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 80 */, MTK_PULL_PUPD_R1R0_TYPE /* 81 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 82 */, MTK_PULL_PUPD_R1R0_TYPE /* 83 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 84 */, MTK_PULL_PUPD_R1R0_TYPE /* 85 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 86 */, MTK_PULL_PUPD_R1R0_TYPE /* 87 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 88 */, MTK_PULL_PUPD_R1R0_TYPE /* 89 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 90 */, MTK_PULL_PUPD_R1R0_TYPE /* 91 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 92 */, MTK_PULL_PUPD_R1R0_TYPE /* 93 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 94 */, MTK_PULL_PUPD_R1R0_TYPE /* 95 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 96 */, MTK_PULL_PU_PD_TYPE /* 97 */,
+	MTK_PULL_PU_PD_TYPE /* 98 */, MTK_PULL_PU_PD_TYPE /* 99 */,
+	MTK_PULL_PU_PD_TYPE /* 100 */, MTK_PULL_PU_PD_TYPE /* 101 */,
+	MTK_PULL_PU_PD_TYPE /* 102 */, MTK_PULL_PU_PD_TYPE /* 103 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 104 */, MTK_PULL_PUPD_R1R0_TYPE /* 105 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 106 */, MTK_PULL_PUPD_R1R0_TYPE /* 107 */,
+	MTK_PULL_PU_PD_TYPE /* 108 */, MTK_PULL_PU_PD_TYPE /* 109 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 110 */, MTK_PULL_PUPD_R1R0_TYPE /* 111 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 112 */, MTK_PULL_PUPD_R1R0_TYPE /* 113 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 114 */, MTK_PULL_PUPD_R1R0_TYPE /* 115 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 116 */, MTK_PULL_PUPD_R1R0_TYPE /* 117 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 118 */, MTK_PULL_PUPD_R1R0_TYPE /* 119 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 120 */, MTK_PULL_PUPD_R1R0_TYPE /* 121 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 122 */, MTK_PULL_PUPD_R1R0_TYPE /* 123 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 124 */, MTK_PULL_PUPD_R1R0_TYPE /* 125 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 126 */, MTK_PULL_PUPD_R1R0_TYPE /* 127 */,
+	MTK_PULL_PU_PD_TYPE /* 128 */, MTK_PULL_PU_PD_TYPE /* 129 */,
+	MTK_PULL_PU_PD_TYPE /* 130 */, MTK_PULL_PU_PD_TYPE /* 131 */,
+	MTK_PULL_PU_PD_TYPE /* 132 */, MTK_PULL_PU_PD_TYPE /* 133 */,
+	MTK_PULL_PU_PD_TYPE /* 134 */, MTK_PULL_PU_PD_TYPE /* 135 */,
+	MTK_PULL_PU_PD_TYPE /* 136 */, MTK_PULL_PU_PD_TYPE /* 137 */,
+	MTK_PULL_PU_PD_TYPE /* 138 */, MTK_PULL_PU_PD_TYPE /* 139 */,
+	MTK_PULL_PU_PD_TYPE /* 140 */, MTK_PULL_PU_PD_TYPE /* 141 */,
+	MTK_PULL_PU_PD_TYPE /* 142 */, MTK_PULL_PU_PD_TYPE /* 143 */,
+};
+
 static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
@@ -793,6 +887,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
 	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8195_pin_rsel_range),
 };
 
 static const char * const mt8195_pinctrl_register_base_names[] = {
@@ -817,6 +912,7 @@ static const struct mtk_pin_soc mt8195_data = {
 	.gpio_m = 0,
 	.base_names = mt8195_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt8195_pinctrl_register_base_names),
+	.pull_type = mt8195_pull_type,
 	.bias_set_combo = mtk_pinconf_bias_set_combo,
 	.bias_get_combo = mtk_pinconf_bias_get_combo,
 	.drive_set = mtk_pinconf_drive_set_rev1,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 5b3b048725cc..1cbf7931328e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -641,6 +641,9 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
 	} else if (arg == MTK_PUPD_SET_R1R0_11) {
 		r0 = 1;
 		r1 = 1;
+	} else if (arg == MTK_ENABLE) {
+		r0 = 1;
+		r1 = 0;
 	} else {
 		err = -EINVAL;
 		goto out;
@@ -661,6 +664,28 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
 	return err;
 }
 
+static int mtk_pinconf_bias_set_rsel(struct mtk_pinctrl *hw,
+			      const struct mtk_pin_desc *desc,
+			      u32 pullup, u32 arg)
+{
+	int err;
+
+	if (arg < MTK_PULL_SET_RSEL_000 || arg > MTK_PULL_SET_RSEL_111) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	arg -= MTK_PULL_SET_RSEL_000;
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL, arg);
+	if (err)
+		goto out;
+
+	err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, MTK_ENABLE);
+
+out:
+	return err;
+}
+
 static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
 				u32 *pullup, u32 *enable)
@@ -742,44 +767,117 @@ static int mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,
 	return err;
 }
 
-int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
-				const struct mtk_pin_desc *desc,
-				u32 pullup, u32 arg)
+static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
+				     const struct mtk_pin_desc *desc,
+				     u32 *pullup, u32 *enable)
 {
-	int err;
+	int pu, pd, rsel, err;
 
-	err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
-	if (!err)
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL, &rsel);
+	if (err)
 		goto out;
 
-	err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc, pullup, arg);
-	if (!err)
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PU, &pu);
+	if (err)
 		goto out;
 
-	err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
+
+	if (pu == 0 && pd == 0) {
+		*pullup = 0;
+		*enable = MTK_DISABLE;
+	} else if (pu == 1 && pd == 0) {
+		*pullup = 1;
+		*enable = rsel + MTK_PULL_SET_RSEL_000;
+	} else if (pu == 0 && pd == 1) {
+		*pullup = 0;
+		*enable = rsel + MTK_PULL_SET_RSEL_000;
+	} else {
+		err = -EINVAL;
+		goto out;
+	}
 
 out:
 	return err;
 }
+
+int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc,
+			       u32 pullup, u32 arg)
+{
+	int err = -EOPNOTSUPP;
+	bool try_all_type;
+
+	try_all_type = hw->soc->pull_type ? false : true;
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_RSEL_TYPE)) {
+		err = mtk_pinconf_bias_set_rsel(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PU_PD_TYPE)) {
+		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PULLSEL_TYPE)) {
+		err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc,
+							  pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PUPD_R1R0_TYPE)) {
+		err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
+		if (err)
+			dev_err(hw->dev, "Invalid pull argument\n");
+	}
+
+	return err;
+}
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
 
 int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc,
 			      u32 *pullup, u32 *enable)
 {
-	int err;
+	int err = -EOPNOTSUPP;
+	bool try_all_type;
 
-	err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
-	if (!err)
-		goto out;
+	try_all_type = hw->soc->pull_type ? false : true;
 
-	err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc, pullup, enable);
-	if (!err)
-		goto out;
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_RSEL_TYPE)) {
+		err = mtk_pinconf_bias_get_rsel(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
 
-	err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PU_PD_TYPE)) {
+		err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PULLSEL_TYPE)) {
+		err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc,
+							  pullup, enable);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PUPD_R1R0_TYPE))
+		err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
 
-out:
 	return err;
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index a6f1bdb2083b..491ae4b3a8cc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -17,6 +17,13 @@
 #define MTK_ENABLE     1
 #define MTK_PULLDOWN   0
 #define MTK_PULLUP     1
+#define MTK_PULL_PU_PD_TYPE		BIT(0)
+#define MTK_PULL_PULLSEL_TYPE		BIT(1)
+#define MTK_PULL_PUPD_R1R0_TYPE		BIT(2)
+#define MTK_PULL_RSEL_TYPE		BIT(3)
+#define MTK_PULL_PU_PD_RSEL_TYPE	(MTK_PULL_PU_PD_TYPE \
+					| MTK_PULL_RSEL_TYPE)
+
 
 #define EINT_NA	U16_MAX
 #define NO_EINT_SUPPORT	EINT_NA
@@ -67,6 +74,7 @@ enum {
 	PINCTRL_PIN_REG_DRV_E0,
 	PINCTRL_PIN_REG_DRV_E1,
 	PINCTRL_PIN_REG_DRV_ADV,
+	PINCTRL_PIN_REG_RSEL,
 	PINCTRL_PIN_REG_MAX,
 };
 
@@ -206,6 +214,7 @@ struct mtk_pin_soc {
 	bool				ies_present;
 	const char * const		*base_names;
 	unsigned int			nbase_names;
+	const unsigned int		*pull_type;
 
 	/* Specific pinconfig operations */
 	int (*bias_disable_set)(struct mtk_pinctrl *hw,
@@ -237,7 +246,6 @@ struct mtk_pin_soc {
 			     const struct mtk_pin_desc *desc, u32 arg);
 	int (*adv_drive_get)(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, u32 *val);
-
 	/* Specific driver data */
 	void				*driver_data;
 };
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 85db2e4377f0..7f467c46a8c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -577,9 +577,9 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
 
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
-	unsigned int gpio, char *buf, unsigned int bufLen)
+	unsigned int gpio, char *buf, unsigned int buf_len)
 {
-	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
+	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1, rsel = -1;
 	const struct mtk_pin_desc *desc;
 
 	if (gpio >= hw->soc->npins)
@@ -591,6 +591,8 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 		pinmux -= hw->soc->nfuncs;
 
 	mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
+
+	/* Case for: R1R0 */
 	if (pullen == MTK_PUPD_SET_R1R0_00) {
 		pullen = 0;
 		r1 = 0;
@@ -607,10 +609,15 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 		pullen = 1;
 		r1 = 1;
 		r0 = 1;
-	} else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
-		pullen = 0;
 	}
-	len += scnprintf(buf + len, bufLen - len,
+
+	/* Case for: RSEL */
+	if (pullen >= MTK_PULL_SET_RSEL_000 && pullen <= MTK_PULL_SET_RSEL_111) {
+		rsel = pullen - MTK_PULL_SET_RSEL_000;
+		pullen = 1;
+	}
+
+	len += scnprintf(buf + len, buf_len - len,
 			"%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
 			gpio,
 			pinmux,
@@ -624,10 +631,12 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 			pullup);
 
 	if (r1 != -1) {
-		len += scnprintf(buf + len, bufLen - len, " (%1d %1d)\n",
+		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
 			r1, r0);
+	} else if (rsel != -1) {
+		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
 	} else {
-		len += scnprintf(buf + len, bufLen - len, "\n");
+		len += scnprintf(buf + len, buf_len - len, "\n");
 	}
 
 	return len;
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index afb7650fd25b..681267c0e1a4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -61,7 +61,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
 
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
-	unsigned int gpio, char *buf, unsigned int bufLen);
+	unsigned int gpio, char *buf, unsigned int buf_len);
 
 extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
