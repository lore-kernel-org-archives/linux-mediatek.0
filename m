Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2417FC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 01:23:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F15A6206B5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 01:23:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IPNx3jnZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="osmTCgse"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F15A6206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u3wdTQk3jD3ccosjACgaJt7rOmrYtd+ji1hGJWZOnhA=; b=IPNx3jnZ5S+cm6OZ829vslpsy
	oUUc8LGz4mUqURoT2vNO04ia6aOGO3ZAac3OnAIypCEDf555zk8jmkSNZ89ma6P66vQ2jLh7DQZ/c
	5qJtlokjW38OUfQvo5f1E4yoBbdpOuMXxFRYCPPBqF0dKngryyJLFXkOgNcUg8E3pgjjK9+Lr/aZN
	85NcVPU1n8h6IEJI6ZNbhCx9B+fuftVylTkqylPtT2YoLGFP5x+9q4OiRb1947VPCIq9CnY3wwGf5
	NvnJ/X9gSrBsFO4S1HhdrfN98WVjRG5VhAFrr7tobn1O8bBXaADDc5dQJiDQoP3xIGGTPViTMiriU
	EJX36fPXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3r6E-0003lI-Hh; Fri, 07 Aug 2020 01:23:10 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3r6C-0003k9-3b
 for linux-mediatek@lists.infradead.org; Fri, 07 Aug 2020 01:23:09 +0000
Received: by mail-oi1-x243.google.com with SMTP id l204so508145oib.3
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 18:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EGoiJwr7Yn7E8C81RuccqJ1OLqJy/5B2GmlLZzl97CY=;
 b=osmTCgsekWezaCWmBB9Fal9fGvS/B9ZLHEO/zNUnaIFHxPMRYcgjd8J32mw+CwJl/u
 t7LcYW/wgR4ddB0nPQminG/BGV8meoautGgE291F5yX/BB7hzW/sR3HtvdwwgLEylpJ6
 xZVqSoMvXPPAq5FqyM0q1LbzCD+g/vBFFo/yB10uFLsiqzKwNz2xbT+GIXiTopKtXGgT
 0Aa7+kvPGsakHXyCuSLBqYhT2UPIgDdmgQjPI+WvGzGHA8OihhXvuxt/minXpuA0mB4R
 IQuPoapIrW9o9m01ORxnrpPMiO+ZnDU6e9odE1eZrejTiMc4Tj6xl+vqu8idgUtDC9Ek
 /lpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EGoiJwr7Yn7E8C81RuccqJ1OLqJy/5B2GmlLZzl97CY=;
 b=EOrmjr9QZ2rpzdyOLhH10s0ES46uxTjxfQ8CEJnWipB5uYBWVoQbtXgxEzKCW79cfT
 mXfXnX/fBqPhsmKW7cVYFFo4qS/6CGDsTDLcroE1RbmPbnT2H8nMg8Wa1KdITKQjVI9a
 wZqShkaP1C0CeZBG+U8buIcb0PZ62jWH2jRQFck+rfeZrAXWPJmdI5/lomTMSiaff9PX
 BgW5pURBwOYz4tjdFI5HqpRNA5UUbaswdbSwnLNg6R+36O98tENmAyMqeSbNvZNjjcgU
 T3fjF3zr3ClgwQ1BNPshhweipzczmMLfFIedUE5utYAlNZO2CvAwf0v0ehn7edQb6noz
 59Zw==
X-Gm-Message-State: AOAM531XAh37ApqHzYK7VjBo+hee0czsjSZEv7JmSYFqoUmQoGOlsZbh
 mQWivrWaEWmtRo1VNtD2oMGathB9IDHDJl9kNf9eq7p8
X-Google-Smtp-Source: ABdhPJwFk2nflHwOtTvVQHApMHk97eO1yiJZx+c9NT3sX6L2W+QUIqlBsciPxXNEYOGivlC0fJKcGnGDyWS8Vo0yGMg=
X-Received: by 2002:aca:f106:: with SMTP id p6mr8969952oih.169.1596763384888; 
 Thu, 06 Aug 2020 18:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
 <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan>
In-Reply-To: <20200807004001.GF20825@builder.lan>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 6 Aug 2020 18:22:53 -0700
Message-ID: <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_212308_485164_4B5411D2 
X-CRM114-Status: GOOD (  28.86  )
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
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Andy Gross <agross@kernel.org>,
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

On Thu, Aug 6, 2020 at 5:43 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 05 Aug 14:57 PDT 2020, John Stultz wrote:
> > On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
> > > On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > > > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> > > >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > > >>> <sigh>
> > > >>> So this is where I bashfully admit I didn't get a chance to try this
> > > >>> patch series out, as I had success with a much older version of
> > > >>> Saravana's macro magic.
> > > >>>
> > > >>> But unfortunately, now that this has landed in mainline, I'm seeing
> > > >>> boot regressions on db845c. :( This is in the non-modular case,
> > > >>> building the driver in.
> > > >> Does that mean the modular version is working? Or you haven't tried
> > > >> that yet? I'll wait for your reply before I try to fix it. I don't
> > > >> have the hardware, but it should be easy to guess this issue looking
> > > >> at the code delta.
> > > > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > > > around 20200727, but I didn't track it down as, well, there's less way
> > > > to get debug output on the C630.
> > > >
> > > > In my testing, module or built-in doesn't matter, but reverting does
> > > > allow me to boot again.
> > > >
> > > Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> > > boots, however, module (on the c630 at least) doesn't boot whether it's
> > > a module or built-in.
> >
> > You may need to set deferred_probe_timeout=30 to give things a bit
> > more grace time to load.
>
> With the risk of me reading more into this than what you're saying,
> please don't upstream anything that depend this parameter to be
> increased.
>
> Compiling any of these drivers as module should not require the user to
> pass additional kernel command line parameters in order to get their
> device to boot.

So, ideally I agree, and Saravana's fw_devlink work should allow us to
avoid it. But the reality is that it is already required (at least in
configurations heavily using modules) to give more time for modules
loaded to resolve missing dependencies after init begins (due to
changes in the driver core to fail loading after init so that optional
dt links aren't eternally looked for). This was seen when trying to
enable the qualcom clk drivers to modules.

It doesn't seem necessary in this case, but I suggested it here as
I've got it enabled by default in my AOSP builds so that the
module-heavy configs for GKI boot properly (even if Saravana's
fw_devlink work is disabled).

thanks
-john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
