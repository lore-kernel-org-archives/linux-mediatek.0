Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 20:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dp/FyrqZ1FTaU2/qh7nNjPuWvKnyxPnhqjoH+5L9W5g=; b=jaEcglatZsJTek
	SCzAHQ/dZACY0yiVHQJvryzrbKzrCUWHFUGeLwvb/UFXv6kNwRFCmxpG6j4XZzeT8qDWXUkR9x1W9
	sTCgbR+1DvXQHnOgqGuz5gkEmXkSq2Gd4aDB1HyyoTNt1opzrUa+lGEic9nbmC+X4GWcgijTSJLT7
	gJMCUkbWGFMozPjkc1jJe3hPY9Zcg6YN4N0Et+xmUp7x5gZntrHVUPJ7m5Kzyk334Vb059+TsaZ/s
	HyU7Hly13M7aNkF0hzTQ+QYhI+QTo9UiL3TFBSBM3FU/Imf3TVn63/Z5f6CGmZ4XISsWe6uCK3lcS
	zoz2HNqQCAhF9tFv0s6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ9M-002YeV-QD; Mon, 06 Jun 2022 20:16:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ9K-002Ycr-2C
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 20:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654546584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=soh7nshOOI4K9myM3ozv4aem+NBtc61+4Mxmv3KYpHg=;
	b=FQltUO3gh8g1wLMtKgDHThUavY4wpnowIBNALSGZ7rYaoXUWXGyWQ9ObtdDYGEO7J6vOgq
	+4d/vv3AHo4037CmuMnzHvqbEj1Ms3om07TIOZAORqcw8Q4rd1GsuSnDH9Wc+OfW3CrNw4
	RvZBuSXfnijEpRrdDOaS/rPmP1B8EVQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-HkjcMbQSNv-3vQvMsndT5Q-1; Mon, 06 Jun 2022 16:15:32 -0400
X-MC-Unique: HkjcMbQSNv-3vQvMsndT5Q-1
Received: by mail-ej1-f69.google.com with SMTP id nb10-20020a1709071c8a00b006e8f89863ceso6685378ejc.18
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 13:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=soh7nshOOI4K9myM3ozv4aem+NBtc61+4Mxmv3KYpHg=;
        b=V+jrnSf9aiwjiYNR7EBVl+lh68pB6jG6kojAjXPNUkSosvSjAOX6Sh49kT73iKsqcs
         xO+urD94EsHEwVtPI5WqXPTqXYlYQTvTrt3sYvEobLZqRvd0ZHA3/FHYvzRtZ2VwLSwx
         snfkUbB1zer7tlo96fWkESDnwu/KB2DCrK/ybkeQnY1MF8CS4T8AqQCpCgPclLhm+Su9
         iS9YbkA6JtmFoTQFvytut+Pun0pCH0EyiOe3wdfH/gpRczGgnqP9ul7vx58tRfVJjj0B
         Enp+Ilxbn/3EoWjcit5eLBfOLYIsONAbeZaW6e49DEh19pgpRUswl1LrSlQFNcMqNSDX
         WUpg==
X-Gm-Message-State: AOAM530ENOOhsmpGx9P6t/BNbQ2XdTlOmBNIfn9dLn9CS2pojC9oKXo/
	QJryonYZEONiIZtgOHRQRHj+BtrALMuG4cFbN01hG0DgPfycb7kQiiTszaUnSB6/73IDf+tIc8y
	QcDmYkvDUAhgqbhQv4geQabP95j6pNrYt
X-Received: by 2002:a17:906:ce36:b0:711:d032:e99 with SMTP id sd22-20020a170906ce3600b00711d0320e99mr6336302ejb.242.1654546531228;
        Mon, 06 Jun 2022 13:15:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+R5Eu8yIp0AZcVOEeq1aIzb0Cegxw60TVcu2tMOPSlvbkiSDO4mWQNQcrPYsa2c7zj6yzdQ==
