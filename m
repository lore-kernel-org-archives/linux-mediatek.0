Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D771CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 09:49:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9196560FC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 09:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9196560FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7L5OUEytjj75UTFja4DC8Q9ByddTObVjDcfbg7pogR8=; b=fri2XCnmKNH0xssL9eF2LlV3w9
	KaJYf14WumAC1T8W99/CccbOy/Sbs57FcBRy71qTqeJx+kxD4ni8PQ0T46XeMNiFy01JZLpAviRJO
	MXKsGfGi12syL9V2EgYYFjXxRrEMZmw4goYJVnxUepDjEl04MshfLRwbH/vMH72OiPcI9cvyqRm4E
	2bXQzmZYyxZBfqYe+I4KEQP9umxvStzqhNjWGCU2kVvxpgFKRhwwdsVWF0I9Qsj1W+NgTh899wwp5
	ywep+YLm2y7dF9ehgfEhogYJQjmfZL9Vu0bHNxxzA73q6+CpqCsB8QeFTKTvtPszTsnYK0l2m+KXH
	ySUO3QJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM5oh-00BYSD-4j; Fri, 03 Sep 2021 09:48:59 +0000
Received: from lb1-smtp-cloud8.xs4all.net ([2001:888:0:108::1b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM5oT-00BYQZ-AG; Fri, 03 Sep 2021 09:48:47 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id M5oQmN7Ajy7WyM5oRmA06H; Fri, 03 Sep 2021 11:48:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1630662523; bh=SJ8hd1vkoE1lDR7Gui6NdVSUUgSzmWITome7gxPlUDU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=j6p6FJi6YLNAQCdU6hfsWGUf3VqqCIrYZiKbDUYj5qegwetrBhX/nNKewE1O1TGTa
 /tRsIIdCQsxDvkroD9J9avuXIkQjK5qzVUfuX53WBjhogMasACClK23P0E0uEk5f3+
 bA2IEZlGtUaUX7Nr8tKkeFIdB8LARUVSuSHkyx+VJSUmQn6JwJkney2LOCCnVVJU+T
 mvMJaypvY1mf6+yKfvfp1hosjcc3KTcc+ZTrgsrkXSytsamvq8GoHbnhSDzyCHEyZC
 exZxNVlSPCX+atGtLUSqkaxsjidkwwyE6S8HjXwUSQVqrUmlqaLV/41ZF7Ky5AZW7B
 iFfjQibG/1Srg==
Subject: Re: [PATCH v7 5/5] media: platform: mtk-mdp3: Add Mediatek MDP3 driver
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, drinkcat@chromium.org,
 acourbot@chromium.org, pihsun@chromium.org, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
 srv_heupstream@mediatek.com, hsinyi@google.com
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-6-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6898a212-6ccf-b668-fc70-cc8fd4bb39f5@xs4all.nl>
Date: Fri, 3 Sep 2021 11:48:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824100027.25989-6-moudy.ho@mediatek.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfJ4ioDmS4XtQHcugZwVkBni7FGMQiywW0gjM3kJxcDJjOQZ2L4kqAsGHSfISHRR/5AXECJ0HS3oAZm0u4YKkjd+0JKhwzM4XgPxJr35egUjDy2+LHGok
 Z9F2+O4SFhAob1iDfSzyZv3Rp0RKcTH6b00WEl3WVJWpE9oCTWb95ffxbtLNZYLkgDnqvht0HoMtOxpWI6nySJYzwKZQ+ivG/Cz5xe5Xa525f8T8QaO4/Ej9
 ol0fME5v6XF4BaPQZ8HEK+posxVZ5i1Fav7DGdW+or7cu0AzafNiWJpSVeru0l24kc/Gf6g8i8ZWUEpagGoL4rVmpqbVSPXFYaRKDLZJNa1wpUc0sj5Rmt9H
 bqscLv8O9cSh9uSTrgFxzQj2webhgMD1PjmkU2U1lveYIcxiC4fjEtoU/RGAfdvuePT4VfhG+m9Fm/7jI4CDUObSeO8KFUbTKMp0Tikw/HI6L5oyWTM9Vg3d
 fH8uZdy2E8ostYECZes7wsfSPs8BPS7GiPSQJL1XaBeDEURptiAQkRVzVZJeSNtGVQhngrWcAMAEAk2A9qCAxweLrKIsATU80hlWI3TGlsluIJ3xYW1xXiYX
 /bim1qkBOt0004Jspanj4fv/rxxOf42+H1Y0YtfH9MfMJtuPX2kMfe/ZkFW59xaaiDF7DsYt5EikKEzvlYrdqH441hMnJGOCFsEWhsNLKJYNnOC6Dhkextxt
 Uwt90RdZeU8+c3Ua/HYhOAkrX6aUwIc/blpywayEtAcGSA0mGowrVfOc8dr3dgaCb3ZmuJKp3qJDlvNXrdL+x9rvI26/MgcMmjbPcOkfgtM+uf9lZ13ngZiE
 b2lacG87jUILXuTWanJaMvl/duxSJQTlKMRvzQQ0pD/NLEnSNG7I1kMlQWsT72XfN4rwTH5XGDHA+IerYJQVf0z3K3Q0T4lTCezjDgUyeW00tK/djXYOrOY4
 XuTc3z+IPCG/U+qvgk/yx/zClC+qYora5WFp1pQPFvzYagbbpLGof9LWI1FaXnySR0S7g+kwx3an14wahxiL4ggb/fzv9UjKUvEFRPf2vj9RkCasQSS0d8S8
 t7t8sxFGu6J2IMAe2I4TJ7KOgz1PvCoWTEwnr3AtBhpsE/CbElNjFUDiggyqgoP7S/t9x3Oy3x2VIdFUOLShrWSmbufDEShsDRIbAzzSnOr5CTGpmM8d3hWz
 1awnQY2/CLTiiVr4TCTVBA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_024845_560706_E15FBF55 
X-CRM114-Status: GOOD (  22.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24/08/2021 12:00, Moudy Ho wrote:
> This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
> It provides the following functions:
>   color transform, format conversion, resize, crop, rotate, flip
>   and additional image quality enhancement.
> 
> The MDP3 driver is mainly used for Google Chromebook products to
> import the new architecture to set the HW settings as shown below:
>   User -> V4L2 framework
>     -> MDP3 driver -> SCP (setting calculations)
>       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> 
> Each modules' related operation control is sited in mtk-mdp3-comp.c
> Each modules' register table is defined in file with "mdp_reg_" prefix
> GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> Probe, power, suspend/resume, system level functions are defined in
> mtk-mdp3-core.c
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
> Depend on:
>    [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-9-acourbot@chromium.org/
>    [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-10-acourbot@chromium.org/
> ---
>  drivers/media/platform/Kconfig                |   19 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-mdp3/Makefile      |    6 +
>  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
>  drivers/media/platform/mtk-mdp3/mdp_reg_isp.h |   27 +
>  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
>  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
>  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
>  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
>  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  280 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  507 +++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   46 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1307 +++++++++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  147 ++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  329 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   75 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  801 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   41 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  746 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  372 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  312 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   78 +
>  22 files changed, 5320 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 157c924686e4..b7f331dbe1b5 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -299,6 +299,25 @@ config VIDEO_MEDIATEK_MDP
>  	    To compile this driver as a module, choose M here: the
>  	    module will be called mtk-mdp.
>  
> +config VIDEO_MEDIATEK_MDP3
> +	tristate "Mediatek MDP v3 driver"
> +	depends on MTK_IOMMU

This should probably be:

	depends on MTK_IOMMU || COMPILE_TEST

> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on HAS_DMA
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEO_MEDIATEK_VPU
> +	select MTK_CMDQ
> +	select MTK_SCP
> +	default n
> +	help
> +	    It is a v4l2 driver and present in Mediatek MT8183 SoC.
> +	    The driver supports for scaling and color space conversion.
> +
> +	    To compile this driver as a module, choose M here: the
> +	    module will be called mtk-mdp3.
> +
>  config VIDEO_MEDIATEK_VCODEC
>  	tristate "Mediatek Video Codec driver"
>  	depends on MTK_IOMMU || COMPILE_TEST

Regards,

	Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
