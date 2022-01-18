Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42516C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z6nynEnn/I2vJ98C/28As282LJg0ut3eqyTZAc3bBUk=; b=m3ZMyB4mgiEWqt
	F7+tV6Iw5qq2PXWdOFi3ZXXzyx+e8XzBX7I2ddpE0pBZH29TKyfr8rwS44cu5x+zGpnuXhd45hzyy
	7qf4OvTz0HNhzhMM037e3x7AIFZWvjIRXDxKgFuyuqhb+uGWqJsjlsJdVW4hH32CcXri+r2p+o9Zn
	orattyoGa7AayINsyXITC/GaTKCVClBTpOf+O7QlTFOSdVY2MfoeKcpKTUMGq5bLBzS/x+uYbYM2f
	AuNhRWP6eODTieVnfmtOUrCanls1vM0KGgWxoWDSGxcuxDiGDlz6AAZQasJ/tn53SOSgqefrpk89L
	1PiAuWP+HGPjKfHJCafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9pHM-001ol9-K2; Tue, 18 Jan 2022 14:16:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9pHG-001ogI-9E
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 14:16:03 +0000
X-UUID: 692175f8619d48fd94ccce3a2c63ee00-20220118
X-UUID: 692175f8619d48fd94ccce3a2c63ee00-20220118
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1151258988; Tue, 18 Jan 2022 07:15:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 06:15:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 18 Jan 2022 22:15:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Jan 2022 22:15:44 +0800
From: <guochun.mao@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Zhen Zhang
 <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>, "Chuanhong
 Guo" <gch981213@gmail.com>, Bin Zhang <bin.zhang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <project_global_chrome_upstream_group@mediatek.com>
Subject: [PATCH v2 0/4] add new SoC mt8186 support for spi-mtk-nor
Date: Tue, 18 Jan 2022 22:15:38 +0800
Message-ID: <20220118141542.2510-1-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_061602_373917_DF7F321F 
X-CRM114-Status: UNSURE (   9.18  )
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

These patches is mainly for adding mt8186 support.
The spi nor controller of mt8186 has some differences,
it needs one more clk, axi_s, for dma feature.
And also needs one extra dummy bit when read flash registers.

The version 2 patches fix some typos for bindings file,
correct return value of probe function in spi-mtk-nor.c file,
and add some comments to explain why add extra dummy bit.

Guochun Mao (4):
  dt-bindings: spi: add mt8186-nor compatible string
  spi: spi-mtk-nor: improve device table for adding more capabilities
  spi: spi-mtk-nor: add new soc mt8186 support
  spi: spi-mtk-nor: add axi_s clock for mt8186

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |  4 ++
 drivers/spi/spi-mtk-nor.c                     | 71 ++++++++++++++++---
 2 files changed, 65 insertions(+), 10 deletions(-)

-- 
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
