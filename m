Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3990EB64D9
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXWXkSUzw9+6yEZh83K8PUDQEmfYrr8qCrzZLCEBY/o=; b=vky9Q7DzfhkVadkej4ivtd8tNk
	8YICkMc9u67L9YbkxgxWocR+IGEBSX7Pzccq5654GBBi241ZWFbIf9wxmxkObnF+XHWe8cQNWwMqv
	5Ldtp8rHlP5ttYkFSy16Dff4QDcx5XCmu4LpQS44rcpN1znM/Sf8dAJ+0K9wjJ5uydEB/e3fEYWF5
	MkM0cArA8M2SpAiLJkSe4Mi/AxG7EIP60NenK3tHR7wTrhZF68P/TWLZi4fZLqSPbMoSaXbq1nHEv
	s9hK+Xa6Dcpj45zlgFrBsDF/IIwg9+Ku5pSDKJppfOeSB5wdv004lTyL+lBwNyJrKqAD9YTc/z55N
	wGm3pbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmwS-004xFC-0t;
	Fri, 07 Jul 2023 15:00:16 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmwH-004x8E-1K
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 15:00:07 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-c1aad78d5b2so4698801276.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688742000; x=1691334000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXWXkSUzw9+6yEZh83K8PUDQEmfYrr8qCrzZLCEBY/o=;
        b=jki+DGL7JvgqT4DeMqboGGZ38iarIwXTm5dyf+lNpH2jvgyoY1DbmR2oLjWleDV2tI
         //HuSOQx+LlFfK/8ovnzxODRvl6hxUoNzkQ65+CDssv0s2qSiuj4TihvnWnrahrGOcw2
         isswuDp1fu1xZl0PQRKD+scVHE+JKI92pMDgU9tuq9cO+H26QKZGDCug4YvKpY3wsRHf
         5gIyQ4I9q9Bv2d3u8YvDWMNwtFw+vFXmAKCDW7Pyw68K4h1DI1rCKdMp3wskoKHRJb9i
         Ef9yf4JAWOXRqX9zlUNW6ExsYgxqDmNPBZsHl0VrgUBwa6Uw/qEHcRUTiOpTbEkQbr9o
         LWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688742000; x=1691334000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXWXkSUzw9+6yEZh83K8PUDQEmfYrr8qCrzZLCEBY/o=;
        b=BavZnaGs7T2iSKSL7Z7dvjABAhW/Nuj33KDPidJtY80C1ty8Oi8PrBFBeNSoW2Enrh
         hyyGqcz22sXwArq654Un4PhIGTFM31FEnVrYxsq7+0evIlFxl9lijTnNI5yhgfrM5n0E
         GJSs/wqF1DBSUbArMWty/kjHoyp/mJ1J4MX5YXJEdqdOBPRQ01BOKjtAVkuqdkSy38DY
         fzknnPvrpySPFg4S35poUPBKcsI1tsHGs2kXJbCjAd+UBE5N+RlU2q5PioOTkuFDTzce
         4jdymucCf5Lz5KY9S/3KUaiCnogCIo0kfh+o6efrf9bV+YM3Sjjk9nsgBxv8EjND7cRi
         p71A==
X-Gm-Message-State: ABy/qLa5zMRH0sw+go5L73AyDqVuSJ5njS+yAYCsGskWnVb1hb2fGmFS
	RWzx8KzoiPYBhtTIn2vfRm3ZTfLvJlHDEmljJPI/KA==
X-Google-Smtp-Source: APBJJlE1BZcabAFehqNCs//dqigKyMMoDXX4Syr09uTj4SE7BfYLXhHLaSzqjf58oTSZlAvE8sVD/ilI2HCtgHiWmxk=
X-Received: by 2002:a25:5502:0:b0:bcf:d645:bd9 with SMTP id
 j2-20020a255502000000b00bcfd6450bd9mr4478249ybb.3.1688742000568; Fri, 07 Jul
 2023 08:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-8-ulf.hansson@linaro.org> <0364cab8-25b0-5850-9791-4b0451d2adbe@gmail.com>
