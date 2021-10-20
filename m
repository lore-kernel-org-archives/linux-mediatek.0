Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1627AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:18:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA2FE60F59
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA2FE60F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E4w9jgfPZjUFQ8SWbag05PRtyCFE/Awfhm1shXOV4z8=; b=sL91Kq7KI2U8qM
	sxWmtNj5vtxX8wQj5pWnnz8UW29CtFDG0/Z/WhxohtXq3gopSpxSfTDQtxB/hP5odC1myFNG14q82
	fHf34M3vhhFg8p6ZtHndODiV7jRWzG5KZFXzwbiDj6KFowrKxH1HGGcg2CeuLdV3oack0z2pyiNIm
	hBFUP1OPLqguLHq1wGrYdTDoYTitUiUJxSqJytQGl1rcIuYxsDPW28AtlUFKhyygBC97IGaiU20JF
	9ctsnqoZvQ5fbV6ggQN9GWkN7LfvZv1lLjAKsRYuooqrC6M922JYhBEUaeerp8CWfoPPoYKXx97VK
	xcN30FUwU4cV1M8qIIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5rY-003ZVL-Is; Wed, 20 Oct 2021 07:18:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5p3-003Y6k-Dx; Wed, 20 Oct 2021 07:15:49 +0000
X-UUID: 4e1cebf349044a9682fd46186c9a0550-20211020
X-UUID: 4e1cebf349044a9682fd46186c9a0550-20211020
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 13090063; Wed, 20 Oct 2021 00:15:29 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 00:15:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 15:15:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 15:15:26 +0800
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
Subject: [PATCH v2 0/9] Add mdp support for mt8195
Date: Wed, 20 Oct 2021 15:14:39 +0800
Message-ID: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_001537_511914_DA013318 
X-CRM114-Status: GOOD (  12.94  )
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
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |    2 +
 .../media/platform/mtk-mdp3/mdp_reg_tdshp.h   |  114 ++
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   18 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  215 ++-
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  763 +++++++--
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |    1 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1377 +++++++++++++++--
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  274 +++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   | 1085 ++++++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   53 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   18 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  418 ++---
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  274 ++--
 drivers/soc/mediatek/mt8195-mmsys.h           |  716 +++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |   44 +-
 drivers/soc/mediatek/mtk-mmsys.h              |    3 +
 drivers/soc/mediatek/mtk-mutex.c              |   79 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |   93 +-
 include/linux/soc/mediatek/mtk-mutex.h        |    2 +-
 44 files changed, 6369 insertions(+), 772 deletions(-)
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
