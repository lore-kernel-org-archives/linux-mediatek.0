Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8DBFA3748
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVpICAxbAun/Z86wk5H+tZRi+f2zjk20FqIxJDRTlCY=; b=3E1Ddw6YqAKzTFAgCituQyai+p
	1rfp5JWGTRTrr1vGQlh1sCnangTri2TwI8ze8k4HR81lzU75kejKYX0WlpO2ryhXPszdONySiU4oH
	NqGWXRlYbZ24CmifBF5fXDKGpn4QmsPDjzzK9NLNVg2u9mvmpQwnNKHQivmrQ7f9U1qWMQ4j5ZB+/
	Mk48yBeMSsOYJoBZ8+fBRMM2bSW1qUzG4Ix8qowL9cfYY0xx2tH+UDTUZButW2jKjmSOLnpNMHJc4
	tfbWAtNGicKEaEG3S2sDP2eghGbzUNUxLiaArVWSaW8jusCn1OTWluePipvUadyOPmiX/fi6xnGOQ
	bK1JlSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp54T-0000000Fpa4-1Xwq;
	Fri, 13 Sep 2024 12:06:41 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp50S-0000000Fooa-1gzs
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 12:02:33 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e1d0e1bffc8so1993662276.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726228951; x=1726833751; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zVpICAxbAun/Z86wk5H+tZRi+f2zjk20FqIxJDRTlCY=;
        b=K4Hw3gglN0+ZFkTV55VOpIlRmpiyT5XaWqeMmplifb167lPZACtUm5Tk7x9CuuXoeT
         rp8SAKxBayAUnwUIYHhwqpdorHIySsTPjjpO9iDXAEt2K5Q4NmfO2SABBJ7OgLznIXOc
         ii7cRzWI9MvjFtx5dwRffUW9jFJiJKrnaMqkhMngholEZnOeITOPbxr2aPbPPRIPqG6e
         2RIE6m/gCdcroG2meUMZY4rtaBpzpPLPJkuVK018JH4kJpfy5xYDSGeJjkMW94HTjQaS
         hQegLWz+qYa1ujPwAZL+yHyxj2DVaiQ66Iqv0AVo1TjIqcH61+lPmVKyQGYy74nxpojz
         86lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726228951; x=1726833751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVpICAxbAun/Z86wk5H+tZRi+f2zjk20FqIxJDRTlCY=;
        b=cnsjz7iJZZkh9DUW1e/cFUtmLWnUBD0YpvwrfhUaB5F9B2cyK+GTFVBNowhosyZe15
         vKvbUG6QHnAiFczgDN2MZucQf33rG3FHYWQftz5SrvjVl+DEo2gIrFVUWljku4F2benB
         E0gIpCQatpknv/TCpLCUMt9d2/0WF7llYGBcwPe0XWDY5Uz4meQrwoVU9OR7gTPZfAkP
         JXFOjcP4dozQHXutSFkeWWSwaNEKD3U/1Nh4hK1xuoouAzjMvtXAG0vAmEGiCTlRTwm3
         lLc7mBgQJ7gV0QBHTIH0iU6htQVFguU3UbKoV9hts8kYz3Tw22X9370SkPQBqD2W89tJ
         wD0w==
X-Forwarded-Encrypted: i=1; AJvYcCWV/IcyCeWce58T7dwnEeRYXbArEItX2R6vMNdoK6l04y+Zmc0w46mQZ8MBGbpmQ8IsQq2IdGOPKWJ1M0nywQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywog/G+4LVhdMKx5fwSWvercpM9Vfz5h12I4MZRzkwPOBc7ri7Z
	wQ3OlECIdggo6UbDu4f3/cPOqVtWW8NGkO7ja/kyn7fp7KeE+mWj36SK4UEGxEgYsp1INYeHw+G
	gn6YD9zELfiwhVCkBEZBA9Y2UEIKAqsEO8jprxA==
X-Google-Smtp-Source: AGHT+IGXoMXQAwpn2Ow05AMk5gmTy19hcKor5+jT+80wySjeRS1y7hnBDOOxnb0xBEgQdVhR8e9tNlcK+rkTo9yNS68=
X-Received: by 2002:a05:690c:4a02:b0:6b5:916d:597 with SMTP id
 00721157ae682-6dbb6b236d4mr57262927b3.22.1726228951054; Fri, 13 Sep 2024
 05:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240828121230.3696315-1-lihongbo22@huawei.com>
In-Reply-To: <20240828121230.3696315-1-lihongbo22@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Sep 2024 14:01:55 +0200
Message-ID: <CAPDyKFoy_5qHANFOoQGk0hvHOMrWiOp4p4aqpUTWyAFWiJdh4Q@mail.gmail.com>
Subject: Re: [PATCH -next] pmdomain: mediatek: make use of dev_err_cast_probe()
To: Hongbo Li <lihongbo22@huawei.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_050232_462334_8124041A 
X-CRM114-Status: GOOD (  15.22  )
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

On Wed, 28 Aug 2024 at 14:04, Hongbo Li <lihongbo22@huawei.com> wrote:
>
> Using dev_err_cast_probe() to simplify the code.
>
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index e274e3315fe7..88406e9ac63c 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -398,12 +398,10 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>                 scpsys->dev->of_node = node;
>                 pd->supply = devm_regulator_get(scpsys->dev, "domain");
>                 scpsys->dev->of_node = root_node;
> -               if (IS_ERR(pd->supply)) {
> -                       dev_err_probe(scpsys->dev, PTR_ERR(pd->supply),
> +               if (IS_ERR(pd->supply))
> +                       return dev_err_cast_probe(scpsys->dev, pd->supply,
>                                       "%pOF: failed to get power supply.\n",
>                                       node);
> -                       return ERR_CAST(pd->supply);
> -               }
>         }
>
>         pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
> --
> 2.34.1
>

