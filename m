Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AE1C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hWVV+SEd3hNz+aAIZnzIG+V+q06v+4GVIba2zhCVMJA=; b=kmyV+kGCXNvRgT
	KYU/yStCz4k6OcPKKR1Ghtt4VnqdKmkI7bnXUg0dBJyjOzlaMqioKbjeAMBww0UQ2qerbiZvWtq/f
	Syr58RsNuLUFo6GBeUzJzV8gjGhCGN3eeiJOeTNIrSmXrpPcBlY/TUl4+dFo5jw26Hwo7KZYqHG/Z
	UoxHILSfnNNzsF6+4PCz5PhAjp4vXdxM9w4rXUqbFFwtC0AKUL7PGCcQhqgXq/9Lg9Q9HSJVBEjUJ
	S51O9y9c/sJg5T4cvoEa41B5Eeb6E2ZIWNtnWx92k3zRuRaox4Wz7YFD7xXzpCVIXbb/vV8aRNzci
	TSdD+7LDThS5Y+x5CJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8G1y-007uIk-Pu; Fri, 14 Jan 2022 06:25:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8G1u-007uFe-17
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 06:25:43 +0000
X-UUID: f00c1e070f1540268e2d2ae94150f0ca-20220113
X-UUID: f00c1e070f1540268e2d2ae94150f0ca-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1283725616; Thu, 13 Jan 2022 23:24:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 22:24:26 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Jan 2022 14:24:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 14:24:24 +0800
From: <guochun.mao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH V1 0/4] mainly add a new SoC support for spi-mtk-nor
Date: Fri, 14 Jan 2022 14:24:04 +0800
Message-ID: <20220114062408.9077-1-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_222542_104809_53871A35 
X-CRM114-Status: UNSURE (   7.03  )
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

There is a new SoC mt8186, which spi-nor controller has some differences.
It needs one more clk, axi_s, for dma feature.
And also needs 1 extra dummy bit when reads flash registers.

Guochun Mao (4):
  dt-bindings: spi: add mt8186-nor compatible string
  spi: spi-mtk-nor: improve device table for adding more capabilities
  spi: spi-mtk-nor: add new soc mt8186 support
  spi: spi-mtk-nor: add axi_s clock for mt8186

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |  4 ++
 drivers/spi/spi-mtk-nor.c                     | 63 ++++++++++++++++---
 2 files changed, 58 insertions(+), 9 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