In-Reply-To: <0364cab8-25b0-5850-9791-4b0451d2adbe@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 7 Jul 2023 16:59:24 +0200
Message-ID: <CAPDyKFroGAF1rH3HaQXFw2prNWa2Saz73FM0Hsy0pJ=Eojnt0Q@mail.gmail.com>
Subject: Re: [PATCH 07/18] soc: mediatek: Move power-domain drivers to the
 genpd dir
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_080005_484532_DE78246F 
X-CRM114-Status: GOOD (  18.67  )
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

On Fri, 7 Jul 2023 at 16:45, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 07/07/2023 16:04, Ulf Hansson wrote:
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Cc: <linux-mediatek@lists.infradead.org>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> We are missing a complete commit message here, is that intentional?

I was lazy and added the motivations behind this in patch 1. I will
re-spin and fix this.

> It would also need a patch against the maintainers file.

You already have this in the Mediatek SoC section. But I can add the
genpd directory too, to make it explicit if you prefer that?

N:      mtk
N:      mt[2678]
K:      mediatek


>
> Apart from that patch looks good.
>
> Regards,
> Matthias

Thanks!

Kind regards
Uffe

>
> > ---
> >   drivers/genpd/Makefile                              | 1 +
> >   drivers/genpd/mediatek/Makefile                     | 3 +++
> >   drivers/{soc => genpd}/mediatek/mt6795-pm-domains.h | 0
> >   drivers/{soc => genpd}/mediatek/mt8167-pm-domains.h | 0
> >   drivers/{soc => genpd}/mediatek/mt8173-pm-domains.h | 0
> >   drivers/{soc => genpd}/mediatek/mt8183-pm-domains.h | 0
> >   drivers/{soc => genpd}/mediatek/mt8186-pm-domains.h | 0
> >   drivers/{soc => genpd}/mediatek/mt8188-pm-domains.h | 0
> >   drivers/{soc => genpd}/mediatek/mt8192-pm-domains.h | 0
> >   drivers/{soc => genpd}/mediatek/mt8195-pm-domains.h | 0
> >   drivers/{soc => genpd}/mediatek/mtk-pm-domains.c    | 0
> >   drivers/{soc => genpd}/mediatek/mtk-pm-domains.h    | 0
> >   drivers/{soc => genpd}/mediatek/mtk-scpsys.c        | 0
> >   drivers/soc/mediatek/Makefile                       | 2 --
> >   14 files changed, 4 insertions(+), 2 deletions(-)
> >   create mode 100644 drivers/genpd/mediatek/Makefile
> >   rename drivers/{soc => genpd}/mediatek/mt6795-pm-domains.h (100%)
> >   rename drivers/{soc => genpd}/mediatek/mt8167-pm-domains.h (100%)
> >   rename drivers/{soc => genpd}/mediatek/mt8173-pm-domains.h (100%)
> >   rename drivers/{soc => genpd}/mediatek/mt8183-pm-domains.h (100%)
> >   rename drivers/{soc => genpd}/mediatek/mt8186-pm-domains.h (100%)
> >   rename drivers/{soc => genpd}/mediatek/mt8188-pm-domains.h (100%)
> >   rename drivers/{soc => genpd}/mediatek/mt8192-pm-domains.h (100%)
> >   rename drivers/{soc => genpd}/mediatek/mt8195-pm-domains.h (100%)
> >   rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.c (100%)
> >   rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.h (100%)
> >   rename drivers/{soc => genpd}/mediatek/mtk-scpsys.c (100%)
> >
> > diff --git a/drivers/genpd/Makefile b/drivers/genpd/Makefile
> > index 6b9e9fe907f3..1a0a56925756 100644
> > --- a/drivers/genpd/Makefile
> > +++ b/drivers/genpd/Makefile
> > @@ -3,3 +3,4 @@ obj-y                                 += actions/
> >   obj-y                                       += amlogic/
> >   obj-y                                       += apple/
> >   obj-y                                       += bcm/
> > +obj-y                                        += mediatek/
> > diff --git a/drivers/genpd/mediatek/Makefile b/drivers/genpd/mediatek/Makefile
> > new file mode 100644
> > index 000000000000..8cde09e654b3
> > --- /dev/null
> > +++ b/drivers/genpd/mediatek/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_MTK_SCPSYS)             += mtk-scpsys.o
> > +obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS)  += mtk-pm-domains.o
> > diff --git a/drivers/soc/mediatek/mt6795-pm-domains.h b/drivers/genpd/mediatek/mt6795-pm-domains.h
> > similarity index 100%
> > rename from drivers/soc/mediatek/mt6795-pm-domains.h
> > rename to drivers/genpd/mediatek/mt6795-pm-domains.h
> > diff --git a/drivers/soc/mediatek/mt8167-pm-domains.h b/drivers/genpd/mediatek/mt8167-pm-domains.h
> > similarity index 100%
> > rename from drivers/soc/mediatek/mt8167-pm-domains.h
> > rename to drivers/genpd/mediatek/mt8167-pm-domains.h
> > diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/genpd/mediatek/mt8173-pm-domains.h
> > similarity index 100%
> > rename from drivers/soc/mediatek/mt8173-pm-domains.h
> > rename to drivers/genpd/mediatek/mt8173-pm-domains.h
> > diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/genpd/mediatek/mt8183-pm-domains.h
> > similarity index 100%
> > rename from drivers/soc/mediatek/mt8183-pm-domains.h
> > rename to drivers/genpd/mediatek/mt8183-pm-domains.h
> > diff --git a/drivers/soc/mediatek/mt8186-pm-domains.h b/drivers/genpd/mediatek/mt8186-pm-domains.h
> > similarity index 100%
> > rename from drivers/soc/mediatek/mt8186-pm-domains.h
> > rename to drivers/genpd/mediatek/mt8186-pm-domains.h
> > diff --git a/drivers/soc/mediatek/mt8188-pm-domains.h b/drivers/genpd/mediatek/mt8188-pm-domains.h
> > similarity index 100%
> > rename from drivers/soc/mediatek/mt8188-pm-domains.h
> > rename to drivers/genpd/mediatek/mt8188-pm-domains.h
> > diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/genpd/mediatek/mt8192-pm-domains.h
> > similarity index 100%
> > rename from drivers/soc/mediatek/mt8192-pm-domains.h
> > rename to drivers/genpd/mediatek/mt8192-pm-domains.h
> > diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/genpd/mediatek/mt8195-pm-domains.h
> > similarity index 100%
> > rename from drivers/soc/mediatek/mt8195-pm-domains.h
> > rename to drivers/genpd/mediatek/mt8195-pm-domains.h
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/genpd/mediatek/mtk-pm-domains.c
> > similarity index 100%
> > rename from drivers/soc/mediatek/mtk-pm-domains.c
> > rename to drivers/genpd/mediatek/mtk-pm-domains.c
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/genpd/mediatek/mtk-pm-domains.h
> > similarity index 100%
> > rename from drivers/soc/mediatek/mtk-pm-domains.h
> > rename to drivers/genpd/mediatek/mtk-pm-domains.h
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/genpd/mediatek/mtk-scpsys.c
> > similarity index 100%
> > rename from drivers/soc/mediatek/mtk-scpsys.c
> > rename to drivers/genpd/mediatek/mtk-scpsys.c
> > diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> > index 8c0ddacbcde8..9d3ce7878c5c 100644
> > --- a/drivers/soc/mediatek/Makefile
> > +++ b/drivers/soc/mediatek/Makefile
> > @@ -4,8 +4,6 @@ obj-$(CONFIG_MTK_DEVAPC) += mtk-devapc.o
> >   obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> >   obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> >   obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
> > -obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> > -obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
> >   obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> >   obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
> >   obj-$(CONFIG_MTK_SVS) += mtk-svs.o

