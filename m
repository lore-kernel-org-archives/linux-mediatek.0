Return-Path: <SRS0=B6WE=Z2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605C8C43603
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 09:52:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3063D206DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 09:52:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="toVxm9CR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GZ6Zaj52"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3063D206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3WROln9bPWZxDoIrCgOQfU6RFutdVycg7k7V7/vys3k=; b=toVxm9CRldvB8Y
	AyyQxkmy8wU30A2ixcLhvwXeWzjFxFUeoZnEsB4fCkP6z3kjQiksnpQ9soPanuslLMqEPuF5mx0Bp
	8fPMOU18CalQf6DRcFPRyqHm2GpCRN4BmXUgjsJ+MtAv2PElMB6QebJnhhzWM99kPZMhFCeterQCt
	1uNKnLStW72IeZv08r5+FW3/x2OD1iQmAkFVzonjwmBJMyEjtVkFuL0acyOMKqod+3W+h0Tkl7k8Y
	AvflNhk0lk3lgbbHBWe0T2xh5qyOFb9QYMDsOksAfsfLXwnxBFWPeL1G2fXCW+f9Ly6YAlzkdxf96
	sAO2qRTG0FbAFDYrQmuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icRKf-0003Qz-NT; Wed, 04 Dec 2019 09:52:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icRJW-00024m-No; Wed, 04 Dec 2019 09:51:21 +0000
X-UUID: 257613a2801d4634b3e2bb1621c8e5b7-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BIYIzFcwVh/HRz6vBoAKLLqHGE4W8/Vx4vvIlZQjGhI=; 
 b=GZ6Zaj52GU8IIJ6Ru6ZjLsvkbloIRnEarZhMsHelUzeFOp0GXza4NoJMPQVVs2bmadBritUNBKOQYi9SR/+BXnqydW8OhNJ1mvp9q39JkVApBE1hPeZoNjIQQBYrugobrUcP4VC26V5zFTXS6x0hL6dMm5gleIqA2A/rfu5+h/s=;
X-UUID: 257613a2801d4634b3e2bb1621c8e5b7-20191204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 540617737; Wed, 04 Dec 2019 01:51:14 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 01:44:41 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 17:44:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Dec 2019 17:44:01 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v5 0/5] Add support for mt2701 JPEG ENC support
Date: Wed, 4 Dec 2019 17:44:19 +0800
Message-ID: <20191204094424.2562-1-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_015118_783942_F39841AD 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset add support for mt2701 JPEG ENC support.

This is the compliance test result for jpeg dec and enc.

The JPEG dec log:
------------------------------------------------------------
v4l2-compliance -d /dev/video0
v4l2-compliance SHA: af33cc5ef00177edbb45d466faf9061197767f2b, 32 bits

Compliance test for mtk-jpeg device /dev/video0:

Driver Info:
        Driver name      : mtk-jpeg
        Card type        : mtk-jpeg decoder
        Bus info         : platform:15004000.jpegdec
        Driver version   : 5.4.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected JPEG Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK

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
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
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

Total for mtk-jpeg device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0
------------------------------------------------------------

The JPEG enc log:

------------------------------------------------------------
v4l2-compliance -d /dev/video1 
v4l2-compliance SHA: af33cc5ef00177edbb45d466faf9061197767f2b, 32 bits

Compliance test for mtk-jpeg device /dev/video1:

Driver Info:
        Driver name      : mtk-jpeg
        Card type        : mtk-jpeg encoder
        Bus info         : platform:1500a000.jpegenc
        Driver version   : 5.4.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected JPEG Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
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
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for mtk-jpeg device /dev/video1: 44, Succeeded: 44, Failed: 0, Warnings: 0
------------------------------------------------------------

Change compared to v4:
-improve code quality for the orignal jpeg decode driver in separate patch.
-support crop for jpeg encode and compose for jpeg decode separately.
-delete jpeg_enc_param/mtk_jpeg_enc_param structure.
-delete mtk_jpeg_set_param() for jpeg encode.
-use clamp() to replace mtk_jpeg_bound_align_image() and round_up() to
 replace mtk_jpeg_align().
-move macro definition about hw to mtk_jpeg_enc_reg.h.
-delete unnecessary V4L2 logs in driver.
-cancel spin lock and unlock operation in deviec run function.
-change jpeg enc register offset hex numberals from upercase to lowercase.

Xia Jiang (5):
  media: platform: Fix jpeg dec driver bug and improve code quality
  media: dt-bindings: Add jpeg enc device tree node document
  arm: dts: Add jpeg enc device tree node
  media: platform: Rename jpeg dec file name
  media: platform: Add jpeg dec/enc feature

 .../bindings/media/mediatek-jpeg-encoder.txt  |  37 +
 arch/arm/boot/dts/mt2701.dtsi                 |  13 +
 drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 752 +++++++++++++-----
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  50 +-
 .../{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}      |   8 +-
 .../{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}      |  14 +-
 ...{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} |   2 +-
 ...{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} |   2 +-
 .../{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}    |  19 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 271 +++++++
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  86 ++
 .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  78 ++
 13 files changed, 1100 insertions(+), 237 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (89%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (77%)
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
