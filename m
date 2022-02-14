Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9536AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 03:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M9jyU0zgRAEwaycut1tRt0j1eTtD58lbU09TWmdo2Fs=; b=U2JuzjjVhcPaXX
	4UcuIAkkjQDU8m1f/0vTU0YYYCjyFbthZRP89iGta+ObbnzYFLr+RcF1nWuXXqZsraG/XLXd8xRSk
	M+YLPafNABkXLPe0YTCn5kRbRSFaCMVcTpCGnB/laVJmGT7Ubmwuopi6GtoJIrIxyEkoQpntjynmX
	vLrCxdbWcBYU8w1Yc/H3aS8C99reNXlid5GsGtCYkjVATZCIp0Y79vmbchjKLT9Y8IMjAj0ixJyLD
	hzDsZ1Bn9P0CvXdWvIYDnTldbW4CySAb3PKv8/u299lKOo+E957Yrzai+rJ5QbjXr+zx39OonEMq5
	n6htmm0wwxrKLx2gKMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJRhL-00D5BA-N6; Mon, 14 Feb 2022 03:06:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJRhI-00D5AD-Sn; Mon, 14 Feb 2022 03:06:42 +0000
X-UUID: 3f179de56a13431d976069eb2a47fe32-20220213
X-UUID: 3f179de56a13431d976069eb2a47fe32-20220213
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 405103296; Sun, 13 Feb 2022 20:06:39 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 19:06:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 11:06:36 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 11:06:35 +0800
From: Guodong Liu <guodong.liu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guodong Liu
 <guodong.liu@mediatek.com>
Subject: [PATCH v4 0/3] pinctrl: mediatek: Support pinctrl driver on mt8186
Date: Mon, 14 Feb 2022 11:06:28 +0800
Message-ID: <20220214030631.4969-1-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_190640_962619_B1D57FFD 
X-CRM114-Status: GOOD (  10.71  )
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

changes since v3:
- remove generic descriptions for common properties
- remove quotes
- drop "."
- drop "-" on description
- move partial "bias-pull-up" description info to the example
- don't break the code into two lines, maximux 84 columns is fine
- add the required fixes tag

changes since v2:
- update reg property
- update reg-names property
- sync rsel resistance selection property same as patch 3
- repair constraints is not indented correctly for bias-pull-{up,down}
- add "type: boolean" to the list of valid values. This corresponds to having bias-pull-{up,down} without any arguments.
- add dual file license for file "mt8186-pinfunc.h"
- add patch 3 to change "mediatek,rsel_resistance_in_si_unit" to "mediatek,rsel-resistance-in-si-unit"

changes since v1:
- add default pinctrl config to consistent with other MTK pinctrl drivers

Patch 1 add pinctrl file and binding document.

Patch 2 add pinctrl chip driver on mt8186.

Patch 3 canonical rsel resistance selection property.

Guodong Liu (3):
  dt-bindings: pinctrl: mt8186: add pinctrl file and binding document
  pinctrl: add pinctrl driver on mt8186
  pinctrl: canonical rsel resistance selection property

 .../bindings/pinctrl/pinctrl-mt8186.yaml      |  302 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c     | 1311 ++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h | 2186 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |    2 +-
 include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174 +++++++++
 7 files changed, 4982 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8186.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h
 create mode 100644 include/dt-bindings/pinctrl/mt8186-pinfunc.h

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
