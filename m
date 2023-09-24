Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA83ECE7A8A
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Sep 2023 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTCoYBjr017l6wFXONnZTUqQscIlTsYc71hdwazXlvU=; b=Hy7fiLtehSghKRWSfov8gxQ761
	pkOWBLJuHM9fEEXzQZCrNmMZoNJNLJf+G+LYP7h/uGMOv7mL6awvAvOym1uDlNXpHl5cyEXL0xImn
	K6oFCeB4F3Zzlguh7+VY0yXGGDsLoHFYmz3r+rkz2hg3T/9If14Q2h2p0E90Rh88iGdrheHOjq5Bg
	JX7rr/pL/d2O98gPZy3UhlW/ZX95WWB7EnnWmQAfwsty49tJiG7ZMYvOoQYJpdlmYUzVyIDjVZyyR
	ceR0th3+BFC2lJ92tyq6ob3E7cLWEHnW0YrIB8A/1Fu1Onhm88zVwlB6qViYksIcNgEj5jPAD1fFS
	jtfpTkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkQ5A-00CMYJ-39;
	Sun, 24 Sep 2023 14:27:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkQ57-00CMWq-2B;
	Sun, 24 Sep 2023 14:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8ADC60C28;
	Sun, 24 Sep 2023 14:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8445EC4339A;
	Sun, 24 Sep 2023 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695565648;
	bh=bTCoYBjr017l6wFXONnZTUqQscIlTsYc71hdwazXlvU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gUGAWIfW7vC1NooiXlxXAW77CGrUMiNfl1d0Cb+Ur1u6pV9vKzFjnH/HrDXCQPWpz
	 VzQhp79Iu77tCMpohvzqwhU2VI6jFcTxIl/PwmgQ/zqrNiGUG5qfp5VPuAEfVezs98
	 3JuLWuvfWl/1R0GAoVToJO3SKOdkdJ68ol7Yk4vODF97IuaSALUuTCxXSPBNEin0jO
	 Uxy2F55OVFSNNiLGrA7Sy+pLvTK3RAka01exn8c0wABlLEzPyTKFwC7xju9Cj3sqOJ
	 KNmno5TjgU1f3Ab9oAHE4z2RHFYTqAfnWTtwjjlz/nm/HbFxIvZgYnHc8dnRdf2+sA
	 Cqd5Eki0be9Lg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2bff936e10fso73163801fa.1;
        Sun, 24 Sep 2023 07:27:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YwHs2V0QBaMVWZo+PBQp5rtZsUBEAOoqT5COFFsZZftgLgZASWp
	TviPHsdErYUz0ol1hr+W6t764VH1gcbyvom6LA==
X-Google-Smtp-Source: AGHT+IHf5vWm0GIZ1hkeawxAEZsjJHRSUs4KnxlkvgtCc373prUzNyF256grHwvaFc81Egmx7IoRA+c1Jovfx/Fg9VA=
X-Received: by 2002:a2e:b81c:0:b0:2c0:b37:a1cf with SMTP id
 u28-20020a2eb81c000000b002c00b37a1cfmr2571604ljo.22.1695565646665; Sun, 24
 Sep 2023 07:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131058.2472260-1-jani.nikula@intel.com>
 <20230914155317.2511876-1-jani.nikula@intel.com> <CAGXv+5GJxEobJKKWuc_UN+Gf_z8g6eb6KWTz-L+RqtyLYKK3Jg@mail.gmail.com>
 <87cyyetohx.fsf@intel.com> <CAGXv+5FvmwMW+bxJ9d_ULbOJA9qpd-vybn0VyE5iyQLHCET1=A@mail.gmail.com>
 <87o7huo840.fsf@intel.com>
In-Reply-To: <87o7huo840.fsf@intel.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 24 Sep 2023 22:27:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY__MYub=0Qkf8rn1W=O0MHSOD7wziO5ipCQEJRSK-EawEg@mail.gmail.com>
Message-ID: <CAAOTY__MYub=0Qkf8rn1W=O0MHSOD7wziO5ipCQEJRSK-EawEg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 audio detection
To: Jani Nikula <jani.nikula@intel.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Guillaume Ranquet <granquet@baylibre.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Bo-Chen Chen <rex-bc.chen@mediatek.com>, 
	linux-mediatek@lists.infradead.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_072733_801639_63F9FDE1 
X-CRM114-Status: GOOD (  19.88  )
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

Hi, Jani:

Jani Nikula <jani.nikula@intel.com> =E6=96=BC 2023=E5=B9=B49=E6=9C=8822=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:44=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 19 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Tue, Sep 19, 2023 at 7:02=E2=80=AFPM Jani Nikula <jani.nikula@intel.=
com> wrote:
> >>
> >> On Fri, 15 Sep 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >> > On Thu, Sep 14, 2023 at 11:53=E2=80=AFPM Jani Nikula <jani.nikula@in=
tel.com> wrote:
> >> >>
> >> >> The sads returned by drm_edid_to_sad() needs to be freed.
> >> >>
> >> >> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> >> >> Cc: Guillaume Ranquet <granquet@baylibre.com>
> >> >> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> >> >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> >> >> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> >> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >> >> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >> >> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> >> >> Cc: dri-devel@lists.freedesktop.org
> >> >> Cc: linux-mediatek@lists.infradead.org
> >> >> Cc: linux-kernel@vger.kernel.org
> >> >> Cc: linux-arm-kernel@lists.infradead.org
> >> >> Cc: <stable@vger.kernel.org> # v6.1+
> >> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> >
> >> > Looks correct to me.
> >> >
> >> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >>
> >> Thanks for the reviews Chen-Yu and Guillaume. Will you push this to
> >> drm-misc-next or shall I?
> >
> > Patches for the MediaTek drm driver go through their own separate tree,
> > maintained by CK (Chun-Kuang).
>
> Chun-Kuang, can you confirm picking up these two patches, please?
>
> MAINTAINERS does not list a separate git repository for MediaTek drm
> drivers, so I don't know where that would be. It should probably be
> added to MAINTAINERS.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Thanks,
> Jani.
>
> >
> > ChenYu
>
> --
> Jani Nikula, Intel

