Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E764C369A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LFFK30ORGOB8opISAVi2/AjiV23wsDk5moHBmYPz9c=; b=jGCtDSEyochZTwPWGFFtHIyB4c
	NZbxes8TdbTsfSbjPzCsyEJtbrodvZ3/T9L4JjAEKz/1uGQJBDgXUV4u95f6MC11D1Q8oOKYcKrui
	ab2cy4rKM9bMnGPzMiyt0ncYskdo3Mdgm33F0UjaOdScUy4bq8U8A+OmNba6KMdmbSTJ61Kl5YGNU
	O6mz/4y5rfVD7LI5b5o8nitngi4usp+++wb/RTLc+LikcNB5RE+Lw/PaUsk4zaQgsG8YL64jx1nqo
	xsknAaqm9uJEe0cVY3z2hlytyXc44ZwROS0rXJg2uTwbq9Fp47Hp++Ili4xHgOayhJcpF+g3A8YkI
	Jidzp5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stNXB-00000004W4z-0CHy;
	Wed, 25 Sep 2024 08:38:05 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stNW0-00000004VsY-0iO3
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 08:36:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5356bb5522bso7655992e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727253410; x=1727858210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LFFK30ORGOB8opISAVi2/AjiV23wsDk5moHBmYPz9c=;
        b=uqohlrcfnZOOwW1xpTrgwQTy034mOJObeLOflubeciGxj8qP2Jmk9dJdTstcXvg48B
         0JqzE4SCzn8zroqlytTvyvLWps3Gc0LEFO1EGvHNXPFdOTwMvbMuI/kjBhIB53GvTzNC
         n8lUE1NfXAnnD9EQ9Pspr+Fg09DAnupf/y1fL0f/Ah6tLkFC3qb5RCU+0gamYfjN0Lwd
         VdhoHO0B2dMDWqJ9/IWIgAjJwu95jxV1NH6JRQ7NZuXRA9R5vcoNfx0eu6pup/ei6uaP
         IZVJdbfqfghbmwdRw3rsyyWlfY8ujHwb716xGRKJwAA8GhWV/jB2Qgp/ibHs3Z0EwlJL
         9GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253410; x=1727858210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LFFK30ORGOB8opISAVi2/AjiV23wsDk5moHBmYPz9c=;
        b=D2jFZSqdMROxLkm50t5TP94HecZ8DAT6G66TYUchHUUdiNbmL+mK3l9PjefhbJNzZ9
         fzeb9biFd0x7XKPJjl8J/y3WDC25J9QpFwtfNjq07YSyP3F5q8leqMCdAsagdSI8MIWy
         6kTcOtlcWNPJ4rFgpTZ8bIicJ/cZyInlySI0HDP7B928iVDt5RV1ZVcp3nS8MbgwBeyr
         dEBGWtIfMf+buOy3snh28xluBCUb61+AVfIBF+ukPvuapwlfb8T10zTmYwme+v5ByY3o
         VSugpZ6fqpGd9r+Z3GvivC+f22OD9HxRyxcjEJvYRf8YhpqSNLpjfn4CnoNKMArkZ08M
         DJUw==
X-Forwarded-Encrypted: i=1; AJvYcCU+OEsyTizgc548SL7RJTaqd2l504/aMxQah9Uc7/N9D03vglyteBLV92Rmdd0PsyawoWf+FHTmhmlDUjgagA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV6Mltv4YXf85zFR5iiS1/VEB9u3rdIiQkYp8h4XWG3kOiZyQN
	pezA9wmdC5tmWf/ofjN+vd0Fg15kqxt4GM7mycXnNxu2Aq1LEleoRv2io8zuACE=
X-Google-Smtp-Source: AGHT+IFzrCK0VcF5jVceh0qZQhYC3c4kXM0RNJ7sHMGDqRBw1Dr0li2TBcCq7sjXdcDnOzH2DHlX+w==
X-Received: by 2002:a05:6512:110e:b0:52c:e3ad:3fbf with SMTP id 2adb3069b0e04-5387755cb9cmr1098457e87.42.1727253410148;
        Wed, 25 Sep 2024 01:36:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e0ba7sm457699e87.52.2024.09.25.01.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:36:48 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/1] drm/mediatek: dp: Add sdp path reset
Message-ID: <ybnnqysm2ptvclaal3kw26ttqkgbicn45cwxkkchl72vuzwtt2@el7c34zqxmjl>
References: <20240925064854.23065-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925064854.23065-1-liankun.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_013652_233802_0C53B042 
X-CRM114-Status: GOOD (  17.15  )
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

On Wed, Sep 25, 2024 at 02:48:22PM GMT, Liankun Yang wrote:
> When using type-c to type-c to connect to the monitor,
> the sound plays normally. If you unplug the type-c and
> connect the type-c to hdmi dongle to the monitor, there will be noise.
> 
> By capturing the audio data, it is found that
> the data position is messy, and there is no error in the data.
> 
> Through experiments, it can be restored by resetting the SDP path
> when unplugging it.
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> Changes in V3:
> - No change.

If there are no changes, why did you increase the revision?

> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240923132521.22785-1-liankun.yang@mediatek.com/

The link points to some other patch. Please consider using b4 tool, it
will manage changelogs and links for you.

> 
> Changes in V2:
> - Fix build error.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240923133610.23728-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 15 +++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  1 +
>  2 files changed, 16 insertions(+)
> 

-- 
With best wishes
Dmitry

