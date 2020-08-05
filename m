Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C99C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 20:20:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E30522CAD
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 20:20:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vxdcd674";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="lBeyGQOG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E30522CAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hdd/Po0O16QT/ROz+zrE8U68S0WMuiUDSBs7EjZKJSk=; b=Vxdcd674ekCsJQ9tkCwzdhQCg
	40ggk6EuSXWYEJ+Nmf6IQNSlGY7TTYuwcN4XZcgkJx795d5wMzPmHsJXBaQelVPip0IvkIrP6A7ka
	KuGSdYuFtKsdTPUOWouwtMFu0a+2snzzdFXTeunRZCTtt6JI3l9YL9OuNU4JHXh5ahWCKaSge4BZz
	nDAITKJJLfO1vGEXL1kOjSk/ovH9IwXDjF2VYuA0iJHVyiMIvPvC7435LTj7cEscqKDmgSksYD/2r
	ZV7CQcL+tQS0tziosVgCLh/L/ZOtt4ampBJh305oQN/7tS0SqyUqjy78//Xll4ks+TtvxzOvztHY1
	w3kOBkuoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3PtC-0004rw-Bc; Wed, 05 Aug 2020 20:19:54 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Pt8-0004ql-GI
 for linux-mediatek@lists.infradead.org; Wed, 05 Aug 2020 20:19:51 +0000
Received: by mail-pj1-x1041.google.com with SMTP id i92so3645365pje.0
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2020 13:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVjtbYhstiKuNQL6JeVbBPs4G1xXwyHdcoC1ZxR9HUQ=;
 b=lBeyGQOGbakQKscP5qJp87U0BD2iPT7BShFj1oh45m4vW3V+uOyjQZjzqLblxE+DoG
 ub+MTpdonw61jGuhYukxNyO/HMUXjsmaRDFu5GslTldXpvTE1UfUzpXvKOGxj4GBOLFJ
 o1jzDk6g7iUKQwYW/KEivXAieYBSN294EgsiL2TdFPLYA4zX/pRBxN4U3YNsKkDsBxqR
 aW+1CWTbx8Oktp2rcBVnX7xXXbWHanLCj0j5d3/0RGRRX8bdH+kVmgZKOjHTKoPbwrjy
 kD9dI/VFWynhcgO7mpFsAc5PiwBbeklTcxzilRT/p1dFwFyC+yDqdJhCmaEC7t6r8Ihd
 ix+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVjtbYhstiKuNQL6JeVbBPs4G1xXwyHdcoC1ZxR9HUQ=;
 b=M6b2XXenC7D6x2N5fCcXXNAFg1z1xuRVpjjqPYbyG1UeXm5IirsCHwQ16EaI30qcuf
 05slsxmyQSsCGXBsISIXLsZSUBAqYXcDRFO5/3qMnr721OXRfVXLQ55/KuIo4eXKiQGT
 0r35U72OZxufx5eNDyw308wawMvFg/uatw9st7c2DzOMSDMO21pTc319GJen6C3u941I
 a6zq+TdKTE+tFDoDAvsGCnJGBN+vLt/xflnD2N+/56cAADIiNyME3WjVGcNi7XXHbH7L
 gmeCvsQIk7CLu/2AWYvDdfstXHcl1l5Nx21bRVbkHV3eNWEcUv981NRezkDQsywLZxKo
 T2UQ==
X-Gm-Message-State: AOAM5319OVfID7xgEkfgs7JPwFeKgpGhAmJu4sd1MvLq9yKPHrGuTa8k
 XNrZASWFaM2FL5yT8BWw826vGw40oCQDdsRDgs5fBw==
X-Google-Smtp-Source: ABdhPJyzC3W0lW0kRAsgMCPz7TzprnpMpUFYzlQwQ8cedIEf9CqmMuoAlFAGdxAKZ6AyjNgpHiemuwv1bJvRpW+qLtA=
X-Received: by 2002:a17:90a:17e9:: with SMTP id
 q96mr4963217pja.91.1596658785977; 
 Wed, 05 Aug 2020 13:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
In-Reply-To: <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 5 Aug 2020 13:19:10 -0700
Message-ID: <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: John Stultz <john.stultz@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_161950_611652_68E027B4 
X-CRM114-Status: GOOD (  31.64  )
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
>
> On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > Switch the driver to use the helper macros. In addition to reducing the
> > number of lines, this also adds module unload protection (if the driver
> > is compiled as a module) by switching from module_platform_driver to
> > builtin_platform_driver.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
> >  1 file changed, 3 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > index 5b624e3295e4..c1c5dfad57cc 100644
> > --- a/drivers/irqchip/qcom-pdc.c
> > +++ b/drivers/irqchip/qcom-pdc.c
> > @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
> >         return ret;
> >  }
> >
> > -static int qcom_pdc_probe(struct platform_device *pdev)
> > -{
> > -       struct device_node *np = pdev->dev.of_node;
> > -       struct device_node *parent = of_irq_find_parent(np);
> > -
> > -       return qcom_pdc_init(np, parent);
> > -}
> > -
> > -static const struct of_device_id qcom_pdc_match_table[] = {
> > -       { .compatible = "qcom,pdc" },
> > -       {}
> > -};
> > -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> > -
> > -static struct platform_driver qcom_pdc_driver = {
> > -       .probe = qcom_pdc_probe,
> > -       .driver = {
> > -               .name = "qcom-pdc",
> > -               .of_match_table = qcom_pdc_match_table,
> > -               .suppress_bind_attrs = true,
> > -       },
> > -};
> > -module_platform_driver(qcom_pdc_driver);
> > +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
> > +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
> > +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
> >  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
> >  MODULE_LICENSE("GPL v2");
>
> <sigh>
> So this is where I bashfully admit I didn't get a chance to try this
> patch series out, as I had success with a much older version of
> Saravana's macro magic.
>
> But unfortunately, now that this has landed in mainline, I'm seeing
> boot regressions on db845c. :( This is in the non-modular case,
> building the driver in.

Does that mean the modular version is working? Or you haven't tried
that yet? I'll wait for your reply before I try to fix it. I don't
have the hardware, but it should be easy to guess this issue looking
at the code delta.

The only significant change from what your probe function is doing is
this snippet. But it'd be surprising if this only affects the builtin
case.

+ if (par_np == np)
+         par_np = NULL;
+
+ /*
+ * If there's a parent interrupt controller and  none of the parent irq
+ * domains have been registered, that means the parent interrupt
+ * controller has not been initialized yet.  it's not time for this
+ * interrupt controller to initialize. So, defer probe of this
+ * interrupt controller. The actual initialization callback of this
+ * interrupt controller can check for specific domains as necessary.
+ */
+ if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
+         return -EPROBE_DEFER;

> I managed to bisect it down to this patch, and reverting it avoids the
> issue. I don't see what is wrong right off, but I really need to get
> to bed, so I'll dig further tomorrow.
>
> Saravana: Apologies for not getting around to testing this beforehand!

No worries. Apologies for breaking it accidentally.

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
