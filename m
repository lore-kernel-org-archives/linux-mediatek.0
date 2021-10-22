Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 09:33:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28FEB610CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 09:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28FEB610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rg+MJ793hM/xy87wkmpLUkQM4pxO3etvs0e7W2JGwLU=; b=dxFKiYiws9pkQm
	pt0APW5A8+1QpQefKKFLzMLOrvIMICXhHAhV4u3Q/nfFrlfsSTR4+7GnOLTsqb4aP3EvPOyl522MX
	35cgkEv2k+9daWDZACtBy2FBpPlg0IGMkooWIg6M0AVy/aAZXvigzmumUGJ1GssmOM/OKb0k6yAgi
	N+lzTumQTG/sRdjLd+BoIouCKktuecMNP4g6xHmOxVgBogru0mgi/h98p548VYOY5XROroQFJu/Tf
	UtKCb9OFZw6rxm+3svwWl5wE5TYxB5bxIWCnvbQx4SuczYgX/UGFfw/kU0M75c+YAYbwELnq5yOsG
	8i2e5+y/pdCzLIe6UnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqva-00ANdC-Q4; Fri, 22 Oct 2021 09:33:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqvC-00ANY1-Sx; Fri, 22 Oct 2021 09:33:08 +0000
X-UUID: a8fed3c4a420487ba08e185f859bc44b-20211022
X-UUID: a8fed3c4a420487ba08e185f859bc44b-20211022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1897894892; Fri, 22 Oct 2021 02:33:03 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 02:28:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Oct 2021 17:28:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 17:28:28 +0800
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
Subject: [PATCH v2 0/4] Add additional setting and performance tuning
Date: Fri, 22 Oct 2021 17:28:23 +0800
Message-ID: <20211022092827.24631-1-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_023306_949567_60522790 
X-CRM114-Status: UNSURE (   9.42  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Change in v2:
- Remove global variable and move to mdp_dev
- Revise dma alloc/free flow

Reconfigure shared memory to improve performance.
Revise property in rdma dts node and add additional setting in driver.

Roy-CW.Yeh (4):
  arm64: dts: mt8195: Modify svpp rdma node property
  media: platform: mtk-mdp3: Reconfigure SHM to improve performance
  media: platform: mtk-mdp3: Set dma_set_mask_and_coherent
  media: platform: mtk-mdp3: Set rdma compression reg in each frame

 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  26 ++--
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 112 +++++++++++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   4 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   |  18 +--
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  31 ++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   8 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  10 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |   4 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  99 +++++++++-------
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   8 ++
 10 files changed, 243 insertions(+), 77 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
