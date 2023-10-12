Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C2DCDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 12:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27M+MIAmpe+L/2HgaOkMQYAzM+WcqJam0R6eMp8zZVc=; b=xZ/7JFX9OWxfikG9QsoNe8pKxf
	DlQOzwavzrFd5p30jDVOcfaMuSt9yBX/GYtX6SOFKQefkN+2o5OacKntXoSpOlTcFMoo5sFBfEQSa
	X5vGvOZZ0yGczB8vh2MkD7k/Xp9MN2+k84OG2biuROYsNiyUx2A0XI8hXphNq36fCUXeHAvr5SnZA
	iFamLI8cZmUB97GBVuoTMceiA7DisItWheoXYHFpOmselufU6BIiPFKSv+NYE6myA7EoHtzfqFUEn
	t3WfImzQ9vvboBFiVgcKemdlaOpNAzPGCYVvc+wsNXQy6nFyy2lo2pHlGh9LZ6FpK6A71L9Rqit2L
	eTzI4Axg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquWU-000w1F-0A;
	Thu, 12 Oct 2023 12:10:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qquWR-000w0C-2l
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 12:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697112635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27M+MIAmpe+L/2HgaOkMQYAzM+WcqJam0R6eMp8zZVc=;
	b=MEcXwyQTNe+3NVO/V8hgYQgYkPNf+R31CKHcn/LzpChAKc5wgqyPZPgYdeRh8TFcyQ/jBo
	mJftEUHaeGPiRGgibf9nW4M7Vfd1CtAVEvUE0Un+5xbkBLjZvdYaeEGP8XeK01qWlhGzHD
	7WZc/bXMnicMuN3mW+7HNfLR4AGj3xQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-EQl1-BvWPtynYfdq-Pzeew-1; Thu, 12 Oct 2023 08:10:16 -0400
X-MC-Unique: EQl1-BvWPtynYfdq-Pzeew-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99c8bbc902eso69021566b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 05:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112615; x=1697717415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27M+MIAmpe+L/2HgaOkMQYAzM+WcqJam0R6eMp8zZVc=;
        b=Wk9XoYSYV8UDTityGbRVMCIE/+e6u8Vkmaxz2lKXJmeHhqw57n315CmL3vLRt0aIYX
         E8omvvKM8q8/zNOPNjTNGwg7OHuZjluDyuc0h6HpqC2oOQadtFEDt1IcSCTcIzZxjNMR
         1jE8mWn/p6qR/EmjUPlfJ1KFPyLsgT21l2OkerABQofrCPCVSSIgJ6zQPBuB703kGFpP
         1Xjh0e8Ns51o1pvCrrZ+8OthgaqHLwruHeiF8oDtDZVWcn5NPhlXJhN6M4PvaGWiVysT
         bU1emuhFd/f9Qx+9FQFDw3t3T3uvH/CgI5aFwo7pqzzYDrBSJ8V4Ox2w/3fbQBw4hwHL
         etoQ==
X-Gm-Message-State: AOJu0Yy8tOVO8Ff4FiRSLT4H2MsgGXh3aCrv9BZMfK/b+4tczvNmveoi
	+3ixmLmL6LElduu++asZvGA0kf2C/eCMcypNkyZWqyAAXVH6UKKUHGzr/eh9OlJ/RfvrGwdFBsV
	U+mZoZp3bYQyOKWYXyM8Y7QGKO8nfC++8
X-Received: by 2002:a17:906:1092:b0:9bd:8cfd:e588 with SMTP id u18-20020a170906109200b009bd8cfde588mr1625691eju.27.1697112615688;
        Thu, 12 Oct 2023 05:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkVyuhaskOIIVNVit9o80c6O2JAINjoNgAy46RiSAkOYOLUZ42tscH4PSdUZo1OCucR3X4XQ==
X-Received: by 2002:a17:906:1092:b0:9bd:8cfd:e588 with SMTP id u18-20020a170906109200b009bd8cfde588mr1625662eju.27.1697112615307;
        Thu, 12 Oct 2023 05:10:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id la18-20020a170906ad9200b0099cd008c1a4sm11019663ejb.136.2023.10.12.05.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:10:14 -0700 (PDT)
Message-ID: <7ad450c4-78df-ed5c-a05d-5dca8201d081@redhat.com>
Date: Thu, 12 Oct 2023 14:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 16/56] media: atomisp: Use vb2_get_buffer() instead of
 directly access to buffers array
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
 <20231012114642.19040-17-benjamin.gaignard@collabora.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231012114642.19040-17-benjamin.gaignard@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_051035_964755_0E641527 
X-CRM114-Status: GOOD (  16.87  )
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
> Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
> This could allow to change the type bufs[] field of vb2_buffer structure if
> needed.
> No need to check the result of vb2_get_buffer, vb2_ioctl_dqbuf() already
> checked that it is valid.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Hans de Goede <hdegoede@redhat.com>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
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
> index a8e4779d007f..a8a964b2f1a8 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1059,7 +1059,7 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
>  	if (ret)
>  		return ret;
>  
> -	vb = pipe->vb_queue.bufs[buf->index];
> +	vb = vb2_get_buffer(&pipe->vb_queue, buf->index);
>  	frame = vb_to_frame(vb);
>  
>  	buf->reserved = asd->frame_status[buf->index];


