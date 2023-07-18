Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C45C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W72tr0tg9BiWIz3zCp+YxWdsN0glxdmB5ZEHeCtkS6M=; b=tVHO8JZi+QgkX+quMN29TiAXFO
	tXjgPUtaEaL5L1XtmvWql4Q+rXmiQghAUNLBr6Zn6vGNVlvywJVs7bzAtem6FZ2lKeMGX+r20+A+o
	c5bawPLJlWCVCWc6FYFbw0gQgE3wwN3UL+UzOBPYGt8fx3beH8Moldg6dk8DVneXc+4ID7qDXr0YO
	A2j8HCcwO6PjrsFg7X2GY8xh0DHBercUYScjPcGyAGBFZEV+DC3sYSMpCQJaaRJkE09+5eQ/ru4CU
	FopegyFG/sgFzEerUKIsLn/rHSb48KJdxUDMvlfSKZwvyq/RAuBk7RUBogjZ7TFS4SqYSzKs2poOK
	ck8kNc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Yx-005gGn-2L;
	Wed, 19 Jul 2023 06:21:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Yw-005gFF-0P
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W72tr0tg9BiWIz3zCp+YxWdsN0glxdmB5ZEHeCtkS6M=; b=fFr/5Aneth+dYllqOR66YZ9DwM
	Ys/j2pGBV38WhFPUfTDpXUe07noVuTB3EijOUPc9wiSJQ5jnLyQW9El/qMb/oiNB2KKcSMAKwfHTB
	Z88bFSa11TJjvhcGDRPPGQtrXRs3whJENJ3+K7zgxPnaFksU/Urqr7sb0vQnmAi+M2c0IyE0z8F6Y
	B5ZlHVxbkSjOALoPHp4FzTOJjog961t+q1Y4digteo0zJmThDCpo/r6kU7jmIv5Mj2GRrKksDTXp6
	DNrelQj+Uls8K/pLZvMkfVyJB8+BLACduyMIqDemUkuNbRHBxeoKCo3VN6AeIgiArf0kqDzo8wVN8
	5JX0se3Q==;
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLfLp-00BGTx-2M
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 07:42:31 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-444c42f608aso1424962137.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 00:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689666074; x=1692258074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W72tr0tg9BiWIz3zCp+YxWdsN0glxdmB5ZEHeCtkS6M=;
        b=D2Co+OchLIu7OauttmGocQIy38so+rjD5zvtwRN66f0yhvg3kFzDdzKChQx7iRgHqO
         VYA4sxaNZZxhk9QfJTqBYb/sru4zbwr3ixX56JSSiAORc1wl0LTzMQTQa6SnaBeK3hJU
         bM03afISFjUoLTN0OEiUMm6edDxnvKRloViPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689666074; x=1692258074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W72tr0tg9BiWIz3zCp+YxWdsN0glxdmB5ZEHeCtkS6M=;
        b=YBfoEgYLD+8utsO1DFb22gzgIXukoqcrF2X8tklsi1rFsSZdme9pMR14KgyzF5uXnC
         EELEJODvpO08Q55h1ADlEPWKD7i330jWVyfVj3JZJ6H4s5xvlv/ZkUg0n7DPVG8c5Hbp
         JF8KqVC097xKZdfRLLQdeHE8jUwAXwb2Ze88gptbiV+0UKLCawrOPoIBgEJFU87kSXsd
         /FM/0xoeoEMtSgjgk11OgEhLyMfb0S1X231k84moF8P8Dq2aDXTYCPx0BbUDPzKA0Gxh
         yWoI0x61mNwjJZ6xUtcQCRxjbZ6o+yg7hzu8dfQO/EClHKs1VFVFu+xLYEGDhy3sGFjH
         dkbg==
X-Gm-Message-State: ABy/qLYlPOPfLoxTLQx76CA7b5FivV+vdIWNhLFlaOjzUWf56zqNKksw
	YWvMR5o0AP4chUCQcYR41Y1DLp095vqzJVkj/aC6HQ==
X-Google-Smtp-Source: APBJJlE9uS2QtTlCAm7Z6lCr5REH2fuUUfHsmmkyKOVMYvSCBg65YttmdObOYTuNF4oYeVP9mxLHWObTwXcmPy2TfaU=
X-Received: by 2002:a67:e3d1:0:b0:445:2154:746b with SMTP id
 k17-20020a67e3d1000000b004452154746bmr791821vsm.4.1689666073558; Tue, 18 Jul
 2023 00:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
 <20230713090152.140060-2-angelogioacchino.delregno@collabora.com> <827cc3730c949e38eafd3786631135bcc7c7591c.camel@mediatek.com>
In-Reply-To: <827cc3730c949e38eafd3786631135bcc7c7591c.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Jul 2023 15:41:02 +0800
Message-ID: <CAGXv+5Gj85Fnski5g9dssF+BQH27VVKwG+KXQkJRUCWozGnMeQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] drm/mediatek: dp: Move AUX and panel poweron/off
 sequence to function
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"kernel@collabora.com" <kernel@collabora.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_084230_129311_D683F17F 
X-CRM114-Status: GOOD (  29.51  )
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

Hi CK,

On Tue, Jul 18, 2023 at 3:40=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89)=
 <ck.hu@mediatek.com> wrote:
