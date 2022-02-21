Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACE0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 04:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RJs/dZK7BGGekjr8q9Mumir1uqQixkUhMmZ26qVkCbg=; b=cBRwlsYi98pcGf
	13OJw22IsRIAhlBunnpPMQ2/ASJK7fBpsbWJl16npVbSas5/U5APCLB2BLZNMyI1n8P2b2Ub0pBKz
	v2yeft245WkkkZPkjJ6Qvw5fEOhtHJfOpD1FGlM4GVDp9vzezZM19NzFVi2CYAe5UpCOG03A6NDG1
	nh2f/tFiWnKeMKw5SGEI54hdaX2BKsWE0QT6KTyqFvZZddPHW08ONflMcSxkrvRPUWQTVXWJnPrjR
	tv3Cszt6H6ym5tv1JMe4cCAA2dFSv33qLuysc0oCJqPEZ/+frswTSHG3r+xKM6wFoR7hR8V3E6zhH
	vMMQ68VFgdLn/UTWUQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM028-003L6Z-NS; Mon, 21 Feb 2022 04:10:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM01l-003Kyh-Fh; Mon, 21 Feb 2022 04:10:22 +0000
X-UUID: cced6c9d04de46879123bbba40efe41c-20220220
X-UUID: cced6c9d04de46879123bbba40efe41c-20220220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 536255112; Sun, 20 Feb 2022 21:10:20 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 20:07:23 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 21 Feb 2022 12:07:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 12:07:21 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH V2 0/6] spi: mediatek: add single/quad mode support
Date: Mon, 21 Feb 2022 12:07:11 +0800
Message-ID: <20220221040717.3729-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_201021_540434_AAF51E67 
X-CRM114-Status: UNSURE (   6.99  )
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

v2:
 1. rebase this series on spi for-next.
 2. fix Rob and Krzysztof comments in v1. 

Leilk Liu (6):
  dt-bindings: spi: Add compatible for Mediatek IPM IP with single mode
  spi: mediatek: add IPM single mode design support
  dt-bindings: spi: Add compatible for Mediatek IPM IP with quad mode
  spi: mediatek: add spi memory support
  dt-bindings: spi: support spi-hclk
  spi: mediatek: support spi-hclk

 .../bindings/spi/mediatek,spi-mt65xx.yaml     |   4 +
 drivers/spi/spi-mt65xx.c                      | 496 ++++++++++++++++--
 2 files changed, 468 insertions(+), 32 deletions(-)

--
2.25.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
