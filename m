Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C804C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:41:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17253221FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gIBKnDD9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AjDrOgWL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17253221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=88qHlohrlK/kgD653r4N3KD+6xw92afMCVSLaKHzWvM=; b=gIBKnDD9TEV3zxWE5cjSfH2lwk
	W/je1NoS1REhGwloKl+200iaIqlfwbGngEXshm+4gqwPzn1AMSuuEFmJJ6EpZtHUT/7Vfq4HALLYF
	tql1CeE/zjQ/NZizKpsOytoQ/dDZhQy5+fzE6oq4HuyQVJFbVAOv2/7B/kbAwyB1+ITJstZ2tS/JG
	cXop8e7jzT0ROtc2VKK/tKMc5nb6NyqAa0AeU83+hLxHwilKg1+MSMs3R4hqJPVvyrWLFvMc545Bz
	m0UX97gHBel3+S+6tY+ab0SQ9QBoJcoY3Q1epjjFQthD2p96NJPVsgZKTxIob0Qge0hcNq6OsE3tS
	sfGmj6pA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfwMW-0006jN-Ik; Fri, 20 Nov 2020 02:41:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfwMM-0006ft-ON; Fri, 20 Nov 2020 02:41:16 +0000
X-UUID: 9a122401fe1e4fc0bcef3209caa800f8-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Mrdi6KjtWAz4XCFusnp4arx5x2ie7LwX9SB/eFWDn3E=; 
 b=AjDrOgWL2uJJrpHY+UAlvhpkDpwIsei+jEaJiWq6wjqrEHaot37zt1N6Vr6nNdUSQu0CZcDdtwmJP4TR11+GXNdD1DmLSLsKdv8cZN6mQWOe6IZuRjyoTrWtwgqBA3EESiI05NwdMrp6WOSj15FKjpF6weouAm1Kxg3VO0o64pw=;
X-UUID: 9a122401fe1e4fc0bcef3209caa800f8-20201119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <daoyuan.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1264813898; Thu, 19 Nov 2020 18:32:46 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 18:29:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 10:29:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Nov 2020 10:29:08 +0800
From: Daoyuan Huang <daoyuan.huang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v4 0/4] media: mediatek: support mdp3 on mt8183 platform
Date: Fri, 20 Nov 2020 10:29:02 +0800
Message-ID: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 396CC85A8D0E16EE1F5570B1027F9616E51282698A71B637A4F9EBCC55A77EA42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_214115_028751_5B2B3956 
X-CRM114-Status: GOOD (  17.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, menghui.lin@mediatek.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, drinkcat@chromium.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, daoyuan huang <daoyuan.huang@mediatek.com>,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 linux-arm-kernel@lists.infradead.org, randy.wu@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, ben.lok@mediatek.com,
 moudy.ho@mediatek.com, Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

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
- fix compliance test fail item (m2m cmd with -f)
due to there is two problem in runing all format(-f) cmd:
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

daoyuan huang (4):
  [v4,1/4] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
  [v4,2/4] dts: arm64: mt8183: Add Mediatek MDP3 nodes
  [v4,3/4] media: platform: Add Mediatek MDP3 driver KConfig
  [v4,4/4] media: platform: mtk-mdp3: Add Mediatek MDP3 driver

 .../bindings/media/mediatek,mt8183-mdp3.txt   |  208 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  116 ++
 drivers/media/platform/Kconfig                |   17 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/mtk-mdp3/Makefile      |    7 +
 drivers/media/platform/mtk-mdp3/isp_reg.h     |   37 +
 .../media/platform/mtk-mdp3/mdp-platform.h    |   58 +
 .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   75 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |  206 +++
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |  109 ++
 .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |  125 ++
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |  115 ++
 .../media/platform/mtk-mdp3/mmsys_config.h    |  188 +++
 drivers/media/platform/mtk-mdp3/mmsys_mutex.h |   35 +
 .../media/platform/mtk-mdp3/mmsys_reg_base.h  |   38 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  281 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  504 ++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   54 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1420 +++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  155 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  269 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   86 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  795 +++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   42 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  748 +++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  373 +++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  313 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   79 +
 28 files changed, 6455 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
 create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
 create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp-platform.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_config.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_mutex.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
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
