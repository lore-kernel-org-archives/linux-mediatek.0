Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB325C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jan 2022 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=orEHk+TywztfIcq//tCSXCBrSqkI4j38ryxamycmxuU=; b=Ha1UBLnaxP5+yz
	R2YY4ClpLBkFMh2ymsIpKLfe1ddUt3UKo3Sg3PfhMXqoMM9pAieSAYiygxkHUl5EYs4nYOG9mT0pt
	BNihPcUG4yvmJoHWjUMV8oBXa+FT5L1p4f38AjHYyC9XM0LudJHt1Uq3/QUWX7nCeM8kDcPtgxebL
	miJ1X8yxoJmjfqnVI32jVKJ8XYyrGeSjJtsHhIssPRsztg6fIpQv1CH3nr0Cr+hBFBGaKeyiPG/Y8
	Mh7ZuKMN195g6q6qY2BPy0c7yl/NvC2tDKLXeSygKbGaHvJnG3KDU3VI06JRCAL92UVDlIOv8BmIs
	7d5kqBFS2dfKMGDQ0+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6Bdy-006TL2-34; Sat, 08 Jan 2022 13:20:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6Bdk-006TH7-1c; Sat, 08 Jan 2022 13:20:14 +0000
X-UUID: d22b208c974344ab8d4e538bdb1e7d34-20220108
X-UUID: d22b208c974344ab8d4e538bdb1e7d34-20220108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1872671684; Sat, 08 Jan 2022 06:20:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Jan 2022 05:20:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 8 Jan 2022 21:20:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 8 Jan 2022 21:20:05 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v1 0/2] Mediatek MT8186 power domain support
Date: Sat, 8 Jan 2022 21:19:51 +0800
Message-ID: <20220108131953.16744-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_052012_112591_A48A3CC1 
X-CRM114-Status: UNSURE (   8.52  )
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

This patch series adds power domain support for MT8186.
It depends on [1]"Mediatek MT8195 power domain support"
and based on 5.16-rc6.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579

Chun-Jie Chen (2):
  dt-bindings: power: Add MT8186 power domains
  soc: mediatek: pm-domains: Add support for mt8186

 .../power/mediatek,power-controller.yaml      |   1 +
 drivers/soc/mediatek/mt8186-pm-domains.h      | 344 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         |   5 +
 include/dt-bindings/power/mt8186-power.h      |  32 ++
 include/linux/soc/mediatek/infracfg.h         |  48 +++
 5 files changed, 430 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8186-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt8186-power.h

--
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
