Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2774C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 07:10:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E36261107
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 07:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E36261107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J1AMjzvusDwyAqDc332k7EgnQjrBswYVNUPGz4VhJoM=; b=zJ+jsUVHqVX7Yz
	n60dkfy8nBZzd+xE83jrOVHX7y0Q+8u+jeFqp0Ut9go2MXYs3G0gAczZp3InsczTN+wMcvJjcuPcR
	fKu96c9jACsXsTsK6+F6+yIpTldolNuwfEacUiVCCJ+GjdgbgJOSokepapkNdtln/LqKETN/aAzAl
	KsfXqB4TNmroOAZ+vkBe1t3txvtSzx+FaztlFTh0OBSFowOfX5qZqxMZw87FpqRrg8E0WaJhHGc5W
	OyF/eyQo/bSmoZUFmZLUDTO+RXe+9L/FTzexCf49qzRt3joIVXAHOsu0tub3BZh0PjIv5znH1Er3s
	0nnfZ+kTAQ5EVUXDgpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGcCF-007Rft-58; Thu, 19 Aug 2021 07:10:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGcBl-007RQw-3w; Thu, 19 Aug 2021 07:10:13 +0000
X-UUID: 2b16819765b8467da60d9fef1f46fd28-20210819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=M8fU/a6Va2wvcwVNfIB84/Fwgo9pFefzAIni/XlGVjM=; 
 b=aXRzJ/cqovYw1/nKTjuUzgr8wF3Z1S46E+YzRFXDVyEFo8fj4ajKxQ9cvsLXzZ6/RcqD+C71yqNaZEDMyVyE98xTxJ3Rqa8R5m+r3L9e+jjEpNvzNm3fKre/e+ulxtkhRx9Ju/l2+BHIEBMii9Su2w9/1NTSBIBrEWTbzmeceug=;
X-UUID: 2b16819765b8467da60d9fef1f46fd28-20210819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1202907441; Thu, 19 Aug 2021 00:09:59 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 00:09:57 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 15:09:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 15:09:55 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: <moudy.ho@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Jernej Skrabec
 <jernej.skrabec@siol.net>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, Rob Landley
 <rob@landley.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <acourbot@chromium.org>, <pihsun@chromium.org>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
 <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>, <hsinyi@google.com>
Subject: [PATCH v6 0/5] media: mediatek: support mdp3 on mt8183 platform
Date: Thu, 19 Aug 2021 15:09:49 +0800
Message-ID: <20210819070954.16679-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_001009_221655_F4E18218 
X-CRM114-Status: GOOD (  16.07  )
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

Changes since v5:
- Rebase on v5.14-rc6.
- Move MMSYS/Mutex settings to corresponding driver.
- Revise the software license description and copyright.
- Remove unnecessary enum. or definitions.
- Optimize platform/chip definition conditions.
- Use general printing functions instead of MDP3 private ones.
- Fix compile warning.

Changes since v4:
- Rebase on v5.13-rc1.
- Remove the CMDQ flush flow to match the CMDQ API change.
- Integrate four of MDP's direct-link subcomponents into MDP controller node
  from syscon node to avoid illegal clock usage.
- Rewrite dt-binding in a JSON compatible subset of YAML
- Fix a bit of macro argument precedence.

Changes since v3:
- Rebase on v5.9-rc1.
- modify code for review comment from Rob Herring, cancel multiple nodes using
  same register base situation.
- control IOMMU port through pm runtime get/put to DMA components' device.
- SCP(VPU) driver revision.
- stop queuing jobs(remove flush_workqueue()) after mdp_m2m_release().
- add computation of plane address with data_offset.
- fix scale ratio check issue.
- add default v4l2_format setting.

Changes since v2:
- modify code for review comment from Tomasz Figa & Alexandre Courbot
- review comment from Rob Herring will offer code revision in v4, due to
  it's related to device node modification, will need to modify code
  architecture

Changes since v1:
- modify code for CMDQ v3 API support
- EC ipi cmd migration
- fix compliance test fail item (m2m cmd with -f) due to there is two problem in runing all format(-f) cmd:
1. out of memory before test complete
        Due to capture buffer mmap (refcount + 1) after reqbuf but seems
        no corresponding munmap called before device close.
        There are total 12XX items(formats) in format test and each format
        alloc 8 capture/output buffers.
2. unceasingly captureBufs() (randomly)
        Seems the break statement didn't catch the count == 0 situation:
        In v4l2-test-buffers.cpp, function: captureBufs()
                        ...
                        count--;
                        if (!node->is_m2m && !count)
                                break;
        Log is as attachment

I will paste the test result with problem part in another e-mail

Hi,

This is the first version of RFC patch for Media Data Path 3 (MDP3),
MDP3 is used for scaling and color format conversion.
support using GCE to write register in critical time limitation.
support V4L2 m2m device control.

Moudy Ho (5):
  soc: mediatek: mmsys: Add support for MDP
  soc: mediatek: mutex: add support for MDP
  dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
  dts: arm64: mt8183: Add Mediatek MDP3 nodes
  media: platform: mtk-mdp3: Add Mediatek MDP3 driver

 .../bindings/media/mediatek,mdp3-ccorr.yaml   |   58 +
 .../bindings/media/mediatek,mdp3-rdma.yaml    |  241 +++
 .../bindings/media/mediatek,mdp3-rsz.yaml     |   66 +
 .../bindings/media/mediatek,mdp3-wdma.yaml    |   71 +
 .../bindings/media/mediatek,mdp3-wrot.yaml    |   71 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  110 ++
 drivers/media/platform/Kconfig                |   19 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/mtk-mdp3/Makefile      |    7 +
 drivers/media/platform/mtk-mdp3/isp_reg.h     |   27 +
 .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
 .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  281 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  508 ++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   47 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1357 +++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  148 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  300 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   75 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  802 ++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   42 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  747 +++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  373 +++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  314 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   79 +
 drivers/soc/mediatek/mt8183-mmsys.h           |  235 +++
 drivers/soc/mediatek/mtk-mmsys.c              |  164 ++
 drivers/soc/mediatek/mtk-mmsys.h              |    9 +-
 drivers/soc/mediatek/mtk-mutex.c              |  106 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |   81 +
 include/linux/soc/mediatek/mtk-mutex.h        |    8 +
 34 files changed, 6564 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
 create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
 create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
