Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EF7C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 06:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PaE0YWdmxcYpz6RW0wjo6l/0znCmAX32iAYlunuLTNE=; b=qhEbNS4xS53kvo
	hvBMQ0YH8xLbKhtY32u4iRrhUrckbPGLfjkRq9bJFUNCkEZh3PH32I2WSAyQgkg4PPmj+od2K0D1K
	v/+mQ7L0blivJpZXpxl1vK3iv4BOjvFruGBdtk5b4F75+dMJ0sHY+VZ717zA0GjXWDrtrsw2oVO4F
	ieZ2fLKjU1Rsv7/jdNYqyXtbROOAzm+EUQX5IEAq3EKunzR3DI6VIrRzSH/dmJw9S6iOZVrEQtraH
	uGHM+1TB92Kg6Q6jUkF8toihUefvcUAfjsd5IOBN3p8XpYJcbcgbfn0nv3Zl/SFGM1bWYt70kJ7zh
	y57W0S1+RoggueP+qQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt2Fz-00EXwK-K1; Fri, 03 Dec 2021 06:41:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt2Fv-00EXuh-CY; Fri, 03 Dec 2021 06:41:18 +0000
X-UUID: 906ab63a652347308ed79b9057f14017-20211202
X-UUID: 906ab63a652347308ed79b9057f14017-20211202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 991683051; Thu, 02 Dec 2021 23:41:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 22:40:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 3 Dec 2021 14:40:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 3 Dec 2021 14:40:41 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, <lc.kan@mediatek.com>,
 <yi.kuo@mediatek.com>, <anthony.huang@mediatek.com>
Subject: [PATCH 0/4] MT8186 SMI SUPPORT
Date: Fri, 3 Dec 2021 14:40:23 +0800
Message-ID: <20211203064027.14993-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_224115_479914_A8E1A52C 
X-CRM114-Status: UNSURE (   7.79  )
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

This patchset add mt8186 smi support.
mainly add a sleep control function.

Base on v5.16-rc1.

Yong Wu (4):
  dt-bindings: memory: mediatek: Correct the minItems of clk for larbs
  dt-bindings: memory: mediatek: Add mt8186 support
  memory: mtk-smi: Add sleep ctrl function
  memory: mtk-smi: mt8186: Add smi support

 .../mediatek,smi-common.yaml                  |  4 +-
 .../memory-controllers/mediatek,smi-larb.yaml |  5 +-
 drivers/memory/mtk-smi.c                      | 52 +++++++++++++++++--
 3 files changed, 55 insertions(+), 6 deletions(-)

-- 
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
