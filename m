Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E8FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUoMvHxOc0VLNXxqqhG0X4kSnrWkZ9Sb3GS2op0ymoU=; b=DdjuGw0PxLjFoi83fAfXfFphhA
	83bbi9K1m3Fey7t0cH3mdfWqngdNva3DAJRZOePZ1K0ZAumZMSNVb0TDXA+rUTthUzTe7pSqyXjb+
	fapyzsQA1z14XOCGxfWrPBwmGQVSoaKPpp//IVXUz0Bw1X542zZOclg5CbypvyovN7M4r7jIB9nXg
	DtRIsMa0lbQQM4LH57uito8GkiuZFjpAvOWYe6So0sHbBb6F+RvQjfgE/s6Gb1cfVFtfClbgHper+
	NQB4egIPnd0iCWXDVyDNHOIeyfWNPjhANwzzvYkFsQLmvGQ95+3puO+s0W1ZfsxpQO3LUxboNshca
	dJ3/qLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msOZA-008P4E-Ng; Wed, 01 Dec 2021 12:18:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msOQQ-008LVV-Uf; Wed, 01 Dec 2021 12:09:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9416B1F458EC
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638360565; bh=/uidj4k0zJPUmLFptZ47+9Rl9yr9MrmexaB64VMOX64=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Do5rNVUKnh6urPTkrQHXjoKTciTmUYKZR/jbWV5MjPfMvuHvx5HqSoCShqPY7y0/7
 4/cOnRnbRfkAQl5dg3O4rcBCTVlEOuOdqO+UzKdr7mPhQEnTQRo+y8HEp/7i5aj8uX
 gv0jmm+txjQiHqmmLyRIa/7I/k+AQZMsZnxeGdFnTnH/EAbqzrnaR57X/fLoWE/8t1
 dWBlumJqHcL+6RqwRZZw595Hr76OCpbPLJQAOVIJzlTWZRh/l3yWVpEbonNg3HT3q3
 rGoADhsWdrKribQrR9VHCGtCsdG/jFnMT68WFOQFO6p5S/tmsQEDwReI2IsWjnYTG7
 ikfalqTEyb+4g==
Subject: Re: [PATCH v11, 09/19] media: mtk-vcodec: Add irq interface for multi
 hardware
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-10-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <5b09baac-ac73-03be-09c7-47dc8bdd61a9@collabora.com>
Date: Wed, 1 Dec 2021 13:09:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-10-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_040927_231674_FF507E3F 
X-CRM114-Status: GOOD (  17.65  )
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

Il 29/11/21 04:41, Yunfei Dong ha scritto:
> Adds irq interface for multi hardware.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 33 ++++++++++++++++---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  2 +-
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 25 ++++++++++----
>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  4 +--
>   .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 27 +++++++--------
>   .../platform/mtk-vcodec/mtk_vcodec_intr.h     |  4 +--
>   .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |  2 +-
>   .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  2 +-
>   .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |  2 +-
>   .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |  2 +-
>   .../platform/mtk-vcodec/venc/venc_h264_if.c   |  2 +-
>   .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  2 +-
>   12 files changed, 70 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 95fbe9be3f6d..ac279c2a3f8a 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -52,6 +52,20 @@ static int mtk_vcodec_subdev_device_check(struct mtk_vcodec_dev *vdec_dev)
>   	return 0;
>   }
>   
> +static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
> +{
> +	switch (dev->vdec_pdata->hw_arch) {
> +	case MTK_VDEC_PURE_SINGLE_CORE:
> +		 return MTK_VDEC_ONE_CORE;
> +	case MTK_VDEC_LAT_SINGLE_CORE:
> +		return MTK_VDEC_ONE_LAT_ONE_CORE;
> +	default:
> +		mtk_v4l2_err("not support hw arch:%d",
> +			dev->vdec_pdata->hw_arch);

There's no need to break this line... also, what about changing the message to
"hw arch %d not supported"?


Apart from that,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
