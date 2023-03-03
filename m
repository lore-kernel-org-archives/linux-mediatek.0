Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8C1C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8M4JJhK7OCXpM9WO1V+URKM7Lv3jQVkaIfYcDZqUPng=; b=OBuUezF4judrAzc+BYfxKpAwDB
	F6V22D59vh+s6JsEZngOB+fCEzq6IddvONn7TkvrLl4Ez7W+XgAeRPqgDI0B8S/sSLcG18MIHMXfX
	TTgCW92jfppkHte+7EJDppq14K30n9eFO7TIulN0VOcba7wOrqfYcHRHJSSM3jgF6z46X7oCrgwJq
	7/SwT3c4HKC7RJEJVouN8wD/z+Te2ITgSdBkyushliREKxoabyGwuXCuoIKYlIwPdYnjUY0795zib
	wtN5iXMZTClpvGKd8UexYLPwuNdV4DcsjQyB5QoWpO7xzbpUupl9ch/TBrWv1CyaEZNg2322umsLs
	iwEcqMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYA1J-00791b-1X; Fri, 03 Mar 2023 18:20:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYA18-0078zN-Vu
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 18:20:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id j2so3142154wrh.9
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Mar 2023 10:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677867626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8M4JJhK7OCXpM9WO1V+URKM7Lv3jQVkaIfYcDZqUPng=;
        b=IvX4709SpETHwKZnaZ/VUBhGBnb3edIHYGjmnRTo1BR7Tt1xe823j2DQZTJ2WkNzK/
         R5cpZFgbjIPciEMfKgv3NrYpZemZHbPp9Icf90pImph3WUIV+WDqmvGjINefz1TBaRa6
         k/KQ2xsxWpgC9qzNcLTZlg/ZelSOQaxs+k6RYznEhGkEpU3bEguAOIWlzQdlyb5H1xtE
         VhM3dxPKFeXIwpkmDHby9jXRGvqEma7hrM/d1JolXyCnXd0dnBQPWdb7RrSxvJV3t/CI
         9pQTFRbY/5f5mK4RpUa+g9wxO53l8IjMJHYNBgiJUFgre7filrwaTOQ3mkJgtG3+sjO2
         kQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677867626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8M4JJhK7OCXpM9WO1V+URKM7Lv3jQVkaIfYcDZqUPng=;
        b=pT046mleEeA7InXiNra0em7nYmqABKg7m5KoQvgin5M5v8XiM9Owcigh3MX4SbMbGr
         9ZbLwZ/2XdVw8JiwaDTMQNSxgoZhTeQPZJdQk3UUlPif5dTF+U3fVHHUH0qEyn9gulaZ
         Lkaa7Ru2PlE8bglg1e8PUQqSDYlW/3dXHNoWnrd9cZNnvdonHAfYsubuJwGoRKlkxzb6
         le2MksBOnS/cxUXTQNzuOcz/mQRnohi/Dht5lOXiFMwzXel31oeLx+ADpMS1YrSuRNAr
         OPn8XNc3QFffClef6OLHiVV9BIUOMFYdlCrSCRsILZl4w9b5/pz/QRBYPIeJyxb6D5aS
         bSFA==
X-Gm-Message-State: AO0yUKUc8udU550mR7wv/hLHrHlNd50T7f3ZX/97WlQ3XhmO0Qeai9d0
	hVmNrrZ+x+7nuzknTF028dRgX6UaarANJQ0T64OeLQ==
X-Google-Smtp-Source: AK7set8oEHzqOqPD7jWE2EaUZk7vGnHcVw/OgqgaNvamVgg81oFWY/hFsoF4Gpyn8OzLm2vrZQT2ciIRG5AFFD0W2TQ=
X-Received: by 2002:a5d:4347:0:b0:2c7:1320:7781 with SMTP id
 u7-20020a5d4347000000b002c713207781mr635648wrr.13.1677867626499; Fri, 03 Mar
 2023 10:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20230303102751.9374-1-jason-ch.chen@mediatek.com>
In-Reply-To: <20230303102751.9374-1-jason-ch.chen@mediatek.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 3 Mar 2023 11:20:15 -0700
Message-ID: <CANLsYky0pbqiEfq7E6DZM=J+sm2JJ8gYST2atUyP8X7y9zdHWA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mediatek: Dereferencing a pointer that might
 be NULL
To: Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_102031_090492_BAF4317B 
X-CRM114-Status: GOOD (  16.86  )
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

On Fri, 3 Mar 2023 at 03:28, Jason-ch Chen <jason-ch.chen@mediatek.com> wrote:
>
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
>
> The res might be NULL when calling resource_size.
>

"resource_size" ?  What is that?

> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index eacdf241f4ef..863d18f63f58 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -829,6 +829,9 @@ static int scp_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, scp);
>
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> +       if (!res)
> +               return -ENODEV;
> +

Please have a look at the implementation of devm_ioremap_resource()
along with the function it calls and let me know if your patch is
needed.

>         scp->sram_base = devm_ioremap_resource(dev, res);
>         if (IS_ERR((__force void *)scp->sram_base)) {
>                 dev_err(dev, "Failed to parse and map sram memory\n");
> --
> 2.37.3
>

