Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1E5C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 00:43:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8871206B5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 00:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2nslXxEQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whSCyRwN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8871206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xwk6hLAd1QGY97Zz/xzJQdIGzsVL3iSOcSO3OkY9/TQ=; b=2nslXxEQLE+kUriAuiQjbUzaU
	RID5tyWawfE3xWOozUm8+NeBNMMKCZjCOTH4K7BLQqFcl7RO4IOwAZWsI357ATOVr7w/3LQRJ0wJa
	wRNYkHXSVqKY5LtLUy8T3utDKLZ67j9VMydZG3NTmk6/9OPf/fEjVw5xubYI5rJZDASfXIVuYabr6
	83uwzVJah07Vq0UiY0nzkvWEt5A7Q7eh0e9NtlNl/SKavzrwgCGRQhUGnFHEIi3gLfogYKM81NQcv
	RL95snLas7TgmSwNJIk8GXYZ+XruUwlSFqg3tAz1UgGzjGCLf0QXpkpKUuH1KqdMn+SBmfZrng/Lu
	Y25V78BVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3qU8-0001Yb-IN; Fri, 07 Aug 2020 00:43:48 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3qU5-0001XS-9x
 for linux-mediatek@lists.infradead.org; Fri, 07 Aug 2020 00:43:47 +0000
Received: by mail-pl1-x642.google.com with SMTP id f10so238673plj.8
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 17:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RgPXZVMrIckGX5DmfsQv8yNcqJQDdPlKU/7tj+0RAOU=;
 b=whSCyRwNhpsO+yWDNZ4Cv5qNyZzpLOvp7DiNIK2pc3y7XGe+OgdIGNTYBxcj8Zsxh7
 zYK0DR66GIMJwtwOdD0UOwxI+I5yf6lNoZKf3J+MlgeO82rATZ4XoQZuFSQZYbA+Y1el
 SO329IS71+vYIjIWEGLmlMbwErG6gv2/N5bXbsRi6xPMSzueQ04XdqNNg2be3HuBptsM
 +lJdAMvJDOB5JSozRVKaB3mz6n5A8d428+EF0qwNz/iOBaDczoIhMPLfszGtK7+UWBPK
 Z67kBsTMFlydITNfQZc49FejvfOdYfrpHYf+O4jF1aB9AFLpGA0O2BcoeO4qSphffdVH
 WRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RgPXZVMrIckGX5DmfsQv8yNcqJQDdPlKU/7tj+0RAOU=;
 b=LfVF4xcH+VglDAUVaSJeSRGPXgLSWVSZBhfc2T5P/EyZEzwR4pt0Sse/fuaXjZsFox
 VpiEY77eGNHfJlmBiTdiRO+fQH2DHicR+OYSxR+ZrySruPhclBN1OJaqTVzzQaqVYPsq
 Qkmgt2AuegwodVS3UyeZ24F1BFRdcZWRmTn3euqJlfdp+KAU1OfY9GYcYnkMZDLksIuY
 3QHKKPLPIMr7tEbJtF5Ak5xuYxUMv6tbQROkEIuQ2z7kTfKeCkSaaBJzu20OBabi+xz7
 NtX4M69pTQUUhSPo6NI4hBY4HD6xeJnMT37SIG9tgqUWMIDuDUE3rZRNTBz0Hve8HapV
 O0CA==
X-Gm-Message-State: AOAM5302KdoKw0fFLAGNf1COlmYumDco5bXkLOseJBEH6jv1i6a+nuP4
 2v0hctPWkf5Iw7sHnkPX03qQFA==
X-Google-Smtp-Source: ABdhPJzzSsdKj+hMfY/ueb2cz2zxYSb8Y/2u33WYsliSAC12b4M2MWm1xSe3yMluHLVX3jxKgljGCQ==
X-Received: by 2002:a17:902:8a88:: with SMTP id
 p8mr10174683plo.184.1596761019053; 
 Thu, 06 Aug 2020 17:43:39 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id b15sm9673497pft.116.2020.08.06.17.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 17:43:38 -0700 (PDT)
Date: Thu, 6 Aug 2020 17:40:01 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
Message-ID: <20200807004001.GF20825@builder.lan>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
 <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_204345_777100_375B126F 
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

On Wed 05 Aug 14:57 PDT 2020, John Stultz wrote:

> On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
> >
> >
> > On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> > >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > >>> <sigh>
> > >>> So this is where I bashfully admit I didn't get a chance to try this
> > >>> patch series out, as I had success with a much older version of
> > >>> Saravana's macro magic.
> > >>>
> > >>> But unfortunately, now that this has landed in mainline, I'm seeing
> > >>> boot regressions on db845c. :( This is in the non-modular case,
> > >>> building the driver in.
> > >> Does that mean the modular version is working? Or you haven't tried
> > >> that yet? I'll wait for your reply before I try to fix it. I don't
> > >> have the hardware, but it should be easy to guess this issue looking
> > >> at the code delta.
> > > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > > around 20200727, but I didn't track it down as, well, there's less way
> > > to get debug output on the C630.
> > >
> > > In my testing, module or built-in doesn't matter, but reverting does
> > > allow me to boot again.
> > >
> > Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> > boots, however, module (on the c630 at least) doesn't boot whether it's
> > a module or built-in.
> 
> You may need to set deferred_probe_timeout=30 to give things a bit
> more grace time to load.

With the risk of me reading more into this than what you're saying,
please don't upstream anything that depend this parameter to be
increased.

Compiling any of these drivers as module should not require the user to
pass additional kernel command line parameters in order to get their
device to boot.

Regards,
Bjorn

> (I've mostly recently used qcom-pdc as a module with the android tree,
> so the fw_devlink bits help there, but I need to re-check the state of
> that upstream.)
> 
> I'll dbl check this and dig more on the issue with the patch in
> question once I can get back in my office later today.
> 
> thanks
> -john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
