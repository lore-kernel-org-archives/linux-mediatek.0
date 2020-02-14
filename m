Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F9CC2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 09:35:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87486222C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 09:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hQ9Gcmga";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GoEjXRGH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87486222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPtkRYUxhyMouJr/5xjNAfQzZURYY2i+XxwpLuK92k8=; b=hQ9GcmgaCvCNz9
	8mSNmgVr5UmAAlDKHTY2obn/K3pa8w+dU/Tm/KOZhIqY/0p98b9zleDuuwtrY2JA1ukV9dZsVrYB9
	CLDei3pHbklP/dqVHVHhOOr31+14704TMpoAUdn/0hSpRLyAESjBuq05Cu/mXSUheguDf6iFr9QQH
	4RqZ7wu27jxMK2+ABIOZzgBR4q4B96qhBF8ZyE7GPGBFSlk00dm4xl8rGf3duD4m8+/yFrbZo8Jj4
	vsmyzPjXNvgjM754QDRwDrmzhExrQv0hwv358BdTTtvtgERg1Zcgof7Lq8UWULl2sXV/GF6fezeCV
	Cokn1ZSNf7aKatrgwhsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2XNT-0002dd-UF; Fri, 14 Feb 2020 09:35:15 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2XNQ-0002cr-SC
 for linux-mediatek@lists.infradead.org; Fri, 14 Feb 2020 09:35:14 +0000
Received: by mail-pf1-x442.google.com with SMTP id 4so4607632pfz.9
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Feb 2020 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5AfLEWxBfNqD1QkilGzCQL+klQ2n6nhzMgLjS7kpjJM=;
 b=GoEjXRGHToaAgFkeLpViY1gsJSUIEVFtb8QW+MOKy9T8+kP7xEFTsFYvjUW6MSs7gy
 o28Rzuk0lUdIq/2gWktTi8aG6FVSe5Fp1qD6uMY3WpVJREQ0h3/avtmmbfeIwMUFGd43
 5rx0TuSgzQZHI3TlPFC52tzrHGnYIgDgvMgvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5AfLEWxBfNqD1QkilGzCQL+klQ2n6nhzMgLjS7kpjJM=;
 b=StKHHR5VRqXTU2xQANVhHvZzLnSNGLrH0sib1yCAYxrAdTTJT1Kdd+StJndlNfqgkP
 Vbh7VBbcaIAZQY+XvCccoh6VyYx2NMnhU7esP6+rv4afUe69+ZT4g8TG/IFJFdMsUn5P
 wZRQB2b8I482qYVKG8eBaPm/k0SDM8TcNobcmWXIzTq8TIvNCTxp7pDoPK2Zd4JHMCT/
 U6Ym2ztmqhabEWzVLV+F8bpMp4fKnxJkOmu2NtJNHUtFfOKETsJmW26nj7lhWidpzStO
 b2gA/e9EaxSB/nFW09Loir2Yg1Grm0hGoLg4056/Zije3rkcyKkaaL0OKCCcKt9zxAxc
 exYg==
X-Gm-Message-State: APjAAAU/i+jCcH30L14Iu25sAQOE0D1h1wO2prqQ86+9TRutEtjDciNs
 HeVLaN4JSc4ijMhGy/BVzuRlVA==
X-Google-Smtp-Source: APXvYqzWsScMU1xLX4fTpri3lhL7mpabTPnY7iU6UbbEijI0fSi9fuMBHpf+qZeK5MxPv57X50roQA==
X-Received: by 2002:a65:4486:: with SMTP id l6mr2326605pgq.1.1581672911556;
 Fri, 14 Feb 2020 01:35:11 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:203:f5fe:2a5e:f953:c0ed])
 by smtp.gmail.com with ESMTPSA id w11sm6067926pgh.5.2020.02.14.01.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 01:35:10 -0800 (PST)
Date: Fri, 14 Feb 2020 18:35:06 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v6 1/5] media: platform: Fix jpeg dec driver bug and
 improve code quality
Message-ID: <20200214093506.GA193786@chromium.org>
References: <20200121095320.32258-1-xia.jiang@mediatek.com>
 <20200121095320.32258-2-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121095320.32258-2-xia.jiang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_013512_936878_B52AD23A 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Rick Chang <rick.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Tue, Jan 21, 2020 at 05:53:17PM +0800, Xia Jiang wrote:
> Fix v4l2-compliance test bug and improve code quality of jpeg decode
> driver, because the jpeg encode driver will base on it.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v6: alignment 'MTK_JPEG_DCTSIZE' match open parenthesis.
>                                            
> v5: Use clamp()to replace mtk_jpeg_bound_align_image() and round_up()
>     to replace mtk_jpeg_align().
>     Get correct compose value in mtk_jpeg_selection().
>     Cancel spin lock and unlock operation in device run function.
>     Change register offset hex numberals from upercase to lowercase.
> 
> v4: new add patch for v4l2-compliance test bug fix.

Thanks for the patch. The changes look good to me, but each of the
unrelated changes should be split into its own patch, with proper
explanation in its commit message. Especially the ones that introduce
behavior changes, such as the S_SELECTION or locking change.

Also please see one comment inline.

[snip]

> @@ -801,7 +778,6 @@ static void mtk_jpeg_device_run(void *priv)
>  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> -	unsigned long flags;
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	struct mtk_jpeg_bs bs;
>  	struct mtk_jpeg_fb fb;
> @@ -829,13 +805,11 @@ static void mtk_jpeg_device_run(void *priv)
>  	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
>  		goto dec_end;
>  
> -	spin_lock_irqsave(&jpeg->hw_lock, flags);

Why is it safe to remove the locking here?

>  	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
>  	mtk_jpeg_dec_set_config(jpeg->dec_reg_base,
>  				&jpeg_src_buf->dec_param, &bs, &fb);
>  
>  	mtk_jpeg_dec_start(jpeg->dec_reg_base);
> -	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
>  	return;
>  
>  dec_end:

Best regards,
Tomasz


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
