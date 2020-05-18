Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 14:20:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0391B20657
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 14:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bglo+hCC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0391B20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrlIgSL5AsuyG563b9DoekDSkSY03danz9EYVIgaSlw=; b=bglo+hCCrWOwjB
	duXsEQ+RTOCTus4ZOdQiGEe5BjFjS5Y/MvFVzfTQUM7480botvHQiHGiq2gpU3ABnfHV071xb30F7
	ldpp9WNVysrSrebirKmoqQPDeBhot3KrVkD7+IBgdpQzAY+ja1GoLGHN3iJshMQUfdbPl1YopitSP
	CjbqO4wqHe7nxdB+iT9tPHR4hLy/PHup2jrtoz0kvMkHiZ2dudEVvMzFOMPn58ZwXwBzO5wD+dMGj
	TbmiMPJUqcVReK+1ogwYMf20RuHmlCnxW3G8yPRHu1nmtSPG301gU1DOUHIWbvBMEwWjIPuylTwyU
	jiV0MCgrTyYV8ai+bvuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jagcs-0001QE-70; Mon, 18 May 2020 14:20:18 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jagcZ-0007Gz-4r; Mon, 18 May 2020 14:20:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E3C2101E;
 Mon, 18 May 2020 07:19:56 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.29.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7F9E3F52E;
 Mon, 18 May 2020 07:19:52 -0700 (PDT)
Date: Mon, 18 May 2020 15:19:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [PATCH 0/3] arm64: perf: Add support for Perf NMI interrupts
Message-ID: <20200518141946.GA3164@C02TD0UTHF1T.local>
References: <20200516124857.75004-1-lecopzer@gmail.com>
 <CAFA6WYNwp+_ENiS8QDao5+RXyt5ofJZyq6c5CKG_d0CNEmBNYg@mail.gmail.com>
 <CANr2M19unLW8n0P2DiOYEZ=GZcaD-L2ygPht_5HNtNZ6e4h6xQ@mail.gmail.com>
 <20200518104524.GA1224@C02TD0UTHF1T.local>
 <a9002b5e-aec5-b6e0-7174-87b93351d60c@arm.com>
 <CAFA6WYPKD0Kkn5yQiKZQkM+tT0iW4oPnndegD-iau9EwB5DYog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYPKD0Kkn5yQiKZQkM+tT0iW4oPnndegD-iau9EwB5DYog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_071959_285130_A3BD3895 
X-CRM114-Status: GOOD (  24.74  )
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
Cc: Jian-Lin Chen <lecopzer.chen@mediatek.com>, Will Deacon <will@kernel.org>,
 alexander.shishkin@linux.intel.com, Catalin Marinas <catalin.marinas@arm.com>,
 jolsa@redhat.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 acme@kernel.org, Lecopzer Chen <lecopzer@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 matthias.bgg@gmail.com, namhyung@kernel.org,
 Alexandru Elisei <alexandru.elisei@arm.com>, yj.chiang@mediatek.com,
 julien.thierry.kdev@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 18, 2020 at 07:39:23PM +0530, Sumit Garg wrote:
> On Mon, 18 May 2020 at 16:47, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> > On 5/18/20 11:45 AM, Mark Rutland wrote:
> > > On Mon, May 18, 2020 at 02:26:00PM +0800, Lecopzer Chen wrote:
> > >> HI Sumit,
> > >>
> > >> Thanks for your information.
> > >>
> > >> I've already implemented IPI (same as you did [1], little difference
> > >> in detail), hardlockup detector and perf in last year(2019) for
> > >> debuggability.
> > >> And now we tend to upstream to reduce kernel maintaining effort.
> > >> I'm glad if someone in ARM can do this work :)
> > >>
> > >> Hi Julien,
> > >>
> > >> Does any Arm maintainers can proceed this action?
> > > Alexandru (Cc'd) has been rebasing and reworking Julien's patches, which
> > > is my preferred approach.
> > >
> > > I understand that's not quite ready for posting since he's investigating
> > > some of the nastier subtleties (e.g. mutual exclusion with the NMI), but
> > > maybe we can put the work-in-progress patches somewhere in the mean
> > > time.
> > >
> > > Alexandru, do you have an idea of what needs to be done, and/or when you
> > > expect you could post that?
> >
> > I'm currently working on rebasing the patches on top of 5.7-rc5, when I have
> > something usable I'll post a link (should be a couple of days). After that I will
> > address the review comments, and I plan to do a thorough testing because I'm not
> > 100% confident that some of the assumptions around the locks that were removed are
> > correct. My guess is this will take a few weeks.
> >
> 
> Thanks Mark, Alex for the status updates on perf NMI feature.
> 
> Alex,
> 
> As the hard-lockup detection patch [1] has a dependency on perf NMI
> patch-set, I will rebase and test hard-lockup detector when you have
> got a working tree. But due to the dependency, I think patch [1]
> should be accepted along with perf NMI patch-set. So would you be open
> to include this patch as part of your series?
> 
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2020-May/732227.html

While it depends on the perf NMI bits, I don't think it makes sense to
tie that into the series given it's trying to achieve something very
different.

I think that should be reposted separately once the perf NMI bits are in
shape.

Thanks,
Mark.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
