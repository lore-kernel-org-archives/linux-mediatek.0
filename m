Return-Path: <SRS0=eMNs=BF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55BDC433E1
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jul 2020 03:59:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B22262053B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jul 2020 03:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bJCN7mVt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="pW3nnfGF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B22262053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uwa/G9ed/wRyvHK5HT2xyeTf2Iqld7D/J/ONt2z+sIo=; b=bJCN7mVtnC64rwJ2BfJuIqWN7
	iCUJ1xxnbNP8HCG8xWGOQ184PrEA1g9K2EnCfbIT0w06rJ0vSVRtx157lmCQ46DNLvdDAmUPN+PyT
	2bLmfz/l8zyNPU7PkDvgk62KbHRqxZtgW09N4lYOGLkoWbf79TWBEoWm7pj0ZHhRzK8nOnsRarFbT
	XMkb8S9Bd1Yz9Qe9cqp/V4QKekRX2ggXgKiB0OqyfTvl9Gp7wHt+5aye2f42aSV1PI21xhuBYpU9t
	2wXrNorr34FOY3L0rTHPlWQFH5vDzoYuim69UBU0T5UDW125l0JO8jBMX3RwpM0AlKiaTXv4vJP0M
	BdAv3x98w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzXoK-00073I-6y; Sun, 26 Jul 2020 03:58:52 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzXoF-00072S-TR
 for linux-mediatek@lists.infradead.org; Sun, 26 Jul 2020 03:58:48 +0000
Received: by mail-pl1-x644.google.com with SMTP id t6so6444959plo.3
 for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2020 20:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jcaev1Cp7bKZYJR/UD71l80ZfPg2FMWy0HIr5qj2bGY=;
 b=pW3nnfGF9WNDmVTg3erlNCt9uor03x6BZY37vmHSdP/xICtKgeoqTIYUtOqGOGI6kx
 wuXTf9SMQ2Z/ErYmpP7TYebvPZRaAte8jmiOKquFASWUAxefXF8STiy/6P/Jv7R00kBl
 57dQfKZ8WNigXDUijzvOgs/mNBoEIxbs9PlpEC38RImsjO2WVr8iPSXNIl87vtl9a9qq
 i3tHldUSxyybwQGYKtwc1pCYThrLKg67f/t+eRlWvRje+OjBVUmB/EbiwIKg5Ks97btC
 yz7ob2Qp8v5wYvw5b7+lebRQDzRVb9I7zg9817yrUOdm0QQ/Spsbpv7a9Cyl4JlpmWF6
 x7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jcaev1Cp7bKZYJR/UD71l80ZfPg2FMWy0HIr5qj2bGY=;
 b=n/5lSdZpLR+gINJ+boD4vcbAmmhK4SeAj5rrQiYGchtwBmUiWM7rdCyfTOQuVWTLg7
 Fs/QITb+zZBA2yu5dGo6fKiZQE+PzfjJlQ1l+SOOZ1biQfOUKgjg03kWsa7O9tvYHUjo
 jXyfJv0uw9Wzedv/07YrS+oSMdGCQjsYsdXVac8P6QZ+gPMNVI+yqVn1KchnzSEAduR/
 wfk2duu97YJwzmA43mOXjqs2b3MHhBtNC/NEsRfTLnJfj2v8SBY/aPXsXbugJWA13Af0
 eqP6Es1Oit2T4766rOxJ6BTyhU+Mlz6cbp275801SssWVGSBtUjpXMTahrjOkON+mafw
 rdlA==
X-Gm-Message-State: AOAM5327y1MCcjdbPQ4jkek7Hxk8yUxfMfNmA2kj9HD+AUbZbV6GARk0
 sd3GTFO0vD9/xIz4e94VhIKrmhvcwgltO9XEoAulVw==
X-Google-Smtp-Source: ABdhPJwXraTjC6SZ1tebNEZfR+TFnQAO2mmQKDrLOibMydwILen7cWd7OX+0bEwRfZm/OlR0+VbdaTmWP6YaljsQzW0=
X-Received: by 2002:a17:90a:f98e:: with SMTP id
 cq14mr1036997pjb.51.1595735922224; 
 Sat, 25 Jul 2020 20:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <159568680935.564881.11936174169505990646.b4-ty@kernel.org>
In-Reply-To: <159568680935.564881.11936174169505990646.b4-ty@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Sat, 25 Jul 2020 20:58:06 -0700
Message-ID: <CAGETcx8qyn8TmwvTrXkYEj78MdCNr+HxV0x7JTc8Wvo0VanKEg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] irqchip: Add IRQCHIP_PLATFORM_DRIVER helper macros
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_235848_058109_9DD8763C 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: marex@denx.de, CC Hwang <cc.hwang@mediatek.com>,
 Jason Cooper <jason@lakedaemon.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org,
 Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 25, 2020 at 7:23 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 17 Jul 2020 17:06:33 -0700, Saravana Kannan wrote:
> > Made a series out of the previous v2 patch + some example uses of the
> > macros.
> >
> > Not sure if the MTK changes work (just compile tested), but saw that
> > Hanks was trying to make those drivers into tristate. So I assume
> > they'll work as platform drivers. Please wait for MTK Ack before picking
> > up patches 3 and 4.
> >
> > [...]
>
> Applied to irq/irqchip-5.9, thanks!
>
> [1/4] irqchip: Add IRQCHIP_PLATFORM_DRIVER_BEGIN/END and IRQCHIP_MATCH helper macros
>       commit: f3b5e608ed6d17bdf04dacbf2374f10d51fe9b09
> [2/4] irqchip/qcom-pdc: Switch to using IRQCHIP_PLATFORM_DRIVER helper macros
>       commit: 04741740254cd83fb4f2b7747aeb35202104f8fe
> [3/4] irqchip/mtk-sysirq: Convert to a platform driver
>       commit: 3ae3022690e6787839dafa8ea3496450248b53e1
> [4/4] irqchip/mtk-cirq: Convert to a platform driver
>       commit: 538b63351607960ff2249460089daa31337ddeba

Thanks!

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
