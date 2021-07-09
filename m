Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D52C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 09:20:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C8F613C5
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 09:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84C8F613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpTVe1hhAqRqGkBcpYjcqoAJTKfNlWkeuDktYOvetH4=; b=ADkKzuV8p6NGlw
	CFkcmwpxZ/21KzE635g4+YDN772jDyEgEaFZYRh/NViyd5nz4uSUyYj/LooUTZw8GAca1P7iIpYrY
	cju6D8tnUThJ49b+GHuxAkHiYtOwe4NMiCEjNSA3WQlqowAc3cAZvdv9geqbGyOnQHONfc6foDQ8L
	iUynjibz+fC+eOJS8lg/xeuhv0p/05i7KrbiJ04PlnGiOEWFN6NC6cCIJfG6E8dzKrNlyKBwbWXtz
	7YOwlSCbaEQmrAFt9jxnMtmqw+GHItgPEUoDPyY9IMvMfv2jZBlF3fu67V2Bz+ML48YFrlP/lcE2q
	7XsZpQLuvZs3jevsCBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1mgJ-001ITS-0C; Fri, 09 Jul 2021 09:20:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1mgF-001IS4-Gb
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 09:20:21 +0000
Received: by mail-pf1-x42c.google.com with SMTP id y4so8180990pfi.9
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 02:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hoQn3oFU7ZRtUqLdJQZSv625TdF5Nr5oVUPR/hjrbE8=;
 b=OtahX2vQRDH4vXsYYawxyPICBEajoJPujSji9KpHX7QFCnQ7qpsFQCJKvcOYt78MZ2
 l9V1vS2dVHmqUivOaCqV/UhxOvzEnqckvtG2l7AdrVvlj7kfjdEC1uPcNMwzC8q5EJ5J
 2YgTcYNnN2ksSizkhO4Kf4LLMVz5eudfLoFjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hoQn3oFU7ZRtUqLdJQZSv625TdF5Nr5oVUPR/hjrbE8=;
 b=a9ldDLC+iAxPSjr0sGc1Jxu4gjc9GR91vuvIPQlmwIYyawJWfbTi+mtn1ypNPSwjad
 3YJtLsdrvBTuJJzNGS+aKXyb7U79AqDV/jaKf5kRORjAfUR468/bVrnuUJwbFn7qbm/y
 jTT6k85iPdtHMtPDsewLUmVWsvsVfQuzIsVVb2GhtmpWJv4eKVf6hFe0dPc3Co61fV4w
 dtQJNT6S4aFEJcjqF7jkT4ZpZzcx5ZdpLk9iAM3KXxMU3nDDX1SqUB7RjxpMTBLoDQB7
 QZ1ImPjNGVJQV52Hg1bmZLCwjCchb6uDbpOsBd2WNgn730e0uWxE2nTb/ow7hnLddpVR
 2kgw==
X-Gm-Message-State: AOAM5328fp1KI7n5tOvb0r/9mFRcKCGL2EMjT0XHc+CaHI20oMW8tYnC
 WRznM8DiP/I8l2uMXtmMm4HTzg==
X-Google-Smtp-Source: ABdhPJw3RZDCkA6BRAqJQUHliq1oLYsw8xyE5dnnG1857hRiokfmx9p+cHA/vCqiDreL4+UpfdVGYw==
X-Received: by 2002:a62:2686:0:b029:30c:828f:4447 with SMTP id
 m128-20020a6226860000b029030c828f4447mr36479426pfm.31.1625822418614; 
 Fri, 09 Jul 2021 02:20:18 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:735b:c3cc:6957:ae6d])
 by smtp.gmail.com with ESMTPSA id n34sm4839205pji.45.2021.07.09.02.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 02:20:18 -0700 (PDT)
Date: Fri, 9 Jul 2021 18:20:13 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Subject: Re: [PATCH v2,4/9] media: mtk-jpegenc: Refactor jpeg clock interface
Message-ID: <YOgUzVmL9EDEdVRz@chromium.org>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-5-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1625038079-25815-5-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_022019_620641_FD734EC7 
X-CRM114-Status: GOOD (  30.11  )
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

Hi Kyrie,

On Wed, Jun 30, 2021 at 03:27:54PM +0800, kyrie.wu wrote:
> Using the needed param for lock on/off function.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 46 ++++++++++++++++++++++++-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h | 28 +++++++++++++++
>  2 files changed, 73 insertions(+), 1 deletion(-)
>

Thanks for the patch. Please see my comments inline.

