Return-Path: <SRS0=eMNs=BF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52552C433E3
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jul 2020 14:29:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE1B2065F
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jul 2020 14:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FNt2thP9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="cPtQupmk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DE1B2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tQOZIWJCYLNDqI2O3ahNc1QYob1+RJFucly7EVn6Osc=; b=FNt2thP9nGjTe/eyMHZSQA5Qu
	OaweW/bB85Qf+Np5xSg0GSBwKMDr5vjNnGUcJLw6ysb/YKrbETAB5YKaEHOhpTKfMN/7EfLuK5Lj9
	bLxL8RkHJPYpktKJ0E3eWgzAQ0FirBK10GLfYebo6nSrrQhgeEKGvJaa7tJ2tZL78uq/1/4nlJ9NE
	fwa/Ax8udX3ODAnPnZMjx0YgQeFwd5Xr8ERFMQQvhPbi2YeN04EzUybPMvsv+sw+3LDvbLKpX3ZOT
	taSO+PwwEG0A49HZw9We1gHxTQI+ujWYzF9zY6hINVcTTuIK5lJfJPyqclem6Bo7ciuStEL16WNAu
	lflFT7itw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzheO-0000Cc-CS; Sun, 26 Jul 2020 14:29:16 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzheM-0000C0-9Q
 for linux-mediatek@lists.infradead.org; Sun, 26 Jul 2020 14:29:15 +0000
Received: by mail-ej1-x642.google.com with SMTP id w9so14469295ejc.8
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Jul 2020 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7NgctBmCqLgQBnHYafy5r5rDsgw6j6oRlbINnPPqer0=;
 b=cPtQupmk1fewrsDSJE9eb5vshcj32eD6Ersn4gDO9eNd6Ue1J8TTT513AbOaU188zs
 AFhrKzbGgOthhgLIv7kksB+ClxWzSueRE1uglOlaoNsTsZyf9B+bzJiS+tpChshZNnBx
 jG7QPFt44f1VS8a/+nZT2WeMe/G9NCBDPPm4HUnwcT9dy/zwJ5SzHwOmd7CTs+gwiBqj
 bzjRkzNxOgk/XBF69w5CuAJhiGIlAC4SmYNINF4Buj0bhy9eQvwlc8yYeeo6BUAlSJfO
 rCpj9D4E/yEXL1JlRHqSpG0lcFfNFaw3IXioKQHV91iwjY8z8na9xqtHPwMYUOlv9L+k
 +zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7NgctBmCqLgQBnHYafy5r5rDsgw6j6oRlbINnPPqer0=;
 b=ZKrtmrIpDxUMhLIh8mScYwxy+IT1E8cMyCZScLvnh7I2makptt0NfkV6A4PcpF3Cfw
 t94mMPz98O6Dsb3fSjnNbOjEv+aJA6Z3sqUF2Y42KcwCE4Jp6ZwZP4rRCHq1Zjdmn1Nc
 MhBDnuS34Z9So3CgCUWVafrP05DncRibULwfVSsswVlO17VLJ8/Ao/DZnNQGk4fEvsMw
 bnbXv1V5TJuoti4XusfQIqzRLA2CVF82G/S7krXwuz/fC1pLczS5aEQc7SbL+8ozdkeU
 706Cb7s278r9NiUhZOsRh1AR/1oM1Lx3aQEExvbrsGCdXDb0CdjPC9Cw2Nj2fn0/c4L2
 BhpA==
X-Gm-Message-State: AOAM533+a7pSjPTmxDZOgEBYRqmHsQ2n/Wpstagb0plunq6ScsgEbNgy
 9O/c7kpvpM4letLE5KNFaZ7NdRCXOCrA7IvyaeVw6w==
X-Google-Smtp-Source: ABdhPJzBeuYaugwjE9rJF2v3mAtHaNmHcXv/fPnmdymnSEvfi/ZfOBepfh/WGmh6X9cuHm1Lqxfnl3IKozqO1B3ATn0=
X-Received: by 2002:a17:906:1e43:: with SMTP id
 i3mr16626277ejj.92.1595773751471; 
 Sun, 26 Jul 2020 07:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-8-acourbot@chromium.org>
In-Reply-To: <20200713060842.471356-8-acourbot@chromium.org>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 26 Jul 2020 11:29:00 -0300
Message-ID: <CAAEAJfA4Po9R25CzBxiFAV=7-7rPujLc79zLnXyXWk7xNbBtYA@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] media: mtk-vcodec: venc: specify supported
 formats per-chip
To: Alexandre Courbot <acourbot@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_102914_363724_C60B3712 
X-CRM114-Status: GOOD (  17.48  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alexandre,

Last review on my side, this series looks mostly good.

On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Different chips have different supported bitrate ranges. Move the list

s/bitrate ranges/formats

> of supported formats to the platform data, and split the output and
> capture formats into two lists to make it easier to find the default
> format for each queue.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   8 ++
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 122 +++++++-----------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  40 ++++++
>  3 files changed, 95 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index b8f913de8d80..59b4b750666b 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -313,6 +313,10 @@ enum mtk_chip {
>   * @has_lt_irq: whether the encoder uses the LT irq
>   * @min_birate: minimum supported encoding bitrate
>   * @max_bitrate: maximum supported encoding bitrate
> + * @capture_formats: array of supported capture formats
> + * @num_capture_formats: number of entries in capture_formats
> + * @output_formats: array of supported output formats
> + * @num_output_formats: number of entries in output_formats
>   */
>  struct mtk_vcodec_enc_pdata {
>         enum mtk_chip chip;
> @@ -321,6 +325,10 @@ struct mtk_vcodec_enc_pdata {
>         bool has_lt_irq;
>         unsigned long min_bitrate;
>         unsigned long max_bitrate;
> +       const struct mtk_video_fmt *capture_formats;
> +       size_t num_capture_formats;
> +       const struct mtk_video_fmt *output_formats;
> +       size_t num_output_formats;
>  };
>
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 50ba9da59153..05743a745a11 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -23,47 +23,9 @@
>  #define DFT_CFG_WIDTH  MTK_VENC_MIN_W
>  #define DFT_CFG_HEIGHT MTK_VENC_MIN_H
>  #define MTK_MAX_CTRLS_HINT     20
> -#define OUT_FMT_IDX            0
> -#define CAP_FMT_IDX            4
> -
>
>  static void mtk_venc_worker(struct work_struct *work);
>
> -static const struct mtk_video_fmt mtk_video_formats[] = {
> -       {
> -               .fourcc = V4L2_PIX_FMT_NV12M,
> -               .type = MTK_FMT_FRAME,
> -               .num_planes = 2,

Again, not an issue with your patch, so feel free to ignore this.

You may avoid keeping track of num_planes (or any other
property of the pixel format) and use v4l2_fill_pixfmt_mp
to get all the information you need.

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
