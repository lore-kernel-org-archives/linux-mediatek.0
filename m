Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDC0C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d92WRNuStgTh2w70ACGAJg4igJkmRROu1ITqpBfYdG0=; b=EBbgLKejfHk+L41YRpLjj4whm+
	E0nQsKRimQGcmxXsc5dpv8LZZk+Ka4QwrA7OsVdRs2wsR/48EdbdLQECDlHTWl3YmWMg8twvydSUZ
	BpDdFbBlo73in4YxRy38Ad/tCtCB3jpYNK1eAEY0uYQmI+eujANFSlOG9Exfiwqdbsm1tYsQIBk3v
	wWcWkFIDDv4IxfdrIwJMcRbFsKudIzRXr9ej/UHa06i1hhuxk6gWAM3H1i6cRR8tmDmDW8oJRdXRA
	Cj2dqzqt7F6wNkO9WkwHr0w04PwoJQCInrARveFjAGK7TNA48Vdh2jVem2aZ0LldGXbDgDpaI8U6D
	NY21VyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZF0-00C1mO-2G;
	Tue, 21 Mar 2023 10:29:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZEt-00C1g2-0v;
	Tue, 21 Mar 2023 10:29:12 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f5ef:1040:e3c1:3d00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6900266030DA;
	Tue, 21 Mar 2023 10:29:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679394548;
	bh=thP50rZe85eKdLn09P/bJZIXTEK1LuBUDkCFuB2KNec=;
	h=From:To:Cc:Subject:Date:From;
	b=WANier/NNPyE0Tv/3S9lJSi5ZYSmzU0VgJo+nRTJVSmYgRQ7lVfT014TDpr5IZxDe
	 Ekzaiy1mtjb/2ANsIToKpM8WO7QfkSspjxYUj4JUoY/Cov+A6nkJLafapGCI8PcFWO
	 m8uM6LMu3dRbEC2h5lsGhKz3sJ4zRt0QE+YQso0OtHxhIBnPvB89xcAdbjLH17BsLi
	 9EAC/w+2NIaN2gCS12NwzyF15MXCVZ/Qwls8e0n52FNRbm9b5M6zmR85n3eZfd8Lt7
	 CWDq1ix3An5x04XiwjW4SfVMhUqFeUmVVbLXAenVCYC42YkdyOEiPKPBS0fiJ+taMH
	 c/Jg7F9DXYEsA==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	ming.qian@nxp.com,
	shijie.qin@nxp.com,
	eagle.zhou@nxp.com,
	bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	daniel.almeida@collabora.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	jernel@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 0/8] Add DELETE_BUF ioctl
Date: Tue, 21 Mar 2023 11:28:47 +0100
Message-Id: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_032911_484982_04647443 
X-CRM114-Status: GOOD (  11.51  )
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

VP9 dynamic resolution change use case requires to change resolution
without doing stream off/on to keep references frames.
In consequence the numbers of buffers increase until all 'old'
reference frames are deprecated.
To make it possible this series remove the 32 buffers limit per queue
and introduce DELETE_BUF ioctl to delete buffers from a queue without
doing stream off/on sequence.

change in version 2:
- Use a dynamic array and not a list to keep trace of allocated buffers.
  Not use IDR interface because it is marked as deprecated in kernel
  documentation.
- Add a module parameter to limit the number of buffer per queue.
- Add DELETE_BUF ioctl and m2m helpers.

Benjamin Gaignard (8):
  media: videobuf2: Access vb2_queue bufs array through helper functions
  media: videobuf2: Make bufs array dynamic allocated
  media: videobuf2: Add a module param to limit vb2 queue buffer storage
  media: videobuf2: Stop define VB2_MAX_FRAME as global
  media: v4l2: Add DELETE_BUF ioctl
  media: v4l2: Add mem2mem helpers for DELETE_BUF ioctl
  media: vim2m: Use v4l2-mem2mem helpers for VIDIOC_DELETE_BUF ioctl
  media: verisilicon: Use v4l2-mem2mem helpers for VIDIOC_DELETE_BUF
    ioctl

 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../media/v4l/vidioc-delete-buf.rst           |  51 ++++++
 .../media/common/videobuf2/videobuf2-core.c   | 168 +++++++++++++-----
 .../media/common/videobuf2/videobuf2-v4l2.c   |  23 ++-
 drivers/media/platform/amphion/vdec.c         |   1 +
 drivers/media/platform/amphion/vpu_dbg.c      |   4 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |   2 +-
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         |   4 +-
 drivers/media/platform/qcom/venus/hfi.h       |   2 +
 .../media/platform/verisilicon/hantro_hw.h    |   2 +
 .../media/platform/verisilicon/hantro_v4l2.c  |   1 +
 drivers/media/test-drivers/vim2m.c            |   1 +
 drivers/media/test-drivers/visl/visl-dec.c    |  16 +-
 drivers/media/v4l2-core/v4l2-dev.c            |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  10 ++
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  20 +++
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |   2 +
 include/media/v4l2-ioctl.h                    |   4 +
 include/media/v4l2-mem2mem.h                  |  12 ++
 include/media/videobuf2-core.h                |  84 ++++++++-
 include/media/videobuf2-v4l2.h                |  15 +-
 include/uapi/linux/videodev2.h                |   1 +
 23 files changed, 353 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-delete-buf.rst

-- 
2.34.1


