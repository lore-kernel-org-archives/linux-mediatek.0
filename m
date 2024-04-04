Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2DECD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OLGHTxDGXllhjSVr+wpHbh0zVlIAwon7mEvnonKBt0=; b=ZHEp8SD3bNjigvd9aq15+rKx1N
	eHEzle+6p0L3A6x5mK7TDs+fL9mpheNhoR/3h0YUoW5WxUUzHhb6eDsztOJ+yIv9eogGh9NkasBNe
	eFIdoPToeRAInHQRhNEzdmgjtIhU4IH6CsTMV4p53I0tyj1bi4oX+22bF2WW4CM+QPKuuuPx5rRaA
	ZibqR5zelUrSe/hmJNjKukJIASGpa5wt1mi4ngfthDRXCTMOKlW7cJA7U6rKxBGrAkXAeXw6vp2RE
	ClsUmKFlo8D77Gt3+dN+MTkO2kvvbLGqKhPntEkX7JHY8YG4uF1m/4msQeomx6vgwExd9Ps2qCH+N
	WzA0qP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKcn-00000002EIi-2DYo;
	Thu, 04 Apr 2024 10:47:17 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKcj-00000002EEu-1hyZ
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Apr 2024 10:47:14 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dbed0710c74so780597276.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Apr 2024 03:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712227623; x=1712832423; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0OLGHTxDGXllhjSVr+wpHbh0zVlIAwon7mEvnonKBt0=;
        b=QXOYkpR/fUU+1TWO7Xf9eB89U+DntslmpwWkbZCpU4BmzsdS5RUX4OsydeUMCVnJTS
         i4h1avqFqQneZZYXi4lb4ohDie3e0rD5CaLqX3ziIievITiWQ1N+Kr7bOGA8pm5fFwYd
         56RdL5Y1aQdtwpmY9dTs4fdLtoFQ3UsqLTbWM/nKjWPT/TXleUs+Mv6J5VONjqrigRrw
         8ZD+l8hiCFuSmNxV86wDw2c86e+GOwh/2AApoCIHsvh0xr5OB5IBLFbjKLEv6qFyqDNs
         ipXLesYUzc5sGurtaeFfj3TNQ1ki/M7M4krVgG+QyD5YdQKYwQdAcGB4xDnURX7mx/aj
         HO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712227623; x=1712832423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OLGHTxDGXllhjSVr+wpHbh0zVlIAwon7mEvnonKBt0=;
        b=h5QwvgGTHuHa6nYVPUHFN3rybiAEFd54hWKuzY/awOTzRXHIw70y6da2JVy2wWCvjY
         WiSOsyW5eVmrNiwGZUp3KRGbBO0CqHFvOg/2Gv304dFMvPIaErSg7wPepG3XINRyyBr3
         /gA+8wZNNbq+NTQ2twxCpdOriIy50HYLmzWev/QXS6L1vnw1Jzv3BXH9GM+qw+4TyB6Z
         e+GQ7EO5ocka7qpgEKxByxeGey1tC3fuzXiMEfyTiNuGmRsRGDiHnwArq7z4eeo1lXtR
         dsakT90/J8AzFlFLqBhf/AvJPuzViSf45LSPxm0MHzOMLcITSEhzzG92Mc2N4+Q+Fe7m
         SsUw==
X-Forwarded-Encrypted: i=1; AJvYcCWIPbjSwY+Mi+LGyEAbNsONcT16leoviPpYwpPx/24Da2QOP1IeLlE3t1C27Q4hJBKRyRhYt+/shNG2x3OULjVdD/kZyrlB/vf0B4iIWJv37Zjw
X-Gm-Message-State: AOJu0YwGRwqPgISk1e9QQ3DNffsTiCNJfFrTacIztVK2gvdsDS5bTOph
	RUan4ELq/WT6gPAP6NyVHh8k6EBwUshO2Mj0r5gMZKwEgMbO8i1/tmu8minAu/okq4qJxOPk/Ph
	oXs+V5d6x4Bw+HF4g+GKWCx8TDuEu08p08Xurl46NYc9gXUND
X-Google-Smtp-Source: AGHT+IHb2ngWJuGXnRgC7Jjqe2VL15KZSHlCl5aI2amVAv9f9Jw4owxwUzrf1g3jQ6SJX9boCj6Pb0Kb6Mg+LWoz51E=
X-Received: by 2002:a25:d045:0:b0:dc7:4b0a:589 with SMTP id
 h66-20020a25d045000000b00dc74b0a0589mr2041087ybg.55.1712227623549; Thu, 04
 Apr 2024 03:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240330211036.100956-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240330211036.100956-1-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Apr 2024 12:46:27 +0200
Message-ID: <CAPDyKFoWO+xUsOb0xDge62kNYu9v18eWBAZ=RgLjWJsgvqMWtQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: scpsys: drop driver owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_034713_495195_E984B045 
X-CRM114-Status: GOOD (  17.14  )
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

On Sat, 30 Mar 2024 at 22:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-scpsys.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
> index 59a7a8c261ed..1a80c1537a43 100644
> --- a/drivers/pmdomain/mediatek/mtk-scpsys.c
> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
> @@ -1138,7 +1138,6 @@ static struct platform_driver scpsys_drv = {
>         .driver = {
>                 .name = "mtk-scpsys",
>                 .suppress_bind_attrs = true,
> -               .owner = THIS_MODULE,
>                 .of_match_table = of_scpsys_match_tbl,
>         },
>  };
> --
> 2.34.1
>

