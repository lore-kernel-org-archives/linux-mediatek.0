Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C46FA3740
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypYZqoZTsptEoKYiFoPm/p19rfXtb3oU3pAWnCNe+WI=; b=ySwBr9ouAxyamlrnKXj4qcifba
	YM1qasPca8HKq3xfM8K21NmyChvQlUage4MaHhbAY6e3XL534seE+pi4+GW1fy7WvtW2ifvk5ahtS
	X6fnp/txHGJR77g9WSQrLbfThQPwU/591XIGPC2PYGI3+hSEOPXqdr9JqYkoSXadbzP78bQQuLEqi
	o2syn+2ZnJkrM+foe8NJJw5Q8nIkTT/+LdfDaG3EzM3Ehe88EZtd7hi+fQVJq9GrFGSF/zJjVeTsy
	Hx+/m4Pq1iVDnPrkWIKPg+kkcGkcHPnFm2V/PtiNUj43eUA/4B1B/tbulLmUZLj38ky0ErTXlGae/
	qHdtc73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTTb-00BVsE-NT; Mon, 31 Oct 2022 12:01:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTTX-00BVoN-My
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 12:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667217666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypYZqoZTsptEoKYiFoPm/p19rfXtb3oU3pAWnCNe+WI=;
	b=Dsh8WvO9JJo0emLfcyb+Dq+YBK58iDdt01GG+JJIH1VsbyTY96Va/8YL+I9N0vxzSafRSO
	g5imn9X+8WNES1Ia+R1VN5sLH/9TVxjXS3Yd4XWTtCrUqO4+cODPXmYZ8C5qVKAmrmSJnV
	3ThNkGA/1DNrJfyVSq3/eOCIVujETiE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-YSuqS9pXPVmQM5oD5rVWog-1; Mon, 31 Oct 2022 07:59:38 -0400
X-MC-Unique: YSuqS9pXPVmQM5oD5rVWog-1
Received: by mail-wr1-f69.google.com with SMTP id u13-20020adfa18d000000b00236566b5b40so2974830wru.9
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 04:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypYZqoZTsptEoKYiFoPm/p19rfXtb3oU3pAWnCNe+WI=;
        b=aCLRfd0KpVKqxgBItqvcwbc5JTOZJHCrShi7mjMr1ckqkKiS8v1kGp0FeZU2tvt3Xx
         rCXh7/kEAocSLFgj0gf2FzTtzNQZ4Ldz3Zf0VSphb6cMLAcA1vUQ88/AeS/fIZ630STt
         me8vE2RGrwQy4LKJJ1ZcXH5K+caDszB4JkK1nsuBSerlISq/TzD9P5mLpx1MvGjKk1Jw
         9LRt7FGPTjcT9gIOAixJ3dUTsvI7EPh6vJJHKHhC7ofm1LV6tS1Pqmvh+xIyPhLSWajI
         9IdVM6wJRF1bNIX00UdSG6zFmpK9tHoxWEpAdDbfjxp/YZBXVuzzdrQjs29GF9RT+Vg/
         g38A==
X-Gm-Message-State: ACrzQf1G0ulqPFTKCI3VrqYIHegqxXubVGTg34ExCjyJAY5poZ6oYq3P
	go+WicefZMn5YE0t/Cww7J7VGURTMY+XrtL1KXc8jW+/Mk9/jXTjlaY/J5EqNs+hcJ6bODzLbwb
	cjoWL4TzraTZwivNSUTKR6PBq58GdOMUV
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id p14-20020a05600c468e00b003c6f510735cmr7602956wmo.179.1667217577162;
        Mon, 31 Oct 2022 04:59:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EBETLSD4MBJxdnzTxR3FGu4hBbX2SQFUCrJloOPK1q2LF0w1HzUkYOXWVOI9w84+cugepvA==
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id p14-20020a05600c468e00b003c6f510735cmr7602924wmo.179.1667217576945;
        Mon, 31 Oct 2022 04:59:36 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 123-20020a1c1981000000b003c6c182bef9sm7774720wmz.36.2022.10.31.04.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 04:59:36 -0700 (PDT)
Message-ID: <ae69e0c5-05ee-f0ef-a333-53bbaff5c3e8@redhat.com>
Date: Mon, 31 Oct 2022 12:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 02/21] drm/mcde: Don't set struct drm_driver.lastclose
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
 <20221024111953.24307-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_050107_849082_7B190635 
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
> fbdev console. But as mcde uses generic fbdev emulation, the
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


