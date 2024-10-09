Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD04ACEDD89
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WDQk23QF8GeWnYzaw3f6RwMziRHPmdE4gatkybBRKwQ=; b=rn6WJNNtNijI0wOiRaJp7v/Sau
	uIg0vwaZNfseuSKnoxN8Laz7PO98KgUZZnCuj7zCuWRPNlkJ0BBwcLuNRxmjjBiy8MLuyUvzrKMNa
	n+GgQqM0uZBBraVILKBD/RtSy/KXHG3kBhZSkaoAPpnocrb6l04y9GH1AxJ6J+CC3ilVIOyGqnXCg
	f1I1maMAfw15HuA27duCjaKa7qviMLRXE4RP/OciduHCmISKnmeRy59NFGhxuko2EEOT/ZKQ8Okt6
	enHWEv+Nn3+8q5ScYvMsJ2RWks66KzxliFZM4f+ees59MjjyYlMd4P5mw12LS/fnUKo2Lkl3KyUXU
	z7oTYVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syVq5-00000009DOZ-1Xwz;
	Wed, 09 Oct 2024 12:30:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUfp-000000091Di-3wgD;
	Wed, 09 Oct 2024 11:16:11 +0000
X-UUID: ded9d5a2862f11efb3adad29d29602c1-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WDQk23QF8GeWnYzaw3f6RwMziRHPmdE4gatkybBRKwQ=;
	b=HSOPaN3SFs1YZO/73Ww4v2lBtRPJx+4YdOJjjH4an8Op2MLDjSFoCQpLfkjYfzU9HSYcCKX2C6PY2DQvEstRopeDm6Oi8ivHYGfdffKjo/iv9koE19jGfRaR3kCmFeDdQcxZlT1fEqucHWBkVRd4PfBzA9OPBWGZOkY61X24TzM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:61a19555-f73b-4c4a-abc5-a53393bc1527,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:a253fe64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ded9d5a2862f11efb3adad29d29602c1-20241009
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <shu-hsiang.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 846124092; Wed, 09 Oct 2024 04:16:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 19:15:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 19:15:59 +0800
From: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Christian Konig <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>, <yunkec@chromium.org>, <shun-yi.wang@mediatek.com>,
	Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
Subject: [PATCH v1 00/10] Add MediaTek ISP7 camera system driver
Date: Wed, 9 Oct 2024 19:15:41 +0800
Message-ID: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.819300-8.000000
X-TMASE-MatchedRID: /6tHgHEL3iGAaBshbPhdTBWCVBr+Ay98vhf/zJ92tsPdyIjG+fPOFe5n
	np6b8PTveXq1+k2LDlqtCrdXtF3Jjy4UUq9htJ320C5BWPk1/EG0GxL+/GCnQ1wpnAAvAwazxca
	mCHrGUIj+ZF6Oacqo2yQP4QGuRJMzRbwaQX0OEahH+PTjR9EWkl+iEcKpKdpuNSweOixQAJJHdE
	c8dOyw1Vl+Hk3Iw2bEgDLqnrRlXrZ8nn9tnqel2MprJP8FBOIaqdk2nO+ebu9vQfhO+XsKpRGKW
	WkeCBsRDfaaTTjjxxjC7y1r1oW8QA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.819300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A293CE762DBA9DA2202B574D5BDF1F45F28941944CEBC2497E35940D4614489A2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_041610_017366_BF855637 
