Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AF8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 03:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZWLGxt6bcErIho5We9/rkpSiMZgjuvfJZ/GJstitJkU=; b=TO8JsDe1tfA7LO
	EuCXv6SrW/kl4G9Djkhmamz6TXUsebTzyajtP3S44srck38LmHmb7agFG6uPb1nDl5RJg+UBHL4q+
	M7p4iEq0BjcoXBbnGCRq909DmcUIOk8AjnELJOcmqXxxpTTKubBD1dbqIAfAd7+Zm48gd7pDmttRQ
	7VwHzeo75bGbmi+KJusxzsEbWbC2pmLqdiBEAmvK0X7pjr2vRrz//tBuRriJ1QWW5dNMOewOZnE5V
	r5DNuJXuk7WhLR0xY6X6asbIJU+mMrgA2oFWMfVuMNfHRynvslRJVER3ZetEFLqmOteahuQHOXpvZ
	NWAiPoGWU/+lbODIHD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKB0u-005Q9Q-Oi; Wed, 16 Feb 2022 03:29:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKB0s-005Q8R-IZ; Wed, 16 Feb 2022 03:29:55 +0000
X-UUID: 6eb8b73eb7264b8191c42ef2eb205509-20220215
X-UUID: 6eb8b73eb7264b8191c42ef2eb205509-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 814326238; Tue, 15 Feb 2022 20:29:52 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 19:21:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Feb 2022 11:21:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 11:21:29 +0800
From: Guodong Liu <guodong.liu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guodong Liu
 <guodong.liu@mediatek.com>
Subject: [PATCH v5 0/3] pinctrl: mediatek: Support pinctrl driver on mt8186
Date: Wed, 16 Feb 2022 11:21:21 +0800
Message-ID: <20220216032124.28067-1-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_192954_647938_7C9BCBB8 
X-CRM114-Status: GOOD (  11.87  )
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

changes since v4:
- update mt8186 pull up RSEL type define value
- update mt8186 pull up RSEL type si unit value(ohm)
- update macro definition name
- update mt8186 bias resistance selectio register description

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

 .../bindings/pinctrl/pinctrl-mt8186.yaml      |  297 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c     | 1271 ++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h | 2186 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |    2 +-
 include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174 +++++++++
 7 files changed, 4937 insertions(+), 1 deletion(-)
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
