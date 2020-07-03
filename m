Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C331FC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:39:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92643206DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dyu8AH2A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="a+6dn6fC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92643206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QDhDGqcRHdLw6PEw/0h86XarhE1Cov/3dbFUn35h49Y=; b=dyu8AH2AQGPvY8/x+c2SCiM6U
	t6ZrLRMhmCVP2ftSaUbdvC1mZoOH3cL9dWxCIR1r8QV2MoKQ2rDwaAshNfJ+8VgmKcZkmAMQyWu/o
	nWU6lq2Ee3/SLJZt+42u2pm3BSuOy+SSHn1zSC+LBJqP4G3sw4vV5AvWcoF3r8/y7muRwQFn15ZXo
	uIFmUm3epk7sobDXyBXt4USirl90kAjyVoUTPsrlzUpyHu8B9i9yVuSGBNrX1oexJwmFDiI9l7e8Y
	rlTvIyS9mcqehdvQXelSS5hgx0QZ1vl8eTv85PB/2zc4KGCSvlC23WNTS0heC+mzVQQ2doxCvDA8k
	fZlsDi3mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrHDp-0001Mw-SX; Fri, 03 Jul 2020 08:39:01 +0000
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrHDn-0001Lg-Ug
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:39:00 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id rHDjj8Fb8mVFqrHDmj7MDr; Fri, 03 Jul 2020 10:38:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1593765539; bh=t+CobNXMVOxHCVjy1njKnSsYBRTOdtR1TWHyIIr7Urs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=a+6dn6fCPo663j3dBcDSpcsEwhtkPMiqZSeS7LAvNM4ojM5+rVGXEIQKdFrxPlpiQ
 i7iogRRVK9vfU8dehzfpwiV4d0bmqWCxJkUMqxDFbioTyJrj0rKcWNhuEImoEp9MP4
 zFRVywAOCb1mWTc6xSDpaoxckRQSsQeLF3ffUYnDabYGPjN0ykdkMAz7nxJ3qjaLjk
 qxrV3qZH/g4ivjEkigNyB2WuExf48Qgl5ijQipvRN5Mk2gerkpb5FydeRb3i+oJjqv
 KhjFGAnDreHp6C3l78YrWvypam3oaDR+erGEYeayCTJppJkltBFC/ZmnNnQ1boDrGP
 Vyw2WN0OpF/vA==
Subject: Re: [PATCH 4/9] media: add Mediatek's MM21 format
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20200630062711.4169601-1-acourbot@chromium.org>
 <20200630062711.4169601-5-acourbot@chromium.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d2c15fbf-0076-37b7-7b87-9ef51e0357d9@xs4all.nl>
Date: Fri, 3 Jul 2020 10:38:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630062711.4169601-5-acourbot@chromium.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfKNZeseXYKwmOKbDZ0Vyx/e5xG+FeEKX8ZLoVJw6AZXiESC6p6M3iQAJHiAlhrRlpZ7A9AymnWQO5n1OGoWPya13myHFEiQv76VX4y5ok77oux4Ci1jk
 exJ93H6EIRZbF5+xba+mhaUYF+ekuotphgYY9qLYkc+fhAbcCCqMNiAB5xgsAP12qAWzAKYyDWo5VlxiLV8xh09hni3r/kOfCMKWfppPxACwBlMPzT2wylUl
 b4LhOgT5gTlBfY1vHlH+JacqzNIHRMO4orRQI7Gc9bwZ9UG/Y5PC5hy0bYPRJKMTsfkSEjwjbrZPotVnM05dt1M2NETtH69y5aviX8NScdBRprmj/babaExj
 6LWXajcaXcIEFDttV8N9U/QIxBXFcN+tz1pQ9CHpwE98uetjuxePq27AKuuCiaEqDLz0q5gMGahT+VO5eJ/FDMlxFiXvsmQ6chHrTMwPKmxNoFrtv5KAJd46
 z5IUEKfbM25caYU1k6LJvsvCgWucFZAqJOh4kJAkHDyXvA8gdf5gWrpq96I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_043900_120717_7156F811 
X-CRM114-Status: GOOD (  12.46  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 30/06/2020 08:27, Alexandre Courbot wrote:
> Add Mediatek's non-compressed 8 bit block video mode. This format is
> produced by the MT8183 codec and can be converted to a non-proprietary
> format by the MDP3 component.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 02bfef0da76d..612be602bf76 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1398,6 +1398,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> +	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit block format"; break;

Can you move this up so it comes after V4L2_PIX_FMT_KONICA420?

This format should also be added to Documentation/userspace-api/media/v4l/pixfmt-reserved.rst.

Regards,

	Hans

>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 303805438814..a35f65115bca 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -738,6 +738,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
>  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
>  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
> +#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
>  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
>  #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
>  #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