X-CRM114-Status: GOOD (  12.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Based on linux-next/master, tag: next-20241008

The patch set adds the MediaTek ISP7.x camera system hardware driver.

This driver sets up ISP hardware, handles interrupts, and initializes
V4L2 device nodes and functions. Moreover, implement V4L2 standard
video driver that utilizes media framework APIs. It also connects
the sensors and ISP, bridging with the seninf interface. Communicate
with SCP co-processor to compose ISP registers in the firmware.

These patches include CSI received data from sensors, sensor interface
bridge, raw/YUV image pre-processing, ISP utility and ISP control parts.

Thank you for reviewing these patches.

Shu-hsiang Yang (10):
  dt-bindings: media: mediatek: add camsys device
  media: platform: mediatek: add seninf controller
  media: platform: mediatek: add isp_7x seninf unit
  media: platform: mediatek: add isp_7x cam-raw unit
  media: platform: mediatek: add isp_7x camsys unit
  media: platform: mediatek: add isp_7x utility
  media: platform: mediatek: add isp_7x video ops
  media: platform: mediatek: add isp_7x state ctrl
  media: platform: mediatek: add isp_7x build config
  uapi: linux: add mediatek isp_7x camsys user api

 .../media/mediatek/mediatek,cam-raw.yaml      |  169 +
 .../media/mediatek/mediatek,cam-yuv.yaml      |  148 +
 .../media/mediatek/mediatek,camisp.yaml       |   71 +
 .../media/mediatek/mediatek,seninf-core.yaml  |  106 +
 .../media/mediatek/mediatek,seninf.yaml       |   88 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    2 +
 drivers/media/platform/mediatek/isp/Kconfig   |   21 +
 .../platform/mediatek/isp/isp_7x/Makefile     |    7 +
 .../mediatek/isp/isp_7x/camsys/Makefile       |   16 +
 .../isp_7x/camsys/kd_imgsensor_define_v4l2.h  |   87 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c | 1797 ++++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h |  140 +
 .../isp/isp_7x/camsys/mtk_cam-debug.c         | 1271 ++++
 .../isp/isp_7x/camsys/mtk_cam-debug.h         |  273 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-defs.h |  168 +
 .../isp/isp_7x/camsys/mtk_cam-dmadbg.h        |  721 +++
 .../isp/isp_7x/camsys/mtk_cam-feature.c       |   40 +
 .../isp/isp_7x/camsys/mtk_cam-feature.h       |   26 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h  |   87 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h  |  233 +
 .../isp/isp_7x/camsys/mtk_cam-meta-mt8188.h   | 2436 ++++++++
 .../isp/isp_7x/camsys/mtk_cam-plat-util.c     |  207 +
 .../isp/isp_7x/camsys/mtk_cam-plat-util.h     |   16 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.c |  393 ++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.h |   28 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.c  | 5359 +++++++++++++++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.h  |  325 +
 .../isp/isp_7x/camsys/mtk_cam-raw_debug.c     |  403 ++
 .../isp/isp_7x/camsys/mtk_cam-raw_debug.h     |   39 +
 .../isp/isp_7x/camsys/mtk_cam-regs-mt8188.h   |  382 ++
 .../isp/isp_7x/camsys/mtk_cam-seninf-def.h    |  193 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.c    | 1741 ++++++
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.h    |   16 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-hw.h     |  120 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-if.h     |   28 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-regs.h   |   40 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.c  |  356 ++
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.h  |   23 +
 .../isp/isp_7x/camsys/mtk_cam-seninf.h        |  170 +
 .../isp/isp_7x/camsys/mtk_cam-timesync.c      |  125 +
 .../isp/isp_7x/camsys/mtk_cam-timesync.h      |   12 +
 .../isp/isp_7x/camsys/mtk_cam-ufbc-def.h      |   59 +
 .../isp/isp_7x/camsys/mtk_cam-video.c         | 1817 ++++++
 .../isp/isp_7x/camsys/mtk_cam-video.h         |  224 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam.c      | 4168 +++++++++++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam.h      |  733 +++
 .../isp_7x/camsys/mtk_camera-v4l2-controls.h  |   65 +
 .../isp_7x/camsys/mtk_csi_phy_2_0/Makefile    |    5 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h   |  911 +++
 .../mtk_cam-seninf-csi0-cphy.h                |   69 +
 .../mtk_cam-seninf-csi0-dphy.h                |  139 +
 .../mtk_cam-seninf-hw_phy_2_0.c               | 2879 +++++++++
 .../mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h  |  257 +
 .../mtk_cam-seninf-seninf1-csi2.h             |  415 ++
 .../mtk_cam-seninf-seninf1-mux.h              |  147 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h  |   47 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h      |   49 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h |   99 +
 include/uapi/linux/mtkisp_camsys.h            |  227 +
 60 files changed, 30194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml
 create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-defs.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-dmadbg.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-feature.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-feature.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-meta-mt8188.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-regs-mt8188.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ufbc-def.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
 create mode 100644 include/uapi/linux/mtkisp_camsys.h

-- 
2.18.0


