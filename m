Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68243C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mpa0JJFe/o1NTNRH559bW26zASUS//4D+MkenPj6ccY=; b=J2NqXuOgPQ7x9Ac0RHKQSHmQZ7
	UgIZMfuf5AoyL+z078gjrRFYA2sOsk66KCqGp6Lo31i/ofKi4hVKFYVHTe/ThxXshrXQTshWx8zit
	U5UkBVMG0sdbWATY+HFjnxkZBwjF7e4XXbfRr8cTHH42aDn6tunqjv7Y8qTq3mD2OE7Q96qJl5d29
	7tfF9ijMy7DUHzLP+JF3Se32FvJdUjKRpFHqnezHxvoTtuXVL5MdKVQVlDuv2ppRPDoLAoAWcODJc
	AUk0tTkwDwLSVdkR3QU1XeeZl2l9TYOhoF5fR/4Ftn3BSxiraU2rev+MfDDYOc4oORf8f/b+RgXwf
	VUT0OlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFwU-00ACLG-1d; Tue, 26 Jul 2022 08:29:26 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFvu-00ABkK-KD
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 08:28:51 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-31d85f82f0bso134532397b3.7
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 01:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mpa0JJFe/o1NTNRH559bW26zASUS//4D+MkenPj6ccY=;
        b=NPBwEfUBCABSz/L5Nbv6D0DQrO1qPm6dRPo/VTF8+3ZhxPPLspDa5r3XzhL91UUbgZ
         C6hqxWR6qkZsRA5tWTHaXxV6w7BwSskbOhGavwZJZxc366i2rULgNDyDS47jHBpPs88T
         juL91n6JeqJkwcVPRD2R/VAWhRT9R/w7URX1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mpa0JJFe/o1NTNRH559bW26zASUS//4D+MkenPj6ccY=;
        b=mQdXdlDyzailCDgxeeV8wjzsd1aaKfM2utqwzWvKcw8x6LBLIJt8jlcgNRHDjjGMkG
         F/TXFfDVLzFhcBKlugk1Is1Of9s5AVhrhCAo8e42I+8p/W90MoMKRYoOfnA3v2iBh5+5
         oxv0GEMk0c+VNj9uuIGGTpqGlqHQYC45KXSf17m3kb9bKzKPYjqwlu+SevzuM0xsSZFu
         sjKpOn/5B1NlVqfzQCMm9cUm/eACsY10iQr4w9c5eBp1p3bPra/54Epa1qExRvXsrJDQ
         AcCsO71DwqdV3Tj0d7zNhVA/T52SnN1G/URXWNup5uxBYt04H/pNsjy6vKWveV55dGud
         +LdQ==
X-Gm-Message-State: AJIora9Cm5Zhgn+E8SELjj0ySOHzAfr/GNVqQ2tWVTPCRdpuIYNcZGgf
	ahUS4AMHFLogSPRbD5fVJH+mBKDAjV7PpjndafK3+Q==
X-Google-Smtp-Source: AGRyM1vbFoxeFP4mjwVafsVB5gCnLN7fmZeHslKq8kf0Vhi4/DmExu7sBa48+WYtAYdFfbxIYBqWMUp+WyJf2odrXfU=
X-Received: by 2002:a81:6c94:0:b0:31f:517e:c6ef with SMTP id
 h142-20020a816c94000000b0031f517ec6efmr276610ywc.165.1658824128277; Tue, 26
 Jul 2022 01:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220726040155.17206-1-yunfei.dong@mediatek.com> <20220726040155.17206-3-yunfei.dong@mediatek.com>
In-Reply-To: <20220726040155.17206-3-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 26 Jul 2022 16:28:37 +0800
Message-ID: <CAGXv+5FdYKNqG6TQawWpiH29oSAPdZFAy1wHM=qkqDDSbs2CUw@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Add mt8188 decoder's chip name
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	George Sun <george.sun@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Irui Wang <irui.wang@mediatek.com>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_012850_679682_5E0B1342 
X-CRM114-Status: GOOD (  16.52  )
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

On Tue, Jul 26, 2022 at 12:02 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Getting mt8188's chip name according to decoder compatible name.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

This should be squashed with the previous patch adding the compatible
to the driver.

> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 7d194a476713..641f533c417f 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -227,6 +227,8 @@ static int mtk_vcodec_dec_get_chip_name(void *priv)
>                 return 8195;
>         else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
>                 return 8186;
> +       else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
> +               return 8188;
>         else
>                 return 8173;
>  }
> --
> 2.25.1
>

