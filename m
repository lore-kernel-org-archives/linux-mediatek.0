Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 05:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FQv6jh5Sep3zlTfomEma+6FK+XmWE4ON5Jn3z1bH6Lg=; b=n5U2Hb55M0DiC6
	NWh+jOMDlS/e2niQE6I2o7mAk13zsEovai3KrnATnmw3wv1by0DBMZRVqKBNsYvGirqx3tI8D4Qs8
	MQIA1P97mKXvPJPcPkn90Djgb6IaL8ZdniGCD3vC3CQ9hjbJ+0sH/OU4kIfuzhQlHSk1i3WCT/fSC
	463GYHRc1rWZbn5DYoNG3mCoG7TuO+UQtp3X72giRRUP6ZcNmDhUk2Hu/QDFNdmp89EZS73ynteO/
	kQV1Xavb9Kw4xTxo9HUPcrU75zp6GZwXdh4xGWtO5XZfl6phLbuLFGWRZvuWtUNBX6BzS55pZsZwz
	x517EgrdCidF9lXMwMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXGLQ-00FgOF-88; Thu, 24 Mar 2022 05:49:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXGLN-00FgMa-0s; Thu, 24 Mar 2022 05:49:10 +0000
X-UUID: 7b46f8937c254148b08556aed88795aa-20220323
X-UUID: 7b46f8937c254148b08556aed88795aa-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 964113286; Wed, 23 Mar 2022 22:49:04 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 22:39:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 13:38:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Mar 2022 13:38:54 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <angelogioacchino.delregno@collabora.com>,
 <tzungbi@google.com>, <miles.chen@mediatek.com>, <yc.hung@mediatek.com>
Subject: [PATCH v4 0/6] ASoC: mediatek: Add support for MT8195 sound card with
 max98390 and rt5682
Date: Thu, 24 Mar 2022 13:38:45 +0800
Message-ID: <20220324053851.27350-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_224909_082257_6EAD7F83 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

This series of patches adds support for mt8195 board with mt6359, max98390
and rt5682.

To prevent from copy-paste components, mt8195 machine drivers and 
dt-bindings are merged in the patch.

Patches are based on broonie tree "for-next" branch.

Changes since v3:
  - apply some suggested changes from reviewers

Changes since v2:
  - split "merge machine driver" into two parts for better understanding

Changes since v1:
  - remove merged patches about reset controller
  - propose a common machine driver instead of machine driver common code
  - propose a common dt-bindings for mt8195 sound card

Trevor Wu (6):
  ASoC: mediatek: mt8195: revise mt8195-mt6359-rt1019-rt5682.c
  ASoC: mediatek: mt8195: merge machine driver
  ASoC: dt-bindings: mediatek: mt8195: merge mt8195 machine yaml
  ASoC: mediatek: mt8195: rename card controls
  ASoC: mediatek: mt8195: add machine support for max98390 and rt5682
  ASoC: dt-bindings: mediatek: mt8195: support
    mt8195-mt6359-max98390-rt5682

 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    |   51 -
 ...-rt1019-rt5682.yaml => mt8195-mt6359.yaml} |    9 +-
 sound/soc/mediatek/Kconfig                    |   26 +-
 sound/soc/mediatek/mt8195/Makefile            |    3 +-
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 1198 -----------------
 ...mt6359-rt1019-rt5682.c => mt8195-mt6359.c} |  862 +++++++-----
 6 files changed, 566 insertions(+), 1583 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
 rename Documentation/devicetree/bindings/sound/{mt8195-mt6359-rt1019-rt5682.yaml => mt8195-mt6359.yaml} (84%)
 delete mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
 rename sound/soc/mediatek/mt8195/{mt8195-mt6359-rt1019-rt5682.c => mt8195-mt6359.c} (78%)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
