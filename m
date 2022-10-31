Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8733FC38A02
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=; b=URHr8/Ot/YGhvIjkyy+7wTejKs
	LvzT6vcmg60gPc1yvKrDzImCrV8iXUPm1V49aYmtL3NIN/6NyfsPzbovoPBJhrIZAPH7tUfm2Q8n+
	fs+7C9166fEWE4WhSSRPs5tAJKTpAeEogWlgWkfx3ipbUYJq0KZRYWVAu4Gh4yJb7Ea2x0Iv3vxRd
	EG7eoNqNKA/DR9QoDk229Np2BSwswXsmwvsJNIE4Bmr4WAqYr5JcrvhDcN+hGcBXcoX+DKecT13tY
	I6Zv6j8BeloYXVmCjVdAzmGkcf0Amz+H+jaJUeixYVW79W5yGKgVmB1+BFieuVXY1BHfkTYwHmT9A
	jusZXiUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTiR-00BZSv-A8; Mon, 31 Oct 2022 12:16:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTiG-00BZQF-T4
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 12:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667218579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
	b=Ro2n17G5uKpNaRE7XyjaGHynlkf2TIKROZ2cERywgHOGoWxHG4QTdxOzzJbaiMvHzggKnb
	6xIvbRc9FxD67V385EGwJ+Noz+Qw1mN2RkQDlMRFALz9DjsQ2rmkX4Y8eZeDNPHSxA/Xc+
	CtJ5DZJk1WMp+y8YMszM42FXuZVqiLg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-AqiJtcILNTqSAS7s-pY4qA-1; Mon, 31 Oct 2022 08:16:16 -0400
X-MC-Unique: AqiJtcILNTqSAS7s-pY4qA-1
Received: by mail-wm1-f69.google.com with SMTP id i7-20020a1c3b07000000b003c5e6b44ebaso3380892wma.9
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
        b=CjL/O4uVi6NUTtglIU1NVw++x5Ut5f8n7KrEhCdvVwgGOXqWKOnfVfa4HHw7EdSsKr
         fyYK5emfAjoG9QMn+XjYY1J7m3MAnQU27imMDmfz63xHP+QW7AR9kg3VUxwbp48IzCQu
         ZAL+nw2Qr3NsJO0Av00BSJvLc8xM0swFRWWMybzM0byoTaKcHvT4NLwpGHHSYLvA2SEH
         KEy+z26PxM8Hx9LORCp/9j6Uc8E6p/pQ9oT4gcGSoIDr4VwgoFwP3l3fwMfcdbCHYf0N
         W/zOMyWA5oZ+PcvmeZ7d5TJD8mycggUR66VKPP5N8LoL3iONSGmJXTnjOjgg37r/zsCu
         ykRg==
X-Gm-Message-State: ACrzQf0GW84+7pvJtvqiGpFTbeojx7hjefMswgpzen8X3SWaf+RjhBpb
	uUlrK0K6vjCu/sZ3Wk0l0aYPCXjFtLCtUGCBjGGz+aBBYFn/RTG89dn7bRHjN16t/3c+znerU6J
	3WcVVGx8VV1PInPYV2krtv/lUPbbYHLMM
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id j13-20020a05600c1c0d00b003cf5fd21fd1mr10268835wms.8.1667218575301;
        Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vtgF5OcVzyyhJbAVQv0UtjhNq0IgAK2jPkGsnoYeZKQ/ZE7IsMKsB/emo+io4u+dLlmSgSQ==
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id j13-20020a05600c1c0d00b003cf5fd21fd1mr10268814wms.8.1667218575124;
        Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d2-20020a05600c34c200b003b3365b38f9sm7118010wmq.10.2022.10.31.05.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:16:14 -0700 (PDT)
Message-ID: <8423bcd3-84f6-b6c9-914a-c70166e20482@redhat.com>
Date: Mon, 31 Oct 2022 13:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 05/21] drm/imx/dcss: Don't set struct
 drm_driver.output_poll_changed
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_051621_019808_244A7199 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as DCSS uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


