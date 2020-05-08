Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A51C38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 05:06:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC43F21582
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 05:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WMWoysSi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yOR+kZsO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC43F21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbuLqD9tC5P4Df0j5qPJlIYuI3/uQ1e1P49ZJLPEz30=; b=WMWoysSiQWWV6j
	wJF2F+vC84gNdlNubE2IJRvoN0vbEQWfSs5ufHC4pjiXxuit80X3kDK5ZhS4B5Z8kJ6/NW/eGuumQ
	tYYMq8+SeCzdv1pYC1VmWV9NTeqkR68gSRvZ5CY/OeXMUzfkzwezj+tVaxO8JnkLXs/P4BS8YnIZo
	RyyWMy9vOiijoE4mG1o3DJRHoWM7vHLaJxLmdoIHik1PFk+BquXveDIl5lVjFFLc6peNgoU5qtmFl
	RFLidIALCp0aI41cspRtHkWJQjq5sGR9dqHbJVYgoO9fJLLThmZN+1M1dE8S9vuPmMWn/iPqjSUdi
	EXAUv9LGrHonrw8+xmUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWvDD-00084W-RL; Fri, 08 May 2020 05:06:15 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWvD5-0007so-AK
 for linux-mediatek@lists.infradead.org; Fri, 08 May 2020 05:06:08 +0000
Received: by mail-ua1-x941.google.com with SMTP id 47so206879uaj.12
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 22:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GOyJCplE0htCyKO+7S6/vnX0Dv0M9OHzxvwXwcOQOP4=;
 b=yOR+kZsOgcu3/Opchfd0y0C8bGMkBMGR0doFFK9FPvDPc7z8ErZvL7sKHTdw/qa/dz
 vwQb7uq+1bBHAJitd7DHu33y1u5/2XWL6XeR7xIfarln2m0W5tyjJxIQtragP/eGPxSZ
 QICFM4RGditudJKQTQrhmZJqvAMtj+Yli1q6nJY0g3+7l/ikFJYY48TWu6Mx7KHEHC/4
 Ir622C0eVbJVEXEqtkrkjMVfd/sijw36iAinDFuIlOYVM2FNShq5zd9P1r0ydAMOBLn9
 4G1Ez4KEljvtrT13T1s5DY74tCI1M7t50tW71tit6nh8LhN7AeyBuWfJIeLwQXONv5aQ
 yQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOyJCplE0htCyKO+7S6/vnX0Dv0M9OHzxvwXwcOQOP4=;
 b=YLiqhh+tcsRfL173KaAmUiAN/5qbMxtOzX+R6Qss7JD6+jhJIV7Gog9MfsAWdor/Fi
 Fnu6N0IUWsWjtAsatxneISg2aFNiDUMVTfve6H7dIcHXVDfkpShPttD4Lt3NVb3biFEO
 7YzKv4uS429ppR6d0mkkZ6nyEPyBsUL0z7KAh/fRpWEKt6jYpKAfuwGNHpamzDM7Ybch
 vRaVPFCBmQZqWBp1Xc/yVkaiKRXXF/5oiLWVjjyEr4/veMxob0G+h/EmpPBtJITCUsRN
 UlcVSyvrt+ihLGK947pKFg4LenmyHhJnLDh8Dl5o0VxB5cXTmgdE/9x2ncWhRbekuc69
 Nrtg==
X-Gm-Message-State: AGi0PuaIzIKPeWfTrsR+xVuc/nC+gqZjAFLbh3kBCJD7lkIki5pi6XIV
 wxU08oTtKiG79wNB5jEA3ZG/ROFbWXd59aPVBJsIBg==
X-Google-Smtp-Source: APiQypIV3sbG4ZSLW2R9RC7kszUeNGv4pTkPCpr++SJIgTpFreELrbQMO3vTo+toXhRCi6FYQeprQHSzN9Qws1pY5HQ=
X-Received: by 2002:ab0:5ca:: with SMTP id e68mr505205uae.19.1588914365738;
 Thu, 07 May 2020 22:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
 <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
 <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
 <f9fa0232-3945-4e47-9238-0b51f6531199@codeaurora.org>
