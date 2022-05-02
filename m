Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C21FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvaXcQ60cQAjrehhZUXfJGtBcwOMbe8Q5hAyx9IG1+k=; b=DxhGXHTlH9aG1e
	nRVSgXphlQRsUKK4lu2ulDTXN5FZj3WtG5vuSozZK8qmuBg9CF+c3cOq1LawrkrOHH5Vuy1FoOKAi
	CDfQvhOB4ZrdJWCzrahMs5r5PRfcJKOKu1l7zr2slsvptth4cSbU+SIvCM+7MRd16upWJXo/J6Sck
	6Zn8JlFBJ+DXGPc8MtImHjPBpUofEuhPp/9e0zUbu4Gmujgf73IlX0nCibwRm7vo+BR6WT+MbzC2+
	az2B4XxHTp9tfE90vqgOtix4i0fQ7cBp5vQ4msYWCxuUN9FXpXbJncsd3ohv6n8N6F+SnXfydOa+L
	IMIg0T2qYVYq+1ScQyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlZT5-001vl2-Eg; Mon, 02 May 2022 17:04:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlZMF-001sFU-MA
 for linux-mediatek@lists.infradead.org; Mon, 02 May 2022 16:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651510630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0Gq4g+r6nSFFN2UMiOU7agj8frQhJOC3wt5ScKN4WI=;
 b=ixE/On6lqmUx2F6eb5DkIpb1JZ7slvKSN7XqjJH5EKjfh/1AjjtZzXm5ID+ZAVqfFD0gz0
 CPmUoTJ12+iEOhEkoyGugsBdb9lrx8ccElbE83rKFPh5qAfUUjg8LFGe8EfFuOD2SPOq7r
 P3lRKOS50x41AozRf+ucU6dOzRadrK8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-96c3Jc0FNqyAXoTFt_nDhw-1; Mon, 02 May 2022 12:57:07 -0400
X-MC-Unique: 96c3Jc0FNqyAXoTFt_nDhw-1
Received: by mail-wr1-f69.google.com with SMTP id
 p18-20020adf9592000000b00207bc12decbso5480897wrp.21
 for <linux-mediatek@lists.infradead.org>; Mon, 02 May 2022 09:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K0Gq4g+r6nSFFN2UMiOU7agj8frQhJOC3wt5ScKN4WI=;
 b=uUshZhOJlLtxRjGg9swwPZnS4TU8LPTfm0Pz3lwjdL891A1MnGzn/tVtgca58MseIL
 Q0v9mi6s3KYu5S/+BzKsXct0syUgc+6NUbtYSnF87UxMS91SFS7+S9I+jKQdF/SIDnhX
 ZLI2MAGJWBtbfPU4WktwFY1fBPxwLLpCkmsGp4qPrdhba1Vn5SSWMD1ZeIf/G7G+++4I
 /MlLBcjmIbNcbpEj9GMbK6UEAoMvcfNjFwcc28rO/baTaZhg5OzrRGvrK4EwEzF7e0/L
 /5R0P/2R8zYU2lfj62rIHVwzB0DnfS3EOyi+8UUSFJYqFMcgGDzbSngnYZT5eIPlLVpO
 Gw4A==
X-Gm-Message-State: AOAM5327E/sjwHgg3sRLeTfmpzO0aTCMQr9UUR5tndcViJPjLifbehfU
 8y1P2wjhdusEmsSXcR+9bKG4b+yI2/Gs+HPf64OmQepvkf2BQItdFG+n3ga9Cdo3x1iU0p0i4ja
 OLAiv8jyPA3kRvfpnXPEXB8a76rHjrLtx
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr78543wmq.34.1651510626177; 
 Mon, 02 May 2022 09:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBR5y6TmCRfu+8hzM0SQTGA4cZrpN3ZhuFriWyFUH2mb/ZbNn3olE2yOJI8bAuj+96a04yXQ==
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr78523wmq.34.1651510625948; 
 Mon, 02 May 2022 09:57:05 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 r20-20020adfa154000000b0020c5253d8c7sm7273243wrr.19.2022.05.02.09.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 09:57:05 -0700 (PDT)
Message-ID: <ac202e93-cde2-99fa-5aca-abdc1cf6a3bf@redhat.com>
Date: Mon, 2 May 2022 18:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/3] drm/fb-helper: Rename preferred_bpp
 drm_fbdev_generic_setup() parameter
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-3-javierm@redhat.com>
 <YnABz/4haOHe66Do@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnABz/4haOHe66Do@pendragon.ideasonboard.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_095711_838240_BF12EBD6 
X-CRM114-Status: GOOD (  17.86  )
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

On 5/2/22 18:07, Laurent Pinchart wrote:
> Hi Javier,
> 
> Thank you for the patch.
> 
> On Mon, May 02, 2022 at 05:38:59PM +0200, Javier Martinez Canillas wrote:
>> By default the bits per pixel for the emulated framebuffer device is set
>> to dev->mode_config.preferred_depth, but some devices need another value.
>>
>> Since this second parameter is only used by a few drivers, and to allow
>> drivers to use it for passing other configurations when registering the
>> fbdev, rename @preferred_bpp to @options and make it a multi-field param.
>>
>> The DRM_FB_OPTION() and DRM_FB_GET_OPTION() macros are provided to drivers
>> for computing options bitfield values and getting the values respectively
>>
>> For now, only the DRM_FB_BPP option exists but other options can be added.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>
>> Changes in v2:
>> - Rename DRM_FB_SET_OPTION() to DRM_FB_SET() and make more clear in the
> 
> I assume you meant DRM_FB_OPTION() here, not DRM_FB_SET().
> 
>>   kernel-doc what this macro does (Laurent Pinchart).
>>

Right, that's a typo. The patch description and content are correct though.

I'll fix the patch history log in v3.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
