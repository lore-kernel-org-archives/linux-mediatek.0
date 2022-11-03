Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AF5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 07:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xfSsEzqj2BXrEDx/MIKmNEh/Vct3wpVU7csvyV5KeN8=; b=Ay5k2CKfNS8CrEEyhbdPvLHVlS
	5yOdu7+virUZ+cVLG5do8kTWVuxvpphoBPlEaXdG5VtCrceA3oFqs3mmBmqVvE6VNI23zIhiuSY+M
	OWDdToIjNSbHDfhWbe9d8EOsAv3hXc2KpxBOykxF1OL5Qw/7D+NNTEunEO7qYftHNCVe5GbUTeVoT
	o/Pu6r/MVCiXn1akMjvtRnXkV28TviGWntH/ZEZ/Uc8hKbwsVaFVKwQUOBVOHCQN9Wf5r7SSdKoNL
	c1j34FU1NiVCRRGrfAoHlf+McTrvPrGqYncr4Db8TrlETxgyrNz9W5NY0WJUcjOkL6fFDUzIgqugg
	uM/2ZRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUVc-00GQkz-E2; Thu, 03 Nov 2022 07:19:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUVY-00GQjZ-Ur
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 07:19:27 +0000
X-UUID: 6d0496fb485a42e59ac0b5fb07af4715-20221103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xfSsEzqj2BXrEDx/MIKmNEh/Vct3wpVU7csvyV5KeN8=;
	b=tWri2QRbgp3E7+3aIC3zARFBcDbC5j/BsAzMn6OYYEFTZOiOoQ9wVyQhBLJeSSSpXzgQTuGUgA0ncynwuRFCUywAsx25hW2/c5UqUVa/KGmbhdhM7SOd9kjuVvwXX+UsQo79qJAiIz8qD5vAKGvxRgUm7GBfz7Cd0Ebf6o7BcHU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:64b8ce0b-c90a-42c9-b091-632b34e099c9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:70684eeb-84ac-4628-a416-bc50d5503da6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6d0496fb485a42e59ac0b5fb07af4715-20221103
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1222110558; Thu, 03 Nov 2022 00:19:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 3 Nov 2022 14:48:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 3 Nov 2022 14:48:43 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 00/10] Add support for multiple chips
Date: Thu, 3 Nov 2022 14:48:32 +0800
Message-ID: <20221103064842.12042-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_001925_273758_5499E23B 
X-CRM114-Status: GOOD (  11.08  )
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

Changes since v2:
- Depend on :
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=687004
- Split the shared memory header(mtk-img-ipi.h) by preprocessing instead, and
  classify the generic parts into "mtk-mdp3-type.h", and move
  chip-specific parts to"mt8183/mdp3-comp-mt8183.h".

Changes since v1:
- Depend on :
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=687004
- For hardware-specific structures in the shared memory header(mtk-img-ipi.h),
  split the relevant functions and structure definitions.

Hi,

To support multiple chips, a chip configuration header file needs to be created
and the relevant information split and moved into it.

