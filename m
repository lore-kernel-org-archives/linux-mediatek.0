Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47028C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 02:32:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1616128E
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 02:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF1616128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=krMMdqrTQA+dykftLzYdaBA9bckstmLpsofr8xpQGr0=; b=1yE7LsFkd7pFTg
	2IAYl6takXBX4XVlSDB7M7w79s8dmGNH++y4lw5GHlokhtPWZNbQNkf7AZ+gtBtgAfzHGlz4yM/uW
	3eF2PGWVxrdD5KVNHBbr2iMsBvZ+RFy/rYD5sHbUwVWWuy02ER4NmBn2QFJfjU2HPzzZiKQjypwVE
	yo8eFZBeLG36cCwLmrW+wgmkWH7Vb1QgZeHvBqyRFssC+CnzmQS3diMBmLX89elYdYpl3BjNeFvAi
	yMRU9EWm0n1GvDWY7n1PitC1IezciPiL5voWqaLv99xM6auwnQk5N71z/xt/U63mj9rki0k9EBt2N
	ZcHX42jhYXQ9GCe98otQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdkM2-009Zev-9Y; Fri, 22 Oct 2021 02:32:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdkLg-009ZZf-8M; Fri, 22 Oct 2021 02:32:01 +0000
X-UUID: 59ae7ecbb50a4552ae168602641aeaf0-20211021
X-UUID: 59ae7ecbb50a4552ae168602641aeaf0-20211021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1626517565; Thu, 21 Oct 2021 19:31:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Oct 2021 19:21:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Oct 2021 10:21:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 10:21:52 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 0/9] Add mdp support for mt8195
Date: Fri, 22 Oct 2021 10:21:37 +0800
Message-ID: <20211022022146.3577-1-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_193200_403943_83926EAC 
X-CRM114-Status: GOOD (  11.83  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add a chip independence architecture to make
mt8195 mdp driver compatible with previous soc.

Change in v3:
- Fix logging level and magic number
- Revise null check flow to make it more logical

Change in v2:
- Remove redudant globals and commented lines
- Add enumeration to represent mdp version in plat_cfg

Roy-CW.Yeh (9):
  soc: mediatek: mmsys: expand MDP enum for chip independence
    architecture
  soc: mediatek: mutex: expand parameter for mdp mutex function
  media: platform: mtk-mdp3: add chip independence architecture
  dt-bindings: media: mediatek: mdp3: add additional function block yaml
  arm64: dts: mt8195: add mdp3 node
  soc: mediatek: mmsys: support mt8195 vppsys0/1
  soc: mediatek: mutex: support mt8195 vppsys0/1
  media: platform: mtk-mdp3: support mt8195
  media: platform: mtk-mdp3: Add dual pipe feature support

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |    2 +
 .../bindings/arm/mediatek/mediatek,mutex.yaml |    4 +
 .../bindings/media/mediatek,mdp3-aal.yaml     |   62 +
 .../bindings/media/mediatek,mdp3-color.yaml   |   62 +
 .../bindings/media/mediatek,mdp3-fg.yaml      |   61 +
 .../bindings/media/mediatek,mdp3-hdr.yaml     |   61 +
 .../bindings/media/mediatek,mdp3-merge.yaml   |   62 +
 .../bindings/media/mediatek,mdp3-ovl.yaml     |   61 +
 .../bindings/media/mediatek,mdp3-pad.yaml     |   62 +
 .../bindings/media/mediatek,mdp3-rdma.yaml    |   22 +-
 .../bindings/media/mediatek,mdp3-rsz.yaml     |    2 +
 .../bindings/media/mediatek,mdp3-split.yaml   |   67 +
 .../bindings/media/mediatek,mdp3-stitch.yaml  |   62 +
 .../bindings/media/mediatek,mdp3-tcc.yaml     |   62 +
 .../bindings/media/mediatek,mdp3-tdshp.yaml   |   61 +
 .../bindings/media/mediatek,mdp3-wrot.yaml    |    2 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  672 +++++++-
 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h |   24 +
 .../media/platform/mtk-mdp3/mdp_reg_color.h   |   29 +
 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h  |   23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h |   31 +
 .../media/platform/mtk-mdp3/mdp_reg_merge.h   |   23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h |   24 +
 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h |   20 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   31 +
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |    6 +
 .../media/platform/mtk-mdp3/mdp_reg_tdshp.h   |  114 ++
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   18 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  215 ++-
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  765 +++++++--
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |    1 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1375 +++++++++++++++--
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  274 +++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   | 1081 ++++++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   53 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   18 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  414 ++---
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  274 ++--
 drivers/soc/mediatek/mt8195-mmsys.h           |  716 +++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |   44 +-
 drivers/soc/mediatek/mtk-mmsys.h              |    3 +
 drivers/soc/mediatek/mtk-mutex.c              |   79 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |   93 +-
 include/linux/soc/mediatek/mtk-mutex.h        |    2 +-
 44 files changed, 6370 insertions(+), 767 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_color.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
