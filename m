Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27255C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 02:32:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D483361250
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 02:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D483361250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=408zV4GYGlpTlp5C4QJOY5+A8SJIZVvftk8C3POcOJs=; b=SpbKLvZ67Gz2JP
	wSTCZcqgdcYQ80w4yUg6YVhlOIDBDvHZANr9jTsBUdOhlZuEEMHymdSebWm8P0D1XXokEHUOoSNbq
	9xmRFq5x5RokgWWnrOks+JjxXXO8ujKq7nm8zpH+IK0gO17gjYgLyLzq0lWjwVOvgpUlHHBBTgW0E
	f15T/FqJcCNCqjJGLl/M4tPo4wy1CRU6DPlsXvlKx7rsNENmcdI2hwetBkkBMzlotlAYpU5XEhRnO
	PZVC4FRL6gpel8D8ArwKij7iLafUGdLpT/lMl3eAOBA1npsCk5LR2SXTUJg7t+VmH1+yOMWaltFtb
	mpKOCdbez5kODA0F2kdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR3fv-00CwNK-O1; Fri, 17 Sep 2021 02:32:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR3fs-00CwMf-PC; Fri, 17 Sep 2021 02:32:26 +0000
X-UUID: ff3c900a315b4faba3ebd59678b23917-20210916
X-UUID: ff3c900a315b4faba3ebd59678b23917-20210916
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 75719748; Thu, 16 Sep 2021 19:32:20 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 19:32:18 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 10:32:17 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 10:32:16 +0800
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
Subject: [PATCH v12 0/5] Mediatek pinctrl patch on mt8195
Date: Fri, 17 Sep 2021 10:32:11 +0800
Message-ID: <20210917023216.18384-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_193224_866618_61EF0E61 
X-CRM114-Status: GOOD (  10.90  )
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
