Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EC5ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 03:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LlUSYOUQaymyniGj2EWPMVjOGMzsarO+G5HW/ZVtwY=; b=dUEVTI8pWe+72Pa7hXnygqsIIU
	t/SM3flu/umRdPVMU3iOotSI7zeqj9AsmPKr/aJSwOY0KSudGfdgvsjBceMXF0tOr0lNKVHcfbR/2
	lqTQwC4EBQadxPJDtbdP5WFOdoXR3/SlCXr0oBjO4xYUBJZOXiff26nuHTvfqtCdnI03Yt80fX9Jl
	vHgp8sReSgrKlLFv3lhX5sCJGwe27FFaCej1beIp5qkZfgMRKQjHh8rObZHKdOyveyC9m64P90qG1
	+uECdd2QUwLOqWkiBL2L8qHhsXUktJdtYF7UttbRoa0tXnl64B6HtgJD8mmhtUtTNJ+4G1SPcB4K8
	4NlqYPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZkkQ-00BfIA-BC; Sun, 18 Sep 2022 03:13:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZkkD-00BfBD-A9; Sun, 18 Sep 2022 03:13:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 214EDB80B05;
	Sun, 18 Sep 2022 03:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34582C43142;
	Sun, 18 Sep 2022 03:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663470796;
	bh=LRQ7Yn7Y2hxNvjahNUw/EecsH7SQAePJuUfRRGZjyEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pwmEzUYU5zClcC49iQSpvFDYP0PbyfpfRH1onQjuu1YB8D+oyqSPPDQAxxk+nJ92D
	 BFgjiwordBrm4+RhwRFgjzvaE4ZoxkduRwVFl/MQMUUMgPrb/2DT6eLS+dILYUhL5o
	 0nOeiDOK3JzD4QfPmWJcXDPvgwaXKJvAFYw217wADdzgyGsOsCrnwafQH6SUNC4wGs
	 l0019ryNYcZVcuGUQh+7+OYoFcWwz8WwiJ2D1MbJGaU9RsbRnSA8yu8ysuRE6GBfHp
	 nWxwyLMECAY7hMW6Q9DDow2Q8x7G7SwJ+U7k5hrP7O6EF5Mi4pDbneRFSWVcqOxI62
	 XR8l5cMdv389Q==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-12803ac8113so57501416fac.8;
        Sat, 17 Sep 2022 20:13:16 -0700 (PDT)
X-Gm-Message-State: ACgBeo0L0I8YILmLALgmoMLVQqSn1K4caCJA/vLm2T3pTULvk0AMfpk8
	HCxLY4yaQABPTV15gtuV2c8fgw+gO5yuaJs+jQ==
X-Google-Smtp-Source: AA6agR6eXe+fq7iUDggV9hXjR/lSX8dNsrfPvDT/6tur1J+cOglhQeQXkQqPmPKbPiqoI36tXYVl2ajUMYeCBwV7dls=
X-Received: by 2002:a05:6871:799:b0:11e:a2a3:dcae with SMTP id
 o25-20020a056871079900b0011ea2a3dcaemr11699691oap.69.1663470795260; Sat, 17
 Sep 2022 20:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com> <20220916133821.27980-2-rex-bc.chen@mediatek.com>
In-Reply-To: <20220916133821.27980-2-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 11:13:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-6HD9KYd66+PSKkgL_++0ka+-wg8_+WsGOmKcX8y2LCA@mail.gmail.com>
Message-ID: <CAAOTY_-6HD9KYd66+PSKkgL_++0ka+-wg8_+WsGOmKcX8y2LCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Guillaume Ranquet <granquet@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jitao Shi <jitao.shi@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	liangxu.xu@mediatek.com, DRI Development <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_201321_896772_65A171FF 
X-CRM114-Status: GOOD (  20.81  )
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

Bo-Chen Chen <rex-bc.chen@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=99=9A=E4=B8=8A9:38=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> In order to improve human readability, reduce the indentation by
> returning early if the dp/edp cable is not plugged in.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 66 ++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index dfa942ca62da..c72c646e25e9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1933,39 +1933,41 @@ static enum drm_connector_status mtk_dp_bdg_detec=
t(struct drm_bridge *bridge)
>         bool enabled =3D mtk_dp->enabled;
>         u8 sink_count =3D 0;
>
> -       if (mtk_dp->train_info.cable_plugged_in) {
> -               if (!enabled) {
> -                       /* power on aux */
> -                       mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                                          DP_PWR_STATE_BANDGAP_TPLL_LANE=
,
> -                                          DP_PWR_STATE_MASK);
> -
> -                       /* power on panel */
> -                       drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP=
_SET_POWER_D0);
> -                       usleep_range(2000, 5000);
> -               }
> -               /*
> -                * Some dongles still source HPD when they do not connect=
 to any
> -                * sink device. To avoid this, we need to read the sink c=
ount
> -                * to make sure we do connect to sink devices. After this=
 detect
> -                * function, we just need to check the HPD connection to =
check
> -                * whether we connect to a sink device.
> -                */
> -               drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_coun=
t);
> -               if (DP_GET_SINK_COUNT(sink_count))
> -                       ret =3D connector_status_connected;
> -
> -               if (!enabled) {
> -                       /* power off panel */
> -                       drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP=
_SET_POWER_D3);
> -                       usleep_range(2000, 3000);
> -
> -                       /* power off aux */
> -                       mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                                          DP_PWR_STATE_BANDGAP_TPLL,
> -                                          DP_PWR_STATE_MASK);
> -               }
> +       if (!mtk_dp->train_info.cable_plugged_in)
> +               return ret;
> +
> +       if (!enabled) {
> +               /* power on aux */
> +               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +                                  DP_PWR_STATE_BANDGAP_TPLL_LANE,
> +                                  DP_PWR_STATE_MASK);
> +
> +               /* power on panel */
> +               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D0);
> +               usleep_range(2000, 5000);
>         }
> +       /*
> +        * Some dongles still source HPD when they do not connect to any
> +        * sink device. To avoid this, we need to read the sink count
> +        * to make sure we do connect to sink devices. After this detect
> +        * function, we just need to check the HPD connection to check
> +        * whether we connect to a sink device.
> +        */
> +       drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
> +       if (DP_GET_SINK_COUNT(sink_count))
> +               ret =3D connector_status_connected;
> +
> +       if (!enabled) {
> +               /* power off panel */
> +               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D3);
> +               usleep_range(2000, 3000);
> +
> +               /* power off aux */
> +               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +                                  DP_PWR_STATE_BANDGAP_TPLL,
> +                                  DP_PWR_STATE_MASK);
> +       }
> +
>         return ret;
>  }
>
> --
> 2.18.0
>

