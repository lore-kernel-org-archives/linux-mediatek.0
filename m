Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27F3FA372C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 03:39:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8658B218AE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 03:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sXYvbQpn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bz3+znqk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8658B218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nScdfCm0FWktnptcx5zuBcwsmiZ0A42daT4LSo4O+PI=; b=sXYvbQpnqpKtVX
	cS46gpk0OiTWmONa6A6dAC+doe6vvdDkvnYTf58izrjcKwZucJntjasP5HDhswwe/WNu/DHUb/fbJ
	1a1T1NCDgpcfPaDmQBmenQv+03KAjFy6SwBY5hBIocjAAjBSJvRpHR6Hux/sCmSvj+8PJ7cHS5sDT
	Uuz1177D+5Y3cwqyBlRnHn0GWqFWwdn7H0s2WzGK/vBn7KfidjtJjh6ZeOS1VBE8+bRGCkaFdRI8r
	Dt0J0Ldy12Sqwi3ioSr71CbN+xk85OIscRJKZtug56j4g5k0eYN0SnA3cHpOR01rm5tMtRN5MQNlZ
	LPLN1+ZDAtIiTs6uMUfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSYdt-0002Qp-8u; Thu, 07 Nov 2019 03:39:29 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSYdq-0002Pj-OP
 for linux-mediatek@lists.infradead.org; Thu, 07 Nov 2019 03:39:28 +0000
Received: by mail-ed1-x542.google.com with SMTP id b5so651449eds.12
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 19:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4QNlRTLGQr37mhizIFRLl8TgY9SBjAFUyhyF2JeZyVA=;
 b=Bz3+znqk7TnIZHoZzBYIEZeHa1gUhSjnWdchWVDNXV5CRRegeHogkTvHi39lad8Gde
 +AMSXXKWIiBiFwAEAJKqT1UDffdQSrskvm9w+5o8hjOGVEeFLYyCKwhNOZyaJyOHlMmF
 97U6Blkq786w6QCPKD5KWleQKeLEKx/N//Po8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4QNlRTLGQr37mhizIFRLl8TgY9SBjAFUyhyF2JeZyVA=;
 b=bE9ABbiSuqFdNgZy5jqMXyJHrh2U5RJRe9UIaBBOyFWS3bVdCvSd0vLnA0P13zz8vQ
 jeT7WkTV8g6JRQP2AjPPfS3ur47y3cEbi/1bbApO9eVm6PvfkfE3iQTmWcBt5qkBS90d
 lCIY1jr7nQye54DlGiNIDH2R3D6GmkzdaTBAQitWJ/g8qr2r3Wz6KnNSmzEIQKwvKeBN
 koDgUq33gRxv4QvMMbN3j+jLKkuH0+Kcv3BvTDRhIZNDFe9jMmB1XxUWhvtejc9q7IPc
 nWY9s9FdHkeRL/Lv4pzGCOkzoQhjpoWWzWpDdkKoaa9Z4oLD8oN5Zjp7iYQ26bqM/nXr
 Oukw==
X-Gm-Message-State: APjAAAUOMyPdedg/i16Xtq1QbfGQ+swbPooxKVgNMc+WOod/lNrOdKfk
 G0h9hscpTQbpriVNHpfaRwE+VBttlssVmQ==
X-Google-Smtp-Source: APXvYqxJgBRX+Zy5jPNCKtLW6L/J/cXywn70LsCH0LNrE4QmUgA1H1rrZ5pg+uQTrlCdjDSL3l3mFQ==
X-Received: by 2002:a17:906:6d8a:: with SMTP id
 h10mr1014029ejt.224.1573097964851; 
 Wed, 06 Nov 2019 19:39:24 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id v3sm20747edq.62.2019.11.06.19.39.24
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 19:39:24 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id t26so743315wmi.4
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 19:39:24 -0800 (PST)
X-Received: by 2002:a7b:cbd9:: with SMTP id n25mr816484wmi.64.1573097963552;
 Wed, 06 Nov 2019 19:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20191107033057.238603-1-hiroh@chromium.org>
In-Reply-To: <20191107033057.238603-1-hiroh@chromium.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 7 Nov 2019 12:39:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Buphd-1Z7+AjQ8fpdvMYY7QWPJBAYRTFF-46KM1LZ4GQ@mail.gmail.com>
Message-ID: <CAAFQd5Buphd-1Z7+AjQ8fpdvMYY7QWPJBAYRTFF-46KM1LZ4GQ@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: Remove extra area allocation in an
 input buffer on encoding
To: Hirokazu Honda <hiroh@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_193926_818962_2B181A09 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 7, 2019 at 12:31 PM Hirokazu Honda <hiroh@chromium.org> wrote:
>
> MediaTek encoder allocates non pixel data area for an input buffer every
> plane. As the input buffer should be read-only, the driver should not write
> anything in the buffer. Therefore, the extra data should be unnecessary.
>
> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index fd8de027e83e..6aad53d97d74 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -332,14 +332,12 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>
>                 pix_fmt_mp->num_planes = fmt->num_planes;
>                 pix_fmt_mp->plane_fmt[0].sizeimage =
> -                               pix_fmt_mp->width * pix_fmt_mp->height +
> -                               ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
> +                       pix_fmt_mp->width * pix_fmt_mp->height;
>                 pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
>
>                 if (pix_fmt_mp->num_planes == 2) {
>                         pix_fmt_mp->plane_fmt[1].sizeimage =
> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> -                               (ALIGN(pix_fmt_mp->width, 16) * 16);
> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2;
>                         pix_fmt_mp->plane_fmt[2].sizeimage = 0;
>                         pix_fmt_mp->plane_fmt[1].bytesperline =
>                                                         pix_fmt_mp->width;
> @@ -347,8 +345,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>                 } else if (pix_fmt_mp->num_planes == 3) {
>                         pix_fmt_mp->plane_fmt[1].sizeimage =
>                         pix_fmt_mp->plane_fmt[2].sizeimage =
> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> -                               ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4;
>                         pix_fmt_mp->plane_fmt[1].bytesperline =
>                                 pix_fmt_mp->plane_fmt[2].bytesperline =
>                                 pix_fmt_mp->width / 2;
> --
> 2.24.0.rc1.363.gb1bccd3e3d-goog
>

Thanks for the patch!

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Now I'd also appreciate if there is anyone who could help testing this
further, especially on a platform that is not a Chromebook.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
