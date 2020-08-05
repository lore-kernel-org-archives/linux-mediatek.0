Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3D0C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 07:44:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6FC2245C
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 07:44:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRtWE06A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O7KCWZiy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6FC2245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FoFIUdGca5nHjGQbQASQ+2y3qOpYIC8ucrfLdCGOrtA=; b=uRtWE06AHw6iti7xBNWYlAT6z
	2BKRQKkjLn2NJhZktGGxeGuTulclAR5QnV4R/sC2Dm0KIi/oC28NI4i+QpwO2aJcDPXx/Qs7PnHEN
	S2ni4Yatqwr4gEk1xmXj3UJfOzNqJU1u94og0NzfJ9mpZaMAM0r5shT4LgTxMYS+rRFylESK54ZWZ
	lJObeXf7wOp1CynTZsqv7IYAY4LCQaDq5yURadlqEBIa2d444//9eb8YWJBGoqAN/lStAHHgEh0AR
	k5lR1xHz7dW1Be+gsN9RuqrG1NKFqtoij03pmDCAH43HJyebNPNtofl1yvf3WBRBSrL1x6d7FA6qy
	lcsZ5cawA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3E6J-0002zD-Me; Wed, 05 Aug 2020 07:44:39 +0000
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3E6F-0002y6-AC
 for linux-mediatek@lists.infradead.org; Wed, 05 Aug 2020 07:44:36 +0000
Received: by mail-oo1-xc43.google.com with SMTP id x1so6401208oox.6
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2020 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XB0gKQyc9CsSKqZ7GgGJ8tPycXtrwiQ0rJYnNLbYnE=;
 b=O7KCWZiyayJrpPKe4Qo2MFaMV++l507OxnySpg4nllQ/4WIyMRp2lmiAvGqQ++lZ/i
 vurTpoVPRWh2eWqVPdl+snBzEx6FwPldWsWqTBgZM4xOyUZWUxAZjdRAQgCtgP67MK04
 ee7GreNHGoW00bOF3cl/JYbZUFiin8xF3OX6uD5776b0ZZdreRjtCydX/Uhays9SI/tB
 axIiLXzrWS9a6MiU3AOIocYrZgEHqZi5bWdtWeWMCkuKFVa95uev5y5FAL8m4mBOG7+s
 LFMYnNqvJyhxpqiIzSINRZJQdQ1ASAJHx/N/N+MNsK+WGBTlWFQJ9NeScR/DbhGCCnT0
 6c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XB0gKQyc9CsSKqZ7GgGJ8tPycXtrwiQ0rJYnNLbYnE=;
 b=U5yGeH6tP7SoIK5gGDYPyeKOl8/tQIb4npvp8BM6nnS2zZaYoaI4pogTi6HbWZKh/z
 05iVfCb4d2gjLmgpESrETx6aQsuAWlFScQgDvJDr8tqqSELCQ/aHsMPy9E8DNirNp1ss
 sxZrFzORH++kM6UAli8ez13Kt0hz0Qzb5+DHdYC2cFlES0NM5Rm1Au4gS7ik2wHafIxX
 WlbMVM0Gpxzj8aqKKWaoCwPcJTfjMzd8JDZGbIH6f1F3c/qf3/1pI2hpVKhCBLbsCufp
 bARylUaZLpNns+qSJYZGIJiJWZ1mB/5ys7SvS/pJkBr0XrBKXMCQBArXtnIaA4prbonX
 BGEQ==
X-Gm-Message-State: AOAM533cELvm2yXat9BJqCC0JbycyMzW0NXDQ4GfRlyV+0Psbgl/0KJp
 khi/YPSSbinylg11W8FDqg9xo51kgrhdw2VrwgFawQ==
X-Google-Smtp-Source: ABdhPJyTnc5GAirwQ3qZDK4WN0lqH19fI2aSlix6R6R+dyBypcI5OYPshiJlUl3SHM0DH8s2OgrXhfwvSl++QvmT16w=
X-Received: by 2002:a4a:a648:: with SMTP id j8mr1634862oom.36.1596613472779;
 Wed, 05 Aug 2020 00:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
In-Reply-To: <20200718000637.3632841-3-saravanak@google.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 5 Aug 2020 00:44:21 -0700
Message-ID: <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_034435_714166_4F7EB5C8 
X-CRM114-Status: GOOD (  21.69  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-mediatek@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Switch the driver to use the helper macros. In addition to reducing the
> number of lines, this also adds module unload protection (if the driver
> is compiled as a module) by switching from module_platform_driver to
> builtin_platform_driver.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 5b624e3295e4..c1c5dfad57cc 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>         return ret;
>  }
>
> -static int qcom_pdc_probe(struct platform_device *pdev)
> -{
> -       struct device_node *np = pdev->dev.of_node;
> -       struct device_node *parent = of_irq_find_parent(np);
> -
> -       return qcom_pdc_init(np, parent);
> -}
> -
> -static const struct of_device_id qcom_pdc_match_table[] = {
> -       { .compatible = "qcom,pdc" },
> -       {}
> -};
> -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> -
> -static struct platform_driver qcom_pdc_driver = {
> -       .probe = qcom_pdc_probe,
> -       .driver = {
> -               .name = "qcom-pdc",
> -               .of_match_table = qcom_pdc_match_table,
> -               .suppress_bind_attrs = true,
> -       },
> -};
> -module_platform_driver(qcom_pdc_driver);
> +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
> +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
> +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
>  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
>  MODULE_LICENSE("GPL v2");

<sigh>
So this is where I bashfully admit I didn't get a chance to try this
patch series out, as I had success with a much older version of
Saravana's macro magic.

But unfortunately, now that this has landed in mainline, I'm seeing
boot regressions on db845c. :( This is in the non-modular case,
building the driver in.

I managed to bisect it down to this patch, and reverting it avoids the
issue. I don't see what is wrong right off, but I really need to get
to bed, so I'll dig further tomorrow.

Saravana: Apologies for not getting around to testing this beforehand!

thanks
-john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