In-Reply-To: <f9fa0232-3945-4e47-9238-0b51f6531199@codeaurora.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 8 May 2020 07:05:29 +0200
Message-ID: <CAPDyKFoAa3=Rg77Af7nNQOZN13m9NQYERosrqiK_kuL3s-YECA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE
 bindings
To: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
 Chun-Hung Wu <chun-hung.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_220607_368795_5E50FBEB 
X-CRM114-Status: GOOD (  23.66  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, wsd_upstream@mediatek.com,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Al Cooper <alcooperx@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Android Kernel Team <kernel-team@android.com>, Pan Bian <bianpan2016@163.com>,
 DTML <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Allison Randal <allison@lohutok.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Yong Mao <yong.mao@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 7 May 2020 at 18:33, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
>
> On 5/6/2020 10:06 PM, Ulf Hansson wrote:
> > On Wed, 6 May 2020 at 15:01, Veerabhadrarao Badiganti
> > <vbadigan@codeaurora.org> wrote:
> >>
> >> On 4/28/2020 5:26 AM, Chun-Hung Wu wrote:
> >>> Parse CQE bindings "supports-cqe" and "disable-cqe-dcmd"
> >>> in mmc_of_parse().
> >>>
> >>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> >>> ---
> >>>    drivers/mmc/core/host.c | 5 +++++
> >>>    1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> >>> index c876872..47521c6 100644
> >>> --- a/drivers/mmc/core/host.c
> >>> +++ b/drivers/mmc/core/host.c
> >>> @@ -302,6 +302,11 @@ int mmc_of_parse(struct mmc_host *host)
> >>>                host->caps2 |= MMC_CAP2_NO_SD;
> >>>        if (device_property_read_bool(dev, "no-mmc"))
> >>>                host->caps2 |= MMC_CAP2_NO_MMC;
> >>> +     if (device_property_read_bool(dev, "supports-cqe"))
> >>> +             host->caps2 |= MMC_CAP2_CQE;
> >> This change is breaking emmc driver on qcom platforms where this dt
> >> property is defined.
> >>
> >> [    1.543453]  cqhci_deactivate+0xc/0x38
> >> [    1.545627]  sdhci_msm_reset+0x40/0x58
> >> [    1.549447]  sdhci_do_reset+0x48/0x7c
> >> [    1.553180]  __sdhci_read_caps+0x7c/0x214
> >> [    1.556913]  sdhci_setup_host+0x58/0xce8
> >> [    1.560905]  sdhci_msm_probe+0x588/0x8a4
> >> [    1.564900]  platform_drv_probe+0x4c/0xb0
> >>
> >> So, we cant have this flag defined before sdhci_setup_host().
> >>
> >> I will have to clear this cap and re-enable it in our initialization.
> > Thanks for reporting! I have dropped all the four patches from
> > Chun-Hung, so we can figure out how to fix this.
> >
> > Please help to review the next version of the series.
>
> Thanks Ulf.
>
> Hi Chun-Hung,
>
> On qcom controller CQE also gets reset when SDHC is reset. So we have to
> explicitly disable CQE
> by invoking  cqhci_deactivate() during sdhc reset
>
> SDHC gets reset in sdhci_setup_host() even before cqe is initialized.
> With MMC_CAP2_CQE_DCMD cap set even before sdhci_set_host(), we are
> getting null pointer access with cqhci_deactivate().
>
> If CQE getting reset with SDHC reset is generic (applicable to other
> controllers) then you have revisit your logic.
> If its not the case then only qcom driver would get affected.

Thanks for clarifying the problem, much appreciated.

To me, it looks like the DT parsing of the CQE properties are better
suited to be managed by each sdhci variant, to continue to leave some
room for flexibility.

Chun-Hung, can you please drop patch 1 and patch2 from the series and
adapt to this change in the mediatek variant?

[...]

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
