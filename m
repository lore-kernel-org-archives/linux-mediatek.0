Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9254CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 19:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsJZPMrVw9kLOAWaXnoNJccbzyKD8OzuiPmhtCyJcb8=; b=SORRZLNsvPTzfz
	xLlLTGdrsc1rZAhyG+7tEJD7glUKZztRm4XLfGuoMnZP53apgiIYzLYdc5nMb5EPLAeXmr6XGOMqQ
	S7ks0Wc+e3X2T6NAyILzY+2Fhrfm16kMITFvIgGQhTv5ExtiKcDXfEE39yGUrOipoCeRrjinptDlN
	oWHRw86KSSxGeTfsgeFuRw14ngLNQuIEnqzq2kKiGD9te20QDhgiVwayN4vwJrDVqm7LCoS7ThCnD
	//Mk1Ns5kWQgeXxNFb+AdnNVuxqXqufTIKkhwD0SHwtuHvmVLyzntxAoIPs/tF0MmXMoUKakl9qha
	7lhSVJnfolxT3lO/wrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyI3o-002Ont-G2; Mon, 06 Jun 2022 19:06:44 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyI3d-002Ojo-3y
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 19:06:34 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-f2cd424b9cso20292108fac.7
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6MJn5zOFXH+nWMLAd2/1FRGMn9RFPXr7yGq/vNuS/UQ=;
        b=RrDmHLneHhzEqgs+avpAIqmSmppTbvcPYikg5GtlhI4zj6YLM5PeQdvjIKm2LPaPVk
         siI6Gc87siSylXHmHcyi1wSxGVzUSl5n1RmgILW+hi2JodCl4iV/B+ESsfafQBHWTdL1
         2phByD2xPheRa7+S+FDGacySTsKu0YaYz1B5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6MJn5zOFXH+nWMLAd2/1FRGMn9RFPXr7yGq/vNuS/UQ=;
        b=aLFIvKc5UVOytxw+2YlW8GuBw0ljCOKwCoye86zVSWUIM/1RRToMsL4LqYoy/W6LQ+
         QCkHiltlfd6N/BGYfx35baBauNvFTGXWXKdVUbWNA6GsJFuN69WxzPeSN4XuHdrjRO3H
         wD2bu64ajti/1NxEENlzLy+OROx3C8I5F0AmPScz3yZ89ULellvQWFoZ6/gIKbW8+4OC
         KTP3ac4QMArSDCmDfd/ddDUI9l7JJBICSCQz3WJ8PrKI8qvfSonfktlK0wh4MlbFfRbI
         zdCbDgBXR0VqU3V/E4USkpta6Ih6XI30DOUz4PNByYBnDJpB3NY23BBRn/ja/QZ3AH7X
         SBYw==
X-Gm-Message-State: AOAM532VotqTo2cU2igT7lMIh3LvgqQShXXVhhQOLgydc37Ircr9EXBO
	FSkGWAL7HmbSqbU0wEoPnZhzDkwiur8o71H9Mgdzng==
X-Google-Smtp-Source: ABdhPJwZghG/x2b/qz0erem1Frm0KKmZ2Jh/gPhQA7lPaNFJWoTR0HNboBvnJkV/j1y3j4iPrsscIBz2ag23cFHg/Io=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr14654864oao.63.1654542390129; Mon, 06
 Jun 2022 12:06:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jun 2022 12:06:29 -0700
MIME-Version: 1.0
In-Reply-To: <20220606152431.1889185-2-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org> <20220606152431.1889185-2-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 6 Jun 2022 12:06:29 -0700
Message-ID: <CAE-0n52mzczUdtwUgfdNOC_V7kBGhzFWHRT=QHDoH4kN+yCMGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	Rob Clark <robdclark@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_120633_183963_3946734F 
X-CRM114-Status: UNSURE (   8.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Hsin-Yi Wang (2022-06-06 08:24:24)
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..e12056cfeca8 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -223,6 +223,15 @@ int drm_panel_get_modes(struct drm_panel *panel,
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>
> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)

Should 'panel' be marked const to indicate that it can't be modified?

> +{
> +       if (panel && panel->funcs && panel->funcs->get_orientation)
> +               return panel->funcs->get_orientation(panel);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
