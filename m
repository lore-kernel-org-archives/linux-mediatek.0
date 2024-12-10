Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF486E7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 04:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVjyzJNZzUOHZ4xph7lTSEABYq06yQKkLnmVu5Ncc7M=; b=TKB7IAkN6TyyRQWFdHmyu8ThTr
	Tt9MWtJVWACT0IQN6kL1Biu9pIOXLEFfUBkWf9XF3qpRdr9fAfZTGf697sX8n61/dXEntBPgJwAfJ
	ATNGOq1nwUxZyiIm7bWMo86m1f2T91eS4+4yNNpsk8/FpfNWlvUq/YudMcOBRJtJKZ58pESz43scG
	MC2XJZUJBFDOMh+YP5prIGH+hnB2NqwvELJaVmMGhVKkRgwHhOupitXe8GTGafMTNhOeVLyHMsOgy
	fueIBDciMYExZn3SsteoTX+S9NHi0vBQArmEyVN1cTvQr1JA7WgZTEmgfPyeLu+y3j1uUYn41nv/9
	dNmnJliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKrfi-0000000AAyA-3XVw;
	Tue, 10 Dec 2024 04:16:30 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKrff-0000000AAxO-1Bws
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 04:16:28 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401ab97206so1864146e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Dec 2024 20:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733804185; x=1734408985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVjyzJNZzUOHZ4xph7lTSEABYq06yQKkLnmVu5Ncc7M=;
        b=dDOgLqsZO4ICbIkCgC9IAjOUuneHIvp+M+KVpV/GrPPg1o0FQGAhtSFKaJFHSL352+
         pN97lbHvzX/VMVBbPkcryD/n6MhzA52J2XCl//+ped0T0MZwLkMxuOOV+7T0eeKkAwf7
         Q9LK3SPRALA3GUFK6CSzg9lHQOrTbNgp8XoaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733804185; x=1734408985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVjyzJNZzUOHZ4xph7lTSEABYq06yQKkLnmVu5Ncc7M=;
        b=pAzyf5KogV5iwgAS3bnTYPJ1Tv5V7/kEhnsoureO74t55s0IR2tKsBm+WsqegUpHeX
         9VFn+Fm2XpOwGtmXN8leiQ1rEMMl6QHCFo+aX/iNAFIbmgOnACvpmaaWV1QTEBaE2ksC
         Zzlxfy9YIZ3ao/jd+6yfhtIA7rsAP37GS05h+0q4YfCbcToDrWy9kabawRLndRKcKYNq
         UQ31BXIvHYSj0V75+4aLmZClYi8RYYYndpds+h4MWmmyWYrcGtglt3eo4H7QX4+N+mSQ
         hVmceMMUx/Oy9B6QMkIWYrrzdx354rUPuYOEhbf2mHOW0qTOWcCFDfLLPJOJJ58lmYlL
         q+5g==
X-Forwarded-Encrypted: i=1; AJvYcCXQT00euc9ZxkSzijt9YpRJfs2V1I/nrQXm//9cNvXTZoMGnUg6x8CULeXg22epLKcgUdJyyKGXJcGyxJ6nmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz97JuKjEmB6xXjPUVDP9SKvD2ZarV60BSuRKHm6Fomry7rq3g0
	DpAop1sROB6t0A8IY1esm8DvDkoI6w5I+WXjs/mbu7FVsc+uy4j3UwPDPn7YyeyePsdistN0jqO
	mxmtBctku2FrVmlsfnH/gH7Y2nD1l8vsoPhwh
X-Gm-Gg: ASbGncuV3NaXu2kL+uYaHtJ9YjJ9pUuj2l/yGtAuDV2UO4Fw4NKEAfPXjaW/NmZwn4n
	3XErYApmO8vXJwg0NtdPeiKHDNwsglhEdhsAKi/dm0xRy8oMQ9vx4xyBHNHr1jYg=
