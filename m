Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F70D33A20
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/5k2rLKTo7KgnD4BR9+2dIjyjzlQVVkq8ThtV9wFto=; b=kEPZZkGhoo62UCm4dIljDZKPpu
	4fR2VKltT7TAMOFRUl0p/iXJ6Z8mEo+ayVhaOmnsNhert6cu8xiE5sxGqsNfB7yDP2TJqj7TucJ4a
	nBPWQgc23G2QtpW1ctoHkZxcIQiHH1FXVy213sfj983sWCKlOLdUlPJcIJM2gjwu3l0RJO30cyta2
	zcM2uA50acFBuj+5O60lV7gJ7IbE7ipWOu7wz1jchwFh+f9t5J6brW2pUT8rrqi9hxCvb5gCdvIwU
	VvhLj4rrewGDNvVS0pRSwhtRlUk/Hcp2nQJMg2KMGrrDz4Ib4KLDCUiSlJKkiMEHK2Q4jRwSW9AK9
	EDwXwE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OY0-00000000R2v-13Z6;
	Tue, 05 Nov 2024 18:45:00 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OVi-00000000QBL-0K61
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 18:42:44 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a4d1633df9so19650895ab.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Nov 2024 10:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730832156; x=1731436956; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/5k2rLKTo7KgnD4BR9+2dIjyjzlQVVkq8ThtV9wFto=;
        b=MzHOhaibyZhL6RpROdjkZWnt2KBGOyUm0RgOlT5FIyhsYtvh98fz1/oLNV8L52VKul
         HtiOUlDruj9+XkS8BdpDuBcxuePmSHpz4VAU9TCAhYO0lchn5goZ7sH5qNtdQsi8FS16
         f5IoTV2sw2Bf330uj3sYS4TIgd3KksH9m45ErvLIt6pnt1Oz4ncKPBhAhpFBCDe70rMy
         BF+6x4o8R72qZ7KV+Yl0QCJyT24P7sQrLG/maADC5f5jFvk04My68/lZhzDu8bHB2JFQ
         hlwuSXJsYD+ntsE+cOm5q1ZKNlLyV1/mmhZxkAtjd7+3HdJZuXttGcqC/DxVyVOM5aKK
         oQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832156; x=1731436956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/5k2rLKTo7KgnD4BR9+2dIjyjzlQVVkq8ThtV9wFto=;
        b=fozZwXWd1hnR6HWby6vvn+qDNCsXNHIVMt9Pm34I3j9BVB/36WAOGxaPB5QDJRzZXZ
         iN9ohPRSL9PMaaTNyc5K1GX/bFYxlVnhoS2heSLazL44HU5Oq3o3e3AyPJngnW+cRP3+
         TlJRZOutnVO7DQC9pRRYI/HcRrh/TJcOQmG13L515qcBAYrZsMnfOln8U5KPJSrosdR4
         WKodhTlmbze5ahppF230u0ZIBaa/rhJ4boLZwzasJlzgcHvEO3wAuOmP/RaYzUDnMrCS
         uAr5kg8/sO2TTICmy9Mkz/nvd899KQIx73dE6ooPmfnJ/tOeqf09IlMHoN+i46Wev2fV
         9P2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4ivpz0Vp1kPjJiPhHrtMOWffoDYGwbmLsuQx25UubuBnW+suNKPDIDlMMHsFnzzdos/m6gDRFlXUJWagoLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yynu8Skf5mhV8hyadhTbYO1KaJhklPyvgXkHWCwNehr0P0lJ9Bb
	P4oZrPB44dkZZnjwYWBFJVNhaP2vUFj9mHSXIA2vhBZdJTd44EjWaFLmaWUMkwLD+UPjpU8/e2f
	0wPBo2JB6TCXeVkJZcSSw9vOi0fpN/pxo8EppWw==
X-Google-Smtp-Source: AGHT+IHafiE56RLycAX61PwBNuvy4TPzSnAPrcXkk0qt/3LnY4O4q/UmngQM9Vlm/dj0VEmvvCeNfFq4tqlEFF5LAvc=
X-Received: by 2002:a05:6e02:152e:b0:3a6:b445:dc9c with SMTP id
 e9e14a558f8ab-3a6b445decemr144631815ab.3.1730832155951; Tue, 05 Nov 2024
 10:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20241104064650.799122-2-u.kleine-koenig@baylibre.com> <6b5b4f25-0f42-4f83-b6b5-82c1adbefe83@arm.com>
In-Reply-To: <6b5b4f25-0f42-4f83-b6b5-82c1adbefe83@arm.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 Nov 2024 10:42:25 -0800
Message-ID: <CAH2o1u77TViePZ2eh+FY7oQXxFAp+SEVM38ROP1uKfeMZ9E7hg@mail.gmail.com>
Subject: Re: [PATCH] iommu: Switch back to struct platform_driver::remove()
To: Robin Murphy <robin.murphy@arm.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Clark <robdclark@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Michael Shavit <mshavit@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Georgi Djakov <quic_c_gdjako@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_104238_710076_B45B6236 
X-CRM114-Status: GOOD (  11.89  )
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

> > diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> > index da336863f152..382ba2841849 100644
> > --- a/drivers/iommu/riscv/iommu-platform.c
> > +++ b/drivers/iommu/riscv/iommu-platform.c
> > @@ -81,7 +81,7 @@ static const struct of_device_id riscv_iommu_of_match[] = {
> >
> >   static struct platform_driver riscv_iommu_platform_driver = {
> >       .probe = riscv_iommu_platform_probe,
> > -     .remove_new = riscv_iommu_platform_remove,
> > +     .remove = riscv_iommu_platform_remove,
> >       .driver = {
> >               .name = "riscv,iommu",
> >               .of_match_table = riscv_iommu_of_match,
> > diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
> > index a2f4ffe6d949..e84806eee281 100644
> > --- a/drivers/iommu/sprd-iommu.c
> > +++ b/drivers/iommu/sprd-iommu.c
> > @@ -531,7 +531,7 @@ static struct platform_driver sprd_iommu_driver = {
> >               .suppress_bind_attrs = true,
> >       },
> >       .probe  = sprd_iommu_probe,
> > -     .remove_new = sprd_iommu_remove,
> > +     .remove = sprd_iommu_remove,
> >   };
> >   module_platform_driver(sprd_iommu_driver);
> >
> > base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c
>

Thanks, LGTM for iommu/riscv part of the patch.

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>

