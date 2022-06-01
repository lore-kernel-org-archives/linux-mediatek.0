Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ADEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8v7f7TeBwPnR9Vz/78i8J/aoY6WAMSpA7YqVlzVWvNI=; b=UMs7+UO6RMKQGD
	1UPTpWyM0jpi1dhWDeX3tcL6x+lm+POuJmvK2dW2OYWwfdImeFtESh2TdqkwjvCYD9/3JRrTrJl1M
	vYo4Zh++J0xOPmhr6zrpiX29bzuW79umydRWRtbsMk5d67W13IBLAgseQqS+d1M33UzEm3pgHWmIR
	72lQ0za2+Ivr/Pg6zUL8CGfsMpgQRlnjOJAJYU/gjusDHpw8mJxtrOMHzQwvxB9mZkV9kYCFEWZEJ
	r2VqTBVWImNueJ+0znFsgouvGm11Jbdnp5ARlJhhnwfFG6jAZa4rbXSyjFyeXyXd5eMPWWKuzMlvy
	RqgxXI/c+5ysh1h5RXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKAN-00EnCu-PL; Wed, 01 Jun 2022 08:57:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKAC-00En77-MA
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654073831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lCOUyyDM2EIXc4RPNW8pyLJMNdGYc/IzffrR0m7ZqEw=;
	b=B2MfWPPemgZpykUZ4iF9Y08YU8T5+chDzAmHKjKhx6k0qc+v3BDhfJ+YXHYlIxhsrXpGJA
	uYjZ3j2AMGRBkA8aspIdAGWSjgusrc0O+n7shsVNkQ86rdhEIQRIzMEon0XTITv0PpHX1V
	pAeY8TPFPt4EGzQ5qUvCSD568pttHts=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-Cigx2isCOT6VVof3osE4aA-1; Wed, 01 Jun 2022 04:57:09 -0400
X-MC-Unique: Cigx2isCOT6VVof3osE4aA-1
Received: by mail-ej1-f70.google.com with SMTP id bk16-20020a170906b0d000b006fe34a2e598so624297ejb.0
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lCOUyyDM2EIXc4RPNW8pyLJMNdGYc/IzffrR0m7ZqEw=;
        b=27PblrSkc+HhZWT4kiGRehqIKwIFKuL23AJMKkpm9F2hU8YGI3dEH3KIjRazyCnuko
         wCRvHSpc+q0RvNl57lrwFTL+PoLH+2rydnoQeYCuxZlzDz0mjnivf9Urd4X0wpeD5mFJ
         zBBPNJEuAPmTM8S2oPAcudqbe2YXJl7UVsJSIUl5ZmPXhA8skVdWPoAgXx4+HyvPw35P
         73sGkEu6Ms1IQElmgHM9j1YdzV2Sq7a7xzfJPiRvMKOChSfUX32zNMbTjefIR5iyv33d
         iVvZO8z0i60by7eglupe1YY4zEc3W3HqykoL38Nw7xFIScKCc/0JtroHnmVrxTmWia3f
         nXPA==
X-Gm-Message-State: AOAM53267oW4a7cCHVOYfO8ufW0YUffY5SddOyIFgyp22d9JWQGX8YUB
	Io4zINtBS7tK48BbDz+l2qG4/prKmz2ESHMLyJSSJoYx2Iyo0/KocOPcCsHtasExZZxfei9Bj7F
	17e5iy4/F06Qr3zRYjDffqDL4SPAI4RIz
X-Received: by 2002:a17:907:3ea0:b0:6ff:7d7a:480d with SMTP id hs32-20020a1709073ea000b006ff7d7a480dmr12015289ejc.750.1654073828332;
        Wed, 01 Jun 2022 01:57:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDqD6pKipOJm2UHddq2V2tE+4Dh/llNuSewqbfAAqKxh7eaW78QHTMcUwNyG47vvudKgNjkQ==
X-Received: by 2002:a17:907:3ea0:b0:6ff:7d7a:480d with SMTP id hs32-20020a1709073ea000b006ff7d7a480dmr12015265ejc.750.1654073828091;
        Wed, 01 Jun 2022 01:57:08 -0700 (PDT)
Received: from [192.168.43.127] ([109.36.130.134])
        by smtp.gmail.com with ESMTPSA id y22-20020aa7ca16000000b0042dcbc3f302sm619741eds.36.2022.06.01.01.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 01:57:07 -0700 (PDT)
Message-ID: <c890efc4-dfda-cab1-8a46-527e3e02168a@redhat.com>
Date: Wed, 1 Jun 2022 10:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Rob Clark <robdclark@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220601081823.1038797-1-hsinyi@chromium.org>
 <20220601081823.1038797-9-hsinyi@chromium.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220601081823.1038797-9-hsinyi@chromium.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_015712_827437_3EE0B91F 
X-CRM114-Status: GOOD (  29.08  )
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

On 6/1/22 10:18, Hsin-Yi Wang wrote:
> Panel orientation property should be set before drm_dev_register().
> Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
> 
> Let the drm driver check if the remote end point is a panel and if it
> contains the orientation property. If it does, set it before
> drm_dev_register() is called.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> The concept is the same as the previous version.
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
> The only difference is, it now uses the panel API instead of parsing
> orientation from the driver.
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index bd3f5b485085..12836a697f56 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -185,6 +185,7 @@ struct mtk_dsi {
>  	struct drm_encoder encoder;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next_bridge;
> +	struct drm_panel *panel;
>  	struct drm_connector *connector;
>  	struct phy *phy;
>  
> @@ -822,6 +823,16 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>  		ret = PTR_ERR(dsi->connector);
>  		goto err_cleanup_encoder;
>  	}
> +
> +	/* Read panel orientation */
> +	if (dsi->panel) {
> +		enum drm_panel_orientation orientation;
> +
> +		orientation = drm_panel_get_orientation(dsi->panel);
> +		if (orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
> +			drm_connector_set_panel_orientation(dsi->connector, orientation);
> +	}
> +
>  	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>  
>  	return 0;

drm_connector_set_panel_orientation() is a no-op when called with 
DRM_MODE_PANEL_ORIENTATION_UNKNOWN, so the check for this is not
necessary. This allows this to be simplified to:

	/* Read panel orientation */
	if (dsi->panel)
		drm_connector_set_panel_orientation(dsi->connector,
						    drm_panel_get_orientation(dsi->panel));


Note since drm_panel_get_orientation() checks for a NULL panel, you could even
drop the "if (dsi->panel)", but I think the meaning of the code is more
clear with that present.






> @@ -837,6 +848,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>  	struct drm_device *drm = data;
>  	struct mtk_dsi *dsi = dev_get_drvdata(dev);
>  
> +	/* Get panel if existed */
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
> +

Check ret? or maybe not assign to ret ?    I understand some errors are expected
so maybe something like:

	if (ret && ret != -ENODEV)
		return ret;

?

Note -ENODEV is probably not the right error the check for!

Regards,

Hans



>  	ret = mtk_dsi_encoder_init(drm, dsi);
>  	if (ret)
>  		return ret;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
