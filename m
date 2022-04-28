Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3276C43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 08:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8K7oQl3gsCVuUwHdkehdZq8EjPL6NqYYoKLmyKHa4io=; b=iKLzmPIljyTuEA
	3LgPPXi9rz/ecj73bl2IU4ldmBUPkYox3D48Uaf0TUeD/IviV+tDKTCvOzyP8XOcWnbbVU7/yIfF6
	rcPi1Ofstx42qt/9eQccM8UxZWXZU2gw6D3tEqfgUAD/cFV2pI7keDlJwHlY9UlafvHqvK4RW+c1s
	QkttEQHIZ5UaA+3SR2zdOIxzzEYsfsucfuu54w6ks+LCYv5ZmhTwsdoCJQN9Po1PJhrpjFDQxTX9R
	T0BYziqmMKPbGxuW+RYQ7g62vHrdlyK3EaJXM+Ki9+AY4dDtR1FIqXYZDIPazEZoDfDvaCpq8mBYb
	pCS4YoxC/uHlVUSFaI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njzV9-005WQf-6u; Thu, 28 Apr 2022 08:27:51 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njzUw-005WLd-7G; Thu, 28 Apr 2022 08:27:39 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 893EE2186F;
 Thu, 28 Apr 2022 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1651134453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YIozUSFdjDnLnEJpNn98rpE1d2R0anAtFMrgIZeUiR4=;
 b=kk0y2HUNWPQ6yurCu47RXpWICv/UYYHPEiBz2vwYJUQU92TGjP6YsUB3QW/6bksx3k5t/F
 F/My4Vm3K9vGazCfRQnqYqYdnsZXWxKy4/0UkrWqH/AOJ7+7WlUXGP+sLpj9pHauw349c/
 +8XoiuZlexn/SXMwfGzlxoxmq0EliWI=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D7C5B2C141;
 Thu, 28 Apr 2022 08:27:32 +0000 (UTC)
Date: Thu, 28 Apr 2022 10:27:32 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: acme@kernel.org, akpm@linux-foundation.org,
 alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
 davem@davemloft.net, jolsa@redhat.com, jthierry@redhat.com,
 keescook@chromium.org, kernelfans@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-perf-users@vger.kernel.org, mark.rutland@arm.com,
 masahiroy@kernel.org, matthias.bgg@gmail.com, maz@kernel.org,
 mcgrof@kernel.org, mingo@redhat.com, namhyung@kernel.org,
 nixiaoming@huawei.com, peterz@infradead.org,
 sparclinux@vger.kernel.org, sumit.garg@linaro.org,
 wangqing@vivo.com, will@kernel.org, yj.chiang@mediatek.com
Subject: Re: [PATCH v3 5/5] arm64: Enable perf events based hard lockup
 detector
Message-ID: <YmpP9PTa1/pSmuuQ@alley>
References: <20220421163035.26402-1-lecopzer.chen@mediatek.com>
 <20220426163840.18871-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426163840.18871-1-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_012738_474704_E41C7B67 
X-CRM114-Status: GOOD (  34.45  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed 2022-04-27 00:38:40, Lecopzer Chen wrote:
> > What about just introducing the API that will allow to try to
> > initialize the hardlockup detector later:
> > 
> > /*
> >  * Retry hardlockup detector init. It is useful when it requires some
> >  * functionality that has to be initialized later on a particular
> >  * platform.
> >  */
> > void __init retry_lockup_detector_init(void)
> > {
> > 	/* Must be called before late init calls. */
> > 	if (!allow_lockup_detector_init_retry)
> > 		return 0;
> > 
> > 	queue_work_on(__smp_processor_id(), system_wq, &detector_work);
> > }
> > 
> > /*
> >  * Ensure that optional delayed hardlockup init is proceed before
> >  * the init code and memory is freed.
> >  */
> > static int __init lockup_detector_check(void)
> > {
> > 	/* Prevent any later retry. */
> > 	allow_lockup_detector_init_retry = false;
> > 
> > 	/* Make sure no work is pending. */
> > 	flush_work(&detector_work);
> > }
> > late_initcall_sync(lockup_detector_check);
> > 
> > You could leave lockup_detector_init() as it is. It does not really
> > matter what was the exact error value returned by watchdog_nmi_probe().
> > 
> > Then you could call retry_lockup_detector_init() in
> > armv8_pmu_driver_init() and be done with it.
> > 
> > It will be universal API that might be used on any architecture
> > for any reason. If nobody calls retry_lockup_detector_init()
> > then nohing will happen and the code will work as before.
> > 
> > It might make sense to provide the API only on architectures that
> > really need it. We could hide it under
> > 
> >    ARCH_NEED_DELAYED_HARDLOCKUP_DETECTOR_INIT
> > 
> > , similar to ARCH_NEEDS_CPU_IDLE_COUPLE.
> > 
> 
> During implementation, if I add ARCH_NEED_DELAYED_..., there will contain
> many enclosed ifdef-endif and is a little bit ugly.
> Also, I didn't find a must-have reason to this Kconfig after I rebase from
> your suggestion.
> 
> The one calls retry_lockup_detector_init() must fail at lockup_detector_init,
> so I think anyone who has aleady failed at lockup_detector_init() has right
> to retry no matter HW, SW or Arch reason.
> Thus I might not introduce a new Kconfig in v4, and I would be glad to see
> if any further commet on this.

Sounds reasonable from my POV. There is not much code. It will be removed
after the init phase. It will be most likely removed even during
compilation when linked with gcc LTE optimization and the symbols
are not used.

Best Regards,
Petr

PS: It might take few days until I do the review of v4. I am a bit
    overloaded at the moment.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
