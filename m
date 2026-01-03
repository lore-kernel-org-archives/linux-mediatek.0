Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F048FC617D
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jan 2026 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHxJTJ6jLGr4jRZYNFd3Wgy5zhSvQPzyDXSFu1NA0Mk=; b=OendCehbgiQiK+Xsq+E5PGYUG6
	VbgWaGNTs8h8W+36IZsFwE/48tt2QPMtTn3UtoKjQFip0CbLrSfsDPqx+9uGyTYfLSJsj+nwCimOO
	zFZO8DmxDAoHsoLgbgYUpIaNbk9OzBt+Rif7zwbHOEhrFWIrC9U3qZOZ7VcKO2B9EDT0ut1Kt3P97
	FnfimV65Czu887MuX/cpBUcE+WWSgedxBBLbSHmAAO4gjWwUjpyDB/bAeMTC9ZeB5QSCbax7Mlq9+
	G9zCq4SHA3LRve4EUnKjY3Wj910MPsGszdGbzgR3t6+AyH2v65pXOWE/E/rwJY3IMkpJNTSfg11bV
	8btmBASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyTy-00000009BIC-0Gqu;
	Sat, 03 Jan 2026 10:03:38 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyTu-00000009BFT-0V00
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Jan 2026 10:03:36 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5943d20f352so13449615e87.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Jan 2026 02:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767434612; x=1768039412; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HHxJTJ6jLGr4jRZYNFd3Wgy5zhSvQPzyDXSFu1NA0Mk=;
        b=oj365sEadk0vhXqiW0DKcGXhoIsIlGVbgRn2jlDR1Qe48phuNq4GjxJSujCZwOmuXN
         tosLHi/0alYayRX7XDRaoRC52iY68U/xF0mgjaKtQIl6vAqZ3b5My8wfiN/yp7KdVJli
         RQqBkeqX20Y5Q308Fvq9jzY4R7h3AvryxyiinNopqs7aC+PIIhTCFH9ZUDx2GowWbHTi
         kI0JULlLSCwtt9bPnbQG4tSrn5/KtqVQwLAXqyj5GwN8ZZ5yRW8eqRvFGhTKlnYNudAs
         Y6YCRWOx75TKfNwkRWZ+20+FfZBiUGx863OaL5qRLGLdeb9KqvH+3feSecoSs3N9gMRu
         VkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767434612; x=1768039412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHxJTJ6jLGr4jRZYNFd3Wgy5zhSvQPzyDXSFu1NA0Mk=;
        b=Pfh1ouefzJ6hlCwCzu5ummdONTf9dPz2qRqG1EWgOxo6sZvzStLBQWfKp6BEJx70tY
         soIw4fy+6e2x6k3FkJFMu6TQAINMl2AqSMPSu82Dk/LLTKpRNsOv3WytKQw4pLr4rMCo
         zLobUMfaeXLPJpJS4zjvgxfWFAWobE1ztbaPTa4A77bhiaYgMPfpA+IUbhLImv9418UW
         f3yGgaVF/+ZSv8m5e+b0v/KDMRCqi3oPDo7gkYjDZjkstyP5M1IS+lmxJ0p5a8XTCUDa
         1/pNOxWxwpDZhLVBZItCqWfwlLWZxVzVDsw5+6pHUD+kOsosraUC4kM2i8x3/gs7wkSs
         CrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0YiZrPaUGcU4h6HasG2bvQo7YysswpR820VKyHhhmIFqh8sWs3thyAlLf43Q28Q/sxHuYO5i5hIWcbc+5Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl29xFnh8J04HOIrDPkokl8lA7tXOdThlZPBJQA3Vthpv6W+fl
	/n7WlrkC12+hvO6i9r+mz0h6UEh63pkV26oPNqX8KQiPhIk0FskghE4udr/pMAEVa0czRNZCXkQ
	CPGxJmkILi0OXr0r72085ARCG8fYk3rcRHhYyNKLXsw==
X-Gm-Gg: AY/fxX6n0dUpcU8S9S5AaaxwnLDYZztOkNmZ8E93uVcQvByzUmcqioMIYhwmrt1c7us
	m2m044RppKUPdSS8F4s9QgjA2GvfSijEiFoBA5t8GXF5DMoB7pvtdBeh2hKIu5HIWbP2krAiDrh
	wDLl3WvKtpI5KBkZ0QmxpEX+irjk2gm5gf+G9LGNBwaadhAveI3ZSrDRypKACSJATpVYaabuWZR
	93Q9k2V98kIREWXJVizCO1GPIZPXJ7HKQdzAKAxsQFPx84hsWH06boupY9RJvc4iePq0wfN
X-Google-Smtp-Source: AGHT+IHTuUDA2frL2lWGCTN+qAVB9fALj4UxhdOgtU5kDcFiw+PtpJTP7vF0X8xaSzS7IFgYXZBQXy2NaxWawmUtdow=
X-Received: by 2002:a05:6512:ac9:b0:594:2c42:abaf with SMTP id
 2adb3069b0e04-59a17ddb4a1mr17911978e87.34.1767434611895; Sat, 03 Jan 2026
 02:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20260102124840.64424-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260102124840.64424-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sat, 3 Jan 2026 11:02:56 +0100
X-Gm-Features: AQt7F2o_tAyNn2nFZ_Fhmspn1PF6naWnC3_O52iyThpjfOwNV7jebNizhJNd23k
Message-ID: <CAPDyKFp9zYd+-LyTEka8UwcBeAnOWug_Kiy=K4J0GCL+DBWrhg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_020334_168617_59859B08 
X-CRM114-Status: GOOD (  16.71  )
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

On Fri, 2 Jan 2026 at 13:48, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 80561d27f2b2..ab2514c78c14 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1191,7 +1191,6 @@ static int scpsys_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct device_node *np = dev->of_node;
>         const struct scpsys_soc_data *soc;
> -       struct device_node *node;
>         struct device *parent;
>         struct scpsys *scpsys;
>         int num_domains, ret;
> @@ -1235,21 +1234,18 @@ static int scpsys_probe(struct platform_device *pdev)
>                 return ret;
>
>         ret = -ENODEV;
> -       for_each_available_child_of_node(np, node) {
> +       for_each_available_child_of_node_scoped(np, node) {
>                 struct generic_pm_domain *domain;
>
>                 domain = scpsys_add_one_domain(scpsys, node);
>                 if (IS_ERR(domain)) {
>                         ret = PTR_ERR(domain);
> -                       of_node_put(node);
>                         goto err_cleanup_domains;
>                 }
>
>                 ret = scpsys_add_subdomain(scpsys, node);
> -               if (ret) {
> -                       of_node_put(node);
> +               if (ret)
>                         goto err_cleanup_domains;
> -               }
>         }
>
>         if (ret) {
> --
> 2.51.0
>

