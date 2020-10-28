Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC913C55178
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 03:26:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17CE12242B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 03:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YPWVTCX7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17CE12242B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telegraphics.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+VBz3HTBVkdYWYhiALkUkRGJrJKKlzOSvPJnqUZTPp0=; b=YPWVTCX7/K28EaOofXuDcWwsN
	LMG8T6Ldr5qM8Dh3YDcNmJ8Kc8BZG9KUTz+Tt9fD14v9m73TzrunFxDQp9z2ULFEnnV73cvvo2ifP
	c6H+SCOuTcg8OgWnmKFhMAU4pmDi1LcPCNDPXm4NgAvZBLjEcY9IHCzh4l+Wpziag6ov86ilZjCyz
	KObCsyfQnFtWQpO2TqNuriHnKj3lEcw4WaBjHvScQHGW4NASGjqynUh7GJ0nb7QeO/ck9YpsvFkLJ
	cP4kseaB0coBtZY9YDmFitz2jkj/y0rFnU7ybgwXGNQwdtbkFv+ppmNaCMSZmkTvaO8ZOudqr5Zdc
	AyNhjl60A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXc6X-00011f-VI; Wed, 28 Oct 2020 03:26:29 +0000
Received: from kvm5.telegraphics.com.au ([98.124.60.144])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXc6V-000117-3X; Wed, 28 Oct 2020 03:26:27 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id A654929A58;
 Tue, 27 Oct 2020 23:26:19 -0400 (EDT)
Date: Wed, 28 Oct 2020 14:26:12 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Tom Rix <trix@redhat.com>
Subject: Re: [RFC] clang tooling cleanups
In-Reply-To: <20201027164255.1573301-1-trix@redhat.com>
Message-ID: <alpine.LNX.2.23.453.2010281344120.31@nippy.intranet>
References: <20201027164255.1573301-1-trix@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_232627_163728_DBD774E2 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Tue, 27 Oct 2020, trix@redhat.com wrote:

> This rfc will describe
> An upcoming treewide cleanup.
> How clang tooling was used to programatically do the clean up.
> Solicit opinions on how to generally use clang tooling.
> 

This tooling is very impressive. It makes possible an idea that I had a 
while ago, to help make code review more efficient. It works like this. 

Suppose a patch, p, is the difference between the new tree, n, and the old 
tree, o. That is, p = n - o.

Now let clang-tidy be the transformation 't'. This gets you a much more 
readable patch submission, P = t(n) - t(o).

The only difficulty is that, if I submit P intead of p then 'git am' will 
probably reject it. This is solved by a little tooling around git, such 
that, should a patch P fail to apply, the relevant files are automatically 
reformatted with the officially endorsed transformation t, to generate a 
minimal cleanup patch, such that P can be automatically applied on top.

If the patch submission process required* that every patch submission was 
generated like P and not like p, it would immediately eliminate all 
clean-up patches from the workload of all reviewers, and also make the 
reviewers' job easier because all submissions are now formatted correctly, 
and also avoid time lost to round-trips, such as, "you can have a 
reviewed-by if you respin to fix some minor style issues".

* Enforcing this, e.g. with checkpatch, is slightly more complicated, but 
it works the same way: generate a minimal cleanup patch for the relevant 
files, apply the patch-to-be-submitted, and finally confirm that the 
modified files are unchanged under t.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
