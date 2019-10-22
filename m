Return-Path: <SRS0=62P0=YP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870E5CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 19:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5372321848
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 19:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g8832w4c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbSsk/ek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5372321848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrTZmPrWpd7L4CgwMuDkasg7Gbm62uv3uN+pPU1wOvo=; b=g8832w4cp58zH+
	DaCoZyrfevl9Cw+4fVeZ1mqEKEqtlF1wdVW4LVsKZuPjaEsRx7qRErhPJS2SPHfbjJNO3SHTlbVYE
	iqdTLhpz5D21U8rkJPqvQwmyXFSVNLHH5E+imTWOFFVGYkjT5d85B6ZWjA8rfHGOpaqq3BhSmVOIT
	kNQmv0UQmF/MtW14cy/dKEAckn1mX2MBGsyjD1uk48nYYUEPJQjhTaJonuXTdnucKNhW/OZgDdn7q
	yqANR2A5XsIBzUdwql5DhlXwE/0hRyZYeu1wWU5fKhqUppllN6IMfR/tP7VPsP/NIrZDuFwOjMJWZ
	6M2TFMbu7sWp0Cq7X8Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iN0DB-0002gr-Fg; Tue, 22 Oct 2019 19:52:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iN0Cw-0002Sp-EN; Tue, 22 Oct 2019 19:52:43 +0000
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDDC821D81;
 Tue, 22 Oct 2019 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571773962;
 bh=lVep/kGw+Qm/9BH6yFF5Ta8I/nos5oV6cOnqMoFM8O4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SbSsk/ekDVLBB454r0f1fvmvvTfmN03c5NGb9PdZ9IvpRX8d1DtgQ08Z0bcIFwtzs
 VJWkSkAkUUYtQwyf9KuPhqlpVOF4v4w2h5TXmW4XmSDy7Bzdam3XJW9stl7dqdpFvB
 VeMeIZqvsNaRGBObR2DhS1fZ9eyDJP3dVFLqhiSw=
Received: by mail-qt1-f176.google.com with SMTP id d17so14058651qto.3;
 Tue, 22 Oct 2019 12:52:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWFRztYI5DuJGiRUNffRn1tmvtxVdCUean9PJmT74wIG6OMZAIe
 Fzq4mz/3bCf51LsiEVSEMJtN9Bsk7u4ZGqZdNA==
X-Google-Smtp-Source: APXvYqwfTFQvEWZsi+fmlXq4bJ/93h8u27YyErOcN6+jtvSG/aNt4UCbC5GoUws1bleVICB9W55vYXnUR58eU0hZLWI=
X-Received: by 2002:ac8:741a:: with SMTP id p26mr5266590qtq.143.1571773960946; 
 Tue, 22 Oct 2019 12:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
 <20191022113001.GG4756@pendragon.ideasonboard.com>
 <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Oct 2019 14:52:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJwJgNHy4wr0as0n-R3ist_yKp3ytyBw4bPXjtSOSMOXQ@mail.gmail.com>
Message-ID: <CAL_JsqJwJgNHy4wr0as0n-R3ist_yKp3ytyBw4bPXjtSOSMOXQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_125242_527486_8A00404F 
X-CRM114-Status: GOOD (  11.90  )
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
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

On Tue, Oct 22, 2019 at 6:40 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Laurent,
>
> On Tue, Oct 22, 2019 at 1:30 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Mon, Oct 21, 2019 at 04:45:48PM -0500, Rob Herring wrote:
>
> > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > > @@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
> > >        * align to 64 bytes since Mali requires it.
> > >        */
> > >       args->pitch = ALIGN(min_pitch, 64);
> > > +     args->flags = DRM_MODE_DUMB_KERNEL_MAP;
> > >       args->size = args->pitch * args->height;
> >
> > My OCD gets triggered by flags appearing in the middle here while it is
> > at the end in other drivers :-)
>
> ... while "flags" appears before "pitch" and "size" in the actual struct
> definition... Aaarghl ;-)

There was some reasoning here as my CMA helper conversion patch is
going to insert code between flags and size.

But to keep everyone's OCD in check, I can set flags first.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
