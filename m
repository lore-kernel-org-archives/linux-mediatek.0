Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C892AC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 07:25:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F1D361289
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 07:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F1D361289
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6xs8+stnwgsIgmvdHpsqtD2kPWb3gIROwnl5AJ+7Zbg=; b=AdTl8aj5rqHTnOiecQjyJ77gB
	yo7c101ggzTl3bSCXmO6v3mp0I6kYHYygsUCV2I8VJLy4IjtYPQRGx7lyNhmqXxtKi8DYmsomjzDz
	KMV/ZH+ObWkJAAiEFbn07jcfLqXgVtz0MzMlwBbVxJUmQe8x/m4Y5TENujM4BqILnXxIvKv7gWUZV
	uKIA1CLsnoazVinQlWqJvzPjoL7tZzlBcJC6I5gLui98AnfCwK/DmdF+591qmmwDzQd++ZoHklAwx
	WLc9t/LeFdaslvZbSkQDLF/lbp+ilR3M3yNu3XjN0mnGdIMVD9K/Pu6lnuQows2cGklIshve+qKNo
	AgeBc6EYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc13B-005Cav-Th; Thu, 29 Apr 2021 07:25:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc0uz-005Azx-Ef
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 07:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=xnnCKfyaJF/eAf+XEZujExVF4AzU7qrZb69GBTxgIEg=; b=T6TsOCpLaowHRYU0Z4FgtlVEza
 UywrhyCcRs4zSCuf0/SapYPH8X6GQDxEbstzN1OkKMHa4oj8aYbNtym8Q1H1Qz9Z5feCycOg9/F6N
 3JYP3KgduOi8fKQH35vyDWwdFZcx3t+9jebeSRKsrF4LhKv1xNwsrU7t1qyUQ1AkcHlJu9Zt0godz
 C+4yPX4IWhnklKQVtI82L0OYX3+mpRomOdHLrY093AO2PhF0+2ayA3DADAnDIhHE9F5wmoy0Hxfeq
 kZ6qz156Nd1knWV+yRvlXEmOaSX5oQcAFbnq5GMz4xs78eIvT9WQkW34R6/4p2ByTY/NgRMUBEzHp
 g8VpHI3A==;
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc0uu-000RJw-3A
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 07:17:00 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id c0ublp8LfiDzSc0uflkOHR; Thu, 29 Apr 2021 09:16:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1619680605; bh=xnnCKfyaJF/eAf+XEZujExVF4AzU7qrZb69GBTxgIEg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=wsclS3CMRp2+5ueH/aaPIVYdhexV0rultZnjXTgu6xoe+fEAJhXJa8lyOTEK6nwHg
 G8ZdfBVfbchlRru5O/Q3C1EwlizqAnlqlK/72aVlsl1YhrEIsByJMjdsSBbRtsNlPh
 8sCEGmWCb6UP9Qp89p1LesWZaNPxmnt7jR2NRS2Emfnjdet+CE+AYsjN77xFJHoRG4
 ITiqKhwtHRzYUjQfAxXJHkTX2257RjB07q3kEBLpba6uHQ9Vi534Ab47yps2QeCvps
 bre6RqtzTNEqsvBiBpPeiIdo60d3VBZkPfcH0uJ6JwOzG6wYAMbVQ+WJlahV1pGirB
 PZ1k9cm6D/opg==
Subject: Re: [PATCH v4 04/15] media: add Mediatek's MM21 format
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-5-acourbot@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <25f9bfc5-7e69-20cc-7078-8783bba2f877@xs4all.nl>
Date: Thu, 29 Apr 2021 09:16:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-5-acourbot@chromium.org>
Content-Language: en-US
X-CMAE-Envelope: MS4xfEjD42wv31KGxQzYuQpkZN3n+BoYeNWkPjTUn1ucJATssoAXLUWM7q0ypLRz+BKn1G02eTkdC+wuEYSoJ64rvGv2sJzFfpmT5jae5uqrLqWeGrI5leBn
 8/L1IZVhwJQlnjhvDc8qYadwWEm8AvuUDp/rB22FkDdU0aBH0vJx9Hy/USDlIrSciCSVhJMiaG6Ia5QERb2duaZbOhbaC6JR8pBHqxbu4tEDI+jOeP5zOTQu
 CK1rKHHPJ9QA5PoVsoVdOWMAYgLH7QwIbAtSsb7eO3f/bZ5qU5yuWjVXSfjTmZf70Hin6JQGXay4/NNIwt21H8r0sbNcX+vWb1e3yaoo7+t/SsOYGZC0M85I
 P/bhVlD8lXg6hTw02/Eo45Pnc1Iuuc1fKHo/X2p/amfv3+SsWcK86Xj0b12yYn5+MXiOdO2c02ZzDfmV5Dh7xI61iCcmOh/dtoo+KYqyVxefl7I/91tdhmrU
 UPglvFXIR/vL+Mjrg2TeXh0ETenpPprLH1gkAQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_001656_293524_0F5B2689 
X-CRM114-Status: GOOD (  17.42  )
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

On 27/04/2021 13:15, Alexandre Courbot wrote:
> Add Mediatek's non-compressed 8 bit block video mode. This format is
> produced by the MT8183 codec and can be converted to a non-proprietary
> format by the MDP3 component.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
>  include/uapi/linux/videodev2.h                            | 1 +
>  3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index 0b879c0da713..42357b0b3535 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -246,6 +246,13 @@ please make a proposal on the linux-media mailing list.
>  	It is an opaque intermediate format and the MDP hardware must be
>  	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
>  	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
> +    * .. _V4L2-PIX-FMT-MM21:
> +
> +      - ``V4L2_PIX_FMT_MM21``
> +      - 'MM21'
> +      - Non-compressed, tiled two-planar format used by Mediatek MT8183.
> +	This is an opaque intermediate format and the MDP3 hardware can be
> +	used to convert it to other formats.
>      * .. _V4L2-PIX-FMT-SUNXI-TILED-NV12:
>  
>        - ``V4L2_PIX_FMT_SUNXI_TILED_NV12``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 6a5d1c6d11d6..608e3ddc0f42 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1385,6 +1385,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
>  	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
>  	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
> +	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit block format"; break;

block format -> Block Format

(to be consistent with the other descriptions)

Regards,

	Hans

>  	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
>  	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
>  	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 311a01cc5775..db04e37da1a8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -733,6 +733,7 @@ struct v4l2_pix_format {
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
