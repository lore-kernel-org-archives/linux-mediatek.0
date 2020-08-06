Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D56C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 21:17:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74AAB20855
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 21:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fyn0hBtr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Ilj501oW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74AAB20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G3yR80NjWoyf8IoH9hbplh8iDTbuDGRQnCFhARPo5rI=; b=Fyn0hBtrYQub0aw5jtigPo+ph
	8T41ewoBUz/ibxGz8hML2jvCIejFcqXHSi4zVc6TkPVVSUkVa14sacYrIIpNGyXyBl2SDOoTUvzOF
	nvE0Bcuv8kbvVEvstwQOZfbiwjTMauVEbSBJuDzGHBt4PK4pKWqmYYt25gw0yA7zuvrY2QvokrBNm
	zEpNyi+g7evB+wJwEPC8IvM5W2x+1OdfT2t24wdc4zUefRFTDAnIAeNA6xTwUlFW7In5Xex5qr1YZ
	8+dOjyW35MHqy5tB5WeuXoYEpmODlmqsgvxKDpgLWzukkwI7R+NC1QenmG+1DfACtL+e9UrK6qLIN
	e92c8rs3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3nGK-0002z3-Kf; Thu, 06 Aug 2020 21:17:20 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3nGG-0002xP-7P
 for linux-mediatek@lists.infradead.org; Thu, 06 Aug 2020 21:17:17 +0000
Received: by mail-pl1-x644.google.com with SMTP id u10so26971plr.7
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 14:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eV8wb+RsdeHYLL81ZzFkJklCb773PCylfjZoQQTqqHk=;
 b=Ilj501oWJ1SJEEkOu4H0cRl65mw/mGy5jAcbhftwByDGT6m9P1BaJYr4Q3HXbt386t
 X9spmjep6n/w4vk/sm6rcjF0qtYeMwfs49DmGEDOc19jhubsDg+YAI3FVehBsyLWyr07
 bwf5KfOPc9u+iWiWVHMN20Wg/JCtF7pcoZyOB2UeyGXB0/cdURoDO9Xz56HzILfTGhyC
 ez7HMsHEBfsP3izaeTIP+EKvOA0SQbSsrDFjOrGYLmUznUk8QewWRxVNfzV8p0CfwBfF
 zdamkXFxvcJ93mPrSNLxZgA7L7kURrj7ehHzrgqQzx1eSLuylA6FmP/iMtJcclVQAsYm
 E/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eV8wb+RsdeHYLL81ZzFkJklCb773PCylfjZoQQTqqHk=;
 b=qdebDplyQSX2i7fFi4OwnIJxBHO+z+AasC2ra40InRiw4f47SKyMHqZbBnvnoQ/3Un
 2DteJuFQWedic9yQThx9ovnjKOkzb9SlunO0QBaVt/m9dzvLwX8rqzAX0nES8WnPSPJH
 Ggvib+AtfDymaUn8f+2li5LQH5qXSplGnjXSrSAhGC00QEkjcIN9Z8kw3Q7GkEAF/UJ6
 xJaxgHUyjB98NKpJ/3Lb57K1XRv6ZHrUFr+ld1XmziLa84n2nfgUdLKteGxoayRnYi1A
 hNrEgEMd9vFirxrbpAJVkAKWeiMFhQd6kynYYgoXshVOl7CrupW31FxHkQaq1eyvqNqU
 b7hg==
X-Gm-Message-State: AOAM530DfoXRVa/uHpedWtPwvS+KWkrpJBThzUmR3/Fufk+hHCC/TSi7
 h5JWzbAza8zug9sX0E2wnN91GItts2MMgsWC0lyfyA==
X-Google-Smtp-Source: ABdhPJwxa5hoV+G+t7Ugq7LuOXigLOdS0GIeXL4QAEqUmFx9J9SHj9yeMKBtNaXsYZy3Ec8R9vvh0bo0MJfkC9L0ilY=
X-Received: by 2002:a17:902:9305:: with SMTP id
 bc5mr9728271plb.21.1596748629518; 
 Thu, 06 Aug 2020 14:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
 <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
 <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
 <4d79a3e9c8c24f8adb6f7ade97d5a9c6@kernel.org>
 <CALAqxLUhit4Zz27Uce7gPGVRmkDJ_2UTC2fyk8NkOfgqR8diHQ@mail.gmail.com>
 <c5e73672a123ee6a920bdd0c3d6023c4@kernel.org>
In-Reply-To: <c5e73672a123ee6a920bdd0c3d6023c4@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 6 Aug 2020 14:16:33 -0700
Message-ID: <CAGETcx90=BDUE5Mr8xNBBOunp2zp=ApkUdJZCVTNEkOTs38iyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_171716_353100_1082B232 
X-CRM114-Status: GOOD (  13.27  )
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Nial Peters <uceenpe@ucl.ac.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 6, 2020 at 1:31 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-08-06 21:09, John Stultz wrote:
> > On Thu, Aug 6, 2020 at 12:59 PM Marc Zyngier <maz@kernel.org> wrote:
> >> OK, thanks for confirming. It would have been good if these patches
> >> had seen a bit more testing.
> >
> > Yes, again, my apologies for that!
>
> I would say this should be the job of the patch author, before
> anyone else. Yes, silly bugs happen. In this occurrence, it
> could have been avoided by just boot-testing it, though.

Sorry about this. I don't have a DB 845c to test this one. I generally
work with John or try and backport changes to devices I have that are
running older 4.xx kernels. This one seemed harmless/simple enough
that I didn't think I needed to go through all that. But obviously the
few times you don't test is when things fail :-(

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
