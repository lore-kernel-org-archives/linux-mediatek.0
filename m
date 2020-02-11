Return-Path: <SRS0=52uS=37=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71FAC35242
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 19:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8455320842
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 19:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OrQsHxeC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNht+1KG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8455320842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntafdcWueeUmXiJYawsIUd7HXrZcbrPBf1aTfNc7rmY=; b=OrQsHxeCo64uZN
	dAnPyi6jvCAYEZQQtRktD1Kgt/Jn3REARnNahYolX/FLMujD5mI9+BcrjcRJgM5S3CCfcxLrEMIJN
	kAtcx6fzAB5zvmixlILI7iqKZdDUYUZxmIjUsVRfhlxXHxga/MX6JND/7C86/ASedgvp+MxgFSzBa
	5MKumLPirBY2j9yDilsuc97nu7Kte/2lIBptbw/DidX2EHsh3BVcKaYO8J6n1yn11N0bc4f5+kM95
	AQgrs4s8/0dRE+ErNGoS38MpaSKdeqStI47c05WiHRBC/dU858q1mbichf5JC0JdCOROuHvDuizrZ
	FA+ELsLm9HEhL/vrpnwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1bS6-0004d3-2O; Tue, 11 Feb 2020 19:44:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1bRv-0004VJ-J3; Tue, 11 Feb 2020 19:44:01 +0000
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9030524689;
 Tue, 11 Feb 2020 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581450238;
 bh=DvzM0ydj4D5pq1pifhh+bBq3fqq6xA8Afwwx469Vkho=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UNht+1KGl/nLZWZpg26EufuWcgrSTOX3VAIgakbRdyF2CL16G2d4+TZBX36/+LFWD
 hZVpXwfUvNeNOeXs4r2ZZDOuxALHac6LbPjwBx8kLxlOLqouwe2fLw1ue4BoFTRlbA
 TsB1ToXb6pvScjFYZwFZQLoiCU5100lh5WwswRSI=
Received: by mail-qv1-f44.google.com with SMTP id y8so5587306qvk.6;
 Tue, 11 Feb 2020 11:43:58 -0800 (PST)
X-Gm-Message-State: APjAAAVScW7KvBmywYQzUl2RswZVmW4SJlW0EoaL+RhsNxSFynSORqfm
 jqFH/4Wn0dN/yn7VYKrsQpqFhBDN+ZodILoTAw==
X-Google-Smtp-Source: APXvYqwWjbNjReDsgQKr6XDaSggOqqPVRJvQCHJ/GYq2amBCeGZ41X9dHAmHfM9j4TENY3W9kgIrEy30L5K8rEJVBI8=
X-Received: by 2002:a05:6214:11ac:: with SMTP id
 u12mr4422199qvv.85.1581450237590; 
 Tue, 11 Feb 2020 11:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org>
In-Reply-To: <20200207052627.130118-6-drinkcat@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 11 Feb 2020 13:43:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
Message-ID: <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power
 domains
To: Nicolas Boichat <drinkcat@chromium.org>,
 Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_114359_671580_A575C7DC 
X-CRM114-Status: GOOD (  25.69  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+Saravana

On Thu, Feb 6, 2020 at 11:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> When there is a single power domain per device, the core will
> ensure the power domain is switched on (so it is technically
> equivalent to having not power domain specified at all).
>
> However, when there are multiple domains, as in MT8183 Bifrost
> GPU, we need to handle them in driver code.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> ---
>
> The downstream driver we use on chromeos-4.19 currently uses 2
> additional devices in device tree to accomodate for this [1], but
> I believe this solution is cleaner.
>
> [1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#31
>
> v4:
>  - Match the exact power domain names as specified in the compatible
>    struct, instead of just matching the number of power domains.
>    [Review: Ulf Hansson]
>  - Dropped print and reordered function [Review: Steven Price]
>  - nits: Run through latest version of checkpatch:
>    - Use WARN instead of BUG_ON.
>    - Drop braces for single expression if block.
> v3:
>  - Use the compatible matching data to specify the number of power
>    domains. Note that setting 0 or 1 in num_pm_domains is equivalent
>    as the core will handle these 2 cases in the exact same way
>    (automatically, without driver intervention), and there should
>    be no adverse consequence in this case (the concern is about
>    switching on only some power domains and not others).
>
>  drivers/gpu/drm/panfrost/panfrost_device.c | 97 ++++++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h | 11 +++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  2 +
>  3 files changed, 102 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 3720d50f6d9f965..8136babd3ba9935 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -5,6 +5,7 @@
>  #include <linux/clk.h>
>  #include <linux/reset.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
>
>  #include "panfrost_device.h"
> @@ -120,6 +121,79 @@ static void panfrost_regulator_fini(struct panfrost_device *pfdev)
>                         pfdev->regulators);
>  }
>
> +static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
> +               if (!pfdev->pm_domain_devs[i])
> +                       break;
> +
> +               if (pfdev->pm_domain_links[i])
> +                       device_link_del(pfdev->pm_domain_links[i]);
> +
> +               dev_pm_domain_detach(pfdev->pm_domain_devs[i], true);
> +       }
> +}
> +
> +static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
> +{
> +       int err;
> +       int i, num_domains;
> +
> +       num_domains = of_count_phandle_with_args(pfdev->dev->of_node,
> +                                                "power-domains",
> +                                                "#power-domain-cells");
> +
> +       /*
> +        * Single domain is handled by the core, and, if only a single power
> +        * the power domain is requested, the property is optional.
> +        */
> +       if (num_domains < 2 && pfdev->comp->num_pm_domains < 2)
> +               return 0;
> +
> +       if (num_domains != pfdev->comp->num_pm_domains) {
> +               dev_err(pfdev->dev,
> +                       "Incorrect number of power domains: %d provided, %d needed\n",
> +                       num_domains, pfdev->comp->num_pm_domains);
> +               return -EINVAL;
> +       }
> +
> +       if (WARN(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs),
> +                       "Too many supplies in compatible structure.\n"))
> +               return -EINVAL;
> +
> +       for (i = 0; i < num_domains; i++) {
> +               pfdev->pm_domain_devs[i] =
> +                       dev_pm_domain_attach_by_name(pfdev->dev,
> +                                       pfdev->comp->pm_domain_names[i]);
> +               if (IS_ERR_OR_NULL(pfdev->pm_domain_devs[i])) {
> +                       err = PTR_ERR(pfdev->pm_domain_devs[i]) ? : -ENODATA;
> +                       pfdev->pm_domain_devs[i] = NULL;
> +                       dev_err(pfdev->dev,
> +                               "failed to get pm-domain %s(%d): %d\n",
> +                               pfdev->comp->pm_domain_names[i], i, err);
> +                       goto err;
> +               }
> +
> +               pfdev->pm_domain_links[i] = device_link_add(pfdev->dev,
> +                               pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
> +                               DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);

We're in the process of adding device links based on DT properties.
Shouldn't we add power domains to that? See drivers/of/property.c for
what's handled.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
