Return-Path: <SRS0=62P0=YP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F366CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 11:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C9A3207FC
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 11:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7kTJZa7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C9A3207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7H7cv233taBBA2X4v88y718w+JSH4+gv4qj6hzOIqw=; b=q7kTJZa717etdv
	1Mxmzxx87FTiwH6DJ8QPEtf60Iax8b+2NhCinYjiYm+uLSfB5Mr6crLqfdKD1/xg/p6KJ2KLJ2ECv
	5l7bPfsZTjbtrDh2ZaqcMIFDqmn+tlX1WLZcnpmKynNc3DksbxdJ+JmaFa6FhvBBkRHfrDM0Pddvd
	teYRavi+NN/xB0j09jUOZZbt5uMS4bh7FtOAQbsy1QlV1nmrrLk2iG94ahTsrDakbNA9zDCSlNDtr
	oOAK8bZKHyA+kKnmxfSq49aSlYOpPKO81u1YQr7ZWj/EzyV5d15OacWGRws/ZQ867d9ZpgnP6jXNF
	+oyzTWqCnNnhwvp7LGgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMsX0-0001t5-Cs; Tue, 22 Oct 2019 11:40:54 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMsWv-0001pj-1Q; Tue, 22 Oct 2019 11:40:50 +0000
Received: by mail-oi1-f195.google.com with SMTP id a15so13893945oic.0;
 Tue, 22 Oct 2019 04:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MTkUrxhJaaygKpYFG6XKyORLB/6UsrnNnAcZ2HEl3vA=;
 b=j7e/zRyXU5L0j2HfQBbiPRz1FpuWUq8OpkY1fEgg+b6eFMpCFxxa0wxK5igcfbKDzn
 0fjgfODFh85mRztti513M90VKEGQDozP6DZEl25T3X3Iy4djigU6eXU/ITq6h8aeyL7V
 LAqP5IUgr5LTF7qI4BZQslJBkP2eW6WxQGGtostoG6/DVsy3P5h9xgSsDzlmJEyhYhVT
 R3DD4GkxWGbDM8rVnTS3BTBcBpJaZrIy+uDLc1jivmv9cfCgMeyQZXYsVYHGxG1ICltD
 rGbvZyqQ4osi2/pZHZ/7Rnqd4CaUHgH/V8RoEwOMrreJvEqnOtXcypGTFGWJtrcb/lU0
 S17w==
X-Gm-Message-State: APjAAAVeDIySB0nVGznHacrGOS95zpZ36M8Atl9htX5+7bGtkEjdRRjl
 eqn5OtYlv0a53ZuWqk0xefPqx+DbDNEiRGMbTxA=
X-Google-Smtp-Source: APXvYqzhQ8cZ06PtyQQYS8VBvz7ZAfya04dDgTKpedBCyvYLKvYUP4z21wflkhBwZ+Lx/Betkfre5JCQCLddcCfBX8w=
X-Received: by 2002:aca:882:: with SMTP id 124mr2542881oii.54.1571744447771;
 Tue, 22 Oct 2019 04:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
 <20191022113001.GG4756@pendragon.ideasonboard.com>
In-Reply-To: <20191022113001.GG4756@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Oct 2019 13:40:36 +0200
Message-ID: <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_044049_083408_F929B8F4 
X-CRM114-Status: GOOD (  10.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rongrong Zou <zourongrong@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Laurent,

On Tue, Oct 22, 2019 at 1:30 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 21, 2019 at 04:45:48PM -0500, Rob Herring wrote:

> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > @@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
> >        * align to 64 bytes since Mali requires it.
> >        */
> >       args->pitch = ALIGN(min_pitch, 64);
> > +     args->flags = DRM_MODE_DUMB_KERNEL_MAP;
> >       args->size = args->pitch * args->height;
>
> My OCD gets triggered by flags appearing in the middle here while it is
> at the end in other drivers :-)

... while "flags" appears before "pitch" and "size" in the actual struct
definition... Aaarghl ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