The v4l2-compliance test results list is as follows:
	v4l2-compliance 1.23.0-4942, 32 bits, 32-bit time_t
	v4l2-compliance SHA: 4cf258c24026 2022-07-28 15:43:45

	Compliance test for mtk-mdp3 device /dev/video0:

	Driver Info:
	Driver name      : mtk-mdp3
	Card type        : MediaTek MDP3
	Bus info         : platform:14001000.mdp3-rdma0
	Driver version   : 6.1.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Required ioctls:
		test VIDIOC_QUERYCAP: OK
		test invalid ioctls: OK
	Allow for multiple opens:
		test second /dev/video0 open: OK
		test VIDIOC_QUERYCAP: OK
		test VIDIOC_G/S_PRIORITY: OK
		test for unlimited opens: OK
	Debug ioctls:
		test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
		test VIDIOC_LOG_STATUS: OK (Not Supported)
	Input ioctls:
		test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
		test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
		test VIDIOC_ENUMAUDIO: OK (Not Supported)
		test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
		test VIDIOC_G/S_AUDIO: OK (Not Supported)
		Inputs: 0 Audio Inputs: 0 Tuners: 0
	Output ioctls:
		test VIDIOC_G/S_MODULATOR: OK (Not Supported)
		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
		test VIDIOC_ENUMAUDOUT: OK (Not Supported)
		test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
		test VIDIOC_G/S_AUDOUT: OK (Not Supported)
		Outputs: 0 Audio Outputs: 0 Modulators: 0
	Input/Output configuration ioctls:
		test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
		test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
		test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
		test VIDIOC_G/S_EDID: OK (Not Supported)
	Control ioctls:
		test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
		test VIDIOC_QUERYCTRL: OK
		test VIDIOC_G/S_CTRL: OK
		test VIDIOC_G/S/TRY_EXT_CTRLS: OK
		test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
		test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
		Standard Controls: 4 Private Controls: 0
	Format ioctls:
		test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
		test VIDIOC_G/S_PARM: OK (Not Supported)
		test VIDIOC_G_FBUF: OK (Not Supported)
		test VIDIOC_G_FMT: OK
		test VIDIOC_TRY_FMT: OK
		test VIDIOC_S_FMT: OK
		test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
		test Cropping: OK
		test Composing: OK
		test Scaling: OK
	Codec ioctls:
		test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
		test VIDIOC_G_ENC_INDEX: OK (Not Supported)
		test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
	Buffer ioctls:
		test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
		test VIDIOC_EXPBUF: OK
		test Requests: OK (Not Supported)
		test TIME32/64: OK
	Test input 0:
	Streaming ioctls:
		test read/write: OK (Not Supported)
		test blocking wait: OK
		Video Capture Multiplanar: Captured 58 buffers
		test MMAP (no poll): OK
		Video Capture Multiplanar: Captured 58 buffers
		test MMAP (select): OK
		Video Capture Multiplanar: Captured 58 buffers
		test MMAP (epoll): OK
		test USERPTR (no poll): OK (Not Supported)
		test USERPTR (select): OK (Not Supported)
		test DMABUF: Cannot test, specify --expbuf-device
	Stream using all formats:
		(snip)
	Total for mtk-mdp3 device /dev/video0:
		1592, Succeeded: 1592, Failed: 0, Warnings: 0

Moudy Ho (10):
  media: platform: mtk-mdp3: add chip configuration header file
  media: platform: mtk-mdp3: chip config split about component settings
  media: platform: mtk-mdp3: chip config split about subcomponents
  media: platform: mtk-mdp3: chip config split about color format
  media: platform: mtk-mdp3: chip config split about resolution
    limitations
  media: platform: mtk-mdp3: chip config split about pipe info
  media: platform: mtk-mdp3: extend mdp_color format for compressed mode
  media: platform: mtk-mdp3: extend shared memory structure to 4-byte
    aligned
  media: platform: mtk-mdp3: Split general definitions used in MDP3
  media: platform: mtk-mdp3: decompose hardware-related information in
    shared memory

 .../mediatek/mdp3/mt8183/mdp3-comp-mt8183.h   | 144 ++++++
 .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h   | 409 +++++++++++++++++
 .../platform/mediatek/mdp3/mtk-img-ipi.h      | 218 ++-------
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 136 ++++--
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 433 +++++++++++-------
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  24 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  49 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  18 +
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  10 +-
 .../platform/mediatek/mdp3/mtk-mdp3-regs.c    | 283 +-----------
 .../platform/mediatek/mdp3/mtk-mdp3-regs.h    | 212 ++++-----
 .../platform/mediatek/mdp3/mtk-mdp3-type.h    |  53 +++
 12 files changed, 1185 insertions(+), 804 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mt8183/mdp3-comp-mt8183.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h

-- 
2.18.0


