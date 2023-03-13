Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC33C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YbR/j5de3DczKt5Ew0TDXvKeSS9krgIkQa2K9A3stQw=; b=DWjDYeH62Jo2YOaH0ZVH4Ihz+u
	OLPvvyHexeJcgiu4gc/yXHg88Ll4N+ozzLIlUtUpmfrdmzZTZsOMyc6tr2H1FzIgXO1aVMYK9E31e
	XyXTsgtUOpSIuec7n2z3tvVyR0Ee1kRyBt+f3Lyipjk5XY8U3X+JaDOYiWOVtNv8XwQ7WW7AkclAQ
	XdYjc2jOZPqXFYUHWsA3/nQACqLAoqcuaqyKZnNl61hJzQjTo/v1fBjpFKyTuI8h2pwaJyG79mH7n
	2jj3MV0RFVP2ZHZW0qKgmVmwvmaLn/XYCbmDHrINqlkykK7tMIrJ2Sbk//7+nMKq8wOidcoghLf+4
	H5ipjlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbiiH-0061pq-Rd; Mon, 13 Mar 2023 13:59:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbii2-0061dy-Cs; Mon, 13 Mar 2023 13:59:31 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7a7b:d0cc:67e9:4297])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 00FCA66020C5;
	Mon, 13 Mar 2023 13:59:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678715964;
	bh=+om2k2KNQgvylarO49oxczzpR8UPvFV3qo3tlidzUT0=;
	h=From:To:Cc:Subject:Date:From;
	b=PrYrPAJYVyfuCF96dRZ7vSuoHhW31z3DNMLGXKHKxNJ5+8BrNiFh7mbqFGAx0OqBO
	 NvGy3gsxpPKrIIMBzj5lUVYTClXrcY37rGoWf6rP3MdTJz9wX9DRHYrLA6KYQoi7wY
	 wvnat1Fk21LZfIhnWlxld5uB4r+UkL3IDLPgpXvXDsgxrA+b9e35HVltnR9g9raRK8
	 qwEqAPTVRXFzYKqnoGWSv4kkndvcrT8IFvJpHd4HM17YA/VxE0cZfBeUgujBnw/ro/
	 uI/iSkUSL9F3+O2nYWT5VwcSqzwUTHxlAR80dJNRRXaZs3ZFr0JBnYHiMZJuetByFw
	 ZM8TAlLUsvTvw==
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
	jerbel@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [RFC 0/4] Allow more than 32 vb2 buffers per queue
Date: Mon, 13 Mar 2023 14:59:12 +0100
Message-Id: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_065930_639595_F73F91DE 
X-CRM114-Status: UNSURE (   9.69  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Queues can only store up to VB2_MAX_FRAME (32) vb2 buffers.
Some use cases like VP9 dynamic resolution change may require
to have more than 32 buffers in use at the same time.
The goal of this series is to prepare queues for these use
cases by replacing bufs array by a list a vb2 buffers.

For the same VP9 use case we will need to be able to delete
buffers from the queue to limit memory usage so this series
add a bitmap to manage buffer indexes. This should permit to
avoid creating holes in vb2 index range.

I test these patches with Fluster test suite on Hantro video
decoder (VP9 and HEVC). I notice no performances issues and 
no regressions.

Despite carefully checking if removing bufs array doesn't break
the compilation of any media driver, I may have miss some so
one of the goal of this RFC is also to trig compilation robots.
 
Benjamin Gaignard (4):
  media: videobuf2: Use vb2_get_buffer() as helper everywhere
  media: videobuf2: Replace bufs array by a list
  media: videobuf2: Use bitmap to manage vb2 index
  media: videobuf2: Stop define VB2_MAX_FRAME as global

 .../media/common/videobuf2/videobuf2-core.c   | 107 +++++++++++-------
 .../media/common/videobuf2/videobuf2-v4l2.c   |  17 +--
 drivers/media/platform/amphion/vdec.c         |   1 +
 drivers/media/platform/amphion/vpu_dbg.c      |   4 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |   2 +-
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         |   4 +-
 drivers/media/platform/qcom/venus/hfi.h       |   2 +
 .../media/platform/verisilicon/hantro_hw.h    |   2 +
 drivers/media/test-drivers/visl/visl-dec.c    |  16 +--
 include/media/videobuf2-core.h                |  42 ++++++-
 include/media/videobuf2-v4l2.h                |   4 -
 11 files changed, 130 insertions(+), 71 deletions(-)

-- 
2.34.1


