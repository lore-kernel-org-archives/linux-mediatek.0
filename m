Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1366C282DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 20:10:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F8F2072A
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 20:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qXe/OGwH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbfmSdy+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F8F2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTqTnp8tqqFTRogz7XjppmCc2xq5hGFAsOLspEeWIb8=; b=qXe/OGwHcBi/LG
	D7kvXdhAc6YKWTpcAp014jnePWEBdUpyMfbdOF4Q4n9FaBUZ0BFO0ndA7Z1AXwjp3/xSBimjyTo5a
	r1FFWbRff5H+ci5tvDJHpw9dAcDKyHppP/iVHnL259rK7W4lrp7q/dqWOiCtD3NqAkmC2wy+wIk+8
	5QtLPbIa0vKFlkFoL0QIEbR7Xbg+92AVZQz5fkkbh5yN7U23rFUhSVRgpEOEx4+kuV0lTYOsiSDmm
	YHZ8pC7SFL7XHP3S97U3k0lcRX1TDu27OiD/pDdWdbPNaoiiHTNNZonKPYjOKZ/FWUQ2l+qEzqWfh
	7TkwQvIOf3JOIurr1+KA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipHeR-0000lQ-EU; Wed, 08 Jan 2020 20:09:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipHeH-0000cd-BW; Wed, 08 Jan 2020 20:09:50 +0000
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E403520882;
 Wed,  8 Jan 2020 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578514189;
 bh=HMpUUI05u881FivDVXx8p23Q4WPCIib06475xNf1c9I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lbfmSdy+Wrg1cKLMM72tdGc41LpdFrJUC2MTXQSvs+CnZr9rnij5xj4uZvm0y+nXr
 uzzUOtubqbF077jeXhjPh2tR+aoy7gSUi3nr+OAOKX0TZIp0AvFQiRu6NJmMm8pThE
 5hrTN+D0LmCaARPP6yREK0FbcXzEPtNzLzbmSfgc=
Received: by mail-qk1-f173.google.com with SMTP id d71so3897178qkc.0;
 Wed, 08 Jan 2020 12:09:48 -0800 (PST)
X-Gm-Message-State: APjAAAXU/2ZxtvVJoy4QHaaMyGoMTKaekAXZhySi6+oRTU0ZReqKLrWv
 rAInYxuPJqHo1zx7bKEhmsEAZP/mpMvV9frj9Q==
X-Google-Smtp-Source: APXvYqyBzM8hpEjCqsN8vXLIaQ3o5cj0NDc/Yz3b1xjFrRbEN7LH8SmrAR3PWRfmz+8M9gI0InsycHS1b2WLHCaGWPY=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr6192361qkd.223.1578514187969; 
 Wed, 08 Jan 2020 12:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-8-drinkcat@chromium.org>
In-Reply-To: <20200108052337.65916-8-drinkcat@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 8 Jan 2020 14:09:36 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+jWtrV8-iDzqsefRxr_21jzf7AdSLap8k4hstqK3MBvQ@mail.gmail.com>
Message-ID: <CAL_Jsq+jWtrV8-iDzqsefRxr_21jzf7AdSLap8k4hstqK3MBvQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7,
 RFC]: drm/panfrost: devfreq: Add support for 2 regulators
To: Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_120949_435155_DE7BCF57 
X-CRM114-Status: GOOD (  18.18  )
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

On Tue, Jan 7, 2020 at 11:24 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
> devfreq, and provides OPP table with 2 sets of voltages.
>
> TODO: This is incomplete as we'll need add support for setting
> a pair of voltages as well.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_device.h  |  2 ++
>  2 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 413987038fbfccb..5eb0effded7eb09 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -79,6 +79,22 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>         struct devfreq *devfreq;
>         struct thermal_cooling_device *cooling;
>
> +       /* If we have 2 regulator, we need an OPP table with 2 voltages. */
> +       if (pfdev->regulator_sram) {
> +               const char * const reg_names[] = { "mali", "sram" };
> +
> +               pfdev->devfreq.dev_opp_table =
> +                       dev_pm_opp_set_regulators(dev,
> +                                       reg_names, ARRAY_SIZE(reg_names));
> +               if (IS_ERR(pfdev->devfreq.dev_opp_table)) {
> +                       ret = PTR_ERR(pfdev->devfreq.dev_opp_table);
> +                       pfdev->devfreq.dev_opp_table = NULL;
> +                       dev_err(dev,
> +                               "Failed to init devfreq opp table: %d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
>         ret = dev_pm_opp_of_add_table(dev);
>         if (ret == -ENODEV) /* Optional, continue without devfreq */
>                 return 0;
> @@ -119,6 +135,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>         if (pfdev->devfreq.cooling)
>                 devfreq_cooling_unregister(pfdev->devfreq.cooling);
>         dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
> +       if (pfdev->devfreq.dev_opp_table)
> +               dev_pm_opp_put_regulators(pfdev->devfreq.dev_opp_table);
>  }
>
>  void panfrost_devfreq_resume(struct panfrost_device *pfdev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 92d471676fc7823..581da3fe5df8b17 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -91,10 +91,12 @@ struct panfrost_device {
>         struct {
>                 struct devfreq *devfreq;
>                 struct thermal_cooling_device *cooling;
> +               struct opp_table *dev_opp_table;
>                 ktime_t busy_time;
>                 ktime_t idle_time;
>                 ktime_t time_last_update;
>                 atomic_t busy_count;
> +               struct panfrost_devfreq_slot slot[NUM_JOB_SLOTS];

?? Left over from some rebase?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
