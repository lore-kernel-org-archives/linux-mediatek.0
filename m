Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDD6D32D81
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2024 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxgsDspc5q1Jni5adG0LIm1mb6Zw1UKHydszhDw5eao=; b=Mea1z1RjTaTgCSi/hvEJrLS5Yi
	DzTvkS/GdrkvnrmoG5kkQe2NLDWACNnH9P8IvOfinMmU8+2D0gnq/9qTZXk/dHFCAfNtI/bAI5Y+9
	vHeOqHSxh9PygXdiF0FyOGrdPItp2mWUouL1NYS4xcZJdUR3LSTkmpXmIUXQ725dBMoDLQVMbLb1H
	Plsz3xDWkSzH0bD9d2ZzAnXBvPivifN73zEw/xMUHLkJehGUg74uddzY7QGJH7r0uUbV9QZW6c2ef
	PsCmAVRZcH6LdzYvuv6zZMEdzBX/w+75idFmPqdj22oSzuKnOGiay5DCJ+ZGZrdqlcpsHlvZsjkDE
	BrB5cTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvyB-00000004cGF-3jps;
	Tue, 12 Nov 2024 18:50:31 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvsK-00000004b8P-44sc
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Nov 2024 18:44:30 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e28fa2807eeso5765244276.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Nov 2024 10:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437067; x=1732041867; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oxgsDspc5q1Jni5adG0LIm1mb6Zw1UKHydszhDw5eao=;
        b=M8TRGJ5sxnbJTCaCYcASKMsJ/pU7u0E+q/Thr3c41tJU+cx6Xuu0EPpXuTF4INCp4v
         aVzfQdpP1ACqhJ9NbVSZ2AFcZxBEtsuPGm+wA89J8nN1PHY/a/ScTKpczKPYWyZMf23c
         AnCXPG0DkLPBf3cROi4u3UBY19yeAiXaBaNeZl2ZDwM+GqqpMGJOxsC8kEdYpLn60jjA
         2QpSafh34vw63dIelN0yvxZubVcov6OeC/XtkXiHW7wS9qQ0vfIl4DRPAbDgMhLp+NM6
         SIAhP/7+zC6ilSpn3Af9uKPTdbu5M8h1ccvXzFAtfx2k0trVneJ6Kba0OBAlnfBkd9qF
         FWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437067; x=1732041867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxgsDspc5q1Jni5adG0LIm1mb6Zw1UKHydszhDw5eao=;
        b=OUJrm/E8fOnpYhjUSE9d94twyt+BGfAplNjG5V33bg0SKQly3N9FAw/qYVvzl6pWR9
         5oZ2FqmXSLN+Fq62kud04cQgqyTvW3xQkzHrQJ1EMRZgqT9S0eLgdYwNklOUGzPbm9TE
         5SaRJSQ+utllPG32f7clLx0kKfok1tbFmj+gtNEIYHNeN4WcCEjYB8AVtRM6LmwzA7yA
         Hf7ZbcwB+oORjKoXR520VRRjlMeSM2EoV3nMBwcD+a/QsEzLEL7Ksdxj6S/ZGFpgou5g
         3t5SFbv4QDMMgi5GNFiiHJzoigQR7RGq+DO3JRcI9/HCqDuCxY8Ndkw+cOZsBdQ9WUnR
         XqMw==
X-Forwarded-Encrypted: i=1; AJvYcCVnHUa7rAzeYcli8Ilt2hN8K/BPWotPVyN/bVJgRp8rLGY4iGH0V0nY076fgdmhSZ3EI1gFApLt7JTXJKZB9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJN36X0pwUs5vHyeOcIokGTqxhoRiHCWTLHsQemWekUcAH4jcd
	y1eaYANX6Pj5cQblUFvn3Is+E/OSqEMqdjitv32dNIHuDrzJh4vqarVqtF86fhrXdO4m70KZnr0
	1cf8gbQtDacWBn1jNVU0swTpP1r8HJBi2YJWUorE6z9L2Pbgp
X-Google-Smtp-Source: AGHT+IFMWgRdxZRJtK+Lo3CBpB+VX1bBIjkAiyKqAQn28lKpDNF2wtZFNkKRtCi41qnWunWXbKSXnRp5CfqY5x5v/NA=
X-Received: by 2002:a05:690c:887:b0:6ea:7e37:8cc3 with SMTP id
 00721157ae682-6ecb31b89b0mr847947b3.2.1731437067438; Tue, 12 Nov 2024
 10:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20241111085039.26527-1-andy-ld.lu@mediatek.com>
In-Reply-To: <20241111085039.26527-1-andy-ld.lu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:43:51 +0100
Message-ID: <CAPDyKFopLrZ2Pn66m-CtjDGOEZyiZ+_i8TnnD4KSHpFqCTN7eg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: Fix MMC_CAP2_CRYPTO flag setting
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	wenbin.mei@mediatek.com, mengqi.zhang@mediatek.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_104429_038288_EF85EA62 
X-CRM114-Status: GOOD (  19.50  )
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

On Mon, 11 Nov 2024 at 09:50, Andy-ld Lu <andy-ld.lu@mediatek.com> wrote:
>
> Currently, the MMC_CAP2_CRYPTO flag is set by default for eMMC hosts.
> However, this flag should not be set for hosts that do not support inline
> encryption.
>
> The 'crypto' clock, as described in the documentation, is used for data
> encryption and decryption. Therefore, only hosts that are configured with
> this 'crypto' clock should have the MMC_CAP2_CRYPTO flag set.
>
> Fixes: 7b438d0377fb ("mmc: mtk-sd: add Inline Crypto Engine clock control")
> Fixes: ed299eda8fbb ("mmc: mtk-sd: fix devm_clk_get_optional usage")
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

This didn't apply on fixes the branch, but only on next. That said, I
have queued this up for next and added a stable tag.

Note that, this means that the fix needs to be backported manually,
but I leave that to you or someone else to take care of.

Thanks and kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 022526a1f754..efb0d2d5716b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2907,7 +2907,8 @@ static int msdc_drv_probe(struct platform_device *pdev)
>                 host->crypto_clk = devm_clk_get_optional(&pdev->dev, "crypto");
>                 if (IS_ERR(host->crypto_clk))
>                         return PTR_ERR(host->crypto_clk);
> -               mmc->caps2 |= MMC_CAP2_CRYPTO;
> +               else if (host->crypto_clk)
> +                       mmc->caps2 |= MMC_CAP2_CRYPTO;
>         }
>
>         host->irq = platform_get_irq(pdev, 0);
> --
> 2.46.0
>

