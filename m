Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B06C4724C
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 16:37:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1406120708
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 16:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="od35W50A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVnVRn4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1406120708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3aAO97XivK47nyg+dTh110ZmJ9+Gt4nvSSl5ZQG2wI=; b=od35W50Aa2CTEz
	cryCpVYs89sxm6B7r5TpLWE1yHbZ3N93+yAaDz/qBRTnDXPbwpsy5ROaKOczEvyYDCtN6sRL0XP4r
	/2z4TvwDh/uucfchdW7bgoQ4Oxfg9UD9dwIptxeYXjhxnDGGAhdZXz7avwARIG9XNzbJh936hYclB
	f5UvGavgvfZq6MYB77a3WuajKFeypkTn8pmTtk+p3ShdcIztRJ82mh0I/j+FijPedF4aBmU+HW2+1
	XmMToGOiqfzgst5eiXbG8ybJGyGOlWYWBBtQsSV9yV3anJA055Djb/yhDGhStq8sGzW193QnLqCiv
	9jDhyKqvtEGkaIIARxUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWN2Z-0005Y4-JV; Wed, 06 May 2020 16:36:59 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWN2S-0005PU-Rv
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 16:36:54 +0000
Received: by mail-vk1-xa42.google.com with SMTP id v23so687113vke.13
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qEp/F3SbsRoDv1jpNGzhOxbfis7J4KDcT9P9z6XWkHg=;
 b=eVnVRn4S8Hb7sl1mAhlDpCkwg2p7TvzKWg0qVVe/dWs+kNzu0dkUnF12cuHSLRfxJA
 k1JsPhNHp6gpFvg3metDV/hPplaRlu3pQXHecw2lhBu91JqE8L0mSdp5Zmc9jNhUWqIB
 1xGIHjkcCR9gqoJXy85LS+19SdMWYi5+Ih9W8LUXfrQqUUPxnoOEUhmxOrI+MLwWHhr+
 E9RKn25uZiu4s/nZwk/EVD7PaM11znkaVIxenvyVhmirLDphTRgJue6k6ZZ0J3TwDTz6
 0ZY1n1k1WDVUIhczz4M4qBDev1+txdlb4jFvLkVck7EDsXiBjF4LLHsLj3SpxlVGryrw
 tIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qEp/F3SbsRoDv1jpNGzhOxbfis7J4KDcT9P9z6XWkHg=;
 b=aNgIGVi3npyGzGYVEVTm6PvFGfWXYQYx/Z53UiXR4N/4m490Sa87egmtL8KkzXgttA
 ZMXce3nfrtLPi8vVz6siV7/Pr/Ev22DekABDtay4dgBkKJO7wn8qEBFc2bNbluVBX8Gk
 s7PJ6Q8w/A7N7crh/H14kv+vFFiAp2hofuliJmuAtoC9HDkNKQkEAE1XEp00qaisznRO
 TZL0ApCRlKbWPs7k7lzuCIIjE0hdSYYw0axlfA/6bixMiPrw969pujp43KwRQdVcyJSr
 fEeqFte/PTWAMJe9uwbobfHyWL8TyyD4oga72JiX63nbqZOOPBp4vubJejeQdXMkVpQq
 VVnw==
X-Gm-Message-State: AGi0PuZqUePGt/Ey3RttFmehaDbRAVUPxDa2pf7OIRz/bOTje9K9/Xay
 l0eaJKGfdS/p7iy+9oTxac2DhymI3gnFN/5uAtKk/A==
X-Google-Smtp-Source: APiQypLm9f0btuKktuvMb+D03IME6dlX6dRX4NRiQ4NXE3O3t6sARzsGX6NfhfAe3VIx+4GZEIKh+9FQbLrJ4BJaBxM=
X-Received: by 2002:a1f:8ccf:: with SMTP id o198mr8122974vkd.53.1588783008587; 
 Wed, 06 May 2020 09:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
 <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
In-Reply-To: <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 6 May 2020 18:36:12 +0200
Message-ID: <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE
 bindings
To: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_093652_900376_90F6C2FA 
X-CRM114-Status: GOOD (  19.88  )
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
 Allison Randal <allison@lohutok.net>,
 Android Kernel Team <kernel-team@android.com>, Pan Bian <bianpan2016@163.com>,
 DTML <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
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

On Wed, 6 May 2020 at 15:01, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
>
> On 4/28/2020 5:26 AM, Chun-Hung Wu wrote:
> > Parse CQE bindings "supports-cqe" and "disable-cqe-dcmd"
> > in mmc_of_parse().
> >
> > Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > ---
> >   drivers/mmc/core/host.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> > index c876872..47521c6 100644
> > --- a/drivers/mmc/core/host.c
> > +++ b/drivers/mmc/core/host.c
> > @@ -302,6 +302,11 @@ int mmc_of_parse(struct mmc_host *host)
> >               host->caps2 |= MMC_CAP2_NO_SD;
> >       if (device_property_read_bool(dev, "no-mmc"))
> >               host->caps2 |= MMC_CAP2_NO_MMC;
> > +     if (device_property_read_bool(dev, "supports-cqe"))
> > +             host->caps2 |= MMC_CAP2_CQE;
>
> This change is breaking emmc driver on qcom platforms where this dt
> property is defined.
>
> [    1.543453]  cqhci_deactivate+0xc/0x38
> [    1.545627]  sdhci_msm_reset+0x40/0x58
> [    1.549447]  sdhci_do_reset+0x48/0x7c
> [    1.553180]  __sdhci_read_caps+0x7c/0x214
> [    1.556913]  sdhci_setup_host+0x58/0xce8
> [    1.560905]  sdhci_msm_probe+0x588/0x8a4
> [    1.564900]  platform_drv_probe+0x4c/0xb0
>
> So, we cant have this flag defined before sdhci_setup_host().
>
> I will have to clear this cap and re-enable it in our initialization.

Thanks for reporting! I have dropped all the four patches from
Chun-Hung, so we can figure out how to fix this.

Please help to review the next version of the series.

>
> > +     if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
> > +             host->caps2 |= MMC_CAP2_CQE_DCMD;
> > +     }
> >
> >       /* Must be after "non-removable" check */
> >       if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
