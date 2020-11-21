Return-Path: <SRS0=jy+D=E3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11ACDC388F9
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2020 23:04:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 632BA21741
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2020 23:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SytUhaOY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 632BA21741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hBDDvyigtqY+JhdeAlawCR9a+uP8r+HoLGsqUw027OY=; b=SytUhaOY1GypsHPjrZL3yn+VF
	RS5tXZnEL//J1gbSyfvT1TBNw16N3v1uqZuTG/cnRrPo2FOLDqB37t0oyM+3JtG2X+Yve5d8YbfIV
	2QJbQNP/JLxUorpfCQjUQpjvFb4FXmg1riS+zDT2k6qtwVhpGthExT0yrWc+AHFlukNsqcvzdUqXR
	1ni6Kg5tgJXrXqgWxtisbpmWocYbs/tmJKbchfbqgQX26ds/KRXyURfl7fuZiSG0NnFGyxIaMX/r9
	qVwUWR//2N0gQJX/w22PfI3ODiegppI5mm2HvOIZCqvZYZYHMnDXBAWadN/o7x4I/PiPRc5/bNoRW
	luLIjPQbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgbvC-00074B-9r; Sat, 21 Nov 2020 23:03:58 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgbvA-00073A-CU
 for linux-mediatek@lists.infradead.org; Sat, 21 Nov 2020 23:03:57 +0000
Received: (qmail 658838 invoked by uid 1000); 21 Nov 2020 12:32:31 -0500
Date: Sat, 21 Nov 2020 12:32:31 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH RFC v2 1/1] scsi: pm: Leave runtime PM status alone
 during system resume/thaw/restore
Message-ID: <20201121173231.GA657814@rowland.harvard.edu>
References: <1605861443-11459-1-git-send-email-cang@codeaurora.org>
 <20201120163524.GB619708@rowland.harvard.edu>
 <9df460a7-c7fc-4999-bfaa-076229b8a752@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9df460a7-c7fc-4999-bfaa-076229b8a752@acm.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_180356_538912_894B6070 
X-CRM114-Status: GOOD (  22.56  )
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 ziqichen@codeaurora.org, Can Guo <cang@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 salyzyn@google.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 21, 2020 at 09:00:02AM -0800, Bart Van Assche wrote:
> On 11/20/20 8:35 AM, Alan Stern wrote:
> > On Fri, Nov 20, 2020 at 12:37:22AM -0800, Can Guo wrote:
> >> Runtime resume is handled by runtime PM framework, no need to forcibly
> >> set runtime PM status to RPM_ACTIVE during system resume/thaw/restore.
> > 
> > Sorry, I don't understand this explanation at all.
> > 
> > Sure, runtime resume is handled by the runtime PM framework.  But this 
> > patch changes the code for system resume, which is completely different.
> > 
> > Following a system resume, the hardware will be at full power.  We don't 
> > want the kernel to think that the device is still in runtime suspend; 
> > otherwise is would never put the device back into low-power mode.
> 
> Hi Alan,
> 
> Does this mean that every driver needs similar code for handling runtime
> suspended devices upon system resume? If so, would it be possible to
> move that code into the power management core (drivers/base/power)?

That's a complicated story.

In short, many drivers need to do this, but not all.  There is a complex 
collection of settings available for subsystems or drivers that would 
like their devices to remain in runtime system across a system sleep.

For the subsystems/drivers that don't care to deal with this complexity 
or don't have any special requirements -- yes, they all need to include 
code like this in their system-resume paths.

I had a very long discussion with Rafael Wysocki about all this starting 
last March; you can find the relevant emails beginning roughly here:

	https://marc.info/?l=linux-pm&m=158516934924947&w=2

and continuing through a few different threads.

Rafael ended up making a large number of changes to the PM core and API 
to simplify things, straighten them out, and improve the documentation.  
But we never did try to add this automatic set-runtime-active thing into 
the core.  Probably we wanted all the other changes to settle down 
before trying to do it, and then just forgot about it.  In fact, I'm not 
certain that it is possible now, but we should look into it.

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
