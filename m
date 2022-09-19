Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6728C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMEe3EnrmTz4VXJwt3zNe2mWyBL9jqG4mEETorWmETg=; b=AX0PhgqNKjkMER2tFDe+WuSOoE
	NEhEwuQqSjIHWkyxR9OOfkJAkVcDGE9RkhvtIJFAd7I14/pQYqHAAOavHQhe4LRA5As73yHdZhj/n
	xbat/P/HnBdv5IZgcl6cubhGatmQ/Olln4a+kXsZWHccZSNIgP0vG0L8I5hrwl8Tv2khURR8ajJVL
	1papzbtEqCrqSgdIMr2HfZQ9J8CqVQkKIXQUUHh0JZe+VyPVYSC/xEfXYAhl5aV3TCZc0N1gIWGNc
	4+f7XYCNs4v0MaFq250VdeW4is0YLsa0imca5g7A4fR5hVC9ugxsnpyLTW8/UjMYRE8kKpKHmhchF
	DzneVPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCL5-00AEX0-0Z; Mon, 19 Sep 2022 08:41:15 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCKs-00AEKJ-6u
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 08:41:11 +0000
Received: by mail-yb1-xb33.google.com with SMTP id b136so41526055yba.2
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=EMEe3EnrmTz4VXJwt3zNe2mWyBL9jqG4mEETorWmETg=;
        b=SoyqYVokxMm1uUEputqTB5NtFHq2AOYVphA3SiugU5Db88W1jAKad2wuq+xMWhwTie
         61GIwvjPhTrBhQacCpgFH7SI7SMmwzrSZ3qrkGOMSYTfu1XdCjF/o14QjtFup/T3p+OZ
         rValRdjjh5dz7Oh8DNgTLxaSEzUa2tfJncXvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EMEe3EnrmTz4VXJwt3zNe2mWyBL9jqG4mEETorWmETg=;
        b=vU4wfD3SeCbeJqjmbftBfMyAI80SItL7uRz4F9kXwT5hA4E5JQWz+hZ0aMKlqr17qh
         f2WyyMov7TclQKtiHF+ySjNAWtcd3JKHMx6AznV0p8APLudLKqxr3DR+DZa8LTpVjUxq
         eyVmKwb9E2oF4Mfure0fIAP1oyHK5fA9sPlcK/3CzuGzNLKBfhFmLZlcsJWUGX9vzU6s
         EmhwYWfGR1VsG9MrLgxNA4pQ3vV9/TbcMxY0ElLVgSbL0BUu1NOJDS/juwsub+10F1m7
         R5iIc6on/tZYO2TmZakXqjfwFYkWSYEKU3SU+k8PEbBUlTkxAkLQSd6ztbTKjbvcVa5C
         F3Xw==
X-Gm-Message-State: ACrzQf1Sn+DkI5ZPsoaOU1pjMV8ind3mA0J8chtpU++4HpLyJs5AClMp
	pA2XM9/Hpw8ZUcz4k3nUSIQlJDD67R6JDjIsKN0H2g==
X-Google-Smtp-Source: AMsMyM67MXm/lQa1tGGwV3xRvrukDuk9G5nv3c5F7slxubnSc3M0kXcOawAQvsxcSxx7dCi+CFAeJs1NlPue8RXoIMI=
X-Received: by 2002:a05:6902:1202:b0:6ae:4d4e:f7ea with SMTP id
 s2-20020a056902120200b006ae4d4ef7eamr14310764ybu.393.1663576860104; Mon, 19
 Sep 2022 01:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220804194325.1596554-1-nfraprado@collabora.com>
In-Reply-To: <20220804194325.1596554-1-nfraprado@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 19 Sep 2022 16:40:34 +0800
Message-ID: <CAJMQK-hOxxvkjgOxA6KLLUJxxBehHDQvRo-Y_FLMPLEfkoVMzA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jitao Shi <jitao.shi@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rex-BC Chen <rex-bc.chen@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_014102_350223_491966C3 
X-CRM114-Status: GOOD (  22.82  )
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

On Mon, Sep 19, 2022 at 4:39 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> As the comment right before the mtk_dsi_stop() call advises,
> mtk_dsi_stop() should only be called after
> mtk_drm_crtc_atomic_disable(). That's because that function calls
> drm_crtc_wait_one_vblank(), which requires the vblank irq to be enabled.
>
> Previously mtk_dsi_stop(), being in mtk_dsi_poweroff() and guarded by a
> refcount, would only be called at the end of
> mtk_drm_crtc_atomic_disable(), through the call to mtk_crtc_ddp_hw_fini()=
.
> Commit cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from
> enable/disable and define new funcs") moved the mtk_dsi_stop() call to
> mtk_output_dsi_disable(), causing it to be called before
> mtk_drm_crtc_atomic_disable(), and consequently generating vblank
> timeout warnings during suspend.
>
> Move the mtk_dsi_stop() call back to mtk_dsi_poweroff() so that we have
> a working vblank irq during mtk_drm_crtc_atomic_disable() and stop
> getting vblank timeout warnings.
>
> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable=
/disable and define new funcs")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested on mt8183 jacuzzi and mt8186 that this patch fixes the vblank warnin=
g.

> ---
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 9cc406e1eee1..f8ad59771551 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -685,6 +685,16 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>         if (--dsi->refcount !=3D 0)
>                 return;
>
> +       /*
> +        * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> +        * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disa=
ble(),
> +        * which needs irq for vblank, and mtk_dsi_stop() will disable ir=
q.
> +        * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
> +        * after dsi is fully set.
> +        */
> +       mtk_dsi_stop(dsi);
> +
> +       mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>         mtk_dsi_reset_engine(dsi);
>         mtk_dsi_lane0_ulp_mode_enter(dsi);
>         mtk_dsi_clk_ulp_mode_enter(dsi);
> @@ -735,17 +745,6 @@ static void mtk_output_dsi_disable(struct mtk_dsi *d=
si)
>         if (!dsi->enabled)
>                 return;
>
> -       /*
> -        * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> -        * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disa=
ble(),
> -        * which needs irq for vblank, and mtk_dsi_stop() will disable ir=
q.
> -        * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
> -        * after dsi is fully set.
> -        */
> -       mtk_dsi_stop(dsi);
> -
> -       mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> -
>         dsi->enabled =3D false;
>  }
>
> --
> 2.37.1
>

