Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7EBCD54AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iN3B0w7/HP84BAXZ6ZgHwHAx1XejuMCTQ58AlHw/sJE=; b=TzdZc9JsCSRVRdn6FPfMu7KVib
	oG/D/xLq0o27S2zM45Q4dwWCwDqbDhflT7smHu36Z90+qEJ7vuIDJvrUuUOihwZ8EusinyFL4qU22
	xoYMhJSvWL897/qqcIEM5a+kJGyIkPZKVOzMOndCqFc+d6AJlmZkg7mc76RO07sbfF1SXQYQFXL81
	jLd3686k46deFtIpn0zDIaiTziGi2cdK1muwWBxRkBYPxLdOIaBWgCJluhq7hCwXW+qf2YP2I4KHT
	rue7uM2lxEREh20Qe1rNiKApgiQSc9K53No+lMKMOqFKaS2k8nKR96DKHcZmpX5wzd5XncPTVPbA4
	8B+TkwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXD7-00HW6A-0x;
	Tue, 19 Sep 2023 09:40:01 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXD5-00HW5V-1O
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 09:40:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50325ce89e9so1950105e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 02:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695116397; x=1695721197; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iN3B0w7/HP84BAXZ6ZgHwHAx1XejuMCTQ58AlHw/sJE=;
        b=TUOvpXrFiv2DHQIUiP4fgb0vM6Yv4RyJa9Ae/btaQvtITPdCqqOCkxSvb7rKszS8T4
         gFZg5irPAkOjWttCChbYvqXjMrHKbsKZCHc3X/ih/gaN8mmAZnNJaMlQC/C19R3KuBs7
         nZrkDGGJAw9EkKPTD8pBHENvln1NiPkSioG1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695116397; x=1695721197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN3B0w7/HP84BAXZ6ZgHwHAx1XejuMCTQ58AlHw/sJE=;
        b=KOoKuDIzZHBCMUL5T/m7Vv2MdRQHtK23x7lNM0xlBGEHHeRIR2hyTJ3upp1+JGD3Fz
         UKHesY7WY2h3zuscjAQhXlKam6ilnCgRcKsrG2hMrW0aH7xzCq1LfjPd6LJo4MuygBDt
         1zW3N9V2ploRjC8sw3M8zIRu8ux1TVtyKc9lNdCk/WPBLABzQHUjwe1yP+rVD4dNikJr
         XdiJwIoUHCZL8V6/gpb7Py39LJzOL9sFmyuhnCQN9dT5lurNzGsiVkkGWDQc4pYxWEbR
         B2gHX70rYvFTVcRMusTdihYL8BOrRM96XThG1msKD+Gl5QhaTblmlvg17G+qlL+k35Wb
         FakQ==
X-Gm-Message-State: AOJu0Yz+Daq/BpyGr+VMgaD515AzZoXVQVEKmYfiBUrO7944tMOzh1FL
	vTZeVnmPCGYSeInBDMZy37bFs1Rnl2OofrmUVZT5Pw==
X-Google-Smtp-Source: AGHT+IFqnwQ+G7B5Wej3OwhKCTJI9z3d+kpmSDv6XfBmR30ewo2ZVTcCrIm4Xyl3NuT5C+WjSHQ/Hs6XVobN7thyGM0=
X-Received: by 2002:ac2:494f:0:b0:500:9a15:9054 with SMTP id
 o15-20020ac2494f000000b005009a159054mr9205021lfi.20.1695116397402; Tue, 19
 Sep 2023 02:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230919050305.3817347-1-wenst@chromium.org> <13843095-0906-804e-ffbe-36625ebe05cf@collabora.com>
In-Reply-To: <13843095-0906-804e-ffbe-36625ebe05cf@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Sep 2023 17:39:46 +0800
Message-ID: <CAGXv+5GTW83DMtGDkPXPJ9hNzy4rD_GMQH65fNBzt0fUsdWFLA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mediatek: Detect single/multi core SCP with
 rpmsg-name property
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_023959_495652_6CCF7837 
X-CRM114-Status: GOOD (  24.88  )
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

On Tue, Sep 19, 2023 at 5:26=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/09/23 07:03, Chen-Yu Tsai ha scritto:
> > In the just landed multi-core SCP work, detection of single/multi core
> > SCP is done by checking the immediate child node of the SCP complex
> > device node. In the original work this was done by matching the child
> > node's name. However the name wasn't previously standardized. This
> > resulted in breakage on MT8183 and MT8192 Chromebooks while the driver
> > side changes were picked up and the device tree changes were not picked
> > up.
> >
> > Instead, match against the "mediatek,rpmsg-name" property, which is
> > required to be present in the rpmsg sub-node. This makes the
> > aforementioned devices running old device trees working again.
> >
> > Reported-by: Laura Nao <laura.nao@collabora.com>
> > Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-=
core SCP")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > The patch is based on next-20230918 with a whole bunch of local patches
> > stacked on top. None of my local patches are related to remoteproc, so
> > it should be fine.
> >
> > I tested on both MT8183 Juniper and MT8192 Hayato and on both systems
> > the SCP successfully probed again.
>
> Instead of checking "mediatek,rpmsg-name", I think that a better way of c=
hecking if
> this is single or multi core is to count the number of cores...
>
> I've sent my own version of this, please check [1].

My version checks the structure of the device node, much like the original
code, just against a different property/node name. If it's multi-core,
there would be sub-nodes for each core, and the rpmsg property would be
under those.

Either way works. What we need right now is a quick fix to get things
working again. We can discuss how to make things better later.

Honestly I think it should just be based on the compatible string. However
the current design seems quite fragile. The driver probably can't handle
the core device nodes being out of order.


ChenYu

