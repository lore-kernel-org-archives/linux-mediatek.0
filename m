Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45CAFA3742
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYUZwRg+lRYohe3+hrEekpmCQsb4LiBLuZ4BzJljYVc=; b=0gNXZZx7VOS1ZbgKCBXdq7jjm1
	mzMe0AtqWWyli5q0f7g7niB+NdckFXcHFKF9AkDWmfjt/akN0yjTjsqN4LtwUMLfd3Ubn4qdvsWiN
	PsJo3mbnPMfQlliqfE/Ph2ZBlJFEt0NoXgDvM5rhEDFZTIgOsbV8/MAoIbNLb2YVVuBLLXo9XpkN2
	TPYPOjQJflxy/xHi7I2fqKGRt7m/EVJP0GaXrvkwjMQ4Hhy5D6ybGpqI50Q8kyL7/i+rv1zfT2njc
	JPzdwh0xuu23SIjBCK4tz3hRmDBWNAGOMwn8m8jnh/lsg5pE4G7Sknyf9B4ejuEmBJ+9yyAm3sWpy
	kz499YoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTTA-00BVZO-TV; Mon, 31 Oct 2022 12:00:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTSu-00BVRs-JL
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 12:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667217627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYUZwRg+lRYohe3+hrEekpmCQsb4LiBLuZ4BzJljYVc=;
	b=acnwVq5jdQD8G0EIf3f2jFukYFyaazdWJOsYibV6Qu4otfloysbSMJacu1T9cOIbHRuooo
	tJYpan30lFYXmFyUvPz2AmEPbdJ7nWrYNhOEMndIqTqKlQLzrDMez0rAALkQR+puUmw1V4
	AD8SqnV+pc3brgTO+umsfzEjRepdkIE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-jIobyCIlO2yp1njMFqAnCg-1; Mon, 31 Oct 2022 07:58:52 -0400
X-MC-Unique: jIobyCIlO2yp1njMFqAnCg-1
Received: by mail-wr1-f72.google.com with SMTP id n13-20020adf8b0d000000b0023658a75751so2996473wra.23
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 04:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYUZwRg+lRYohe3+hrEekpmCQsb4LiBLuZ4BzJljYVc=;
        b=ZrrDIBiinnnGyym2j+UjpTtmMfW2MHSLQF6+HoRF71WfzR0wnmMn5fw7OyN0bduLEn
         wB1MIt1i4chGF5uL+dv4Vdby2SnDx9FtiD3iBABHhaz4qrq7QIgY+Gcq9002ybm4RyAa
         FBG8HvxPGlXtL4Z+QxHjLgIFIgtuKNhIbfUMn9uKbBw8ctNdqwuWnjEWwA7z40Npoqff
         NeTgDVNmhy/yh+BMC+9gjQEb4qPIjW0pi0Wq8NK6jvh8U1+7+kH29gwjmY/sg1XN9rCZ
         iw/+X12Ihc8XeuWzyKkrDmDanqsshaU0U2/Hcgg8dw8P2RWVaoYCAJz4J25m1rJtTgD0
         ZwsA==
X-Gm-Message-State: ACrzQf32Dv7kR0Jvwo3D4XUv4woo2rjYrE5OynwIwuAkB3pHFeAGK19t
	xGdYKAjFsvvIg7vsmclNYpHqsBFo04PJ5/q3R71FJlIyirdMlzPCqieP/hyytKl03jp5JUgkwp2
	UiRzb2/ajOk14o0A9CSYX4BLEf7pXV3om
X-Received: by 2002:adf:ee46:0:b0:236:57e4:60d9 with SMTP id w6-20020adfee46000000b0023657e460d9mr7712419wro.208.1667217531293;
        Mon, 31 Oct 2022 04:58:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NlG/EcNgth7sygR/Y2wmF3YkVg5o1INpxQYpcg5X49eIhA0omsq50HY00GhqtS98H3T4hUQ==
X-Received: by 2002:adf:ee46:0:b0:236:57e4:60d9 with SMTP id w6-20020adfee46000000b0023657e460d9mr7712386wro.208.1667217531117;
        Mon, 31 Oct 2022 04:58:51 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id cc14-20020a5d5c0e000000b00228d67db06esm7103664wrb.21.2022.10.31.04.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 04:58:50 -0700 (PDT)
Message-ID: <365e1467-7dc2-42b4-b985-53323741dea8@redhat.com>
Date: Mon, 31 Oct 2022 12:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 01/21] drm/komeda: Don't set struct
 drm_driver.lastclose
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
 <20221024111953.24307-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_050028_771189_7A451759 
X-CRM114-Status: UNSURE (   8.21  )
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
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as komeda uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


