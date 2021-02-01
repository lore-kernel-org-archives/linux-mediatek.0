Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D572C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:55:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E1B164DD8
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E1B164DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xRNvYvnZIe05pzCSnUdNlAVjOrcMFqPdfCl/NoQR12o=; b=1bh6ljPT1TWdz/9Tdv2iQIpRd
	rHpZG1Uz4eXUJZpUgru3Uc15Eak7kFs5ZURcc9VLksGBVDzVUMLT1ZfParOAHZQlDfF+HsyMHKxcl
	erqqe5rPoN+RvdNstGDwVtRufzvn5skZRCesnqNgecsMgEdLtIKCFcrxCbIwgTTlJYb5K3bfHN86Q
	GaWUZGsYkizJoXiVUk1Hhw2wck7wRcGmSQPG2uKFnSAkyxGQvIkj3vspF+9/znODiVBBXGXHcvGrT
	EW7kDYw4yFurhWt9Y6m0PJeeoZMdljM2nlOmH7R/7m2OQXixbNXzpAt/QVXb4SAjMMqd80KLmv3gI
	Yhk16KRJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6SB1-0007gb-3h; Mon, 01 Feb 2021 05:55:07 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6SAw-0007fW-G3
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 05:55:06 +0000
Received: by mail-il1-x129.google.com with SMTP id m20so6972135ilj.13
 for <linux-mediatek@lists.infradead.org>; Sun, 31 Jan 2021 21:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xcfxkt2vV5vJ2sVl9SMRfKcWT/mJaBdrOn2baNl2lbU=;
 b=Np24UsS622Zxz/Kxc02jkiK1zbQNj933ufob5jR1NflrLnK0miPPqnTH5v3KmuCrjf
 8xVFSqNeSXt6is+1OLFRx6zZUKB/c69HOqq+HwB1V968zOEr15a1WcrSpvgWWaaTQOmX
 HJbpgyFlWLU86r9jPBX6p3WyZ27VQ25ZIVjVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xcfxkt2vV5vJ2sVl9SMRfKcWT/mJaBdrOn2baNl2lbU=;
 b=NgaG5eVb8Gr1NICykY/oie99Ga47Lf3OYAd5fhZmFInoioZnQEPWAMbw4GBj8Ctw22
 zSnvmMChTsh1tG4ptpRexxIpfmJkGI5eeTPk8QWUHwuYfvPA886iA2jyLVKoFUp0ZvKr
 +S9XAzSLgf63QI6YfJBZhg9RzryuCMgrIdr7zucfbC2BcUEQUbOQkIvlCdY7SuongGqK
 RbFl/LQUqdz8qEyQ8vJTnQqJas3yKCKE9ZftVD3O3NGPqWD9KgbpMze3DbSBjUL2xY4M
 fvOlI7JlLNQZ4Q1kXZvDeWTGxgU468PxCUPbpxIle7tGPiJB5GNCzeONZtiYptZaRGWx
 L41w==
X-Gm-Message-State: AOAM531+IcGQbf48b1hjOfrfsVuXa1LnsqEMZTJGhgrcOFD1xsrY7w0P
 FRYt/3ikyh1ETLXpfkoEVg535G7qoa4BDNfvXW8vsg==
X-Google-Smtp-Source: ABdhPJyQcc5xV2+Kc+LtL1d25ukxRhKQ6G5J8rLlYWaJCj+IIQLKqJetSVUCQIMP5vaiD3q2SZmzGF52Dlt+oDjGO3o=
X-Received: by 2002:a05:6e02:509:: with SMTP id
 d9mr12085058ils.150.1612158900584; 
 Sun, 31 Jan 2021 21:55:00 -0800 (PST)
MIME-Version: 1.0
References: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
 <20210201054542.1470695-3-Bilal.Wasim@imgtec.com>
In-Reply-To: <20210201054542.1470695-3-Bilal.Wasim@imgtec.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 1 Feb 2021 13:54:34 +0800
Message-ID: <CAJMQK-h-HzSSaLw5nuEYLTZkOER70nU-0GG+y9z5x6i+_VODcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: mediatek: pm-domains: Add domain_supply cap for
 mfg_async PD
To: Bilal Wasim <bilalwasim676@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_005502_592109_20F4607C 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 1, 2021 at 1:45 PM Bilal Wasim <bilalwasim676@gmail.com> wrote:
>
> The mfg_async power domain in mt8173 is used to power up imgtec
> gpu. This domain requires the da9211 regulator to be enabled before
> the power domain can be enabled successfully.
>
> Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

> ---
>  drivers/soc/mediatek/mt8173-pm-domains.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
> index 3e8ee5dabb43..065b8195e7d6 100644
> --- a/drivers/soc/mediatek/mt8173-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8173-pm-domains.h
> @@ -63,6 +63,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>                 .ctl_offs = SPM_MFG_ASYNC_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = 0,
> +               .caps = MTK_SCPD_DOMAIN_SUPPLY,
>         },
>         [MT8173_POWER_DOMAIN_MFG_2D] = {
>                 .sta_mask = PWR_STATUS_MFG_2D,
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