Also, how does this patch refactor anything? I only see new code being
added. Does the subject and/or commit message need some adjustment?

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 24edd87..7c053e3 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1053,7 +1053,32 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
>  
>  static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  {
> -	int ret;
> +	struct mtk_jpeg_dev *comp_dev;
> +	struct mtk_jpegenc_pm *pm;
> +	struct mtk_jpegenc_clk *jpegclk;
> +	struct mtk_jpegenc_clk_info *clk_info;
> +	int ret, i;
> +
> +	if (jpeg->variant->is_encoder) {
> +		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {

Why do we need to enable clocks for all hardware instances? Wouldn't it
make more sense to only enable the clock for the instance that is
selected for given encode job?

> +			comp_dev = jpeg->hw_dev[i];
> +			if (!comp_dev) {
> +				dev_err(jpeg->dev, "Failed to get hw dev\n");
> +				return;
> +			}
> +
> +			pm = &comp_dev->pm;
> +			jpegclk = &pm->venc_clk;
> +			clk_info = jpegclk->clk_info;
> +			ret = clk_prepare_enable(clk_info->jpegenc_clk);
> +			if (ret) {
> +				dev_err(jpeg->dev, "jpegenc clk enable %d %s fail\n",
> +				       i, jpegclk->clk_info->clk_name);

Missing undo. (But the suggestion below would take care of it.)

> +				return;
> +			}
> +		}

How about using the clk_bulk_ API instead of the open coded loop?

> +		return;
> +	}

Rather than multiple if/else variants in one function, it's a common
practice to have two separate functions and then a function pointer in a
hardware variant descriptor struct pointing to the right function. It
makes the code more readable.

>  
>  	ret = mtk_smi_larb_get(jpeg->larb);
>  	if (ret)
> @@ -1067,6 +1092,25 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  
>  static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>  {
> +	struct mtk_jpeg_dev *comp_dev;
> +	struct mtk_jpegenc_pm *pm;
> +	struct mtk_jpegenc_clk *jpegclk;
> +	int i;
> +
> +	if (jpeg->variant->is_encoder) {
> +		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +			comp_dev = jpeg->hw_dev[i];
> +			if (!comp_dev) {
> +				dev_err(jpeg->dev, "Failed to get hw dev\n");
> +				return;
> +			}
> +
> +			pm = &comp_dev->pm;
> +			jpegclk = &pm->venc_clk;
> +			clk_disable_unprepare(jpegclk->clk_info->jpegenc_clk);
> +		}
> +		return;
> +	}

Same comments here as for the clk_on function.

>  	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
>  				   jpeg->variant->clks);
>  	mtk_smi_larb_put(jpeg->larb);
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index bdbd768..93ea71c 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -75,6 +75,31 @@ struct mtk_jpeg_variant {
>  	u32 cap_q_default_fourcc;
>  };
>  
> +enum mtk_jpegenc_hw_id {
> +	MTK_JPEGENC_HW0,
> +	MTK_JPEGENC_HW1,
> +	MTK_JPEGENC_HW_MAX,
> +};

There is no added value from the enum above. Just use integer index,

> +
> +/** * struct mtk_jpegenc_clk_info - Structure used to store clock name */
> +struct mtk_jpegenc_clk_info {
> +	const char	*clk_name;
> +	struct clk	*jpegenc_clk;
> +};
> +
> +/* struct mtk_vcodec_clk - Structure used to store vcodec clock information */
> +struct mtk_jpegenc_clk {
> +	struct mtk_jpegenc_clk_info	*clk_info;
> +	int	clk_num;
> +};

This looks like the generic clk_bulk_data struct.

> +
> +/** * struct mtk_vcodec_pm - Power management data structure */

vcodec?

> +struct mtk_jpegenc_pm {
> +	struct mtk_jpegenc_clk	venc_clk;

venc?

> +	struct device	*dev;
> +	struct mtk_jpeg_dev	*mtkdev;
> +};
> +
>  /**
>   * struct mtk_jpeg_dev - JPEG IP abstraction
>   * @lock:		the mutex protecting this structure
> @@ -103,6 +128,9 @@ struct mtk_jpeg_dev {
>  	struct device		*larb;
>  	struct delayed_work job_timeout_work;
>  	const struct mtk_jpeg_variant *variant;
> +
> +	struct mtk_jpeg_dev *hw_dev[MTK_JPEGENC_HW_MAX];

Why is this recursively having the same struct as its children?
Should we have a separate struct that describes a hardware instance
(core?)?

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
