Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808CDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 04:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ss4b06nAW4SWOJFDwv5RB34Kw13m9/4C2b1cu04YeqQ=; b=bBd+K9OzPi3Tl/
	SsvXDT4DOgXXXOdjBAGGg50EZYvAUoP934bP+bZvILXpd2KS4xF22JmXlTg8an0zwJWptjTzcG+QJ
	flvuvLql/lNZqLLg19ESycKVdm97/l0EQxz8vQC1XhH/THAG1kmZzaB+8t+Ol93KVxiquTwwhkxjh
	Uce4CW0R/pmxwHWtqnWeK/lUKDRdZBEqOjYR+QXispYKV3CyRPLrDNRqK/9AAPLZjB5VPTzocXVUr
	2OgRXcOrOivoLbxvQ9RfRQIbpj9TcRdNsFW3Nj4obdRytPdazBDugO4qKyGvL9egfz728camHMG+9
	hgZ7N0jiZC0IaomZ/DUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM0OQ-003QRo-Ba; Mon, 21 Feb 2022 04:33:46 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM0OE-003QPU-2x
 for linux-mediatek@lists.infradead.org; Mon, 21 Feb 2022 04:33:35 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id d21so9448036yba.11
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Feb 2022 20:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pdVq/Bdju/XC3p7Tx9JRaqrYCFKoB7DXdAQOIXXijT4=;
 b=naEhAVvrNt77acZbiRcdvLw9DUHG1yd9cyyOYNcTREEtbyqkSwJishzXaT+hboEl0f
 pRAGC110oUcocsibxGhLWW22/wL6NFl0CN/DOPolL3EvpDgA5OlsH+Ibtjpdgc/92VwQ
 yutTelFbAq4+BBhwkSH2b9dLMUqZtuzN+NwZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pdVq/Bdju/XC3p7Tx9JRaqrYCFKoB7DXdAQOIXXijT4=;
 b=E15/O2uVzTJCSU7wTduPhoCkr+lxcL79xnXEoO8oMh8lOx1Ld2lOY25m2SumLbdB7W
 l72hAvMLJGRM5LJ/fG/W58z1dp5NollntsSxM7x4RsF+HFEcoVWzdLVJd4eqpi2Qvix8
 v/ev8gkBR89EROohtZY7/Yb+mu9Zz+pkfTRva7926UFj+efeYj4mksIV8yuoVzbevJR+
 uq65EJcFqGTj9O8KedG2T89lzGIZs04YqFRlZO3J//Osu3dzs6yc92izxglsYeUKoIWY
 XtUfirGy2mZF8Dsfur2zOewCqCSttz4NbNZsQnffH6A7zuvBNVrNBo8F8TTJTdyXaiDS
 +0UQ==
X-Gm-Message-State: AOAM532ZdNjmMjCHZcjg06RjDNX/ttV7lUB02qj7N1MIN9wfO7byTwTx
 5RERyNcJ9jQII32siqMk0EWd3iSXR5i6MREl3DXgtQ==
X-Google-Smtp-Source: ABdhPJwYJZ5wFox2PhJi/05KzYq+SwjE0uRDqCM8m4JmRQqsV2jvXhBNYy4J1vCdqamz5hOFvoAJtCr6mI5+C8RlNaw=
X-Received: by 2002:a25:a486:0:b0:61d:a523:acd0 with SMTP id
 g6-20020a25a486000000b0061da523acd0mr16404502ybi.203.1645418013253; Sun, 20
 Feb 2022 20:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
 <20220210141931.291712-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Feb 2022 12:33:22 +0800
Message-ID: <CAGXv+5Gmzu-w0Oi8dUv-a6v1=S8L5otgCfppbAXm1g+jMZFj8Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: mediatek: common-v1: Add common probe
 function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_203334_165676_35B8D7C2 
X-CRM114-Status: GOOD (  17.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 10, 2022 at 10:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> As a preparation to cleanup the probe mechanism of mediatek pinctrl
> drivers that are using the v1 controller, add a common probe function
> to this driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

but

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 11 +++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  2 ++
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 6f8dfa6ae5a0..007da39b68c9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1115,3 +1115,14 @@ int mtk_pctrl_init(struct platform_device *pdev,
>         gpiochip_remove(pctl->chip);
>         return ret;
>  }
> +
> +int mtk_pctrl_common_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       const struct mtk_pinctrl_devdata *data = device_get_match_data(dev);
> +
> +       if (!data)
> +               return -ENOENT;

This is probably bikeshedding, but it seems most other drivers use -ENODEV
or -EINVAL. -ENOENT is seldomly used in this context.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
