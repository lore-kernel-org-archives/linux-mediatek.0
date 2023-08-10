Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08F7C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 20:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDnz6ewYniuiTfJGgcW46P4Frc6dZkTLoKG1gmNwu7U=; b=ArmZG8dk91kkshDsJN1++q9++/
	gh+9/6PjTzpOkJf2iTBpEZgASTqFu3CXmygENkYtbKi1OSI3nKHH34HtkgqYfg1GjYrzLfXQG/poT
	hpWCVQDJPxPaG3dZzenDvKBwK6QLgi4/R4jXsA6FOAEAXVwZKLiUXFuf5rTfISi9I8Y7uZolLQqha
	dIAoOX8Aq17Z9jJ79iNhShDIa6NIvoADPnKez5DjmBA4MDKGS4Ca/U6akUh+GdroEaNRG2TSUzITj
	QXmVCeWKu0O8zHdhso8b5SDiynLXmxPx2LfOc7Hhie4Ichbg4Hg/YM8B5aIJL4j/W8BfCAYD22qs9
	ZINJJD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUC79-008dlM-0t;
	Thu, 10 Aug 2023 20:18:35 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUC75-008dkA-26;
	Thu, 10 Aug 2023 20:18:33 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 5AC85320091F;
	Thu, 10 Aug 2023 16:18:23 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 10 Aug 2023 16:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1691698702; x=1691785102; bh=ED
	nz6ewYniuiTfJGgcW46P4Frc6dZkTLoKG1gmNwu7U=; b=c702C99S6syZ1pNhmI
	pKiD4p/eNvn8c49BkiV32bGMi2go9fB0/EKxUkSAJUY6a5PdWyqiQ/2eyaXc7aIh
	tss2Sa6CAXR4Y9KtrpeveYo0MQ522FOGNblmSuZZyiXMAYP/6FXRPARLcxcFD+rZ
	0/5ptEnqBtpeXmNApGn45sHzelu3Xea9b9yfwEQZuv8k0Qg69WzH1/SQkTmhESMp
	+6UfU57ZGufOaT4N9rTaHQy6ViclK0NpLVbYwgofyk1lXE25rYZTjG9iIptfkJxD
	w3b9ZKM+FGul7+7364N8z4CucPKKqY8RA561totB44ltbyqXW7shu/AkD1u7Z89M
	93lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691698702; x=1691785102; bh=EDnz6ewYniuiT
	fJGgcW46P4Frc6dZkTLoKG1gmNwu7U=; b=atOHadxzMRdeRXbrZq0t18TFQC7As
	9bNedsTKz/HY3ZykIZAB0a6+gP0g+mNvqVpvSpc06bRItBCg38ZYUKiOCqhfEF+X
	lgC0X7H7Al3hKSWmq9lNrx8KY/5zyyr/WdO8tjTkui/XSfsA89wp4QJBl8mAnSu1
	6DNHGE9F2n0W6FHRXNXKbrIELHdnQGXrlIEdEyNhLyvvygMr/9BihUmVJE2HuvOX
	mzfoxHtFaauHdShWnPVwHsFf+aXk7eydYNXKQkK6ArPnBVVsW/5Uz3mP6OrF0SIS
	pmZ0LVl82dg+jpwK4978zUsKbDtC8v+lCSKvt8YOPSRGzu4daoXFASsEQ==
X-ME-Sender: <xms:DkbVZPQFJighC0Pcgkk1mpvk4qDTtPioe4a9DQuB0mudTYGYygnj3w>
    <xme:DkbVZAzdb55_DZZUe_DQeJ64r7SWkL-yymiTnbepyQmBNtYZ_F4YpiTVFO72pgEJx
    Q5G190JYo3hQ-UYqvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigddugeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepudetfeekheffkeekfeelhedvgfetfeduveehuddtfeevtdevueefuedufeel
    udegnecuffhomhgrihhnpegvnhhtrhihqdgtohhmmhhonhdrshgsnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdgu
    vg
X-ME-Proxy: <xmx:DkbVZE0-qhyq86qOIzMkL6T33PxL2FRfHgNEyWfhigTm6DG9qMz4Vw>
    <xmx:DkbVZPAgVaKfSsHDwpuKhZY071V1hOPjcd8XnE98znnVplYnJ3FbMw>
    <xmx:DkbVZIhqWlOXERHfvfksy9OzFCAdN25zeeJ9h3PVW9581VjWxl_9Hg>
    <xmx:DkbVZJbMclNl59vZ8mzME_zLzckUbK1lVH-dt4yuqDArP8mnKaZItQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5B823B60089; Thu, 10 Aug 2023 16:18:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <1190fd24-7d6a-4f6a-a3e3-ba3564c2303c@app.fastmail.com>
In-Reply-To: <20230810195422.2304827-1-keescook@chromium.org>
References: <20230810195141.never.338-kees@kernel.org>
 <20230810195422.2304827-1-keescook@chromium.org>
Date: Thu, 10 Aug 2023 22:17:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kees Cook" <keescook@chromium.org>,
 "Russell King" <linux@armlinux.org.uk>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Lecopzer Chen" <lecopzer.chen@mediatek.com>,
 "Oleg Nesterov" <oleg@redhat.com>, linux-arm-kernel@lists.infradead.org,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Wolfram Sang" <wsa@kernel.org>,
 "Dan Williams" <dan.j.williams@intel.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ARM: ptrace: Restore syscall restart tracing
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_131831_838947_31FBCC33 
X-CRM114-Status: GOOD (  14.68  )
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

On Thu, Aug 10, 2023, at 21:54, Kees Cook wrote:
> Since commit 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store
> thread_info->abi_syscall"), the seccomp selftests "syscall_restart" has
> been broken. This was caused by the restart syscall not being stored to
> "abi_syscall" during restart setup before branching to the "local_restart"
> label. Tracers would see the wrong syscall, and scno would get overwritten
> while returning from the TIF_WORK path. Add the missing store.
>

> diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
> index bcc4c9ec3aa4..5c31e9de7a60 100644
> --- a/arch/arm/kernel/entry-common.S
> +++ b/arch/arm/kernel/entry-common.S
> @@ -90,6 +90,7 @@ slow_work_pending:
>  	cmp	r0, #0
>  	beq	no_work_pending
>  	movlt	scno, #(__NR_restart_syscall - __NR_SYSCALL_BASE)
> +	str	scno, [tsk, #TI_ABI_SYSCALL]	@ make sure tracers see update
>  	ldmia	sp, {r0 - r6}			@ have to reload r0 - r6
>  	b	local_restart			@ ... and off we go
>  ENDPROC(ret_fast_syscall)

Looks good to me, as in my previous reply this is safe for all cases
with the current restartable syscalls, though it would be wrong if
we had a restartblock version of epoll_wait on an OABI_COMPAT task,
which needs to look at the high bits of the number to tell which
structure layout to use.

I also looked at my original patch now and see what I did wrong
there.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

