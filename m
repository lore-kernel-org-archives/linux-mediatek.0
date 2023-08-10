Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920C3C04A94
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 20:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rzh1M8+YdCgayUlZk/BpEK/45i5M5F9GAgNuBkEEHv4=; b=gfe0BLFGuayJ+J7GmWmj1ejc6T
	lukVNtlBs5diLY7m7MYQx2hoKgeDIgWTVODy7uGasEnS+BrRCvDDG7DZHkYnM7CLtyQO6DMvLmI6b
	mmvTR3YTLhQJBafC7yn6/Yi95C6QTgH6PJ6Rsy8G7493Z7AgC92Yx1ipvS7z3E260BJoUVmMkL44n
	04jr5VRZtx5GNoZkPb34DO+fbrHGe014Txjoq/K4hGirgM1e+zDJOTwlAp/Ln8AC4x2L7uaJJD+B6
	gC+NRE4Lf45v8omDZguv5ULZ3M4hnbJ4X+mEt4lUTH3qMnG3WC6TBBhMXL0btUhbR423uEQcjoV2h
	iyw/nWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBzT-008coa-0J;
	Thu, 10 Aug 2023 20:10:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBzO-008cnK-1z
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 20:10:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D472648E7;
	Thu, 10 Aug 2023 20:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671F5C433C8;
	Thu, 10 Aug 2023 20:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691698232;
	bh=WRdoWe5wxBcJbkSsIlQzyIHKODWuaNuzM4NGwXznyvI=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=MmuCvwppqZhHVsoLkY6h+fnmdcPgrOteouLgDLQKC3o17bdbAIbivtkhpNdUIXDPQ
	 PnWPxc33LlUxrJjG1sKX4iYxQENI+JPBw1/lhomq3wYDbGdmRceQ2TDLcFViTSlTet
	 Ohs0P3rcVzPz1X7S6sEkMDi+gjtr4Bhw9JXsJO2K6vmL+sOs2/8iXtpA9jQl0wyF/7
	 N4y7izKu/+X3vT6igmWgzJsXM1IMFTgEVzvyYPrUU4RIx5I8EntUQ1dNtpIzk+bz6v
	 QJPsTwbTCjySlCDdGIRzq31Wxxr7L4U9vVTsD8fxD4zgNXjuRRFcoT3214mz2U21Ts
	 /57cvt5Uoy5RQ==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 35FCA27C0054;
	Thu, 10 Aug 2023 16:10:31 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 10 Aug 2023 16:10:31 -0400
X-ME-Sender: <xms:NkTVZLnao9RAItPUu_GILgQ8k4OilXKsCkyOCv7QA5I2sVqKSwiDkA>
    <xme:NkTVZO1yyBgzvsvahVOb6FWhsPtWflPC5CneFXrcIc1cPSym0RVQU9LLsx7ven7qA
    iS0WyF6KWpoj-7JYu0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepvdeviefgtedugeevieelvdfgveeuvdfgteegfeeiieejjeffgeeghedu
    gedtveehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
    vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
    guvg
X-ME-Proxy: <xmx:NkTVZBo1dhTla8-r3ANxR1R2h_xSmYHQcwYGthiHXp8rDdpv8AUw1w>
    <xmx:NkTVZDlk5a7v0uEl1tG1JZgi6AOrM8eVTPoB8I486hVGUz66KsZENw>
    <xmx:NkTVZJ2mhp6ob6-yZ43lk1pUBJLo_0E5pACi60PRDlrNIU2aTCj2_w>
    <xmx:N0TVZGmSmMG4DdnQQa3PJGfnhvdEhBHprYtCBphWUFLa61dfKLKWVQ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2E1CEB60089; Thu, 10 Aug 2023 16:10:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <786b2d02-f649-4c5f-ae9a-ed2228e4a3fb@app.fastmail.com>
In-Reply-To: <202308101209.45CF7C6F80@keescook>
References: <20230804071045.never.134-kees@kernel.org>
 <f34c11eb-89b5-48a5-bd24-c215083575a5@app.fastmail.com>
 <202308101209.45CF7C6F80@keescook>
Date: Thu, 10 Aug 2023 22:10:08 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Kees Cook" <keescook@chromium.org>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Lecopzer Chen" <lecopzer.chen@mediatek.com>,
 "Oleg Nesterov" <oleg@redhat.com>, linux-arm-kernel@lists.infradead.org,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ARM: ptrace: Restore syscall skipping and restart while tracing
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_131034_766832_37E1C602 
X-CRM114-Status: GOOD (  23.94  )
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

On Thu, Aug 10, 2023, at 21:32, Kees Cook wrote:
> On Wed, Aug 09, 2023 at 09:47:24PM +0200, Arnd Bergmann wrote:
>
>> If the local_restart code has to store the syscall number
>> for an EABI-only kernel, wouldn't it have to also do this
>> for a kernel with OABI-only or OABI_COMPAT support?
>
> This is the part I wasn't sure about. Initially I was thinking it didn't
> matter because it's only a problem for a seccomp tracer, but I realize
> it might be exposed to a PTRACE tracer too. I was only able to test with
> EABI since seccomp is disabled for OABI_COMPAT.
>
> Anyway, syscall restart is done this way:
>
>         movlt   scno, #(__NR_restart_syscall - __NR_SYSCALL_BASE)
>
> Can a EABI call restart an OABI syscall? I think so?

There are very few differences between oabi and eabi syscalls, I
think it basically comes down to 

 - the syscall number, and register in which it is passed to the kernel
 - a few syscalls that exist for OABI backward compatibility and were
   deprecated before EABI was added
 - a few syscalls that pass a struct with different alignment rules
 - epoll_wait() uses a runtime check for the output format

It also seems like the __NR_restart_syscall path is only relevant
for syscalls using restart_block for restarting, and that means
it's only poll(), futex(), nanosleep(), clock_nanosleep() and their
time64 counterparts. All of these are handled by the same entry
points for OABI and EABI, i.e. there is no overlap with the
exceptions above. Crucially, epoll does not use restart_block,
unlike poll().

> So maybe we just need to add:
>
> 	str     scno, [tsk, #TI_ABI_SYSCALL]    @ store scno for syscall restart
>
> after that instead of moving it like I did originally?

Yes, I think that works!

For pure EABI and pure OABI kernels, this just does the right thing,
storing a plain __NR_restart_syscall in the field without an ABI
marker. For an OABI compat task running on an EABI kernel, it will
call the EABI version of restart_syscall(), but that is exactly
the same as the OABI version, as shown above.

    Arnd

