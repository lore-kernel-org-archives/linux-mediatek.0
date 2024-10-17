Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A7CD2F7FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NG+cvB78j3HgiyVriRt2aR///VFc6kWwgdG3Bs9Odiw=; b=3rEsFKnN04BC846uuCUXq/QvTU
	dxvorblOKvgDAlYeTeWHmyt9O5FTipX0+pHGbjDaMEAHWIiimxDbdQICqdTsCDf4U2dSmKjsPSXc2
	rNSUQCwTuUwvptNdnGhLyd4S19AIrvbfO4N1Zv1TfFvpGfIsFc+F9ohjXwcR2QTn8HPb02hfhg2sO
	cUZlofe6dVFMPkjtSTQ4pZQYCNKGngGf+mqHgeQ0mo+dPjJ5s8dQX35OweRSUD7S0v5IscnW7SYiA
	VIsgK547nyT5qsumFdDAUFGiHJV5jo79QyvFc4JRiJvMc363jVXa5NGc6PJh9QDvGV8n66bzvwY2h
	Py1W4m5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LNb-0000000E3Ap-2umq;
	Thu, 17 Oct 2024 07:57:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LM5-0000000E33H-18NV;
	Thu, 17 Oct 2024 07:55:39 +0000
X-UUID: 2c5a0e688c5d11ef9048ed6ed365623b-20241017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NG+cvB78j3HgiyVriRt2aR///VFc6kWwgdG3Bs9Odiw=;
	b=KCW8rkDUF8CLUmke9TvcqGoUs2gi+JB9QsV4AwUvtAPGVeWRp8qtaobQ+U9zgpaNnjnjTJ1sjSkKPSGxu7hUq3yHDePKeGOfAx3uqJpe47dTfLt4jE40MX4gLGiCkDDHcWMmlO58iFR74nPkrYEZ/XmDFjR+HAXjsZ2HGR1VN+Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:d470d379-4010-4373-ae1b-7043531b42f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:b6656465-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2c5a0e688c5d11ef9048ed6ed365623b-20241017
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 217214500; Thu, 17 Oct 2024 00:55:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Oct 2024 00:55:24 -0700
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Oct 2024 15:55:24 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Yongdong Zhang <yongdong.zhang@mediatek.com>, Xiujuan Tan
	<xiujuan.tan@mediatek.com>, Browse Zhang <browse.zhang@mediatek.com>, Bo Ye
	<bo.ye@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>, Evan Cao
	<ot_evan.cao@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] pinctrl: mediatek: paris: Revert "Rework support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE"
Date: Thu, 17 Oct 2024 15:55:19 +0800
Message-ID: <20241017075522.178337-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_005533_417026_610BEC8D 
X-CRM114-Status: GOOD (  15.57  )
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

[This reverts commit c5d3b64c568a344e998830e0e94a7c04e372f89b.]

For MTK HW,
1. to enable GPIO input direction: set DIR=0, IES=1
2. to enable GPIO output direction: set DIR=1, and set DO=1 to output high, set DO=0 to out low

The PIN_CONFIG_INPUT/PIN_CONFIG_OUTPUT/PIN_CONFIG_INPUT_ENABLE/PIN_CONFIG_OUTPUT_ENABLE shall
be implemented according to view of its purpose - set GPIO direction and output value (for
output only) according to specific HW design.

However, the reverted patch implement according to author's own explanation of IES without
understanding of MTK's HW. Such patch does not correctly set DIR/IES bit to control GPIO
direction on MTK's HW.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
Signed-off-by: Evan Cao <ot_evan.cao@mediatek.com>
Signed-off-by: Bo Ye <bo.ye@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 38 +++++++++++++++++-------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 87e958d827bf..a8af62e6f8ca 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -165,21 +165,20 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &ret);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
-		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_IES, &ret);
-		if (!ret)
-			err = -EINVAL;
-		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_OUTPUT_ENABLE:
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
 		if (err)
 			break;
+		/*     CONFIG     Current direction return value
+		 * -------------  ----------------- ----------------------
+		 * OUTPUT_ENABLE       output       1 (= HW value)
+		 *                     input        0 (= HW value)
+		 * INPUT_ENABLE        output       0 (= reverse HW value)
+		 *                     input        1 (= reverse HW value)
+		 */
+		if (param == PIN_CONFIG_INPUT_ENABLE)
+			ret = !ret;
 
-		if (!ret) {
-			err = -EINVAL;
-			break;
-		}
-
-		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DO, &ret);
 		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
@@ -284,9 +283,26 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		err = hw->soc->bias_set_combo(hw, desc, 0, arg);
 		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
+				       MTK_DISABLE);
+		/* Keep set direction to consider the case that a GPIO pin
+		 *  does not have SMT control
+		 */
+		if (err != -ENOTSUPP)
+			break;
+
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
+				       MTK_OUTPUT);
+		break;
 	case PIN_CONFIG_INPUT_ENABLE:
 		/* regard all non-zero value as enable */
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
+		if (err)
+			break;
+
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
+				       MTK_INPUT);
 		break;
 	case PIN_CONFIG_SLEW_RATE:
 		/* regard all non-zero value as enable */
-- 
2.17.0


