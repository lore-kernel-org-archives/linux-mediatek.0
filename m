Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6426AC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 19:19:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E2E2176B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 19:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X5MSuuDI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KuwTS0Ct"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E2E2176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+v8ytVhrER50y8iNObpdd7/GlQV9r3SfA5Thl360HG0=; b=X5MSuuDIOPiPHZrR5waEqpCcT
	gFQWVNTONpZY20PWtrUk33E/0rfea4IFGOzQPrWV/F1AW9y4g+0hmozX/ayF/ztCqrJYKXTpnWf1r
	lsSbKH9VBZbkoIH6QE9god3M9giJt4udJHBZPDfYhawwRrdqxjP0p//gHfuOiCxbfYYXLtCOOhtt/
	3XKB8WMtO0E7n+7cj/vWRVpUyVGhch/3aCqtKD7r+eUWfUDAfYxD1q2tOsEBbjBqPO7cUGl0u8B6K
	ZLNVZ4i6eMapFO9iAQG6KHhiv+VpLtWvRSVfPR/U93ebAanCwEtzMF3yszhJQddTuR9azxstFx+qy
	hGCJZyC7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxbK7-00072N-AV; Mon, 20 Jul 2020 19:19:39 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxbK5-00071F-1X
 for linux-mediatek@lists.infradead.org; Mon, 20 Jul 2020 19:19:38 +0000
Received: by mail-lj1-x243.google.com with SMTP id q6so454330ljp.4
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2020 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c27QdDaalrBPTYx6Hz4qEdOcDXJQt2hGAF2f+ujhjF4=;
 b=KuwTS0CtDg/KT6Vr6p1o4UTZ7HWalRZpW11IdhJWv6Yc5j/TD5gQ7zm5Jjh6B8XI5h
 yfJNFC7eK2lRmItt7PjIn51fAIMXuBYxgWFd3bm23wg5S6Tq4aHjL48ntwLG1xpskAHd
 IC9EtdXCtrNqzLjo5l8RV9NjG1QYz/6dbUsCE6VVhWXw48lAjBR5EyNpzl8NDfqOktSX
 EPmX6U04po198OszhbuhONTWOov4Xd3WFtEE0kzJi4eP9qCQ8vQq88ZBwSDh8+1T4FRD
 hbv4wlJXAUpI8yWYfRaNYst5gn2EOYKYC/8BLagM5mfRI31ySXxAV9tBd5D4Cr90agjs
 Lvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c27QdDaalrBPTYx6Hz4qEdOcDXJQt2hGAF2f+ujhjF4=;
 b=t27zNGo4DLZB3kD9RJheF4+FClLeABhYlqZs9NUZU7OmUann19/NijJX15+Pzn5Vsq
 y4iXi3oGZTA7IT9Pg5zPofDfolnj0F2cNiVsKWxFQxIcXWHHAIfEOA8sOFM0Qd5Pgsha
 E3S7Deqy+3gxEFhKDFgfMxij5QLa3ZuVfOGA96DQcXeZr+quocij7nMy038JRVng88xP
 54/2yfPtdPbbvIIKrR39in2UFiyDF2A2fG42kXNtoC9HsiRvJp2T55IWHp3OJbV5Cszc
 +NQJIssLJ5HgwH0PQUqisz6F6Qjs+Lv1OicBqr9P/RswdUcoblpAYMofmaVRQBwK3mWo
 20mQ==
X-Gm-Message-State: AOAM532NaLbexOPczKAUxbiOwM/eAGCV5L4RcI3aYHol6/QxKSMV9koz
 EtVOne2vDCQI45mekG/eTuwvbbNqouNwbSaYCigR8A==
X-Google-Smtp-Source: ABdhPJytd1L3t3odiIQNSjrPSpGOSnIfawPzcqrPm7XkSZxsxS8d6ysT2xoLHLvMBq1OahMA3S7JIs4XecxrzglTgn8=
X-Received: by 2002:a2e:7401:: with SMTP id p1mr11812893ljc.366.1595272774987; 
 Mon, 20 Jul 2020 12:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuzqA0N6O-52uH9aHjsfF6HfhuxMby1Y6Yz7jGMAHW0zw@mail.gmail.com>
 <CAK8P3a1SHQKNNCVj9Gp25BLuXUC2nf7FuVrqfpPYQkvMbhjzFg@mail.gmail.com>
 <ad7ba016-c3eb-a833-e4d3-4cdcb53ca786@arm.com>
 <CAF6AEGsBRxFC918nNzJZnxMpFnNC6qcNGvMjjM8U3AAn6CusNA@mail.gmail.com>
