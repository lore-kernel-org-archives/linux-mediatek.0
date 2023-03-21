Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9B0C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8bufuY7EmOEx3+yICR4ukvOHyd8n+ZMFN+z80B1flw=; b=YrPySPzsILh4zZx8YR4TvH9+23
	hln24+8MigcE/QXNI4N3mIU0LktzCC8JwDwnftVbXfRU33N+CkOg63ZGuQPY0zZzOGjetcrmB5mUV
	dHWOBjj+LVO5NMoaLG0+l78485JOQ3x/b/CEdmD6F5ead+zwAXq9UYtx/NFeuhO95fiNXpqL7MrVA
	HAYQN97FWfAs7Se3Y+dBOzjj5Z9Qn7y73tYB+iN/vpxtn6NC7NyHaVWB4dueCRGPxCf7ubQvnJpXx
	KAcG5KBik0woM4PW4h6SdJDRgK7ffPvycPEPLfWOOiAvZ2u6nCXgZv4bRKSr4pljDKU6SSz+X22wG
	U+3pOa7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pec3x-00CWx2-2W;
	Tue, 21 Mar 2023 13:30:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pec3t-00CWvM-1h;
	Tue, 21 Mar 2023 13:30:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0129DB8169D;
	Tue, 21 Mar 2023 13:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7B9C433EF;
	Tue, 21 Mar 2023 13:29:57 +0000 (UTC)
Message-ID: <d9106587-8c55-b6d3-dc4e-37368840dc39@xs4all.nl>
Date: Tue, 21 Mar 2023 14:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 00/12] Add support for multiple chips
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230208090855.18934-1-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230208090855.18934-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_063001_851349_7E3B4A2F 
X-CRM114-Status: GOOD (  26.10  )
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

Hi Moudy,

On 08/02/2023 10:08, Moudy Ho wrote:
> Changes since v5:
> - Rebase on linux-next.
> - Integrate the chip configuration into a source file called "mdp_cfg_data.c"
>   instead of a header file.
> - Fix undefined reference to __udividi3 caused by patch [1/12].
> - Fix parentheses issue reported by check script.
> - Fix compilation and smatch errors
> 
> Changes since v4:
> - Rebase on linux-next.
> - Fix potential frame size overflow in "mtk-mdp3-regs.c".
> - Fix OOB in MDP3 component clocks in "mtk-mdp3-comp.*".
> - Reconfigure the shared memory between MDP3 kerenl and SCP.
> 
> Changes since v3:
> - Rebase on linux-next.
> - In the file "mtk-mdp3-m2m.c", use the limited resolution defined by
>   each platform to replace the default format.
> - Add platform ID in driver data, and refine shared memory structure preprocessing.
> - Simplify the way to get mutex ID in function "mdp_path_subfrm_require".
> 
> Changes since v2:
> - Depend on :
>   [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=687004
> - Split the shared memory header(mtk-img-ipi.h) by preprocessing instead, and
>   classify the generic parts into "mtk-mdp3-type.h", and move
>   chip-specific parts to"mt8183/mdp3-comp-mt8183.h".
> 
> Changes since v1:
> - Depend on :
>   [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=687004
> - For hardware-specific structures in the shared memory header(mtk-img-ipi.h),
>   split the relevant functions and structure definitions.
> 
> Hi,
> 
> To support multiple chips, a chip configuration header file needs to be created
> and the relevant information split and moved into it.

This series is close to be ready for merging.

Two issues: please rebase again to the latest media_stage tree
https://git.linuxtv.org/media_stage.git/

I had a number of conflicts, and I didn't feel comfortable to make the
changes myself, it wasn't trivial.

Secondly, I get a smatch error:

drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c:452 mdp_cfg_get_id_public() error: 'mdp_dev' dereferencing possible ERR_PTR()

In any case, if you can rebase and fix that issue, then I'll make a PR.

Thanks!

	Hans

> The v4l2-compliance test results list is as follows:
> 
> v4l2-compliance 1.23.0-4942, 32 bits, 32-bit time_t
> v4l2-compliance SHA: 4cf258c24026 2022-07-28 15:43:45
> 
> Compliance test for mtk-mdp3 device /dev/video0:
> 
> Driver Info:
>         Driver name      : mtk-mdp3
>         Card type        : MediaTek MDP3
>         Bus info         : platform:14001000.dma-controlle
>         Driver version   : 6.2.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 4 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 	test TIME32/64: OK
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
>     (snip)
> 	test MMAP (no poll): OK
> 	(snip)
> 	test MMAP (select): OK
>     (snip)
> 	test MMAP (epoll): OK
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Stream using all formats:
> 	(snip)
> Total for mtk-mdp3 device /dev/video0: 1174, Succeeded: 1174, Failed: 0, Warnings: 0
> 
> Moudy Ho (12):
>   media: platform: mtk-mdp3: fix potential frame size overflow in
>     mdp_try_fmt_mplane()
>   media: platform: mtk-mdp3: add files for chip configuration
>   media: platform: mtk-mdp3: chip config split about component settings
>   media: platform: mtk-mdp3: chip config split about subcomponents
>   media: platform: mtk-mdp3: chip config split about color format
>   media: platform: mtk-mdp3: chip config split about resolution
>     limitations
>   media: platform: mtk-mdp3: chip config split about pipe info
>   media: platform: mtk-mdp3: extend mdp_color format for compressed mode
>   media: platform: mtk-mdp3: dynamically allocate component clocks
>   media: platform: mtk-mdp3: Split general definitions used in MDP3
>   media: platform: mtk-mdp3: decompose hardware-related information in
>     shared memory
>   media: platform: mtk-mdp3: reconfigure shared memory
> 
>  drivers/media/platform/mediatek/mdp3/Makefile |   2 +-
>  .../platform/mediatek/mdp3/mdp_cfg_data.c     | 454 +++++++++++++++
>  .../platform/mediatek/mdp3/mdp_sm_mt8183.h    | 144 +++++
>  .../platform/mediatek/mdp3/mtk-img-ipi.h      | 189 +-----
>  .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |  20 +
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 148 +++--
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 538 +++++++++++-------
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  24 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  46 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  18 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  28 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.h     |   1 -
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.c    | 293 +---------
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.h    | 214 +++----
>  .../platform/mediatek/mdp3/mtk-mdp3-type.h    |  53 ++
>  .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     | 193 +++----
>  .../platform/mediatek/mdp3/mtk-mdp3-vpu.h     |  29 +-
>  17 files changed, 1429 insertions(+), 965 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8183.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> 


