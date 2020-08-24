Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E56C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 00:05:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D1920720
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 00:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t5897/ZN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tcd-ie.20150623.gappssmtp.com header.i=@tcd-ie.20150623.gappssmtp.com header.b="ph3cmZei"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0D1920720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tcd.ie
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WiuAFjZn9PjGI16Rpwkk9x+6nrbvnjHesFhnpSKcTC8=; b=t5897/ZNyyp5iOCfcHofs5Kby
	GllEGUC7PRUyjW1mOTkbOPRhfg7AV2ySIHH1klA70UWHzdKWseA3WFlyMEt30+86VLh5ck2dGZfU1
	EMeKe9NNhBoQ/nxc/7+eKKpJ/NSV5E/F3njojUaS1wuiKmuD7Z316SHIcUZD0rJukLtm/5SeTcOtE
	gMgWcfPGKeUBVa4r1YaUO3BGf8TXCj09F/K0HxGT4k8dCCvjge1KPUX8xvDs0hAPirWeiTNrd43u4
	zVifUHmgu0UWvkls5ZuCzEgxqBiHHglUNi2urx1W8ZIeoPdMqkDqGGhcCi1NNmZ1XsMvAEGZO/3vE
	ocy7o6oAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9zyr-000684-Gz; Mon, 24 Aug 2020 00:04:57 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9zyk-00065s-IG
 for linux-mediatek@lists.infradead.org; Mon, 24 Aug 2020 00:04:52 +0000
Received: by mail-il1-x141.google.com with SMTP id v2so5821025ilq.4
 for <linux-mediatek@lists.infradead.org>; Sun, 23 Aug 2020 17:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qvzvkep7ZlQHNyjrGsuXQAp+x7s+RjdNiOv81NxtoQ=;
 b=ph3cmZeijsQTsHnHnrr9eCGgxMPexaLwCGnu3F9Od9T7oE9SJ1xriseSecoaLR+A31
 cxdttU99z8vHmtpSvs9wLGOOgPOY6GzwuKuovZh4UMjplaxKJu/wyAtKKGV99cTnuUCc
 b9jW667DJd78gpOSqL093TQrnCvZ9zpW4sDgc9e3s4gqdpHbIh0cqwIbSVLaQrTLqDAX
 thER0vKrZAtqkOJvYQeGZuITMeh4kPZ6AWC1kOvIEmnWvuxZr35lD2OOnlXMpkqB5GBo
 XlqFU7D/ggoXmysuTUVEiDWk1jvnBEMzHRuwpliqu/K2HYrSEPvB6WXxqYArt4mYifKa
 QdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qvzvkep7ZlQHNyjrGsuXQAp+x7s+RjdNiOv81NxtoQ=;
 b=cAsztpCyrQzFWp8UQ4couJOCkcSKQQDA6JMP7xYQBLU8Js1qdf9SYT0161tTMGcYgE
 vkmqclcRkfCtWR42F3qBCM8eSsysmusFhfaW/FHR+G05zpC56QO6Vrx1fMFb8/UYao95
 dTgCZXAYmSWuMlN70dxbnNWb7cK26ly2bm95O1Uvq2J5hstVFxn9AiQtmsaco/uR6wCA
 d0XDPkLCjnvl02mg2ZEtUmjzyvCYPWcXSyi8b0Wvc6zGKkyKm13U3yS1eCNGyexGWkMA
 Q7aExZ7brL4Mre4utG1sYITGPHbXOCYeTo1kY2HWkTW3kZmnhGyCqEkbSyYFxTTm6k1O
 Okig==
X-Gm-Message-State: AOAM530Wb4iWF5blTHjmMhF/7MsCI1mtOnH2XjQCGvYjsfIS07e5oZEB
 IyigL4WBBPsWre1BJm+UJ9pEQa+xGR7MXNlu9u+vbg==
X-Google-Smtp-Source: ABdhPJx+Rb9Dh5afCkPV93ubbfa83YINwHuyBNL6aGGIC9gNFt/GVdQQ5DqMV2LQPpqLPd5cGrS+QMzugsAJ9rHE3h4=
X-Received: by 2002:a92:4f:: with SMTP id 76mr2640989ila.11.1598227486317;
 Sun, 23 Aug 2020 17:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
 <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
 <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
In-Reply-To: <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Mon, 24 Aug 2020 01:04:35 +0100
Message-ID: <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To: Logan Gunthorpe <logang@deltatee.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_200450_847833_32602958 
X-CRM114-Status: GOOD (  27.26  )
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Logan/All,

I have added a check for the sg_dma_len == 0 :
"""
 } __sgt_iter(struct scatterlist *sgl, bool dma) {
        struct sgt_iter s = { .sgp = sgl };

+       if (sgl && sg_dma_len(sgl) == 0)
+           s.sgp = NULL;

        if (s.sgp) {
            .....
"""
at location [1].
but it doens't fix the problem.

You're right though, this change does need to be made, this code
doesn't handle pages of sg_dma_len(sg) == 0 correctly
So my guess is that we have more bugs in other parts of the i915
driver (or there is a problem with my "sg_dma_len == 0" fix above).
I have been trying to spot where else the code might be buggy but I
haven't had any luck so far.

I'm doing a microconfernce (at LPC 2020) this wednesdays [1] on this
if you're interested in attending.
I'm hoping I can chat about it with a few people and find how can
reproduce and fix this issues. I don't have any more time I can give
to this unfortunately and it would be a shame for the work to go to
waste.

[0] https://github.com/torvalds/linux/blob/d012a7190fc1fd72ed48911e77ca97ba4521bccd/drivers/gpu/drm/i915/i915_scatterlist.h#L28
[1] https://linuxplumbersconf.org/event/7/contributions/846/

On Fri, 29 May 2020 at 22:21, Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2020-05-29 3:11 p.m., Marek Szyprowski wrote:
> > Patches are pending:
> > https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
>
> Cool, nice! Though, I still don't think that fixes the issue in
> i915_scatterlist.h given it still ignores sg_dma_len() and strictly
> relies on sg_next()/sg_is_last() to stop iterating -- and I suspect this
> is the bug that got in Tom's way.
>
> >> However, as Robin pointed out, there are other ugly tricks like stopping
> >> iterating through the SGL when sg_dma_len() is zero. For example, the
> >> AMD driver appears to use drm_prime_sg_to_page_addr_arrays() which does
> >> this trick and thus likely isn't buggy (otherwise, I'd expect someone to
> >> have complained by now seeing AMD has already switched to IOMMU-DMA.
> >
> > I'm not sure that this is a trick. Stopping at zero sg_dma_len() was
> > somewhere documented.
>
> Well whatever you want to call it, it is ugly to have some drivers doing
> one thing with the returned value and others assuming there's an extra
> zero at the end. It just causes confusion for people reading/copying the
> code. It would be better if they are all consistent. However, I concede
> stopping at zero should not be broken, presently.
>
> Logan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