In-Reply-To: <CAF6AEGsBRxFC918nNzJZnxMpFnNC6qcNGvMjjM8U3AAn6CusNA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 21 Jul 2020 00:49:23 +0530
Message-ID: <CA+G9fYv9K3FqR6D9=2jvQ3s_eSTL=K-x4QW4-P7=AgfjjHCBwA@mail.gmail.com>
Subject: Re: [Freedreno] arm64: Internal error: Oops:
 qcom_iommu_tlb_inv_context free_io_pgtable_ops on db410c
To: Rob Clark <robdclark@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_151937_752061_1AC62D57 
X-CRM114-Status: GOOD (  22.50  )
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Joerg Roedel <jroedel@suse.de>, Vinod Koul <vinod.koul@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "Guohanjun \(Hanjun Guo\)" <guohanjun@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Eric Anholt <eric@anholt.net>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <john.stultz@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 20 Jul 2020 at 21:27, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 20, 2020 at 4:28 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2020-07-20 08:17, Arnd Bergmann wrote:
> > > On Mon, Jul 20, 2020 at 8:36 AM Naresh Kamboju
> > > <naresh.kamboju@linaro.org> wrote:
<>
> > >> [    5.444121] Unable to handle kernel NULL pointer dereference at
> > >> virtual address 0000000000000018
> > >> [    5.456615]   ESR = 0x96000004
> > >> [    5.464471]   SET = 0, FnV = 0
> > >> [    5.464487]   EA = 0, S1PTW = 0
> > >> [    5.466521] Data abort info:
> > >> [    5.469971]   ISV = 0, ISS = 0x00000004
> > >> [    5.472768]   CM = 0, WnR = 0
> > >> [    5.476172] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000bacba000
> > >> [    5.479349] [0000000000000018] pgd=0000000000000000, p4d=0000000000000000
> > >> [    5.485820] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > >> [    5.492448] Modules linked in: crct10dif_ce adv7511(+)
> > >> qcom_spmi_temp_alarm cec msm(+) mdt_loader qcom_camss videobuf2_dma_sg
> > >> drm_kms_helper v4l2_fwnode videobuf2_memops videobuf2_v4l2 qcom_rng
> > >> videobuf2_common i2c_qcom_cci display_connector socinfo drm qrtr ns
> > >> rmtfs_mem fuse
> > >> [    5.500256] CPU: 0 PID: 286 Comm: systemd-udevd Not tainted 5.8.0-rc5 #1
> > >> [    5.522484] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > >> [    5.529170] pstate: 20000005 (nzCv daif -PAN -UAO BTYPE=--)
> > >> [    5.535856] pc : qcom_iommu_tlb_inv_context+0x18/0xa8
> > >> [    5.541148] lr : free_io_pgtable_ops+0x28/0x58
<>
> > >> [    5.628297] Call trace:
> > >> [    5.633592]  qcom_iommu_tlb_inv_context+0x18/0xa8
> > >
> > > This means that dev_iommu_fwspec_get() has returned NULL
> > > in qcom_iommu_tlb_inv_context(), either because dev->iommu
> > > is NULL, or because dev->iommu->fwspec is NULL.
> > >
> > > qcom_iommu_tlb_inv_context() does not check for a NULL
> > > pointer before using the returned object.
> > >
> > > The bug is either in the lack of error handling, or the fact
> > > that it's possible to get into this function for a device
> > > that has not been fully set up.
> >
> > Not quite - the device *was* properly set up, but has already been
> > properly torn down again in the removal path by iommu_release_device().
> > The problem is that qcom-iommu kept the device pointer as its TLB cookie
> > for the domain, but the domain has a longer lifespan than the validity
> > of that device - that's a fundamental design flaw in the driver.
>
> fwiw, I just sent "iommu/qcom: Use domain rather than dev as tlb
> cookie".. untested but looks like a straightforward enough change to
> switch over to using the domain rather than dev as cookie

The proposed patch tested and confirmed the reported problem fixed.

ref:
https://lore.kernel.org/linux-iommu/CA+G9fYtj1RBYcPhXZRm-qm5ygtdLj1jD8vFZSqQvwi_DNJLBwQ@mail.gmail.com/T/#m36a1fca18098f6c34275d928f9ba9c40c6d7fd63
https://lkft.validation.linaro.org/scheduler/job/1593950#L3392


>
> BR,
> -R


- Naresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
