Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B28C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 08:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SC8wLptS4WXWt8bW8YWC7ooVYG9MHbSN/yLxSgqam3k=; b=y2of3YHBSGyT9Gw2YDuS1lBTU6
	FpIvitSbKfx5Qafw97xUNaSWutJzjRiM5Iqa2wEPC1rSddYNb2gbbypEda3FALcJy2ixe+tzKRLTG
	hzNg+c7Ocn+u4PZ7sgLfew2kf4RA/HGchtTeHKpUBgqoXINIC1soxgC/SzZwQsRqdTewxFhjrWbb5
	Nb2U7lwskz5P3191pG5uvcAn1ZZZPx3sQIHcZNNTAnwTV7z2uCzZnY4CXuiR0wSL7WiVIyoBF1YWl
	8BNwaf5kxeIeB/eMRdy2zlLv5ZcFfkcJu7yY5P7zKwZP6DOo1dL5yxJs1QFKeRpWMjB3KCHBnCYMJ
	WECHmWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrd8-002QQN-2t;
	Thu, 13 Jul 2023 08:24:54 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrd5-002QNg-2s
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 08:24:53 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-345fcf8951fso1738035ab.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689236685; x=1691828685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SC8wLptS4WXWt8bW8YWC7ooVYG9MHbSN/yLxSgqam3k=;
        b=FZiLITKaPUzstLBSacSBQs6la+ouO+EElunBvXzjccW5Yd5nG4vmi6UE2SgadGtBfo
         O3zubsgQZpuxjydeGNIi4YF/nzBLpqC8JwBoa5O4OPPyl39u5CVJdbtyVAeJBBakRK7X
         xZCMv323rTgEyvnoBWDzZHBnzpKH11oPRdMR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689236685; x=1691828685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SC8wLptS4WXWt8bW8YWC7ooVYG9MHbSN/yLxSgqam3k=;
        b=BLud6v83x6+ltzpSBL9LxLbadhZ/4TwLuwRUmSB/Csb0KLNhhm7dx72l3mcwwuy+64
         qVHiW0CexmS3eDdYE6vr45AbnuRn0+tdGCdN2h6mK93wgIWUG6MFE3X6R2H4R0pDB0P2
         JIdzQQHvZWAna7ZBbJMZYY6x7y1jQ7lenGtunAYAASRPN7FCT85Nt9VHgEOIzAZrzcNn
         WBFhCqVrBJuIwGuV5UvVVfFsoRzfh7SPBQFHEKahNpPS7wLiwg3JgWRYWWGOxNkEadij
         DrhX3my5WCupZQW+bErZzigSaG2pgjMTcUYTU5OSGAJNDhdgkN61LneB9k9P7DLRKohR
         eTPQ==
X-Gm-Message-State: ABy/qLZ+7AtrjUXsQIwNrdgo6EbvOWqYh4DOvcpz85vqw4cLWmvZoSo7
	PPWeCmR1W2EgyHdk+qaHq+ma9jBBBvpnrRiNxXY=
X-Google-Smtp-Source: APBJJlE/3ZFMLwVe/bXQBcssVqECwXEStIiC+BgneSCDUPe/2UAJnmYbalsk7mHSx7AXZFSKicxDvw==
X-Received: by 2002:a05:6e02:80c:b0:340:79ff:c1b6 with SMTP id u12-20020a056e02080c00b0034079ffc1b6mr969980ilm.4.1689236684870;
        Thu, 13 Jul 2023 01:24:44 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id g15-20020a05663811cf00b0042afec5be53sm1684052jas.153.2023.07.13.01.24.43
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 01:24:43 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-783546553ddso9571139f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 01:24:43 -0700 (PDT)
X-Received: by 2002:a6b:e70c:0:b0:777:8e86:7702 with SMTP id
 b12-20020a6be70c000000b007778e867702mr1334033ioh.16.1689236683371; Thu, 13
 Jul 2023 01:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com> <20230412115250.164899-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-4-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 16:24:07 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhePNeKY=q3XofzPcbwvyonz-bSuSLDNgsKx088qB3ZJA@mail.gmail.com>
Message-ID: <CAC=S1nhePNeKY=q3XofzPcbwvyonz-bSuSLDNgsKx088qB3ZJA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_012451_931986_EDFB2D3B 
X-CRM114-Status: GOOD (  17.67  )
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

Hi Angelo,

On Wed, Apr 12, 2023 at 7:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Function drm_of_find_panel_or_bridge() is marked as deprecated: since
> the usage of that in this driver exactly corresponds to the new function
> devm_drm_of_get_bridge(), switch to it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 6be65ea21f8f..9025111013d3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1063,10 +1063,9 @@ static int mtk_dpi_probe(struct platform_device *p=
dev)
>         if (dpi->irq <=3D 0)
>                 return -EINVAL;
>
> -       ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -                                         NULL, &dpi->next_bridge);
> -       if (ret)
> -               return ret;
> +       dpi->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0,=
 0);
> +       if (IS_ERR(dpi->next_bridge))
> +               return PTR_ERR(dpi->next_bridge);

The original code doesn't print any log so it's probably fine, but
given you're already at it, perhaps you want to also make use of
dev_err_probe() here?
devm_drm_of_get_bridge() can also pass -EPROBE_DEFER from its wrapped
drm_of_find_panel_or_bridge(). Furthermore, that will make the code
visually align with your previous patch.

But that's just optional, and since this patch works anyway,

Reviewed-by: Fei Shao <fshao@chromium.org>

>
>         dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_n=
ode);
>
> --
> 2.40.0
>
>