X-Received: by 2002:a17:906:ce36:b0:711:d032:e99 with SMTP id sd22-20020a170906ce3600b00711d0320e99mr6336261ejb.242.1654546530939;
        Mon, 06 Jun 2022 13:15:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f25-20020a170906139900b006fe8c831632sm6615148ejc.73.2022.06.06.13.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 13:15:30 -0700 (PDT)
Message-ID: <1c6e4d09-cf7a-2812-fd0d-09a21a275201@redhat.com>
Date: Mon, 6 Jun 2022 22:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
To: Sam Ravnborg <sam@ravnborg.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Rob Clark <robdclark@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-2-hsinyi@chromium.org>
 <Yp5Ti3ov/fnw0xeQ@ravnborg.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yp5Ti3ov/fnw0xeQ@ravnborg.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_131630_215766_91802EA0 
X-CRM114-Status: GOOD (  24.38  )
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

Hi,

On 6/6/22 21:20, Sam Ravnborg wrote:
> Hi Hsin-Yi,
> On Mon, Jun 06, 2022 at 11:24:24PM +0800, Hsin-Yi Wang wrote:
>> Panels usually call drm_connector_set_panel_orientation(), which is
>> later than drm/kms driver calling drm_dev_register(). This leads to a
>> WARN().
>>
>> The orientation property is known earlier. For example, some panels
>> parse the property through device tree during probe.
>>
>> Add an API to return the property from panel to drm/kms driver, so the
>> drivers are able to call drm_connector_set_panel_orientation() before
>> drm_dev_register().
>>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> ---
>> v3->v4: Add a blank line.
>> ---
>>  drivers/gpu/drm/drm_panel.c |  9 +++++++++
>>  include/drm/drm_panel.h     | 10 ++++++++++
>>  2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
>> index f634371c717a..e12056cfeca8 100644
>> --- a/drivers/gpu/drm/drm_panel.c
>> +++ b/drivers/gpu/drm/drm_panel.c
>> @@ -223,6 +223,15 @@ int drm_panel_get_modes(struct drm_panel *panel,
>>  }
>>  EXPORT_SYMBOL(drm_panel_get_modes);
>>  
>> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
> const as mentioned by Stephen.
> 
>> +{
>> +	if (panel && panel->funcs && panel->funcs->get_orientation)
>> +		return panel->funcs->get_orientation(panel);
>> +
>> +	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
>> +}
>> +EXPORT_SYMBOL(drm_panel_get_orientation);
>> +
>>  #ifdef CONFIG_OF
>>  /**
>>   * of_drm_find_panel - look up a panel using a device tree node
>> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
>> index d279ee455f01..5dadbf3b0370 100644
>> --- a/include/drm/drm_panel.h
>> +++ b/include/drm/drm_panel.h
>> @@ -133,6 +133,15 @@ struct drm_panel_funcs {
>>  	 * Allows panels to create panels-specific debugfs files.
>>  	 */
>>  	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
>> +
>> +	/**
>> +	 * @get_orientation:
>> +	 *
>> +	 * Return the panel orientation set by device tree or EDID.
>> +	 *
>> +	 * This function is optional.
>> +	 */
>> +	enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);
> 
> Please move this up so it is together with the other get_* methods, in
> alphabetic order. That is, right after get_modes(), and then this also
> matches the order in the .c file with is extra bonus.

The downside of moving this up is that it will break drivers which don't
use c99 style named-struct-field initializers for there drm_panel_funcs.

I admit that no drivers should be using the old style struct init, but
are we sure that that is the case?

Regards,

Hans



> 
> With the two fixes:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
>>  };
>>  
>>  /**
>> @@ -202,6 +211,7 @@ int drm_panel_enable(struct drm_panel *panel);
>>  int drm_panel_disable(struct drm_panel *panel);
>>  
>>  int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
>> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel);
>>  
>>  #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
>>  struct drm_panel *of_drm_find_panel(const struct device_node *np);
>> -- 
>> 2.36.1.255.ge46751e96f-goog
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