X-Google-Smtp-Source: AGHT+IFLm7BUs8MAU7wTXsZF4FUsJzFdNX0LJUGWf1hGpJQa8BMT4iC8QeVgWREJrgR+EdOW4ukZF7ZP90wiDT03Nq4=
X-Received: by 2002:a05:6512:6cc:b0:53e:391c:e96c with SMTP id
 2adb3069b0e04-540240b0ff8mr1052794e87.8.1733804184782; Mon, 09 Dec 2024
 20:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20241203-mt8188-afe-fix-hang-disabled-apll1-clk-v1-1-07cdd7760834@collabora.com>
 <a10dbdf265194e77a69b6e40afa3df9636b3ab14.camel@mediatek.com>
 <a70a0521-985d-43a4-a1fa-36eb733d5ca9@collabora.com> <1d2ee55dde84bcab6f777525042c6789b9f2c1fc.camel@mediatek.com>
 <108d4187-26af-43f6-8b1e-0e48516524a4@notapiano>
In-Reply-To: <108d4187-26af-43f6-8b1e-0e48516524a4@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 Dec 2024 12:16:13 +0800
Message-ID: <CAGXv+5Gi30-GSy_D+DHS_wz-A3F4qxuc7-6KpfBQ-iJwr3POtQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: Enable apll1 clock during reg rw
 to prevent hang
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>, 
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kernel@collabora.com" <kernel@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_201627_447661_C27BE180 
X-CRM114-Status: GOOD (  53.02  )
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

