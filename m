Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7799EC18E57
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 18:09:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6ABE207B3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 18:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6ABE207B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vqASgnFXZH3flMgVu2VsfVsbzVbopwXTGbtQ5i1Wync=; b=oCMli80ipU8ivcxPl/WftBw/e
	FgbO77kcnux0GV9jxCnahg4AwXPu4XvcAoU5a19hWl8lCCUdN+Wt7q16H6hD76teH39EoxiM/urex
	NwXeYffvIq1Z5X2N1jwNwvODeCDW/yMaOvkl02SkRH7dljCQdJGN/waS8412qIG/BOBI4heifk575
	8fZGYABvBcmQcdWII+D0hwETZaWkY8hpkXS636axdSDYeKtEEt60hUFwiRDF4tFWNuEfpEixbWVI/
	an8SPprlgIQZUinc/WKge1ArYnid4LddPUCr25Q2OJnQog98KmKkOU0DwobClGa2NRTbMWnBgWyJo
	Y2TjD1ZaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkt2p-0000LZ-Ed; Thu, 03 Dec 2020 18:09:31 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkt2m-0000K9-30; Thu, 03 Dec 2020 18:09:28 +0000
Received: by mail-pg1-x534.google.com with SMTP id q3so1888999pgr.3;
 Thu, 03 Dec 2020 10:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kX4KVJsGsKYPIIK4aDYtyzJtYeHdnevNwh4wjCWOb0c=;
 b=QTBbK3JkISvsp2gZHBrLBJQZyAPMGYoyF0ezaPFpZ/hWd0KfzK91FRON+2mulxyaJC
 24vSphbfclOZbVO8HPWclbTJtCcX9+kbg3OESxXydsCwKX+NdE8Ue0hkWwQ+1HXhHebU
 m6DdRwBjI4o5jAaD3xm+16hEaB8HOXltbiGcG59sUxroV+YdGzuCgfV4vCYswLH+cPRz
 4Fzp5CQRWlo/KEskO1CMb+CKSV2HIrRESbWGOu8O3DOJmtBrTFALnQR44CrDs1mRM2+W
 ElMWMOKfkO8hainvVY8ebqRZYKhPQGBocLduTwSCiNVsLOIGWZCzVQpDAe51ftyLZElB
 h3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kX4KVJsGsKYPIIK4aDYtyzJtYeHdnevNwh4wjCWOb0c=;
 b=OeY98Pff1Pzz/YXpQ5Jp3FCvHNtLomhi4QsEp1KIkWM9U3zgrQBG+xBZmN06odf13y
 dBb/So0qINucJcCxcP124EvpMMlNbin5eoY/aQFa4s9YZIZYAANp8oUuKUF18A4wf7Ub
 YEr3N6ifFAtru8TAOYyTLp2Mbbe8PXuXZq9Ty4wlSigjGAWIneLQtRcmzrAoljYLsX42
 PwnISglGtOvh6rVuzQtgw+VeXDgex1kONIXbomWMBoe5dG3hXfOzZYtLxzr4MBsPrUmf
 q0IayjWEdNMMfiNxjunCcilFl/6NpieT85RK9zRzKjPZgozBxlzyUUbEMj3qj5WfjFng
 LweQ==
X-Gm-Message-State: AOAM530NOo89OFpGJ2I41HkcM4Kajp63JHeG1vb0m1BcdBu9A/Ub2c1P
 RkwspBzSggBtvYjtMFGY1bKdNK+006d6BVOTg80=
X-Google-Smtp-Source: ABdhPJwra2X3D41eYNE1JAbptcU2GxCMf3L2f8csctuSUqDap0iHk6iRo5leC3xzgYlyjSqNIXA2yx4jLkuOdXuijYs=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr90263pfe.40.1607018963998; Thu, 03 Dec
 2020 10:09:23 -0800 (PST)
MIME-Version: 1.0
References: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
In-Reply-To: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Dec 2020 20:10:12 +0200
Message-ID: <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com>
Subject: Re: media: i2c: add OV02A10 image sensor driver
To: Colin Ian King <colin.king@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_130928_168962_4D0FBC4D 
X-CRM114-Status: GOOD (  16.87  )
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 3, 2020 at 8:03 PM Colin Ian King <colin.king@canonical.com> wrote:

> Static analysis on linux-next with Coverity has detected an issue with
> the following commit:

If you want to fix it properly, see my comments below...

> 529 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> 530 {
> 531        struct ov02a10 *ov02a10 = to_ov02a10(sd);
> 532        struct i2c_client *client =
> v4l2_get_subdevdata(&ov02a10->subdev);
>
>    1. var_decl: Declaring variable ret without initializer.
>
> 533        int ret;
> 534
> 535        mutex_lock(&ov02a10->mutex);
> 536
>
>    2. Condition ov02a10->streaming == on, taking true branch.
>
> 537        if (ov02a10->streaming == on)
>
>    3. Jumping to label unlock_and_return.
>
> 538                goto unlock_and_return;
> 539
> 540        if (on) {
> 541                ret = pm_runtime_get_sync(&client->dev);
> 542                if (ret < 0) {

> 543                        pm_runtime_put_noidle(&client->dev);
> 544                        goto unlock_and_return;

Instead of two above:
                       goto err_rpm_put;

> 545                }
> 546
> 547                ret = __ov02a10_start_stream(ov02a10);
> 548                if (ret) {
> 549                        __ov02a10_stop_stream(ov02a10);
> 550                        ov02a10->streaming = !on;
> 551                        goto err_rpm_put;
> 552                }
> 553        } else {
> 554                __ov02a10_stop_stream(ov02a10);
> 555                pm_runtime_put(&client->dev);
> 556        }
> 557
> 558        ov02a10->streaming = on;

(1)

> 559        mutex_unlock(&ov02a10->mutex);
> 560
> 561        return 0;
> 562
> 563 err_rpm_put:
> 564        pm_runtime_put(&client->dev);

> 565 unlock_and_return:

Should be moved to (1).

> 566        mutex_unlock(&ov02a10->mutex);
> 567
>
> Uninitialized scalar variable (UNINIT)
>     4. uninit_use: Using uninitialized value ret.
>
> 568        return ret;
> 569 }
>
> Variable ret has not been initialized, so the error return value is a
> garbage value. It should be initialized with some appropriate negative
> error code, or ret could be removed and the return should return a
> literal value of a error code.
>
> I was unsure what value is appropriate to fix this, so instead I'm
> reporting this issue.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
