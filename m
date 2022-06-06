Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27956C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7UXjPCn5Zp2nG6VOucJ8+BaVYLYvdk5wr/+sm5tKhY=; b=GLuKhzWdMBDwWI
	ksURaG75cjIx5yq8RdTdkqXkgF6VX+zJRMpASZKORo6SdMwBJvaV3FPbYSnD2OnH5PE7Gq7ZBt4iv
	s1R1ESDz6HLz3XbhdJHll5RC93/959mpuajB+ZmC1Dvxgk4jmeBpzhqEXj38Zuco6qXE6K/x+sST9
	BJVscL+rfD27YYUDvYpqRlzj6kgLByVYg4+ZE8r2Q9QE4HOEEdnib3yLcIZdN/lV8/wdbugHMOYv/
	xB6V+8OxkjwlFbTvBPYSqGCS7lwynvkXy1ELEC6llZWUhYyNxVctRPUpX9Gfhcg91uYJzoFDyHqc2
	lXAHeSG3QOTULS8y2yKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDcu-001TyZ-U1; Mon, 06 Jun 2022 14:22:40 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDcr-001TvQ-TE
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 14:22:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id v1so18590920ejg.13
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HR9ZimCCmd1j/amkGhRbfPT914SxfF+DwhvAMa7hG8s=;
        b=Be/WplNQmJ47YORrypJyjDO3xZsi5v0eEVHzRhHm2XQqN5zxhzrkg7g+OKgS/P4kbm
         ZEtsFw6L3iaoh/1K2n7/XQ0Km74kYu+r1oguG6izyr2gCro2CAG9vbUsiuQS1PwXTH5n
         FrBly5SHx9gQH+Pb60Yer4UrxS7ftU1j4CmJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HR9ZimCCmd1j/amkGhRbfPT914SxfF+DwhvAMa7hG8s=;
        b=g3GOwqxw8z1+s3GFxQWvmVpVMep44NQrOwXhoc6+188nk192VG/f3XC+kB/Jq1FFQe
         2x9AGQhb2x2RHjLmxQynsrSoQTASS707G8MOrcOuiAlpiukMJg5clhYoqZFjdnFreC9K
         BdsoUwn0vf3Doe61BJwFfZ5zX2O4iumNzy1xfTFQDsy+9GmE9Bn3P7GE/E3emg7YRsDC
         3nvzNkEuaV7OTEM9fPWE7Y4gAeSGdnOBk/AaDr17aA8Q/aJefUqpLJn/JlqXPo3mq8V+
         95Xm6k1P03PKn9xBWe52sxaakI/r/GOwVUpTOsxb4xYc8Ji/VSwxJu52RX2ykcDm+5Ns
         FrUg==
X-Gm-Message-State: AOAM532CB1Ou6/ewnaQK8YOu1tigkbyYQKnXoNTUEMWb2/0zRTP63Ck8
	YQigiHRNjvQ+x5Z2y3vjYlZHhEV193h6Zsni
X-Google-Smtp-Source: ABdhPJx3ycBz463z4DJ8Yy2IvH50sKX03PVqva/o0/yc8OLLnELI9BNfjSbstYtGVKYBaWcPBDxc7w==
X-Received: by 2002:a17:906:3bd9:b0:6ff:4b5:4a8f with SMTP id v25-20020a1709063bd900b006ff04b54a8fmr15023062ejf.139.1654525354583;
        Mon, 06 Jun 2022 07:22:34 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906058a00b007101f6f0720sm3585296ejn.120.2022.06.06.07.22.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 07:22:33 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id k19so20067205wrd.8
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:22:32 -0700 (PDT)
X-Received: by 2002:a5d:6483:0:b0:20f:d046:6382 with SMTP id
 o3-20020a5d6483000000b0020fd0466382mr21837218wri.342.1654525352126; Mon, 06
 Jun 2022 07:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org> <20220606044720.945964-5-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-5-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:22:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQbXK13M_X_AsqSPS+D_zQqLtAGFGz=YbHoPu3bcvhZQ@mail.gmail.com>
Message-ID: <CAD=FV=XQbXK13M_X_AsqSPS+D_zQqLtAGFGz=YbHoPu3bcvhZQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/panel: lvds: Implement .get_orientation callback
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_072237_981167_F829374C 
X-CRM114-Status: GOOD (  15.42  )
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

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: add comments for notice.
> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 27a1c9923b09..239527409b00 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -102,15 +102,29 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
>         connector->display_info.bus_flags = lvds->data_mirror
>                                           ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
>                                           : DRM_BUS_FLAG_DATA_MSB_TO_LSB;

Can you rebase your patch and send again? There's a context conflict
with the above line because your tree is lacking commit 83c784e70036
("drm/panel: lvds: Use bus_flags from DT panel-timing property")

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
