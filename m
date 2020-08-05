Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AB0C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 21:57:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB762206F6
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 21:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qC7/stfr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g58fggaC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB762206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N+CKtoKw4Bk1Myow4YHM8SuvNfKiswblQr30yOQ3mJY=; b=qC7/stfr722HYDXLnt5nxd7A5
	Sfb0VbZhx4WtZCQXMAVnR72osflS8pSqUEUpXKl1qhXpUEAKPNY3fITy91aJU+PzR8JVNYQawa0yO
	w2SSkuxIpY6hTzZ5G2N6XclH0qtGaePNc/umSzc1LJXnhSm29oovJLvU3w3XpDuy2dynGkdhBvWv9
	ohmUrG7Onm5oOG1AYM3df1vIgX98athQTN8ZvNaLfv2jB6zTXyt7lCgw0j2fN5Tt+hFtxyyueSdVl
	WqhSA+FWe1Vv3Q01JWt+u2z4UID011awvUDDGxglYU0rCIennzUcLeV0VzQJQbePkOx3pDtmr1SOw
	uJdCGeHvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3RPh-0003Tf-3V; Wed, 05 Aug 2020 21:57:33 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3RPd-0003Sa-1r
 for linux-mediatek@lists.infradead.org; Wed, 05 Aug 2020 21:57:30 +0000
Received: by mail-ot1-x343.google.com with SMTP id e11so10390245otk.4
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2020 14:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EW1xytv7V7gDtjoyC2+l+LNJutA6LsLNhSa7cNIEDgw=;
 b=g58fggaCpWJ8fV/7CT/RBrakbZOA/j2Fa6hXVlgy536iNIRtiT9JteFTdZw86bGzIW
 83wKiU5+B1Y/On+B5ugh2UKgLeMt+Er1aujK646TJnafUeAHXN92H3DXBvm6t3epbUki
 bsww+LL2RH8kFh6MmhSeZcrHNlUlO+fA/LkNkTdBV72HD1iUiGZc+27+Rhn7Tq8wIldc
 4FQvVUXkQfW2yVntxTeJ8fe7+Kqhl00eeoTp/2XLaHwhKqiU1kmSvutHH+2J9DwEumnN
 XA2WwC8dwZgkM1kRPUk6LepeVPBvWInffL7Z/YUXHIBkYBI+4HjMqbAl/0PbVMOln4aM
 fpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EW1xytv7V7gDtjoyC2+l+LNJutA6LsLNhSa7cNIEDgw=;
 b=UgF55V9zToeHtYmelNHpD3UiVQVjXMmO+0B1YoEhtvYNH5/FdE2dqvP29Et/mQaoZl
 Gd1H4pdBU6qkrUpAySnV5xTIck/5OoSG/03zNUy3jKXlZnaCg58BRKva2KAosne3Jzn8
 n5hBM/Tz0KUNm0Vpw8fq43ismS6fHA1SWHq55sM+Ik2uu96xQlqvDWRtDnyMykiVRqBL
 4PEKUf/444mBbQxRjKiSiQ92QbmYvG/UDbFXyOGMAJwk07BZTsZhc4z055jxdr7KwxFO
 tMv+z5Q5wIJBVDwl67lJDmiaoIPnzJswpUmIseqXx4H74IinFmG/3Ic6SzeyanhuCkFw
 s22g==
X-Gm-Message-State: AOAM533GSIUBnrIIYesDFVuTFfgLw93XX/iMwP5BHs04znwQsPoAON01
 3qRYXHgZKqka6DwDcSD0B3tVb/zf/qykpDGMUI3Edw==
X-Google-Smtp-Source: ABdhPJzBW5pD245rGtYcy2dRuaElWUSO+wS3GTkjkqWacA2ZZgSIt1aLNiPlWdINx/ZIfm6Z0QL6TEq/RfC5ZpgXOXU=
X-Received: by 2002:a05:6830:237b:: with SMTP id
 r27mr4305663oth.352.1596664645516; 
 Wed, 05 Aug 2020 14:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
 <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
In-Reply-To: <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 5 Aug 2020 14:57:14 -0700
Message-ID: <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Steev Klimaszewski <steev@kali.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_175729_365645_D0188A03 
X-CRM114-Status: GOOD (  21.31  )
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
 lkml <linux-kernel@vger.kernel.org>,
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

On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> >>> <sigh>
> >>> So this is where I bashfully admit I didn't get a chance to try this
> >>> patch series out, as I had success with a much older version of
> >>> Saravana's macro magic.
> >>>
> >>> But unfortunately, now that this has landed in mainline, I'm seeing
> >>> boot regressions on db845c. :( This is in the non-modular case,
> >>> building the driver in.
> >> Does that mean the modular version is working? Or you haven't tried
> >> that yet? I'll wait for your reply before I try to fix it. I don't
> >> have the hardware, but it should be easy to guess this issue looking
> >> at the code delta.
> > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > around 20200727, but I didn't track it down as, well, there's less way
> > to get debug output on the C630.
> >
> > In my testing, module or built-in doesn't matter, but reverting does
> > allow me to boot again.
> >
> Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> boots, however, module (on the c630 at least) doesn't boot whether it's
> a module or built-in.

You may need to set deferred_probe_timeout=30 to give things a bit
more grace time to load.
(I've mostly recently used qcom-pdc as a module with the android tree,
so the fw_devlink bits help there, but I need to re-check the state of
that upstream.)

I'll dbl check this and dig more on the issue with the patch in
question once I can get back in my office later today.

thanks
-john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