On Tue, Dec 10, 2024 at 4:08=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Fri, Dec 06, 2024 at 06:57:00AM +0000, Trevor Wu (=E5=90=B3=E6=96=87=
=E8=89=AF) wrote:
> > On Thu, 2024-12-05 at 13:51 +0100, AngeloGioacchino Del Regno wrote:
> > >
> > >
> > > Il 04/12/24 13:17, Trevor Wu (=E5=90=B3=E6=96=87=E8=89=AF) ha scritto=
:
> > > > On Tue, 2024-12-03 at 17:07 -0300, N=C3=ADcolas F. R. A. Prado wrot=
e:
> > > >
> > > > >
> > > > > Currently, booting the Genio 700 EVK board with the MT8188 sound
> > > > > platform driver configured as a module (CONFIG_SND_SOC_MT8188=3Dm=
)
> > > > > results
> > > > > in a system hang right when the HW registers for the audio
> > > > > controller
> > > > > are read:
> > > > >
> > > > >    mt8188-audio 10b10000.audio-controller: No cache defaults,
> > > > > reading
> > > > > back from HW
> > > > >
> > > > > The hang doesn't occur with the driver configured as builtin as
> > > > > then
> > > > > the
> > > > > unused clocks are still enabled.
> > > > >
> > > > > Enable the apll1 clock during register read/write to prevent the
> > > > > hang.
> > > > >
> > > > > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.c=
om>
> > > > > ---
> > > > >   sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 4 ++++
> > > > >   1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > > b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > > index
> > > > > e69c1bb2cb239596dee50b166c20192d5408be10..fb8cf286df3f02ac076528b
> > > > > 898f
> > > > > d0d7a708ec1ea 100644
> > > > > --- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > > +++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > > @@ -587,6 +587,8 @@ int mt8188_afe_enable_reg_rw_clk(struct
> > > > > mtk_base_afe *afe)
> > > > >          mt8188_afe_enable_clk(afe, afe_priv-
> > > > > > clk[MT8188_CLK_AUD_A1SYS_HP]);
> > > > >
> > > > >          mt8188_afe_enable_clk(afe, afe_priv-
> > > > > > clk[MT8188_CLK_AUD_A1SYS]);
> > > > >
> > > > > +       mt8188_afe_enable_clk(afe, afe_priv-
> > > > > > clk[MT8188_CLK_APMIXED_APLL1]);
> > > > >
> > > > > +
> > > > >          return 0;
> > > > >   }
> > > >
> > > > Hi Nicolas,
> > > >
> > > > If I understand correctly, APLL1 should be the parent clock of
> > > > AUD_A1SYS_HP and AUD_A1SYS, so it should be enabled automatically
> > > > by
> > > > CCF.
> > > >
> > > > I'm not sure why you resolved the hang issue after enabling APLL1.
> > > > Could you share more details about the solution?
> > > >
> > >
> > > Hmm. Now I see what's happening here...
> > >
> > > Nicolas, Trevor,
> > >
> > > Possible parents for top_a1sys_hp are:
> > >   - clk26m
> > >   - apll1_d4
> > >
> > > ...what's happening here most probably is that after the clock gets
> > > disabled as
> > > unused, it gets parented to clk26m by default as that is parent index
> > > 0... and
> > > something else in AFE needs APLL1 to feed a clock to .. something ..
> > > to allow
> > > register access.
> > >
> > > Trevor, do you know why is this IP unaccessible when A1SYS is
> > > parented to clk26m?
> >
> > Hi Angelo,
> >
> > As far as I know, it should work even though the clock is parented to
> > clk26m.
> >
> > Unfortunately, I have no idea about why APLL1 enabling can resolve the
> > hang issue. I'm also curious about how Nicolas found the solution to
> > resolve the problem.
> >
> > From the description, it seems that the problem is related to register
> > r/w hang. If I remembered correctly, when the mtcmos of ADSP_INFRA is
> > ON, register r/w won't cause the cpu to hang. However, ADSP_INFRA has
> > been configured as ALWAYS_ON in the driver. I'm not sure if it doesn't
> > work correctly when the driver is configured as a module. Maybe Nicolas
> > can also check this.
>
> Indeed, as suggested by Angelo, adding
>
>   assigned-clocks =3D <&topckgen CLK_TOP_A1SYS_HP>;
>   assigned-clock-parents =3D <&topckgen CLK_TOP_APLL1_D4>;
>
> to the afe node also fixes this issue.
>
> In mt8188.dtsi, we currently have
>
>   afe: audio-controller@10b10000 {
>         ...
>         assigned-clocks =3D <&topckgen CLK_TOP_A1SYS_HP>;
>         assigned-clock-parents =3D  <&clk26m>;
>
> So the question is, do other MT8188 platforms need clk26m to be the paren=
t of
> a1sys_hp? Depending on that I can either update the parent on the common
> mt8188.dtsi or on the genio700-evk.dts, which is where I observed the iss=
ue. I
> don't have access to other mt8188 platforms. Trevor, do you know?
>
> As for how I identified this issue, I noticed that when booting with the
> platform driver as a module the system would hang, and that passing
> clk_ignore_unused avoided the issue. Then I selectively ignored some unus=
ed
> clocks until I narrowed down to ignoring unused only the apll1 clock, mea=
ning
> the apll1 clock needed to be left on during the platform driver probe for=
 the
> system to not hang.

I don't know. The AFE driver supposedly enables all clocks that are
required for register access on runtime PM resume using
mt8188_afe_enable_reg_rw_clk().

Maybe try enabling debug printk in sound/soc/mediatek/mt8188/mt8188-afe-clk=
.c
and see what that gives you? There are already debug messages around the
clk enable/disable calls.

Either there's a bug or incorrect description of the clock tree,
or the AFE device node is referencing the wrong clocks.


ChenYu

> Thanks,
> N=C3=ADcolas
>
> >
> > Thanks,
> > Trevor
> >
> > >
> > > That might give Nicolas a definitive hint about how to resolve this
> > > issue.
> > >
> > > Cheers,
> > > Angelo
> > >
> > > > Thanks,
> > > > Trevor
> > > >
> > > > >
> > > > > @@ -594,6 +596,8 @@ int mt8188_afe_disable_reg_rw_clk(struct
> > > > > mtk_base_afe *afe)
> > > > >   {
> > > > >          struct mt8188_afe_private *afe_priv =3D afe-
> > > > > >platform_priv;
> > > > >
> > > > > +       mt8188_afe_disable_clk(afe, afe_priv-
> > > > > > clk[MT8188_CLK_APMIXED_APLL1]);
> > > > >
> > > > > +
> > > > >          mt8188_afe_disable_clk(afe, afe_priv-
> > > > > > clk[MT8188_CLK_AUD_A1SYS]);
> > > > >
> > > > >          mt8188_afe_disable_clk(afe, afe_priv-
> > > > > > clk[MT8188_CLK_AUD_A1SYS_HP]);
> > > > >
> > > > >          mt8188_afe_disable_clk(afe, afe_priv-
> > > > > > clk[MT8188_CLK_AUD_AFE]);
> > > > >
> > > > > ---
> > > > > base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
> > > > > change-id: 20241203-mt8188-afe-fix-hang-disabled-apll1-clk-
> > > > > b3c11782cbaf
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > > > >
> > > > >
> > >
> > >
>

