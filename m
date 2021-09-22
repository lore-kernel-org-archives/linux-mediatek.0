Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF1CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 03:07:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F1360FA0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 03:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17F1360FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=suZHm3eqaT+Z12Sp1A7rqWaiwNeudYogeDJbioe8rao=; b=ZjnV3rzpcvtFyx
	AGfN8KzrXIlL2OsrkWJft2atLGYl+zTiAx2srz36hWa0GdI+lEkU6Mj7PicukWkM+2iZx4988s0gX
	r5OY5piQJbxFP6UhvIJUzbBh1AznFt+l7vftPWeVTexvd/VrlIY25BHUcm1owuUUaTq/eWISQCn9y
	qo7ZgbTRRsN9SJMPyPzBJJsB2gy4LpVPcQXf7Za/5UnkkapVxpzsAITpMXl5HSSgubOUAkwUZH4jb
	DePAr3eJWM1qpLgytJN/H+vHSVtB49aLDpeKIiLcEdiTEJhBCanAE+SUma9AUnwO1F28psld1+rIP
	tOVU0O1enEacyyySJWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSsax-006nvz-MR; Wed, 22 Sep 2021 03:06:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSsau-006nuB-AJ; Wed, 22 Sep 2021 03:06:49 +0000
X-UUID: 24647c84641f4f048fc58ffba43c877c-20210921
X-UUID: 24647c84641f4f048fc58ffba43c877c-20210921
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1598366756; Tue, 21 Sep 2021 20:06:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Sep 2021 19:56:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Sep 2021 10:56:41 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Sep 2021 10:56:40 +0800
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
Subject: [PATCH v13 0/5] Mediatek pinctrl patch on mt8195
Date: Wed, 22 Sep 2021 10:56:35 +0800
Message-ID: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_200648_393050_0CEC1C5B 
X-CRM114-Status: GOOD (  11.38  )
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

This series includes 5 patches:
1.add rsel define.
2.change pull up/down description
3.fix coding style
4.support rsel feature for common ICs
5.add rsel setting on MT8195

Changes in patch v13:
1)change "-EOPNOTSUPP" to "-ENOTSUPP" in patch 4/5.
2)fix description on 2/5.

Changes in patch v12:
1)add "ack-by" on "rsel define" patch.
2)add "change reason" in commit message and write a shema
  on patch document patch 2/5.
3)separate eint pm_ops fucntion support patch
4)separate rsel patch, the common parts as patch 4/5 to support
  common ICs. The mt8195 specific changes as patch 5/5.
5)add fix coding style patch to fix Camel spelling to avoid checkpatch
  warning in a following patch.
6)remove unrelated changes in rsel patch.
7)change ternary ops in resel patch
8)add "rsel_is_unit" property on struct mtk_pinctrl, and itendify
  "mediatek,rsel_resistance_in_si_unit" property in probe function.
9)add explanation for "MTK_PULL_RSEL_TYPE" and "MTK_PULL_PU_PD_RSEL_TYPE".
10) fix spell warning in rsel patch.

Changes in patch v11:
1)add pm_ops fucntion support
2)change pull up/down description
3)add resistance value feature support.

Changes in patch v10:
1)fix PARENTHESIS_ALIGNMENT of mtk_pinconf_bias_set_rsel
2)fix LONG_LINE warning in 615 in pinctrl-paris.c.

Changes in patch v9:
1)fix "mtk_pinconf_bias_set_rsel" build warning.

Changes in patch v8:
1)add rsel define patch
2)avoid  CamelCase
3)add pinctrl rsel setting patch which is another resistance selection
  solution for I2C on MT8195.

Changes in patch v7:
1)add version in patch and fix spelling mistakes.

Changes in patch v6:
1)add "pintcrl: mediatek" as prefix.

Changes in patch v5:
1)document and driver patch are apploed.
2)change '-EOPNOTSUPP' to '-ENOTSUPP'

Changes in patch v4:
1)fix pinctrl-mt8195.yaml warning error.
2)remove pinctrl device node patch which is based on "mt8195.dtsi".

Changes in patch v3:
1)change '^pins' to '-pins$'.
2)change 'state_0_node_a' to 'gpio_pin' which is defined in dts.
3)change 'state_0_node_b' to 'i2c0_pin' which is defined in dts.
4)reorder this series patches. change pinctrl file and binding document
together in one patch.

There are no changes in v1 & v2.

Zhiyong Tao (5):
  dt-bindings: pinctrl: mt8195: add rsel define
  dt-bindings: pinctrl: mt8195: change pull up/down description
  pinctrl: mediatek: fix coding style
  pinctrl: mediatek: support rsel feature
  pinctrl: mediatek: add rsel setting on MT8195

 .../bindings/pinctrl/pinctrl-mt8195.yaml      |  65 ++++-
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 133 ++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 231 +++++++++++++++---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  45 ++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  68 ++++--
 include/dt-bindings/pinctrl/mt65xx.h          |   9 +
 6 files changed, 497 insertions(+), 54 deletions(-)

--
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
