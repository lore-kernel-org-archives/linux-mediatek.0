Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2143CEE14C5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 18:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKlxMwUUPTxt5CEqWkiIRwix0QCPHH/Qrv+2DhWCGLc=; b=hrt8aWqtV6sGgOVIWVzE4OXM7v
	o0FP9Nau7nWtugnCN40RwNRZFdw4UFxNnhwcC4WdP+XhFiRLOWjyhNptfft7LUuAxuI7ZiyR00uqJ
	u7BOnrTpBKHan8nOjsgazJx4jYrKcNrWcEHCzkF4NNyCZrFNaUJPE04Ci3K2IfJJda4FnjYseGomm
	J3jr3sM4XIPB6unmJkjqj3ojyqmhKxRRswRZFeui+EVRDV7ZE2mL6aO6U0VVXnZAyZmjx9CHR5grS
	Z/iQlXNylpknZKaIWJ3/Xly8xylZJY4CERKN2a3qa5nUeZyX0ZCtpu/jfhxkTJGGxUNQbKyf86Yh9
	gbFz25YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdww5-00AgMV-1D;
	Wed, 06 Sep 2023 18:07:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdwvx-00AgL3-27;
	Wed, 06 Sep 2023 18:07:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0ECCD60FEB;
	Wed,  6 Sep 2023 18:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4438FC433C7;
	Wed,  6 Sep 2023 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694023639;
	bh=LK/9RFwAWACpDVkJmUMLa4ZQcl1iT5eciMmgvqDRP+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfJ6SGeyG/KrBP0dZuQ2sQn02bCkZJ+aM3V9f3+RZeEMWUjQHqk285OqMaVDaWaoi
	 yqy6yyVu+LRLQmKbJ8g0LeMvVQWCFHWQsKfkrR5BWxUJSrPNvPf1TdVCFOoFZTkyzw
	 dbvYxwRmTj15VMEidM58t1UQbkFrFx1OPft6GG6y9Phn68dO7pLyZGccuojTDjHOvI
	 RvgbLnjk52ttRqS5AZjfBEDYoGBIedPuanlO8owmfxva7SgyMFNcvPuhkDjQbPZzrt
	 WVC/QtBxOYPwXJCvHqpo2VQM5k2gQGfFrAseWzht+W5ZOaHYI8/98H0lNjApjNPOBY
	 PW4FubQkVUrmw==
Date: Wed, 6 Sep 2023 19:07:13 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	John Hsu =?utf-8?B?KOioseawuOe/sCk=?= <John.Hsu@mediatek.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Xiaobing Shi =?utf-8?B?KOWPsuWwj+WFtSk=?= <Xiaobing.Shi@mediatek.com>,
	Chunhui Li =?utf-8?B?KOadjuaYpei+iSk=?= <chunhui.li@mediatek.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Kuan-Ying Lee =?utf-8?B?KOadjuWGoOepjik=?= <Kuan-Ying.Lee@mediatek.com>,
	Casper Li =?utf-8?B?KOadjuS4reamrik=?= <casper.li@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [BUG kernel-5.15] aarch64: __pi_strncmp() out-of-bound error
Message-ID: <20230906180713.GA5021@willie-the-truck>
References: <e9f30f7d5b7d72a3521da31ab2002b49a26f542e.camel@mediatek.com>
 <ZNEOmRb2sYQlVYwj@FVFF77S0Q05N.cambridge.arm.com>
 <729b1505-c466-8a71-6079-4b0d9f81731d@arm.com>
 <20230810143118.GA5795@willie-the-truck>
 <10095b14-c005-c791-7e3e-d6561dac4dec@arm.com>
 <20230810160907.GA5951@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810160907.GA5951@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_110726_675037_F7CCD9F8 
X-CRM114-Status: GOOD (  29.49  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 10, 2023 at 05:09:07PM +0100, Will Deacon wrote:
> On Thu, Aug 10, 2023 at 04:00:00PM +0100, Robin Murphy wrote:
> > On 10/08/2023 3:31 pm, Will Deacon wrote:
> > > On Thu, Aug 10, 2023 at 01:23:28PM +0100, Robin Murphy wrote:
> > > > I'm not sure there's strictly a bug here. The C standard says:
> > > > 
> > > > "The strncmp function compares not more than n characters (characters that
> > > > follow a null character are not compared) ..."
> > > > 
> > > > so although any characters between the first NULL and n must not be
> > > > considered for the result of the comparison, there doesn't seem to be any
> > > > explicit promise anywhere that they can't be *accessed*. AFAICT what happens
> > > > here is in the request to compare at most 23 characters, it ends up in the
> > > > do_misaligned case, loop_misaligned runs twice and finds no differences or
> > > > NULLs in characters 0-7 and 8-15, so then done_loop loads characters 15-23
> > > > to compare the last 7, and is tripped up by 22-23 not actually existing in
> > > > src2. Possibly the original intent was that this case should have ended up
> > > > in page_end_loop, and the condition for that was slightly off, but I'm not
> > > > sure, and this code is obsolete now anyway.
> > > 
> > > The long backtrace above worries me, as it suggests that you can trigger
> > > this from userspace. In that case I think it's a bug regardless of what
> > > the C standard says.
> > 
> > Bleh, poor choice of words... obviously there is a bug overall, it just
> > might arguably be in the caller's expectations rather than the strncmp()
> > implementation itself. However I would concur that there's no way we're
> > going over all ~3000 strncmp() callsites with the "well, actually" comb just
> > for this. It was more to say I don't think it's worth digging much deeper
> > into exactly why, and I agree the pragmatic thing to do is either rip it out
> > or backport the newer MTE-safe implementation which should be more robust.
> 
> Heh, then we agree. I was worried you'd gone mad :)

In the end I cherry-picked the newer implementation rather than fall back to
the generic implementation:

https://lore.kernel.org/r/20230906180336.4973-1-will@kernel.org

Will

