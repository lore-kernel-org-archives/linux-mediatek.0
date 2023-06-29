Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2ECEB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 07:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRfHZimcg2TwrTCu70Ut/9j2/CR84p1GM7zeYwry15A=; b=2xoPsYG0fhmD607Ff6fn+xpJ1p
	/1jcA8AWBQFri9SruiROltiaRMgGsyii1Ozn7Q7Kp4N0RRtmZ9tuYk4+pn9I17DCxLtEwhllPq/Gn
	jx/xFaS1DreGxHioz8+sk8RazSUSc5U0z5lMZbyRePYzc5nRAp6279a1Fr6yCTariv9sdiSeKFs0g
	w3I1vbfmM4sDoXYn+orqPCyg3WTmKLl05C57rcmPPwcf94shsX/JvpN1E/cjXRyYVXzsGrSd3ciVZ
	eIsD2MMhAiqON5iljBEawrne4PsXmpe8rnehJ0P106ocdBZfij7DfaxVnlujJPTnjO0ZKhtjgOCYr
	gLcpi39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qElvm-000Bwa-2j;
	Thu, 29 Jun 2023 07:19:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qElvk-000Bv9-0E;
	Thu, 29 Jun 2023 07:19:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B124A614CD;
	Thu, 29 Jun 2023 07:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595EAC433C8;
	Thu, 29 Jun 2023 07:19:00 +0000 (UTC)
Message-ID: <63bd261c-f05c-0530-6271-a4d82ccf7797@xs4all.nl>
Date: Thu, 29 Jun 2023 09:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] OOB read and write in mdp_prepare_buffer
Content-Language: en-US
To: yqsun1997@gmail.com, mchehab@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 499671216@qq.com
References: <20230627082731.1769620-1-yqsun1997@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230627082731.1769620-1-yqsun1997@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_001904_153281_55077EB3 
X-CRM114-Status: GOOD (  18.28  )
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

Hi!

On 6/27/23 10:27, yqsun1997@gmail.com wrote:
> From: yqsun1997 <yqsun1997@gmail.com>
> 
> Because format in struct img_image_buffer max index is IMG_MAX_PLANES ==3,
> The num_planes max index is 8.so will be OOB like in mdp_prepare_buffer.
> 
> static void mdp_prepare_buffer(struct img_image_buffer *b,
>                                 struct mdp_frame *frame, struct vb2_buffer *vb)
> {
>          struct v4l2_pix_format_mplane *pix_mp = &frame->format.fmt.pix_mp;
>          unsigned int i;
> 
>          b->format.colorformat = frame->mdp_fmt->mdp_color;
>          b->format.ycbcr_prof = frame->ycbcr_prof;
>          for (i = 0; i < pix_mp->num_planes; ++i) {

Unless there is a bug in the driver, pix_mp->num_planes will never 
exceed 3. Userspace might certainly pass more than 3 planes, but only 
the first pix_mp->num_planes should ever be used.

If pix_mp->num_planes can ever be more than 3, then that would be the 
real bug.

Regards,

	Hans

>                  u32 stride = mdp_fmt_get_stride(frame->mdp_fmt,
>                          pix_mp->plane_fmt[i].bytesperline, i);
> 
>                  b->format.plane_fmt[i].stride = stride;  //oob
>                  ......
> 
> Signed-off-by: yqsun1997 <yqsun1997@gmail.com>
> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> index ae0396806..e2e991a34 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> @@ -11,7 +11,7 @@
>   
>   #define IMG_MAX_HW_INPUTS	3
>   #define IMG_MAX_HW_OUTPUTS	4
> -#define IMG_MAX_PLANES		3
> +#define IMG_MAX_PLANES		8
>   #define IMG_MAX_COMPONENTS	20
>   
>   struct img_crop {

