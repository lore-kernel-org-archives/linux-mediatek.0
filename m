Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E447CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 01:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HUP7CDvPJewnJ3Ljnx1jPgz6m7n9m9F6gBvU+FiUCtw=; b=kC+jVeunTLuRqBpfAnjjCcKCnt
	PQx94k5SlDdq+SjOpHtEgGYpOHi6TlxB/aDcbgBYauTVfnDLyoxipTHMysqjUSuEZpw+NVnQcXzfx
	IUmHKrOAa5obV/p43wy4IvF5mXqsbr0HPohudswW7GtfNKuq//H/E4mDU2ft83CZqAudF/yiMMVEg
	RfR0LoOOQ5YvAjWYIR5pr+6+SUIm5DktX8Tm2YkxpD35ipvWIqelcwWRCvM6w3cSgQkwjKLiVKoIY
	Nf3aWZHR1XyNNidGwgFM3DeoyCjhzj9jj8ANWvb3DECbVc4lmur1RqgZsF0QQC8Ow/uYrYW/zO1wb
	qFFJclxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqkN6-00H7E7-1o;
	Thu, 12 Oct 2023 01:20:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqkN2-00H7D6-1I
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 01:20:14 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 984E67FC;
	Thu, 12 Oct 2023 03:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697073606;
	bh=x38t53j8Sk+I5ukmymqPUmq+7cx33nmVbO4/IqkUf28=;
	h=From:To:Cc:Subject:Date:From;
	b=TCPwOKC1MKjj6yGwWkL244ziYsjygP7QZkz2UvZ0a4+CoI5Q6d4hW/0Qx8lUS52JM
	 uGz30cWTO6hDkgNvTb/53Vv3Rj29AMmAuBFbE/RwS1lU8bkpNIrSXFQnVsO9wLjoAX
	 jZ8i+TJaqtsjuwNFMrfZDrcW1ZLSuqNpvTjinyIU=
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
Subject: [PATCH v2 0/3] media: i2c: Add driver for THine THP7312 ISP
Date: Thu, 12 Oct 2023 04:20:13 +0300
Message-ID: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_182012_746380_E42C2EFF 
X-CRM114-Status: GOOD (  16.44  )
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
large number of patches are needed to support the board and the MT8365
SoC. Some of those patches are on their way to mainline, and some, like
the Pumpkin i350 board device tree, will require more work. For
convenience and reference, the needed patches are available in [1].
Example overlays for DT integration of the THP7312 are available in that
branch, in [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=mtk/v6.6/pumpkin/camera
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?h=mtk/v6.6/pumpkin/camera&id=e5fd74796c3e0973991bab2692a3534ed1a23d86

Compared to v1, this is a near complete rewrite of the driver that has
taken (to my knowledge) all review comments into account.

Below is the mandatory v4l2-compliance report. Careful readers may
notice that my v4l2-utils version is three commits behind upstream, but
that makes no practical difference as those commits are not related to
v4l2-compliance.

The mainline kernel is currently fairly unstable on the Pumpkin i350
board. For this reason, the driver has primarily been developed against
the Mediatek v5.15-based BSP, and successfully tested there. I managed
to test it on mainline as well, but that requires close to hundred boots
to get a userspace that doesn't segfault. This is why the
v4l2-compliance report below is from a run against the BSP. The thp7312
driver is identical to this version, except for the usage of
.probe_new() on v5.15 that has since been dropped from mainline, and the
return type of the .remove() function that was `int` back then.

If anyone would like to help with getting mainline to run better on the
Pumpkin i350 board, I would  be grateful :-) It would certainly help
maintaining this driver going forward.

# v4l2-compliance -u /dev/v4l-subdev2
v4l2-compliance 1.25.0-5097, 64 bits, 64-bit time_t
v4l2-compliance SHA: b79e00a74fde 2023-09-13 07:19:23

Compliance test for device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 5.15.37
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
[  353.331499] thp7312 2-0061: =================  START STATUS  =================
[  353.332515] thp7312 2-0061: Focus, Automatic Continuous: true
[  353.333460] thp7312 2-0061: Focus, Absolute: 0
[  353.334074] thp7312 2-0061: Auto-Focus Method: 2
[  353.334700] thp7312 2-0061: White Balance, Automatic: true
[  353.335432] thp7312 2-0061: Red Balance: 64
[  353.335998] thp7312 2-0061: Blue Balance: 50
[  353.337065] thp7312 2-0061: Brightness: 0
[  353.337627] thp7312 2-0061: Saturation: 10
[  353.338182] thp7312 2-0061: Contrast: 10
[  353.338712] thp7312 2-0061: Sharpness: 8
[  353.339242] thp7312 2-0061: Rotate: 0
[  353.339742] thp7312 2-0061: Auto Exposure, Bias: 0
[  353.340453] thp7312 2-0061: Power Line Frequency: 50 Hz
[  353.341160] thp7312 2-0061: Camera Orientation: Front
[  353.341835] thp7312 2-0061: Camera Sensor Rotation: 0
[  353.342504] thp7312 2-0061: Low Light Compensation: true
[  353.343204] thp7312 2-0061: Noise Reduction Auto: true
[  353.343882] thp7312 2-0061: Noise Reduction Level: 0
[  353.344636] thp7312 2-0061: ==================  END STATUS  ==================
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

 .../bindings/media/i2c/thine,thp7312.yaml     |  225 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../userspace-api/media/drivers/thp7312.rst   |   32 +
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   16 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/thp7312.c                   | 2386 +++++++++++++++++
 include/uapi/linux/thp7312.h                  |   19 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 9 files changed, 2696 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
 create mode 100644 drivers/media/i2c/thp7312.c
 create mode 100644 include/uapi/linux/thp7312.h


base-commit: a1766a4fd83befa0b34d932d532e7ebb7fab1fa7
-- 
Regards,

Laurent Pinchart


