Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D2DCD6E56
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIsasgqqNgYOsSc89cGDDcMn49t+H2lczoN+QU1ZahA=; b=eFC/NUnF3aBIv28xBnS3XeDYz2
	hq1p8PqG/iMV40UxuwRhKYRxU9sOhoBnBdOUlsJEzZ6684msNjaYlme0YyOuTHidYeUH7ywDLY+JN
	ps3H8kUpwCUIRujlWWPb1ivfCkkvxCENKB/AENCv4H3Um+7Fa6SYp9p/kueiIw2r5rlJM9P6MgLwS
	53t+9FvIUvO35OQ04ao2oXBRLrXKtoNk8Pvx/7huX9GdZvhQL034TGtWCuTnu2EwzadCkV+uK9pLp
	6+ZSFIKByI7hg897siT1PalifB3dqmToKgvDmNJ9MP4V4e975oYdIwFVmZsQYhOhBbrJfxe3ygcLe
	PLSIBAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVTG-00FKLF-34;
	Wed, 11 Oct 2023 09:25:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVTB-00FKKO-1O;
	Wed, 11 Oct 2023 09:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 873A9CE2294;
	Wed, 11 Oct 2023 09:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE44C433C7;
	Wed, 11 Oct 2023 09:25:27 +0000 (UTC)
Message-ID: <69334bb8-c9e5-4387-b3c5-adc66ed9f825@xs4all.nl>
Date: Wed, 11 Oct 2023 11:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/54] Add DELETE_BUF ioctl
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_022533_813426_F9617A50 
X-CRM114-Status: GOOD (  26.71  )
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

Hi Benjamin,

On 03/10/2023 10:06, Benjamin Gaignard wrote:
> Unlike when resolution change on keyframes, dynamic resolution change
> on inter frames doesn't allow to do a stream off/on sequence because
> it is need to keep all previous references alive to decode inter frames.
> This constraint have two main problems:
> - more memory consumption.
> - more buffers in use.
> To solve these issue this series introduce DELETE_BUFS ioctl and remove
> the 32 buffers limit per queue.
> 
> VP9 conformance tests using fluster give a score of 210/305.
> The 24 resize inter tests (vp90-2-21-resize_inter_* files) are ok
> but require to use postprocessor.
> 
> Kernel branch is available here:
> https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/remove_vb2_queue_limit_v10
> 
> GStreamer branch to use DELETE_BUF ioctl and testing dynamic resolution
> change is here:
> https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/VP9_drc
> 

<snip>

I'm a bit unhappy about the order of these patches.

It mixes core and driver patches, making it hard to follow. Also, the
driver patches are missing CCs to the driver maintainers.

There are two types of driver patches:

1) switch to vb2_get_buffer()
2) switch to vb2_get_num_buffers(), or stop using num_buffers altogether.

I am not counting the patches for verisilicon and the test drivers that
add support for max_num_buffers, those are separate.

In order to support more than 32 buffers the first phase is to fix the
drivers.

I would suggest the following:

1) start with a videobuf2-core.h patch adding vb2_get_num_buffers()
   (so just the header part of patch 21/54).
2) then add all driver patches switching to vb2_get_buffer/vb2_get_num_buffers(),
   grouped by driver (so e.g. the two amphion patches are placed together).

Also add CCs to the driver maintainers for each driver patch, allowing them
to review the code.

Also include patches 10/54 and 22/54 (dvb-core).

The remaining patches for vb2 etc. and for drivers patches adding support for
the new features should be posted as a separate series on top of this.

I want to get the driver changes in first. That will greatly simplify the
remaining work.

What will also be very helpful if this approach is taken is that it should
be no problem to merge the initial patch adding the new vb2_get_num_buffers
function for v6.7. That makes it easier to convert drivers in phases, if
needed. And new upcoming drivers can start to use this function as well.

Regards,

	Hans

> Benjamin Gaignard (54):
>   media: videobuf2: Rework offset 'cookie' encoding pattern
>   media: videobuf2: Stop spamming kernel log with all queue counter
>   media: videobuf2: Use vb2_buffer instead of index
>   media: amphion: Use vb2_get_buffer() instead of directly access to
>     buffers array
>   media: mediatek: jpeg: Use vb2_get_buffer() instead of directly access
>     to buffers array
>   media: mediatek: vdec: Remove useless loop
>   media: sti: hva: Use vb2_get_buffer() instead of directly access to
>     buffers array
>   media: visl: Use vb2_get_buffer() instead of directly access to
>     buffers array
>   media: atomisp: Use vb2_get_buffer() instead of directly access to
>     buffers array
>   media: dvb-core: Use vb2_get_buffer() instead of directly access to
>     buffers array
>   media: videobuf2: Access vb2_queue bufs array through helper functions
>   media: videobuf2: Be more flexible on the number of queue stored
>     buffers
>   media: Report the maximum possible number of buffers for the queue
>   media: test-drivers: vivid: Increase max supported buffers for capture
>     queues
>   media: test-drivers: vicodec: Increase max supported capture queue
>     buffers
>   media: verisilicon: Refactor postprocessor to store more buffers
>   media: verisilicon: Store chroma and motion vectors offset
>   media: verisilicon: g2: Use common helpers to compute chroma and mv
>     offsets
>   media: verisilicon: vp9: Allow to change resolution while streaming
>   media: Remove duplicated index vs q->num_buffers check
>   media: core: Add helper to get queue number of buffers
>   media: dvb-core: Do not initialize twice queue num_buffer field
>   media: dvb-frontends: rtl2832_srd: Use queue min_buffers_needed field
>   media: video-i2c: Set min_buffers_needed to 2
>   media: pci: cx18: Set correct value to min_buffers_needed field
>   media: pci: dt3155: Remove useless check
>   media: pci: netup_unidvb: Remove useless number of buffers check
>   media: pci: tw68: Stop direct calls to queue num_buffers field
>   media: pci: tw686x: Set min_buffers_needed to 3
>   media: amphion: Stop direct calls to queue num_buffers field
>   media: coda: Stop direct calls to queue num_buffers field
>   media: mediatek: vcodec: Stop direct calls to queue num_buffers field
>   media: nxp: Stop direct calls to queue num_buffers field
>   media: renesas: Set min_buffers_needed to 16
>   media: ti: Use queue min_buffers_needed field to set the min number of
>     buffers
>   media: verisilicon: Stop direct calls to queue num_buffers field
>   media: test-drivers: Stop direct calls to queue num_buffers field
>   media: usb: airspy: Set min_buffers_needed to 8
>   media: usb: cx231xx: Set min_buffers_needed to CX231XX_MIN_BUF
>   media: usb: hackrf: Set min_buffers_needed to 8
>   media: usb: usbtv: Set min_buffers_needed to 2
>   media: atomisp: Stop direct calls to queue num_buffers field
>   media: imx: Stop direct calls to queue num_buffers field
>   media: meson: vdec: Stop direct calls to queue num_buffers field
>   touchscreen: sur40: Stop direct calls to queue num_buffers field
>   sample: v4l: Stop direct calls to queue num_buffers field
>   media: cedrus: Stop direct calls to queue num_buffers field
>   media: nuvoton: Stop direct calls to queue num_buffers field
>   media: core: Rework how create_buf index returned value is computed
>   media: core: Add bitmap manage bufs array entries
>   media: core: Free range of buffers
>   media: v4l2: Add DELETE_BUFS ioctl
>   media: v4l2: Add mem2mem helpers for DELETE_BUFS ioctl
>   media: test-drivers: Use helper for DELETE_BUFS ioctl



