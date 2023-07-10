Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DFEEB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 03:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0f/movtZorEjzM+r+LRTHIo16m8aSFE9mANkKWC//k=; b=JXCrJpVHVqRndPPJeCybAF9IWT
	cCM0t/tYto7isdaiRk0CUZ4PSaR8nMZnnxTBHJulQCmmxX7jRq8dX19waqySEXjLH8eRQfb8I9JXw
	YAvv5vq5f0pQqTxc49wbbOyRlYauExMz+Ue8Vs+Pf0RJzUjp3wJsL0Z0P8DYMMipkl2l3Kgpxmpl4
	Hr3yhbJoTGCOV9JCUDtm1mk0VnVv6IGPIW0s4osrGFL0ySMCeRgv+RBMUXpTaiUS2nWNuhlPshDRJ
	OsRSzq4GxDsrVUGOFswG55IhCKwe6obA32TK8MzfIIIGS53mXnuvwKxAiJaql/lm/zgZ6ZUhrEL0e
	UziJY1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIhLa-00AFuf-1z;
	Mon, 10 Jul 2023 03:13:58 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIhLY-00AFu2-1j
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 03:13:57 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-345f4a3ff76so15072005ab.2
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Jul 2023 20:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688958834; x=1691550834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0f/movtZorEjzM+r+LRTHIo16m8aSFE9mANkKWC//k=;
        b=DCu8m6Lgc3fN0s/umvG5QaoJejb15A7VhtGNn26yIUaP9CbiHAO6VhMIjCjM/NAbYt
         soZzFtvp/tERAWjE2/CROXgSbcmahjxIWXdH59dgHCGBawCTgANsfqHUTlOnssHQgMxI
         1F0rLYp/xA4XFeD1Pu1bpB69S1z7GYvNG/XR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688958834; x=1691550834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0f/movtZorEjzM+r+LRTHIo16m8aSFE9mANkKWC//k=;
        b=jBBtCkEDEJ2ZzIb3mvLDmXWcQbhWHHIaWuC5diO4zaeHEiwH1a0uVbYO3vT2s/t0bb
         05D9OPFSgx3jhnxf6hrvz/EmC0kAgzhfrlQSTv4MqKkaBa98WXOsFP+9wuA8GmsjIWuc
         s9FLKHEuecCIQAw72bcAyYQUPkIu7Z6T8hkwhJzhf2XIyExnTYJtvRf1THwRSdrdi6bT
         xuk4JAEnOW6/26qhcv3Jv/emjzVF7Lhbu1lLI7VfmeoW6lRudYD2UN6UyyRt5tGOG6EQ
         Y9BSlT47BNnQ6kMPaPnNaJkH2KdD2htHhgjHlNsuZ6Ko2OjgNML6iNzCkfg7I4BV8G6V
         9ZDw==
X-Gm-Message-State: ABy/qLaV8QcX7x+BHNKvMKfcy3FORnYrvfOwK9jGwi2lcAO0UW1CXe8y
	pjbkgCmpUArVcs1jB1bmXRnt3Q4DFl2u7Q7ufEA=
X-Google-Smtp-Source: APBJJlGrRGdZfBxwDYL1+0LL1Z3U/yvCIP6GuSgZzVXbBmXRsrCcX+wyOfadMeAwDJmcOqsXQ1Yq8w==
X-Received: by 2002:a92:c806:0:b0:340:54f1:35dc with SMTP id v6-20020a92c806000000b0034054f135dcmr10689688iln.18.1688958833809;
        Sun, 09 Jul 2023 20:13:53 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id n13-20020a02a90d000000b0041fb2506011sm2927580jam.172.2023.07.09.20.13.52
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jul 2023 20:13:52 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-78358268d1bso121531239f.3
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Jul 2023 20:13:52 -0700 (PDT)
X-Received: by 2002:a5d:8f89:0:b0:783:63d6:4c5 with SMTP id
 l9-20020a5d8f89000000b0078363d604c5mr436352iol.12.1688958832360; Sun, 09 Jul
 2023 20:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230709162641.6405-1-jason-jh.lin@mediatek.com> <20230709162641.6405-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230709162641.6405-3-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 10 Jul 2023 11:13:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1njmD1+12dS5x20XLR650nkRpkyM-dKjaierSLknuTPRuw@mail.gmail.com>
Message-ID: <CAC=S1njmD1+12dS5x20XLR650nkRpkyM-dKjaierSLknuTPRuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: Fix iommu fault during crtc enabling
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_201356_591606_7B55B884 
X-CRM114-Status: GOOD (  16.34  )
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

Hi Jason,

On Mon, Jul 10, 2023 at 12:27=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> OVL layer should not be enabled before crtc is enabled.
> The plane_state of drm_atomic_state is not sync to
> the plane_state stored in mtk_crtc during crtc enabling,
> so just set all planes to disabled.
>
Please add the "Fixes" tag before your S-o-b.

Regards,
Fei
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index d40142842f85..51d10e65004e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -410,6 +410,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *=
mtk_crtc)
>                 unsigned int local_layer;
>
>                 plane_state =3D to_mtk_plane_state(plane->state);
> +
> +               /* should not enable layer before crtc enabled */
> +               plane_state->pending.enable =3D false;
>                 comp =3D mtk_drm_ddp_comp_for_plane(crtc, plane, &local_l=
ayer);
>                 if (comp)
>                         mtk_ddp_comp_layer_config(comp, local_layer,
> --
> 2.18.0
>
>

