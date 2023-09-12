Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0D1CA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzOy9+i/I3/0IAop11I8QZ9KuzjqNEblUBdj8hE/TNs=; b=vwY6vBCEM2ulxEdBh2gQj+UNZF
	kZKEjOLdkhhXLGvMyzbj1UCSvebeHSm58/h0hncrt0YtS+6m5khv8zsy0hVVLF6sI3Ux9Q+MmZvM9
	JCgK7clYX9RQwYqZNaeHENdN9+UB0iGgJgQUN/EXbqSpyYIlk2SbTzwNabaxqr3G9gu2Rw1MdzyJ1
	UwziGdWY17BB/PPMHYkXQH9TsB8huR9p+MdbTHM7QtH5z1WOFreSxKxH3FmmRty/c9eYNWtQaXw/E
	NQ6cUfODC2USK4L5aE5CvUe58SJgxlHO+O0JlHatCCcLF9S72B9V+O4neJ4/EmCkh1gcyqpLJiwep
	H4k28AaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzpw-002lu7-36;
	Tue, 12 Sep 2023 09:37:36 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzps-002lrC-1g
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 09:37:35 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-501cba1ec0aso8886436e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 02:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694511449; x=1695116249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzOy9+i/I3/0IAop11I8QZ9KuzjqNEblUBdj8hE/TNs=;
        b=UY42ZyKeGp4dhjl3DZIGkIg+T5ZjnHPxDhHnZuyA/6ecuDk/j71aDNC0rLXOFJc9Cu
         XIo+HWu5/CUzOK4KnMeeYI7lQMfpAjKzObu78DqY18qV8DA3+pbCVe4x3NPjea0b29NC
         mTvFDwEOlxL5nhKmY55WYy9Wy+LIpnVZS8mqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694511449; x=1695116249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzOy9+i/I3/0IAop11I8QZ9KuzjqNEblUBdj8hE/TNs=;
        b=m3EQva5NB0QJ/0bm2qS9qolN+/6RS8ohVY2ziX7FRMkmX+ybuQXG76HWa8S6zdmALI
         Ze4Max7P+0NtC7twS5YBUEVy8Ae2OGx9RcnkfYFnA+4orrXWZpYwsxddBYA2Rgcq9jaP
         y+1hfQ1IkygCiS+AwyVYAvd7elc1WgeSGQIzfemyF1ZKWUFQ4kPkJhr1RA2QI5JuNZM/
         PnUrwhTISTUu4gkB/zqc4uKKRnxM+XBY9jljqSgKCk3m6iHhnic3g7Kj9wWZ5izKkbue
         GeMrFf03dbks+HgDbH6/EB/R7gZsCBY636wISquKb63cgYz3tAP/Z79sC37xXo40ekQx
         +x9Q==
X-Gm-Message-State: AOJu0YyYJiD5/NDUtzf6XiQnBSoIlJhBCbp9i11c23bEwOg/9Zmad68F
	ucXF2lpnJj8KZ59hy2XRjrdNRHziEZdl3HrqurKXPA==
X-Google-Smtp-Source: AGHT+IE5nYxQfZ/p5JEjeqA28AdkacyPuXzw3SozYcbXSTHvYQRz83ev3q6BCV7+1dnYJ4QqMVA8anjAE8x57wQR11Q=
X-Received: by 2002:a05:6512:2829:b0:4fd:fecf:5d57 with SMTP id
 cf41-20020a056512282900b004fdfecf5d57mr10819604lfb.39.1694511448719; Tue, 12
 Sep 2023 02:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230912075805.11432-1-moudy.ho@mediatek.com> <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
In-Reply-To: <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 Sep 2023 17:37:17 +0800
Message-ID: <CAGXv+5FhsKVGwoJxLP=-gV+rSHbQ8DUX0YACy0mPxYw+MC85=g@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_023732_555334_7B90E5D4 
X-CRM114-Status: GOOD (  18.91  )
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

On Tue, Sep 12, 2023 at 5:00=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 12/09/23 09:57, Moudy Ho ha scritto:
> > Changes since v4:
> > - Rebase on v6.6-rc1
> > - Remove any unnecessary DTS settings.
> > - Adjust the usage of MOD and clock in blending components.
> >
> > Changes since v3:
> > - Depend on :
> >    [1] https://patchwork.kernel.org/project/linux-media/list/?series=3D=
719841
> > - Suggested by Krzysztof, integrating all newly added bindings for
> >    the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
> > - Revise MDP3 nodes with generic names.
> >
> > Changes since v2:
> > - Depend on :
> >    [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek=
/list/?series=3D711592
> >    [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?=
series=3D711618
> > - Suggested by Rob to revise MDP3 bindings to pass dtbs check
> > - Add parallel paths feature.
> > - Add blended components settings.
> >
> > Changes since v1:
> > - Depend on :
> >    [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/=
?series=3D698872
> >    [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek=
/list/?series=3D684959
> > - Fix compilation failure due to use of undeclared identifier in file "=
mtk-mdp3-cmdq.c"
> >
> > Hello,
> >
> > This patch is used to add support for MDP3 on the MT8195 platform that
> > contains more picture quality components, and can arrange more pipeline=
s
> > through two sets of MMSYS and MUTEX respectively.
> >
> > Moudy Ho (14):
> >    arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
> >    arm64: dts: mediatek: mt8195: add MDP3 nodes
>
> Please send the DTS patches separately, those go through a different main=
tainer.

I thought most people prefer the _full_ view in a patchset?

> P.S.: The dt-bindings patch can be sent inside of this series, please do =
that.
>
> Thanks!
> Angelo
>
>

