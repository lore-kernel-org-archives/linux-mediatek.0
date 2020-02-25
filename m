Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FD3C35E15
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 20:58:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 633DC2176D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 20:58:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UMKDc8qJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gg6Rej+l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 633DC2176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xv0/w84Es19+27sMn9z9wTpr4dbxXIjaoLZWhd5cJy8=; b=UMKDc8qJUFiILz
	/fgHfwmIwykPFLvR1nyDwlWDYCR/o7rGnKZUBcu9qjqrxwok+N77jHIPLflajjrLgvhCcAqfL4RhI
	TypMTTHWULW4kvCxkd6OfEJlMBX3pbLGhNdJQQ/kQ7h0y7Qu26R96JWNfFWN2GXx2BtBMd2IXYZOm
	Te2XQJAxfTbLU8wtSns59GdOIEPupBBi45pNoziSakdO46iY9HOJ/8iFFKD3D/D0bEfFK3pQWt1rI
	A2BwA534GkLrzMf7AkaPxqqRfZjVhqo0aayGhM3Oa5juz/MMMQGG1tz2PJnYdxxaOb/3zP2xH7HmD
	meFm0/8zNdFWKj/9H0Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6hHB-0006A7-JA; Tue, 25 Feb 2020 20:57:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6hH2-00062x-TI; Tue, 25 Feb 2020 20:57:50 +0000
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8B2124650;
 Tue, 25 Feb 2020 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582664268;
 bh=rEf2Wh9b2Cqc5tJSuDzSluIyGn5h8PEv+2AGQEQ1p7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gg6Rej+lEjdE3MacAgPmABGfeEK4naM3qOPYaKvI6VDiP+dnMybL0IxoHGVGDs7yy
 E3V+I76+lUu0xY/bwpiOuR2QpnM95bq/0c4t6LVntRLm17lQNFftdzZSonrfhuEA9D
 oR7Ir/7pF1qi7QFUxPXnrZq2XPZK6VAIOSpFAbUg=
Received: by mail-qk1-f174.google.com with SMTP id h4so598788qkm.0;
 Tue, 25 Feb 2020 12:57:47 -0800 (PST)
X-Gm-Message-State: APjAAAVEvXCRwOQNlytJiPliqSziECC7nDX4CiFbQTs/gef8BFjZyhEw
 BVwHHI4ZhLfa6Q3cuvIHcC20yF/gqY+70AgdCA==
X-Google-Smtp-Source: APXvYqz2R5nikNFiKQzE3WzYAa4JRDhsDEPVyRy8hsiD3YIxfbq2k/r6k7Ue9axTsmsjn+eGEtYJoB+gv797DdDBI14=
X-Received: by 2002:a37:a750:: with SMTP id q77mr933467qke.119.1582664267060; 
 Tue, 25 Feb 2020 12:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20200221194731.13814-1-lukasz.luba@arm.com>
 <20200221194731.13814-5-lukasz.luba@arm.com>
In-Reply-To: <20200221194731.13814-5-lukasz.luba@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Feb 2020 14:57:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ1D6Cf2cxdskDS2JCEe8ja6uUeoSpA3i-wxNgi=S1SYA@mail.gmail.com>
Message-ID: <CAL_JsqJ1D6Cf2cxdskDS2JCEe8ja6uUeoSpA3i-wxNgi=S1SYA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/panfrost: Register to the Energy Model with
 devfreq device
To: Lukasz Luba <lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_125748_990346_CA589E97 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: Nishanth Menon <nm@ti.com>, juri.lelli@redhat.com,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, bsegall@google.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Fabio Estevam <festevam@gmail.com>,
 Morten Rasmussen <Morten.Rasmussen@arm.com>, patrick.bellasi@matbug.net,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Ingo Molnar <mingo@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 Zhang Rui <rui.zhang@intel.com>, mgorman@suse.de, orjan.eide@arm.com,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>, Dietmar.Eggemann@arm.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, David Airlie <airlied@linux.ie>,
 javi.merino@arm.com, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 qperret@google.com, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 21, 2020 at 1:48 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Add device to the Energy Model framework. It will create a dedicated
> and unified data structures used i.e. in the thermal framework.
> The power model used in dev_pm_opp subsystem is simplified and created
> based on DT 'dynamic-power-coefficient', volatage and frequency. It is

typo.

> similar to the CPU model used in Energy Aware Scheduler.
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 413987038fbf..d527a5113950 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -105,6 +105,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>         }
>         pfdev->devfreq.devfreq = devfreq;
>
> +       dev_pm_opp_of_register_em(dev, NULL);

Can't fail?

> +
>         cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
>         if (IS_ERR(cooling))
>                 DRM_DEV_INFO(dev, "Failed to register cooling device\n");
> @@ -118,6 +120,7 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>  {
>         if (pfdev->devfreq.cooling)
>                 devfreq_cooling_unregister(pfdev->devfreq.cooling);
> +       dev_pm_opp_of_unregister_em(&pfdev->pdev->dev);
>         dev_pm_opp_of_remove_table(&pfdev->pdev->dev);

Does it make sense to keep this (and the registration side) as
separate calls? Perhaps there's some ordering requirement with
everything between dev_pm_opp_of_add_table() and
dev_pm_opp_of_register_em()?

While you're just adding 2 lines, it seems there's a lot of complexity
exposed to the driver just to initialize devfreq/opp.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
