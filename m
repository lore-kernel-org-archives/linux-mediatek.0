Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDB4C07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 11:40:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8AF4613C2
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 11:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8AF4613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cob/JGCuE40GXt78j/C5/WgkH2m9HFH7W4FgfIyHnys=; b=IN5PL0Hc+/1/5u
	00nKK+wCE3Sv3jMevl6Q0VkFD4fXYmBIBmqknHP1ZY931E0O8TIipWJA85we/LTY61ypW2jR2yc5H
	aDiTF4JadoM4bqsIo9gUJXi+l41gMgAX+f7P2BzQUOcT5fGh3onrNZV+pZJMb11f7mN6sbs1oFhOv
	yw8zN7d1NV7m407m1jUCqHDDv560BoQcSxjkMLaSRFmm5GWna+nzwhC9njjq0WPXKf18HAVk2XiFA
	pybjg7tcD8yzyt2ODcQPS6iAM7VYtmEULkWr/IcBKe2zf3uB2vBP/q/+Y6utHy6a7zcA0lkT7r0Jp
	9sxkKqIK0reXpmMIrwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2BLW-003WyH-Mw; Sat, 10 Jul 2021 11:40:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2BJx-003WTu-Fw; Sat, 10 Jul 2021 11:38:58 +0000
X-UUID: 4f75c411067145ab88f70b3bd20e3ca7-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1Gx+AieyWPVp3jAy7NhDfoyrRAS/GTLRzvaUysOg+3w=; 
 b=WsMB/J0W38f6fUp7o/yWbUwE8miLT3lTu3IFuo37ls1fPmZ8EO6OZ7D2lKNO3Zh+O6c7OEnkEa52URld8dgQqSmQtRog78DaXeaZkwOnLbAhpIBzjwufql/DXqtswWGPmdXxfyZt22tcIf4r+o5TLr3ygI5GwDla/drK0vDfMh0=;
X-UUID: 4f75c411067145ab88f70b3bd20e3ca7-20210710
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1799063889; Sat, 10 Jul 2021 04:38:44 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 04:38:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 19:38:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 10 Jul 2021 19:38:27 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v2 0/9] Add MediaTek SoC DRM (vdosys0) support for mt8195
Date: Sat, 10 Jul 2021 19:38:10 +0800
Message-ID: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_043857_653831_E476D848 
X-CRM114-Status: GOOD (  10.68  )
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

The hardware path of vdosys0 with eDP panel output need to go through
by several modules, such as, OVL, RDMA, COLOR, CCORR, AAL, GAMMA,
DITHER, DSC and MERGE.

Add DRM and these modules support by the patches below:

jason-jh.lin (9):
  dt-bindings: mediatek: add definition for mt8195 display
  dt-bindings: mediatek: add DSC definition for mt8195
  dt-bindings: arm: mediatek: add definition for mt8195 mmsys
  arm64: dts: mt8195: add display node for vdosys0
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  soc: mediatek: add mtk-mutex support for mt8195 vdosys0
  drm/mediatek: add mediatek-drm of vdosys0 support for MT8195
  drm/mediatek: add DSC support for MT8195
  drm/mediatek: add MERGE support for MT8195

 .../bindings/arm/mediatek/mediatek,mmsys.txt  |  15 +
 .../display/mediatek/mediatek,disp.txt        |   9 +-
 .../display/mediatek/mediatek,dsc.yaml        |  57 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 111 ++++
 drivers/gpu/drm/mediatek/Makefile             |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  16 +
 drivers/gpu/drm/mediatek/mtk_disp_dsc.c       | 205 +++++++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 525 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  14 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  29 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  32 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +
 drivers/soc/mediatek/mt8195-mmsys.h           | 191 +++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              | 107 +++-
 include/linux/soc/mediatek/mtk-mmsys.h        |  10 +
 18 files changed, 1337 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
