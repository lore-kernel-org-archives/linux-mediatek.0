Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411C5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 02:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sN1AzpwTSKYlfw3K09JtnLKwZYlilfSCIaMGsTp7sqg=; b=DicMJGA0U8uTP/
	DVLZ/1EpD+6L86ZrXGXUsE5Cu9S7lY9wVPC3h/nw2t8XlPFphS7UQqbWrHxhRGhHGEeXyouinyw4a
	QXLM6EOVMK7VmbH5FKSvuO04fSVc/z0atKgwZxKb4pkYLVV2Q4iZmM0YueafEs3g0iEDBqcb4LIqh
	+O96FfnNuA44PUSs2ftQWsi1DZZRx8REFoY7mfuwzNlBWEXm3HoACznYKS+Hkb5V4iJvLk4EFNL1A
	RaxvMZo1HiW3BjV1cDlelwedkuYpftG9HSnYXW7XOy+m3hpDZgvARPC3ZsLeX54fjuJkL/qaLRlAB
	zc7BS5LqIapFVeGBIh8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mphkQ-003p1K-OS; Wed, 24 Nov 2021 02:10:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mphkE-003p06-0J; Wed, 24 Nov 2021 02:10:47 +0000
X-UUID: 12f5e27c9e9142519e9ae0515865ece6-20211123
X-UUID: 12f5e27c9e9142519e9ae0515865ece6-20211123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 215507163; Tue, 23 Nov 2021 19:10:40 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Nov 2021 18:04:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 24 Nov 2021 10:04:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Nov 2021 10:04:52 +0800
Message-ID: <739993f6910516fe0d451b2c7f56afa94438cab7.camel@mediatek.com>
Subject: Re: [PATCH] arm64: update compiler option for PAC
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet
 <corbet@lwn.net>, Matthias Brugger <matthias.bgg@gmail.com>, Chinwen Chang
 =?UTF-8?Q?=28=E5=BC=B5=E9=8C=A6=E6=96=87=29?= <chinwen.chang@mediatek.com>,
 Nicholas Tang =?UTF-8?Q?=28=E9=84=AD=E7=A7=A6=E8=BC=9D=29?=
 <nicholas.tang@mediatek.com>, <James.Hsu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, <kuan-ying.lee@mediatek.com>
Date: Wed, 24 Nov 2021 10:04:51 +0800
In-Reply-To: <20211123121055.GD37253@lakrids.cambridge.arm.com>
References: <20211115031810.29701-1-Kuan-Ying.Lee@mediatek.com>
 <20211116101147.GB9851@willie-the-truck>
 <20211123121055.GD37253@lakrids.cambridge.arm.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_181046_091553_1308CFB3 
X-CRM114-Status: GOOD (  35.22  )
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

On Tue, 2021-11-23 at 20:10 +0800, Mark Rutland wrote:
> On Tue, Nov 16, 2021 at 10:11:47AM +0000, Will Deacon wrote:
> > On Mon, Nov 15, 2021 at 11:18:08AM +0800, Kuan-Ying Lee wrote:
> > > We pass -mbranch-protection=pac-ret+leaf to support PAC
> > > when we use GCC 9 or later.
> > > 
> > > Before GCC 9, we pass -msign-return-address=all to support
> > > PAC.
> > > 
> > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > ---
> > >  Documentation/arm64/pointer-authentication.rst | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/arm64/pointer-authentication.rst
> > > b/Documentation/arm64/pointer-authentication.rst
> > > index f127666ea3a8..055d08b0d42d 100644
> > > --- a/Documentation/arm64/pointer-authentication.rst
> > > +++ b/Documentation/arm64/pointer-authentication.rst
> > > @@ -54,8 +54,10 @@ virtual address size configured by the kernel.
> > > For example, with a
> > >  virtual address size of 48, the PAC is 7 bits wide.
> > >  
> > >  Recent versions of GCC can compile code with APIAKey-based
> > > return
> > > -address protection when passed the -msign-return-address option.
> > > This
> > > -uses instructions in the HINT space (unless -march=armv8.3-a or
> > > higher
> > > +address protection when passed compiler option as following.
> > > +Pass -msign-return-address when we use GCC 7, 8.
> > > +Pass -mbranch-protection when we use GCC 9 or later.
> > > +This uses instructions in the HINT space (unless -march=armv8.3-
> > > a or higher
> > >  is also passed), and such code can run on systems without the
> > > pointer
> > >  authentication extension.
> > 
> > I think I'd be more inclined to delete this paragraph altogether.
> > It doesn't
> > really document anything to do with the kernel, and trying to
> > document the
> > behaviour of "recent" versions of GCC is futile.
> 
> Agreed. I think the only thing we might want to mention is that we
> rely
> on the compiler to use the HINT space instructions (PACIASP and
> AUTIASP)
> so that a kernel built with pointer authentication support works on
> HW
> without the feature.
> 
> So replacing that paragraph with something like:
> 
> > When ARM64_PTR_AUTH_KERNEL is selected the kernel will be compiled
> > with HINT space pointer authentication instructions protecting
> > function returns. Kernels built with this option will work on
> > hardware with or without pointer authentication support.
> 
> ... would make sense to me.

Hi,

Thanks you both for suggestions.
I will rewrite this paragraph in v2.

Thanks,
Kuan-Ying Lee

> 
> Thanks,
> Mark.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
