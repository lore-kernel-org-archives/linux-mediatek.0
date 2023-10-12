Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4616DCDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0nmqy59jy/rGMIg2W3+5Ft0g6PXLLlnoefzeVrsrTs=; b=yi4rkB9Ylq/yMjkJYoJaOW33Xm
	EAj0uYvQgZoFeL6xw+85KqelpLCbvCUWsiBJ559MaZvggXgJc6AJ64GTCP0ny/AwODd9WYxMFQy/d
	mdHlIEawTvBjzT8p9H55kwgM6sIu3I8bukLUJDJsSIjWKk+sI1hK9hkxLdAq06212ldK8cOHPs9k7
	ixC6+6FzCf6A9wqylf5Imfvt0Hs5cc+owGIJCn6fd+imc4KRSKT/9T2adrjRx6Jc0QgR6RvrSCcjf
	egiyitNDMenXv7GxaUhzOSxkLV/kmuOhBzDZ2mgXT5pNL77Hp7XzogdGpdVY9rjq0EFojc1gMhR75
	ZWO8jNVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquWP-000vzC-0E;
	Thu, 12 Oct 2023 12:10:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qquWM-000vxe-0k
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 12:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697112628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e0nmqy59jy/rGMIg2W3+5Ft0g6PXLLlnoefzeVrsrTs=;
	b=SrCSLvreBIdBuPQM/ha4E3z3Kz37BfdrQ3thw0VpnxSanDR3ndvLBJ71x8TJhN+DJy8VHq
	yAGxBmUT9ArOJPrCPC4epac2kdYtpBbaCVMExKLLQv2h4+JZPC2dFCd/fgdGOPWIXyPBH9
	v0ofpKPvkaib8MrgB921PlXT1F/HfzA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-leEcHkRKNB-SuXCFXTMtBA-1; Thu, 12 Oct 2023 08:10:26 -0400
X-MC-Unique: leEcHkRKNB-SuXCFXTMtBA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9bd86510329so68660366b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 05:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112626; x=1697717426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0nmqy59jy/rGMIg2W3+5Ft0g6PXLLlnoefzeVrsrTs=;
        b=UqvlpJd+NeQL+MiisAty7/FN2dQkssCaw/qJuZw2c5TlGwIpW5mQK343USxwEWMqin
         z0jpIr8JpGm6RGco7TRzpk3obR2PoUim3wLBcSytB+T0iplt6Y6n84KYv5bcD9YAG9BS
         B2q3d0RBjriMCWyDdbRDSyeK5Y1Zc2pCGD5BuSLX1fxX4f36dly2fjFHLPUthyX0XYai
         Ap07SPxKeJd0o/2TEfT27jcdOW19ECGKkzxptLFnl35B0bDo/RtzqttnOFnvIIZEHE7o
         Ev7OvDDsv3cw9lNVKnzpG4sFiKZpqxBc5G0orjd8cHYjdbmuSab35JspDNnjx4URLhTE
         rxSw==
X-Gm-Message-State: AOJu0Yx10aSkLwKhquAc7lMLo9Myeq7Pe86Muq0jkyGc331pN9AEZIaL
	v8gv8KHBCfG9qX7Df9ATubN58nk9sRzAxJqMdQ6z6nPxI6G6C0p4/26swSwqy+P/GQDMSUZXQN5
	1kTMt7g+/GAhDPfH4vNJUuyljDNsKN0eF
X-Received: by 2002:a17:906:cc13:b0:9b6:50d3:2a75 with SMTP id ml19-20020a170906cc1300b009b650d32a75mr19703351ejb.48.1697112625894;
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjvJVtD0uQR8XMo2cR7XmHJlpYVc+HmbN4viv4pGPb6gmHPLLfBWOiJNvTCRNd4xhqfQomHg==
X-Received: by 2002:a17:906:cc13:b0:9b6:50d3:2a75 with SMTP id ml19-20020a170906cc1300b009b650d32a75mr19703329ejb.48.1697112625566;
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x26-20020a170906711a00b0099329b3ab67sm11000199ejj.71.2023.10.12.05.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
Message-ID: <c9e693a2-845f-9ef1-e3cb-724cece84756@redhat.com>
Date: Thu, 12 Oct 2023 14:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 17/56] media: atomisp: Stop direct calls to queue
 num_buffers field
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-18-benjamin.gaignard@collabora.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231012114642.19040-18-benjamin.gaignard@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_051030_338182_A5D3AAD2 
X-CRM114-Status: GOOD (  14.42  )
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

Hi,

On 10/12/23 13:46, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Hans de Goede <hdegoede@redhat.com>
> CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index a8a964b2f1a8..09c0091b920f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1028,7 +1028,7 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
>  	struct atomisp_device *isp = video_get_drvdata(vdev);
>  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>  
> -	if (buf->index >= vdev->queue->num_buffers)
> +	if (buf->index >= vb2_get_num_buffers(vdev->queue))
>  		return -EINVAL;
>  
>  	if (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING) {


