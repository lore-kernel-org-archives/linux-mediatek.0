Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3831CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 10:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgZtYBR5l4jAR6e7J4cMwAV4IF+p7taiK6YFr2EEUJ0=; b=Vfox6yd4XcXEhDtSGx75xGyG1S
	pm5OE8gVrYZtGhEYUuL6gAW/jX6IB6b2WOJ95YdMk78O3gjzTRJLz6Uh2FlBZk3+XejGgGVqvTvYA
	RYIyPuxVjcTKCgMKTNro/DsFmwNHmV8nULRgm9IJ6K86gf0rXGL056SSLbh9wDXvOhs4Y5vlb5c0E
	BCeBGciCHnxAhiG1D6xe5EQ7a/NV6+IbvIRhKjhDMRFmkkMpfixhxEJbN7j5uAlFtizqwud9UVTpU
	Phl6KC8Tx/WKyWcrjtKn2N9GrcvYtI1Fm0y6Hi80O6klGz9hlszW+Ml5mwXg3WiD1iFZuQlLKVq2s
	nS00kvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqBp2-00741J-La; Thu, 25 Nov 2021 10:17:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqBop-0073zH-6F; Thu, 25 Nov 2021 10:17:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6EE071F45F43
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637835442; bh=kU/MZYNKaO3dvvsRN6JtzRQ0r5zNYRD15c2pxK8A1Ok=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JGFhrwntMATS6G/uRNt2zAPnUTAA3+pGem015A7Lx36duECl7zqipbC+UMi9omJG0
 Iszu+AW61a7QT8TII0Bb54NsOG4GccMZvVi2maKuZk5NcVgx5zT7+Fr1keXmOj0j4m
 S4C6Hb9EJpkLL/XtT93AH0Z/R6NQ1H0h0WwLjDTVksPPb7BM/hxUf5Wq1j6zjhCi1Q
 J2EEXTfyMrsGHkdrZKnqnd1CSn2VNUgp8DQXs7whKpgQnY2FkrEl4JC7FbOw1FvHDN
 g2TeRJtCr37bJEBoP5AcItesIOCFas3KRMjZ6lgHdm3IF+T/A1gQmA9CXsLb1Y6QSK
 2Ht57sVCAfBlg==
Subject: Re: [PATCH 0/9] Enable two H264 encoder cores on MT8195
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig
 <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210816105934.28265-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <50a44f71-b39e-6f5c-dfc6-67377ecb4364@collabora.com>
Date: Thu, 25 Nov 2021 11:17:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_021731_550576_A960F5AD 
X-CRM114-Status: GOOD (  24.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/08/21 12:59, Irui Wang ha scritto:
> MT8195 has two H264 encoder cores, they have their own power-domains,
> clocks, interrupts, register base. The two H264 encoder cores can work
> together to achieve higher performance.
> 
> This series of patches is to use enable two h264 encoder cores.
> path[1..2]: use linux component framework to manage encoder hardware,
> user call "mt8195-vcodec-enc" driver can get the encoder master device,
> the encoding work is done by the two encoder core device. The hw_mode
> variable is added to distinguish from old platform, two encoder cores
> called "FRAME_RACING_MODE".
> 
> The hardware mode of two encoder cores work together(overlap, another
> word called) on MT8195 called "frame_racing_mode", the two encoder
> power-domains should be power on together while encoding, the encoding
> process look like this:
> 
>      VENC Core0 frm#0....frm#2....frm#4
>      VENC Core1  .frm#1....frm#3....frm#5
> 
> patch[3..5]: due to the component device, the master device has no
> power-domains/clocks properties in dtsi, so the power/clock init function
> can't use for "frame_racing_mode" device in master device probe process,
> it should be called in component device probe process. Power on the
> hardware power and clock on demand.
> 
> patch[6]: "frame_racing_mode" encoding need a new set of memory buffer
> for two encoder cores. For compatibility, we should new a encoder driver
> interface.
> 
> patch[7..9]: add "frame_racing_mode" encoding process:
> As-Is: Synchronous
> VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder IRQ -->
> encode done with result --> job_finish
> 
> VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder IRQ -->
> encode done with result --> job_finish
> ...
> 
> To-Be: Asynchronous
> VIDIOC_QBUF#0 --> device_run(triger encoder core0) --> job_finish
> ..VIDIOC_QBUF#1 --> device_run(triger encoder core1) --> job_finish
> (core0 may encode done here, return encode result to client)
> VIDIOC_QBUF#2 --> device_run(triger encoder core0) --> job_finish
> 
> Thers is no "wait encoder IRQ" synchronous call during "frame_racing_mode"
> encoding process, which can full use the two encoder cores to achieve
> higher performance.
> 
> Irui Wang (9):
>    dt-bindings: media: mtk-vcodec: Add binding for MT8195 two venc cores
>    media: mtk-vcodec: Use component framework to manage encoder hardware
>    media: mtk-vcodec: Rewrite venc power manage interface
>    media: mtk-vcodec: Add venc power on/off interface
>    media: mtk-vcodec: Rewrite venc clock interface
>    media: mtk-vcodec: Add new venc drv interface for frame_racing mode
>    media: mtk-vcodec: Add frame racing mode encode process
>    media: mtk-vcodec: Return encode result to client
>    media: mtk-vcodec: Add delayed worker for encode timeout
> 
>   .../bindings/media/mediatek-vcodec.txt        |   2 +
>   drivers/media/platform/mtk-vcodec/Makefile    |   2 +
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  34 +-
>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 120 +++-
>   .../platform/mtk-vcodec/mtk_vcodec_enc.h      |  10 +-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 204 +++++-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 253 +++++++
>   .../platform/mtk-vcodec/mtk_vcodec_enc_hw.h   |  38 +
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 213 ++++--
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  13 +-
>   .../platform/mtk-vcodec/mtk_vcodec_util.c     |  19 +
>   .../platform/mtk-vcodec/mtk_vcodec_util.h     |   5 +
>   .../platform/mtk-vcodec/venc/venc_common_if.c | 675 ++++++++++++++++++
>   .../platform/mtk-vcodec/venc/venc_h264_if.c   |   6 +-
>   .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
>   .../media/platform/mtk-vcodec/venc_drv_if.c   |  96 ++-
>   .../media/platform/mtk-vcodec/venc_drv_if.h   |   7 +
>   .../media/platform/mtk-vcodec/venc_vpu_if.c   |  11 +-
>   .../media/platform/mtk-vcodec/venc_vpu_if.h   |   3 +-
>   19 files changed, 1564 insertions(+), 149 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
>   create mode 100644 drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
> 

Hello Irui,
we have some interest in this series; can you please rebase it over the latest
changes that were sent in series [1] [2]?

Also, please follow [2], where of_platform_populate was used in place of the
component framework (where applicable and where possible) on this series, as well.

Thanks!
- Angelo

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=579201
[2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=578467

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
