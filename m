Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DD7CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2DrY4VqfMC9yHPVa2voF7UwqiWGscYGfZiuWQYcG8IM=; b=Q+ddVtoo7tx7QF6xjXlvG1xZnu
	lG7mxoWlZge+CaBA1FtTH9nKRcSNbf+PAiDkQNITVYw2j5k95H51pMHAE9X1ZBNBlW87QlYBWo+TT
	0JFoHVA+fx8QGinOaDS83Nn4dzAY5K2AlumfrENTBQ2nBq6kSI5d2BP0sG4RTT7dznjKPH//hGZ6v
	JZz3OGRH7c0wK8NWC6YhB2QQXSW37QMqT2WpiQ4nzN8A6s0z36mU0g2n9QDw4u+ids9z7fZK5zWO0
	J9RvyIiGXI3b3tGHKoBaTI9j4L23SNObBwJfoc/nqMruTwFo2ynvjWl5IHP2RiurJ46ZiieU4LKMl
	PWOjitgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr1V8-001hwK-1i;
	Thu, 12 Oct 2023 19:37:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr1V4-001huq-21
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 19:37:40 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97BED8C;
	Thu, 12 Oct 2023 21:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697139447;
	bh=L+wv19PM7x/xXr/z3O//0TkRxpU4Mv28RyY6tp937+Q=;
	h=From:To:Cc:Subject:Date:From;
	b=Q9JvKVrAJdLNy0mUdxQMRM5cZyJf91YII1Ax5XcuEaGpvFnB2K+GGUytlnOu0AH6I
	 NKyx+foXpdPQ/lScIvTWCRPl/MFuNESd4EqyzXF+oHif/jy/tFpqq8n2P1rCw8YAKj
	 SmFlbrp5GpazZFRNzo2RawplOQevuQ6lkmsyfqtQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/3] media: i2c: Add driver for THine THP7312 ISP
Date: Thu, 12 Oct 2023 22:37:34 +0300
Message-ID: <20231012193737.7251-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_123738_827834_D43817AB 
X-CRM114-Status: GOOD (  14.37  )
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

Hello,

This patch series adds a new driver for the THine THP7312 ISP. It has
been tested on an OLogic Pumpkin i350, which has a Mediatek MT8365 SoC,
with the THine THSCG101 camera module.

Technically the driver itself (and its bindings) have no dependencies,
but to run/test this on the Pumpkin i350 with the mainline kernel, a
number of patches are needed to support the board and the MT8365 SoC.
Some of those patches are on their way to mainline, and some, like the
Pumpkin i350 board device tree, will require more work. For convenience
and reference, the needed patches are available in [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=mtk/v6.6/pumpkin/camera

Example overlays for DT integration of the THP7312 are available in that
branch, in
arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso and
arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso.

Compared to v2, all comments received for the DT bindings in v1 have now
been properly taken into account (as far as I can tell). The driver has
also been improved slightly. Please see individual patches for detailed
changelogs.

I also managed to get the mainline kernel running properly on the
Pumpkin board, so this series has been properly tested on v6.6-rc5.

Below is the mandatory v4l2-compliance report. Careful readers may
notice that my v4l2-utils version is three commits behind upstream, but
that makes no practical difference as those commits are not related to
v4l2-compliance.

root@buildroot ~ # v4l2-compliance -u /dev/v4l-subdev2
v4l2-compliance 1.25.0-5097, 64 bits, 64-bit time_t
v4l2-compliance SHA: b79e00a74fde 2023-09-13 07:19:23

Compliance test for device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.6.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK

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
        Standard Controls: 17 Private Controls: 4

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev2: 43, Succeeded: 43, Failed: 0, Warnings: 0

Laurent Pinchart (1):
  media: uapi: Add controls for the THP7312 ISP

Paul Elder (2):
  dt-bindings: media: Add bindings for THine THP7312 ISP
  media: i2c: Add driver for THine THP7312

 .../bindings/media/i2c/thine,thp7312.yaml     |  226 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../userspace-api/media/drivers/thp7312.rst   |   32 +
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   16 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/thp7312.c                   | 2330 +++++++++++++++++
 include/uapi/linux/thp7312.h                  |   19 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 9 files changed, 2641 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
 create mode 100644 drivers/media/i2c/thp7312.c
 create mode 100644 include/uapi/linux/thp7312.h


base-commit: a1766a4fd83befa0b34d932d532e7ebb7fab1fa7
-- 
Regards,

Laurent Pinchart


