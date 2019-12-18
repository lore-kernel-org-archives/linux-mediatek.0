Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF98CC43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 14:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B63002176D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 14:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F9s7fJP6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIoDOfee"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B63002176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KC/7CQPJhacbWQgnE5K3DLtTfrzEUgmtJ6vTbsFd50=; b=F9s7fJP6w2kW5t
	zlB0KV3wjjTnkqSHUeV6YgBJZGY7+p0vVa2YCqC/arjHaJjilNZ5hHF47OxHIWs/lv9ACSGebUPdf
	Ogw/2ZWvGsVFS/PWfVnc/5WUwH/RaejFqK1V7GZmuQKdOTZywncffgOKO0hAUe4hb9862wECW21MB
	6XPiws0i5GPAfm9ENEgL9QIZNQa09dNcG2f5OzGPdLHUxmyYkJFgm5vtQ+61veOhTBZyz1LobkyKp
	M9YEe9Ebb653JATwmTfKYNwHKD1dXJIooxMLRz6kLWK63HUVV3igSJeU0ByIbXMhxsh07M8/hgr2x
	BfJmPKASfmW74YL66Ndg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihZuD-0000lI-79; Wed, 18 Dec 2019 14:02:25 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihZuA-0000jr-6a
 for linux-mediatek@lists.infradead.org; Wed, 18 Dec 2019 14:02:23 +0000
Received: by mail-ua1-x944.google.com with SMTP id 1so670851uao.1
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Dec 2019 06:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWfYBni5NvApXaQAN+Sc8AcAyWYbtB1RtpsTw1gA/Ig=;
 b=UIoDOfeeFGo8xJL7UOOA5AiHtOnoVYYX8uWUVSYGlN91z4GJFaIV3YUvfPbrkK6EaC
 kN+uw1xgypetPlU+ZEfU9QyIYqJy3XnYRf1RjpOeMfmO0rhb4J0O1iYnvCySqhlJ67hG
 pBmkr43dD5CdHdXH67Lr6LhaWtSPujA60xbFz71VAA7xD00Bmx0f37SXneXyo/tMTZnY
 wAokPjmzQ2ays98bjhWAL12sbuwFo4dkwmpPPg/isp7TCJVtyOcPNZXgOGZt6mQMSVPZ
 HLFnwFCGNYsQscjiVRnnABGHWMqY5ytLEZAzpE+/8TNkGb9R5VQhp9NsjuRb+GCX8Bq5
 Zfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWfYBni5NvApXaQAN+Sc8AcAyWYbtB1RtpsTw1gA/Ig=;
 b=WujC4QwtuBxCRw781tCGg6CN1Um8WfYytuYRYk7qfs8sEdTgp+QrnIjjxWz6aGH/YE
 xAV5enBsOJ98rVIG+0+0gzAbUFDRJE57c782b2qSSrvioc8RLcR4L67CtqtzZNgxJKtY
 9XbxF4/xEJ16G/asJw48RUJHlm/gGUrnEnA9+mlbc3y8bGbrSaCZCIQjnBgvEEi/XiFi
 wenTviDdjYIiaT5x9yo0V177gq7mY9mVOUp20/kj3GylvUikcTyIq1LxmFO3zgutIC/D
 96C9zNlDFvwyfXM4uKgEAeKb9+BOPHp9pY1isPmpIqt3wlw0dHUJuIVoY20sJCQmMiOA
 73ig==
X-Gm-Message-State: APjAAAXDt3jNQUMbRLVa0zL8QSK+7HoVUDItelm4wiVrHjvMgwA+Xr4b
 s/aVlC0Kb9CHrgtWHj1npDDe9B3DejEwKO8Jf4ItIg==
X-Google-Smtp-Source: APXvYqzlW10cgVZlH4+ozp+d38GOPO+fFsjnBu+gNNFWD1IskWWWrLnsiB7uOFCa5PBl7aGksxtQ4pSl6TsVj61svpo=
X-Received: by 2002:ab0:5510:: with SMTP id t16mr1519430uaa.15.1576677736310; 
 Wed, 18 Dec 2019 06:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
 <20191215175120.3290-10-tiny.windzz@gmail.com>
 <20191218063028.GC3755841@builder>
In-Reply-To: <20191218063028.GC3755841@builder>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Dec 2019 15:01:40 +0100
Message-ID: <CAPDyKFrNXqwHuTNkT-Q9=jswXyPXkNNg9eTWfzv-Rwd1P5JqEA@mail.gmail.com>
Subject: Re: [PATCH 10/13] mmc: sdhci-msm: convert to
 devm_platform_ioremap_resource
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_060222_236684_C5B8E93A 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Andy Gross <agross@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

-trimmed cc list

On Wed, 18 Dec 2019 at 07:30, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sun 15 Dec 09:51 PST 2019, Yangtao Li wrote:
>
> > Use devm_platform_ioremap_resource() to simplify code.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index 3d0bb5e2e09b..6daacef4ceec 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -1746,7 +1746,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> >       struct sdhci_host *host;
> >       struct sdhci_pltfm_host *pltfm_host;
> >       struct sdhci_msm_host *msm_host;
> > -     struct resource *core_memres;
> >       struct clk *clk;
> >       int ret;
> >       u16 host_version, core_minor;
> > @@ -1847,9 +1846,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> >       }
> >
> >       if (!msm_host->mci_removed) {
> > -             core_memres = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > -             msm_host->core_mem = devm_ioremap_resource(&pdev->dev,
> > -                             core_memres);
> > +             msm_host->core_mem = devm_platform_ioremap_resource(pdev, 1);
> >
>
> This would now look better without this empty line.

Good point, I fixed it when applying. No actions needed.

>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>

[...]

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