>
> Hi, Angelo:
>
> On Thu, 2023-07-13 at 11:01 +0200, AngeloGioacchino Del Regno wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Everytime we run bridge detection and/or EDID read we run a poweron
> > and poweroff sequence for both the AUX and the panel; moreover, this
> > is also done when enabling the bridge in the .atomic_enable()
> > callback.
> >
> > Move this power on/off sequence to a new mtk_dp_aux_panel_poweron()
> > function as to commonize it.
> > Note that, before this commit, in mtk_dp_bridge_atomic_enable() only
> > the AUX was getting powered on but the panel was left powered off if
> > the DP cable wasn't plugged in while now we unconditionally send a D0
> > request and this is done for two reasons:
> >  - First, whether this request fails or not, it takes the same time
> >    and anyway the DP hardware won't produce any error (or, if it
> >    does, it's ignorable because it won't block further commands)
> >  - Second, training the link between a sleeping/standby/unpowered
> >    display makes little sense.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

There is a v6 already.

> >
> > Signed-off-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dp.c | 76 ++++++++++++-----------------
> > --
> >  1 file changed, 30 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> > b/drivers/gpu/drm/mediatek/mtk_dp.c
> > index 64eee77452c0..8b7ded1746f3 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -1251,6 +1251,29 @@ static void mtk_dp_audio_mute(struct mtk_dp
> > *mtk_dp, bool mute)
> >                          val[2], AU_TS_CFG_DP_ENC0_P0_MASK);
> >  }
> >
> > +static void mtk_dp_aux_panel_poweron(struct mtk_dp *mtk_dp, bool
> > pwron)
> > +{
> > +     if (pwron) {
> > +             /* power on aux */
> > +             mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > +                                DP_PWR_STATE_BANDGAP_TPLL_LANE,
> > +                                DP_PWR_STATE_MASK);
> > +
> > +             /* power on panel */
> > +             drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D0);
> > +             usleep_range(2000, 5000);
> > +     } else {
> > +             /* power off panel */
> > +             drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D3);
> > +             usleep_range(2000, 3000);
> > +
> > +             /* power off aux */
> > +             mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > +                                DP_PWR_STATE_BANDGAP_TPLL,
> > +                                DP_PWR_STATE_MASK);
> > +     }
> > +}
> > +
> >  static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
> >  {
> >       mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
> > @@ -1936,16 +1959,9 @@ static enum drm_connector_status
> > mtk_dp_bdg_detect(struct drm_bridge *bridge)
> >       if (!mtk_dp->train_info.cable_plugged_in)
> >               return ret;
> >
> > -     if (!enabled) {
> > -             /* power on aux */
> > -             mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > -                                DP_PWR_STATE_BANDGAP_TPLL_LANE,
> > -                                DP_PWR_STATE_MASK);
> > +     if (!enabled)
> > +             mtk_dp_aux_panel_poweron(mtk_dp, true);
> >
> > -             /* power on panel */
> > -             drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D0);
> > -             usleep_range(2000, 5000);
> > -     }
> >       /*
> >        * Some dongles still source HPD when they do not connect to
> > any
> >        * sink device. To avoid this, we need to read the sink count
> > @@ -1957,16 +1973,8 @@ static enum drm_connector_status
> > mtk_dp_bdg_detect(struct drm_bridge *bridge)
> >       if (DP_GET_SINK_COUNT(sink_count))
> >               ret =3D connector_status_connected;
> >
> > -     if (!enabled) {
> > -             /* power off panel */
> > -             drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D3);
> > -             usleep_range(2000, 3000);
> > -
> > -             /* power off aux */
> > -             mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > -                                DP_PWR_STATE_BANDGAP_TPLL,
> > -                                DP_PWR_STATE_MASK);
> > -     }
> > +     if (!enabled)
> > +             mtk_dp_aux_panel_poweron(mtk_dp, false);
> >
> >       return ret;
> >  }
> > @@ -1982,15 +1990,7 @@ static struct edid *mtk_dp_get_edid(struct
> > drm_bridge *bridge,
> >
> >       if (!enabled) {
> >               drm_atomic_bridge_chain_pre_enable(bridge, connector-
> > >state->state);
> > -
> > -             /* power on aux */
> > -             mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > -                                DP_PWR_STATE_BANDGAP_TPLL_LANE,
> > -                                DP_PWR_STATE_MASK);
> > -
> > -             /* power on panel */
> > -             drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D0);
> > -             usleep_range(2000, 5000);
> > +             mtk_dp_aux_panel_poweron(mtk_dp, true);
> >       }
> >
> >       new_edid =3D drm_get_edid(connector, &mtk_dp->aux.ddc);
> > @@ -2010,15 +2010,7 @@ static struct edid *mtk_dp_get_edid(struct
> > drm_bridge *bridge,
> >       }
> >
> >       if (!enabled) {
> > -             /* power off panel */
> > -             drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D3);
> > -             usleep_range(2000, 3000);
> > -
> > -             /* power off aux */
> > -             mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > -                                DP_PWR_STATE_BANDGAP_TPLL,
> > -                                DP_PWR_STATE_MASK);
> > -
> > +             mtk_dp_aux_panel_poweron(mtk_dp, false);
> >               drm_atomic_bridge_chain_post_disable(bridge, connector-
> > >state->state);
> >       }
> >
> > @@ -2178,15 +2170,7 @@ static void mtk_dp_bridge_atomic_enable(struct
> > drm_bridge *bridge,
> >               return;
> >       }
> >
> > -     /* power on aux */
> > -     mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > -                        DP_PWR_STATE_BANDGAP_TPLL_LANE,
> > -                        DP_PWR_STATE_MASK);
> > -
> > -     if (mtk_dp->train_info.cable_plugged_in) {
> > -             drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D0);
> > -             usleep_range(2000, 5000);
> > -     }
> > +     mtk_dp_aux_panel_poweron(mtk_dp, true);
> >
> >       /* Training */
> >       ret =3D mtk_dp_training(mtk_dp);
> > --
> > 2.40.1

