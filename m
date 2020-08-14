Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4F1C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:13:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F35F2087D
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:13:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="17E3zy8s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VAEqyzg7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F35F2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QnulfCaooWTl4KEu3xHY9lwiTYQh0d5dkVBWEuhX3yU=; b=17E3zy8sYRDWvC8uhzZrjor9It
	PXfWRNZqOJifYgUQp7qO/OAflT+crUkkKNpKIvLHO3BKvl+f7kpU5O2Eb/Pa7SHApDdQ1sEZGpr8S
	Sie2NO/ex+UcYwwF1c6ywoES0MTKsx7FQ0k9KdCoKqbtI4VlD684+VlsTNYXWMV2aHv4A84DqlWqL
	MVGDHRSObmGqzYpu8pQqsQsIyfgsLzI1fekwmsx+KMDDbgYWoBbC+E4L9N/xJXjNL0gKdL6VK/AX4
	1bWyC/G1638PJVSkIpU4ngW8pw9wOHJ3FvppJEV0OYAXpTymZAIiM5OZCP0uQd3y3v9VD8r4pRPpD
	yjXghv6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Ttv-0000Rt-OQ; Fri, 14 Aug 2020 07:13:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Ttr-0000LV-Kp; Fri, 14 Aug 2020 07:13:17 +0000
X-UUID: c37eb05f5fe34af3b7436737cf7e612b-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/gV4G8yfdOJyyPolCrQdy5QSbmXGl5sMOZ98019F01Y=; 
 b=VAEqyzg7nNOvFxueM9HFW0OUBxBlXMyuxRIw9TwSq4iFcBa7H9t7RTYyq5T68y8OKkpK7JPI8tFH65DaWMpGkoQ7MUEkLNV1/dhERr7y39hTA6AxDswfu2aKZenYk4RCEP2+c7/AiE0sUr2XjG4LMuzofpBG7Mxt0vi7XmHzimY=;
X-UUID: c37eb05f5fe34af3b7436737cf7e612b-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1027755313; Thu, 13 Aug 2020 23:13:05 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 00:13:03 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:00 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v12 00/29] Add support for mt2701 JPEG ENC support
Date: Fri, 14 Aug 2020 15:11:32 +0800
Message-ID: <20200814071202.25067-1-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_031315_881047_CC912F26 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
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
v4l2-compliance SHA: 78e4b293f654df1f273bbc6b1213511f53a2a465, 32 bits, 32-bit time_t

Compliance test for mtk-jpeg-dec device /dev/video0:

Driver Info:
        Driver name      : mtk-jpeg-dec
        Card type        : mtk-jpeg-dec
        Bus info         : platform:15004000.jpegdec
        Driver version   : 5.8.0
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

        test invalid ioctls: OK
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
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for mtk-jpeg-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
------------------------------------------------------------
                                                            
The JPEG enc log:                                           
                                                            
------------------------------------------------------------
v4l2-compliance -d /dev/video1
v4l2-compliance SHA: 78e4b293f654df1f273bbc6b1213511f53a2a465, 32 bits, 32-bit time_t

Compliance test for mtk-jpeg-enc device /dev/video1:

Driver Info:
        Driver name      : mtk-jpeg-enc
        Card type        : mtk-jpeg-enc
        Bus info         : platform:1500a000.jpegenc
        Driver version   : 5.8.0
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

        test invalid ioctls: OK
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

Total for mtk-jpeg-enc device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0
------------------------------------------------------------

Change compared to v11:                  
- add the relied patch(https://lore.kernel.org/linux-arm-kernel/20191204124732.10932-2-Jerry-Ch.chen@mediatek.com/) to this series
- fix the compile warnings of patch 29/29

Pi-Hsun Shih (1):
  media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume

Xia Jiang (28):
  media: platform: Improve subscribe event flow for bug fixing
  media: platform: Improve queue set up flow for bug fixing
  media: platform: Improve getting and requesting irq flow for bug
    fixing
  media: platform: Change the fixed device node number to unfixed value
  media: platform: Improve power on and power off flow
  media: platform: Delete the resetting hardware flow in the system PM
    ops
  media: platform: Improve the implementation of the system PM ops
  media: platform: Add mechanism to handle jpeg hardware's locking up
  media: platform: Cancel the last frame handling flow
  media: platform: Delete zeroing the reserved fields
  media: platform: Stylistic changes for improving code quality
  media: platform: Use generic rounding helpers
  media: platform: Change MTK_JPEG_COMP_MAX macro definition location
  media: platform: Delete redundant code and add annotation for an enum
  media: platform: Delete vidioc_s_selection ioctl of jpeg dec
  media: platform: Change the maximum width and height supported by JPEG
    dec
  media: platform: Refactor mtk_jpeg_try_fmt_mplane()
  media: platform: Refactor mtk_jpeg_find_format()
  media: platform: Redefinition of mtk_jpeg_q_data structure
  media: platform: Change the colorspace of jpeg to the fixed value
  media: platform: Refactor mtk_jpeg_set_default_params()
  media: platform: Change the call functions of getting/enable/disable
    the jpeg's clock
  media: dt-bindings: Add jpeg enc device tree node document
  arm: dts: mt2701: Add jpeg enc device tree node
  media: platform: Rename jpeg dec file name
  media: platform: Rename existing functions/defines/variables
  media: platform: Using the variant structure to contain the varability
    between dec and enc
  media: platform: Add jpeg enc feature

 .../bindings/media/mediatek-jpeg-encoder.txt  |  35 +
 arch/arm/boot/dts/mt2701.dtsi                 |  13 +
 drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 930 ++++++++++++------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 106 +-
 .../{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}      |  10 +-
 .../{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}      |  12 +-
 ...{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} |   2 +-
 ...{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} |   2 +-
 .../{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}    |  19 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 154 +++
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  91 ++
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  41 +
 include/media/v4l2-mem2mem.h                  |  22 +
 14 files changed, 1059 insertions(+), 383 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (91%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (77%)
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h

-- 
2.18.0 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
