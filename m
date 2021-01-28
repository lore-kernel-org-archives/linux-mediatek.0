Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B03BC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 20:27:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E18B64DDE
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 20:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E18B64DDE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hFsY4syFIYTcl/7dPVHtjxmnR2ZE4jafGAX3CRpDinE=; b=s2y2tZH6hCBFBe4ZreJTByQAz
	8/TLSys/wifsNDgDZIRxt4w4rjIfFke7bxMDlw/4ggNPrRGkVbH2/v9AlqHJ20LYJy8uRcBzqENxt
	RWJGMs4O9QnHacDvh2etYk81bR/HKGgKRSlP4P3IAPMbj6IxRWZ4RFCLVhClO45fjqE3nSuTTIiDT
	QUPzQ2/+fGor27qp0s13hrW+/mL4dCD5R/ZlPXbwuS7fA16xnYbkoxEmkk8VfBpyDikhQtAnK+but
	Hr6ZNlX4cl1Kv8LFHMHrlaUXjeBLoVhZZLDmOZMuvfS2ERvM/QdPfHYqV/ft9n+JPVbBBxVwA024x
	GDDStibbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Dse-0003gP-NB; Thu, 28 Jan 2021 20:27:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5DsX-0003e6-Km; Thu, 28 Jan 2021 20:26:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D79B64DA1;
 Thu, 28 Jan 2021 20:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611865616;
 bh=xUkEvlfwN3vzXkDI+dFINpbQYvnm02tIWsSrva06Mow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZIVCMyxW5f7N7HczAlC51VnZLdKNmDnQ5813A/i/4BvDjLcbYVgSfU9dP6+p91Dcs
 pWmenLl/NjKmL5e8Bqv1uPG8U1sNRZW1+azBV8dAtylXAkZn1P0ueYlSOjbeh+qW0J
 w8sI1nrlvsLRzRTeWxIQqO1UE9FBkf/7gzkl3YDsggpFoTTSWmfN0Ojelan4XhEh1C
 cQfP+EsfGAQZYqDmuJtS9SWqfZ5MJ+yF/flmSWknlApj7EkjDAPaVugtb5uFSWTKft
 /Bv1CQQhtuiiSL2RDckGa4gsm3N5u1QRKO6fdpa+/otDLfm9QZMDNYR83zvZZio5Tp
 OqOzWSzsfGIvg==
Date: Thu, 28 Jan 2021 20:26:49 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: Re: [PATCH v2 4/4] arm64: kaslr: support randomized module area with
 KASAN_VMALLOC
Message-ID: <20210128202648.GF3016@willie-the-truck>
References: <20210127230413.GA1016@willie-the-truck>
 <20210128085326.22553-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128085326.22553-1-lecopzer.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_152657_759925_B4B98C82 
X-CRM114-Status: GOOD (  18.07  )
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
Cc: catalin.marinas@arm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 tyhicks@linux.microsoft.com, glider@google.com, vincenzo.frascino@arm.com,
 ardb@kernel.org, yj.chiang@mediatek.com, kasan-dev@googlegroups.com,
 dvyukov@google.com, aryabinin@virtuozzo.com, linux@roeck-us.net,
 andreyknvl@google.com, lecopzer@gmail.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, dan.j.williams@intel.com,
 linux-arm-kernel@lists.infradead.org, gustavoars@kernel.org,
 akpm@linux-foundation.org, robin.murphy@arm.com, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 28, 2021 at 04:53:26PM +0800, Lecopzer Chen wrote:
>  
> > On Sat, Jan 09, 2021 at 06:32:52PM +0800, Lecopzer Chen wrote:
> > > After KASAN_VMALLOC works in arm64, we can randomize module region
> > > into vmalloc area now.
> > > 
> > > Test:
> > > 	VMALLOC area ffffffc010000000 fffffffdf0000000
> > > 
> > > 	before the patch:
> > > 		module_alloc_base/end ffffffc008b80000 ffffffc010000000
> > > 	after the patch:
> > > 		module_alloc_base/end ffffffdcf4bed000 ffffffc010000000
> > > 
> > > 	And the function that insmod some modules is fine.
> > > 
> > > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > > ---
> > >  arch/arm64/kernel/kaslr.c  | 18 ++++++++++--------
> > >  arch/arm64/kernel/module.c | 16 +++++++++-------
> > >  2 files changed, 19 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> > > index 1c74c45b9494..a2858058e724 100644
> > > --- a/arch/arm64/kernel/kaslr.c
> > > +++ b/arch/arm64/kernel/kaslr.c
> > > @@ -161,15 +161,17 @@ u64 __init kaslr_early_init(u64 dt_phys)
> > >  	/* use the top 16 bits to randomize the linear region */
> > >  	memstart_offset_seed = seed >> 48;
> > >  
> > > -	if (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> > > -	    IS_ENABLED(CONFIG_KASAN_SW_TAGS))
> > > +	if (!IS_ENABLED(CONFIG_KASAN_VMALLOC) &&
> > > +	    (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> > 
> > CONFIG_KASAN_VMALLOC depends on CONFIG_KASAN_GENERIC so why is this
> > necessary?
> > 
> > Will
> 
> CONFIG_KASAN_VMALLOC=y means CONFIG_KASAN_GENERIC=y
> but CONFIG_KASAN_GENERIC=y doesn't means CONFIG_KASAN_VMALLOC=y
> 
> So this if-condition allows only KASAN rather than
> KASAN + KASAN_VMALLOC enabled.
> 
> Please correct me if I'm wrong.

Sorry, you're completely right -- I missed the '!' when I read this
initially.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
