Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65091C4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKCZke1KMPopQ9RKPdCxdFTkVP9U+Bz1cnxAljvkmYE=; b=HBjQpe22tGm4O5pjhzxOeAUYMx
	/93B2bHefWk1w3/fojSRaIROfMTiTrKk621HSVUHDh4DqE9Pb+N3dTynhNHA/mShjw4fk5F3ewa6M
	LD7/bD9SokMX1XIi7TKTHihuNgDX1Lp4AawiXWflxf4AUxw6ytNmNairrxRrwbFIgdV47MpOQDRi3
	r/nuhxRT8SxR07HY+6qMzX/PtgX6QGSyc6Crgd67BGhym4ob0pR5qaDUQZIXX/G3z+7keD7JBaNUp
	PeIdx9zbT6QUAPOiC/XIDJ9cKztL/btCNfq70kcQWRq71CngISytzDqcXAuOqtIO2D2pyuLos9X0S
	DcYx8e4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMrl-00000007xB5-2zMD;
	Tue, 06 Feb 2024 14:56:05 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMrj-00000007x99-0jJg
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 14:56:04 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-59a45d8ec91so2192192eaf.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 06:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707231360; x=1707836160; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKCZke1KMPopQ9RKPdCxdFTkVP9U+Bz1cnxAljvkmYE=;
        b=GOf3R52gtk5fi3DZL9RJJWTyfw3r4A0czaLcXG/MgBPG2zD9/hZH9ma1IzGLxpw7TZ
         1i/lpSScU4zqX3awZqPzRkbQ6FAMRJBHaVdWyNxNk1u4DTYREiZLYkt8yYGzArbCK139
         gU5XQtayJtxH8SHBsPQI6zqdsKhp57XiO11eYBQoaVfPPlemFrYVtdeKeyp6aa906oD/
         LwqMnBkvUyzAvgrJQE7pPVfI2bSSPwZwzMAqlTglBLL9KxA+o1MKPsYpA13IO0LJxulO
         DDhHgO2UYYf3WwUXm3JHZVNfLqqvrJF2TZtVefTgygkExzGsid8f0lou6r3Psf8g8uxq
         06WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707231360; x=1707836160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKCZke1KMPopQ9RKPdCxdFTkVP9U+Bz1cnxAljvkmYE=;
        b=PWfBlg2CQA6Ruz2Zm+qxSiH+hXfDUiIncLrHeZw9ieFfuuM04ShoKlIJXyouJFvGpR
         1aCJkMxdHiTwHYOh17KvqY0iPna7WOPXLKxmywO4cclI8HyTEH8YhWnZBGAUIh0F5sGI
         j8fyIvg+ojQXOO1pERZA4/McjqR/TCIQJ0qbN9GY9JBYiIvNG/fjdzNghVqNCKsvTawt
         KOe9txMsB5C+gl+Q3NEJaMA4DUTbGyv0PEyyn2Y7VgmF2EsGWmZXY8btVoiv6mk0SYyw
         HQ9Li7IOMmktrpjpIXnFtdy5xwGALF5OMap4vIolNI+IoZpEsO9f5YjMunatK/GYqaoy
         XWEA==
X-Gm-Message-State: AOJu0Yz/w/yaFzp69QhIl7r0x0wf+tAIvtLP9j69Kcsu1VA1q3ZrqCRp
	giMtmNoE6rbjXKVPSLAzRzDR4dD5ztXaVKF2BTXLYYCGlY8VDNF1YGJz8TDWy7OWCscq0lHviFl
	Nqdf5Wtrq0dOr8HvzaArtjthxS4hUHvjhLQA18w==
X-Google-Smtp-Source: AGHT+IEjZNrhvqIStbF4U44ytlGPmSnzsLH2enASrVkowIdVD2zLnzSWnYbwn6i/81EJzWZPXL1iPryIbri0vd8KjCI=
X-Received: by 2002:a05:6359:4113:b0:176:40fb:cf3a with SMTP id
 kh19-20020a056359411300b0017640fbcf3amr2357172rwc.14.1707231360167; Tue, 06
 Feb 2024 06:56:00 -0800 (PST)
MIME-Version: 1.0
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de> <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
 <6e397bf2-1d45-434f-8619-58a737a138e3@web.de>
In-Reply-To: <6e397bf2-1d45-434f-8619-58a737a138e3@web.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 6 Feb 2024 15:55:24 +0100
Message-ID: <CAPDyKFrVgHKXrps5wB3yhOK6JFdBeW8zzYHcQJC1RVs8PXJgOw@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Use devm_platform_ioremap_resource()
 in init_scp()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_065603_260164_55897367 
X-CRM114-Status: GOOD (  18.48  )
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

On Tue, 6 Feb 2024 at 10:21, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 6 Feb 2024 10:05:34 +0100
> Subject: [PATCH v2] pmdomain: mediatek: Use devm_platform_ioremap_resource() in init_scp()
>
> A wrapper function is available since the commit 7945f929f1a77a1c8887a97ca07f87626858ff42
> ("drivers: provide devm_platform_ioremap_resource()").
>
> * Thus reuse existing functionality instead of keeping duplicate source code.
>
> * Delete a local variable which became unnecessary with this refactoring.
>
>
> This issue was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> v2:
> The transformation pattern was adjusted based on advices by known contributors.
>
> Examples:
> * Doug Anderson
> * Geert Uytterhoeven
> * Robin Murphy
>
>
>  drivers/pmdomain/mediatek/mtk-scpsys.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
> index b374d01fdac7..59a7a8c261ed 100644
> --- a/drivers/pmdomain/mediatek/mtk-scpsys.c
> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
> @@ -425,7 +425,6 @@ static struct scp *init_scp(struct platform_device *pdev,
>                         bool bus_prot_reg_update)
>  {
>         struct genpd_onecell_data *pd_data;
> -       struct resource *res;
>         int i, j;
>         struct scp *scp;
>         struct clk *clk[CLK_MAX];
> @@ -441,8 +440,7 @@ static struct scp *init_scp(struct platform_device *pdev,
>
>         scp->dev = &pdev->dev;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       scp->base = devm_ioremap_resource(&pdev->dev, res);
> +       scp->base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(scp->base))
>                 return ERR_CAST(scp->base);
>
> --
> 2.43.0
>

