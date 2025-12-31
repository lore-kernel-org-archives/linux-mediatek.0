Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB456EE6425
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 10:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8HFoCIidEb0xBgam0yKy/IXRO1AsOCcrDLZQiUtTJ8=; b=Fad4tFZyp14HYe6c0bXuP/Tqv3
	wo7nDQQpG32Piy1mXP0qKPd+qE2ZSTCECltpZHea3jLr//hIA2OcrJ3OB6v1UgVW841dRz0G7xp2r
	FHHvMWRlk598uJ0gc45w1LBHUaycpXm6+VXnk9/OPza3rPWZlCINM+m5ZKsOJ8oAMnRQqSLEf+K/P
	dmmNbFDmGJjFmRt1uBxrQc0vmzNtKeT8K5L92fHekhWjCJT+Pge+fLQp3v2+d7JRZS8hlmkF/yvmW
	HUbFcAWCn/k87NHvMTpdeyp2Pr8WEqskDm3QVEzEnQZoCfWcdR3t85fBx8gFBpdN1MXA94FykRdBO
	K7pE4ZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatYq-00000005t9C-1hm8;
	Wed, 31 Dec 2025 10:36:12 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatYn-00000005t86-0Pku;
	Wed, 31 Dec 2025 10:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1767177360;
	bh=LDF4ARuzunhfsj6zAMmkog9ma6Ip1TH3chjUte6eewY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j49yk9EKPJTUpBpb5EDnRRzqNE+RPpfciqoQWEyUYz3KyccoNvTL3C2HmL2p8tT6z
	 ewhpjmJDDe85/47XHYuB9vQKi9VMcFPVaWzmzqQOq0TFfGuqQhecqTgMAJrLlTojnb
	 1v0SbsX/9t9GFVJcH5LRlnuOaLlCWAcFIdS+pI7o=
Date: Wed, 31 Dec 2025 11:36:00 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Eric Biggers <ebiggers@kernel.org>, 
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, Mario Limonciello <superm1@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, quan.zhou@mediatek.com, Felix Fietkau <nbd@nbd.name>, 
	lorenzo@kernel.org, ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek@lists.infradead.org, shuah <shuah@kernel.org>
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
Message-ID: <8c8c8f27-ba44-48eb-96f6-dae6d2d0cbf8@t-8ch.de>
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
 <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
 <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_023609_359207_28B47269 
X-CRM114-Status: GOOD (  20.54  )
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

On 2025-12-30 16:57:20-0700, Shuah Khan wrote:
> On 12/29/25 21:21, Matthew Schwartz wrote:
> > On 12/29/25 4:41 PM, Linus Torvalds wrote:
> > > On Sat, 27 Dec 2025 at 04:25, Thomas Weißschuh <linux@weissschuh.net> wrote:
> > > > 
> > > > Hi Shuah,
> > > > 
> > > > On 2025-12-27 02:07:24-0700, Shuah Khan wrote:
> > > > > mt7921e doesn't load on my primary laptopn on Linux 6.19-rc1 and problem
> > > > > still there on 6.19-rc2.
> > > > 
> > > > This should be a duplicate of
> > > > https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com/

(...)
 
> Reverting the following fixed my problem.
> f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")
> 
> The above fixes an extra newline in the dmesg by making the
> code more complex it needs to introducing local buffers and
> strscpy() - the proposed fix replaces this with memcpy().
> 
> Is there a simple way to do this than introducing memcpy()
> or strscpy() to remove an extra newline that might or might
> not exist? Why not check if newline exists or not using
> strstr()?

We do have memtostr() which would be a perfect fit to use here.
That is still a memcpy() under the hood, but the code is clear and safe.
It does however require the source to be annotated as __nonstring.
Which also seems to be the right choice here anyways. However for
consistency, all other similar fields should also be annotated in the
same way. So it is a bit of a larger change than a pure bugfix.


Thomas

