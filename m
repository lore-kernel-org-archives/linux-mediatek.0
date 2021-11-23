Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F026C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=js+NX9k8a4+RE2epMT2mLdZQfQiqw61FJtsmh7dTlsQ=; b=1pohCeIlQ/mhfZ
	+cLbBRQ90km5+9T5hEcZlbyFL/RZNENVETkH0KlwcaaIshOdtB4QW4IEP8N+tKWffP8zDwJgUEz9G
	p7KrHQFRyPdenms3Ux3ut/zLJTvSC0YtVlcSBDLbWb6u14RMzeXz11zdx3//ImEJgySFI+7ZH9VZ3
	e20gUgHUE93cE5Kr1u1CAg7/2mXhH/K0UEx6MFwyq0bajIRqBchrQSX6aoN+DzH81FUys824fSuJC
	F+7Atff8AsJFmNy2ovdPdNs4YPB7eQQovxYRRJ9PtNYhmFcVuhGCgXMoCzjXEXhpZsdQ1chDwwJn/
	RRXVL4w3pHWzZOLqgypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpUdn-0021UB-FU; Tue, 23 Nov 2021 12:11:15 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpUdY-0021PL-Kl; Tue, 23 Nov 2021 12:11:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E824147A;
 Tue, 23 Nov 2021 04:10:59 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04F373F5A1;
 Tue, 23 Nov 2021 04:10:57 -0800 (PST)
Date: Tue, 23 Nov 2021 12:10:55 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com,
 james.hsu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: update compiler option for PAC
Message-ID: <20211123121055.GD37253@lakrids.cambridge.arm.com>
References: <20211115031810.29701-1-Kuan-Ying.Lee@mediatek.com>
 <20211116101147.GB9851@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211116101147.GB9851@willie-the-truck>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_041100_761862_8B1218F0 
X-CRM114-Status: GOOD (  26.26  )
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

On Tue, Nov 16, 2021 at 10:11:47AM +0000, Will Deacon wrote:
> On Mon, Nov 15, 2021 at 11:18:08AM +0800, Kuan-Ying Lee wrote:
> > We pass -mbranch-protection=pac-ret+leaf to support PAC
> > when we use GCC 9 or later.
> > 
> > Before GCC 9, we pass -msign-return-address=all to support
> > PAC.
> > 
> > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > ---
> >  Documentation/arm64/pointer-authentication.rst | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/arm64/pointer-authentication.rst b/Documentation/arm64/pointer-authentication.rst
> > index f127666ea3a8..055d08b0d42d 100644
> > --- a/Documentation/arm64/pointer-authentication.rst
> > +++ b/Documentation/arm64/pointer-authentication.rst
> > @@ -54,8 +54,10 @@ virtual address size configured by the kernel. For example, with a
> >  virtual address size of 48, the PAC is 7 bits wide.
> >  
> >  Recent versions of GCC can compile code with APIAKey-based return
> > -address protection when passed the -msign-return-address option. This
> > -uses instructions in the HINT space (unless -march=armv8.3-a or higher
> > +address protection when passed compiler option as following.
> > +Pass -msign-return-address when we use GCC 7, 8.
> > +Pass -mbranch-protection when we use GCC 9 or later.
> > +This uses instructions in the HINT space (unless -march=armv8.3-a or higher
> >  is also passed), and such code can run on systems without the pointer
> >  authentication extension.
> 
> I think I'd be more inclined to delete this paragraph altogether. It doesn't
> really document anything to do with the kernel, and trying to document the
> behaviour of "recent" versions of GCC is futile.

Agreed. I think the only thing we might want to mention is that we rely
on the compiler to use the HINT space instructions (PACIASP and AUTIASP)
so that a kernel built with pointer authentication support works on HW
without the feature.

So replacing that paragraph with something like:

| When ARM64_PTR_AUTH_KERNEL is selected the kernel will be compiled
| with HINT space pointer authentication instructions protecting
| function returns. Kernels built with this option will work on
| hardware with or without pointer authentication support.

... would make sense to me.

Thanks,
Mark.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
