Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C82C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 01:43:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE27620855
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 01:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dqYds1JF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rb1Aia/5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE27620855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JE5iNpDkrkax6tNtuB0KrXpFIXBlv3pQ2xz6o9GQuRA=; b=dqYds1JFMtIFDNmWz25uEIaEa
	8bJ0rIZU9pOY0pJAhuu1KWx2xTHaRN4IY1QIE3P95ecLWhiKHt37094iwEzGwpdDNw8Z0J/VLYnjz
	LxFM/EyDV8PZphRbVM4V5Sv4sWS/FQtREqoaqKn/9zMV9WBLAkhL7YTe2Vr7In1oX57AFH4WN5V0S
	Gamm3tI2RBTTz49qffSX1Y+Ok8EncHLEoffKLtuDPOGJfv+th3k6iOH+Ymz4VRv6nrjM8ZI48h5hb
	/WcesAOtubWLPyhA6aKXt5hVsE8Vwjk/WD1iNq46cdBl9Vdw9GWQDDmZIWH1tzZOTEG44Swk7t2o2
	aL3QR4NLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3rPF-00059p-36; Fri, 07 Aug 2020 01:42:49 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3rPB-00058y-4k
 for linux-mediatek@lists.infradead.org; Fri, 07 Aug 2020 01:42:46 +0000
Received: by mail-pg1-x543.google.com with SMTP id m34so100388pgl.11
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 18:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cAPX6D2qzJW+cM4TwCNFgYllwmjivb9JxeuNDMu8OqY=;
 b=Rb1Aia/5mpYUMxN9hLfbwKYrYIYeobqIFx7wpP7JvLpUfD1tC0oCip6VQfp5bQT799
 FF4++SLrByMlkoblaNVMVj8ujTPzej6dSye2kyYbmUbPAMQciDE8DIMVCFi4QrMXLGn1
 9mmghCPOjBC6AAwJgIeEJfLpHMo/FGQfLxgBAOMXnNlLKPq3Ou3gbd7FqihG2o9NIwKP
 yUYAUOyMVBk3flcgqrhsDhHKey1dKx5Pa4kIxtieOqaTiyq6IoCH9F4jq0WIYPwooMw1
 yvVTs98FXs3BnMt7vjDL+e1eCi4oSniROVL5yCD6K0erbM9xd+63A1SIAtLV5RxFlw+U
 do2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cAPX6D2qzJW+cM4TwCNFgYllwmjivb9JxeuNDMu8OqY=;
 b=lhdfNfZZ5cfrflAzk/ZfIUTSAbea4vYAtmHHo4nCla2Fo2Ruuu66ebZ2I003VCpFyG
 CIbFRQtUt2Aa19b1hAD2FEDtmSMkdcSG2IiZJ9Pv+YXWQNQL9Du0ya1LUwo6nsk1ts7g
 XVkQ/U2yYbtKlr1ABd+gR0Nhc7tdBPEBYpmEqSHHCTAT8Wcoezc2DP5UxxqIGgm1jOKR
 72XN6pQObzAlln5k1JrSQzIWp0cf0YkSblKnNSnbSN8oK7a0n6sE0E8dUcLoOaCS+HXx
 CmuI84zJLMQ7j7a8FqrtbYoBcedfKphU0m+Bx65KhLYobmc6+s4xehpzCRe4d/Hzf9SI
 jknA==
X-Gm-Message-State: AOAM533LTpef310SZ0hFlwyf3uxXnLuBALVniNJJgBaXghLWHArPQpC/
 xc4gaZb6nU/SCr5eUA5Y+/xyrw==
X-Google-Smtp-Source: ABdhPJzj4zgIDD/7qY6szboPvWpWjPCrmFgpaapdZ8cQMmuJnqsLKWM/UU/+vw2kRylnHv/CMYglwQ==
X-Received: by 2002:a63:6542:: with SMTP id z63mr10058026pgb.317.1596764561531; 
 Thu, 06 Aug 2020 18:42:41 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id h12sm10507294pfr.143.2020.08.06.18.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 18:42:40 -0700 (PDT)
Date: Thu, 6 Aug 2020 18:39:03 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
Message-ID: <20200807013903.GG20825@builder.lan>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
 <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan>
 <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_214245_302526_B8D49D86 
X-CRM114-Status: GOOD (  33.48  )
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

On Thu 06 Aug 18:22 PDT 2020, John Stultz wrote:

> On Thu, Aug 6, 2020 at 5:43 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Wed 05 Aug 14:57 PDT 2020, John Stultz wrote:
> > > On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
> > > > On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > > > > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> > > > >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > > > >>> <sigh>
> > > > >>> So this is where I bashfully admit I didn't get a chance to try this
> > > > >>> patch series out, as I had success with a much older version of
> > > > >>> Saravana's macro magic.
> > > > >>>
> > > > >>> But unfortunately, now that this has landed in mainline, I'm seeing
> > > > >>> boot regressions on db845c. :( This is in the non-modular case,
> > > > >>> building the driver in.
> > > > >> Does that mean the modular version is working? Or you haven't tried
> > > > >> that yet? I'll wait for your reply before I try to fix it. I don't
> > > > >> have the hardware, but it should be easy to guess this issue looking
> > > > >> at the code delta.
> > > > > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > > > > around 20200727, but I didn't track it down as, well, there's less way
> > > > > to get debug output on the C630.
> > > > >
> > > > > In my testing, module or built-in doesn't matter, but reverting does
> > > > > allow me to boot again.
> > > > >
> > > > Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> > > > boots, however, module (on the c630 at least) doesn't boot whether it's
> > > > a module or built-in.
> > >
> > > You may need to set deferred_probe_timeout=30 to give things a bit
> > > more grace time to load.
> >
> > With the risk of me reading more into this than what you're saying,
> > please don't upstream anything that depend this parameter to be
> > increased.
> >
> > Compiling any of these drivers as module should not require the user to
> > pass additional kernel command line parameters in order to get their
> > device to boot.
> 
> So, ideally I agree, and Saravana's fw_devlink work should allow us to
> avoid it. But the reality is that it is already required (at least in
> configurations heavily using modules) to give more time for modules
> loaded to resolve missing dependencies after init begins (due to
> changes in the driver core to fail loading after init so that optional
> dt links aren't eternally looked for). This was seen when trying to
> enable the qualcom clk drivers to modules.
> 

So to clarify what you're saying, any system that boots successfully
with the default options is a sign of pure luck - regardless of being
builtin or modules.


And there you have my exact argument against the deferred timeout magic
going on in the driver core. But as you know people insist that it's
more important to be able to boot some defunct system from NFS than a
properly configured one reliably.

> It doesn't seem necessary in this case, but I suggested it here as
> I've got it enabled by default in my AOSP builds so that the
> module-heavy configs for GKI boot properly (even if Saravana's
> fw_devlink work is disabled).
> 

With all due respect, that's your downstream kernel, the upstream kernel
should not rely on luck, out-of-tree patches or kernel parameters.

Regards,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
