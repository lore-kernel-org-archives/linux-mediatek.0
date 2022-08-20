Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BC4C25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKqV7mRrWjx8l3qzmdIRlsvLj/j8Chh+EErQLyiuAVU=; b=IFwK3oL9Up4qJfUHNIe1FlHFj6
	letmnvZjxEkVUyzHtrfIYkQJQ1fnksbkT3gnoX/FTS2nwNqKtx5+NUS3sLMI2OGp+kv5X6fPcbueu
	xBaOTHjjhNzxW5epehfcnuhKIdVxvVdvNE/ZRCCTh8iT3rJ//izCQ8UEJqG/c2VmYwE4pIB5Zxpzc
	5hNuLRG6Xp9cz7SdCQklK5V11H4w5M4xmNyi/95JMBX6qlK/kQgYNBCVTSXD0AwMnRN0GE+5QeWkA
	iYq29XYa5xuaGaKPoNa85+T0iUa0hYJxslEJ0P9+fyVlRhErzgNi9guvWLxAgg8OEsNHFQgHWnXpP
	h2u/QzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPPbS-00Ag9Z-CQ; Sat, 20 Aug 2022 14:37:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPPbG-00Ag4a-By; Sat, 20 Aug 2022 14:37:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F1B57B80CAD;
	Sat, 20 Aug 2022 14:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99438C433D6;
	Sat, 20 Aug 2022 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661006238;
	bh=BWn2AuZzmBQWgCHdWYaKRFlhXdOsJZRS65HElJ+rCnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0/5SZHW21ph5f4RPJG97a05DM5d7Lpao/oGNc8IrLae65UMG0PQhuBVVmwlVPxQL
	 9e7vfn6zON8NsmuFTIKxNxYHxcsnua3klYYFWVuHmnvWZBcw5W2nnwAY6ApLOzo34i
	 hvGS5swdxJf9hdWZAJ4JaT2X4OYQQw4zF4WliNfhoNu7LM1EclC4Wb+08AucuzI0Re
	 JVBVTUBeaJ8IRu6Culw2PO5W+8NvYbaTlK7G+YrEaBZ/5Xr0/bfM79QEWLQvfM3aXT
	 Sqs1Uds/CEA/zSAtIvhAzOny89n8ryglMphBY7gAE4fEHA206UG8wflCl5UzKy2U4D
	 W05rEP29vxoBA==
Date: Sat, 20 Aug 2022 10:37:17 -0400
From: Sasha Levin <sashal@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <rmk+kernel@armlinux.org.uk>, linux@armlinux.org.uk,
	ryabinin.a.a@gmail.com, matthias.bgg@gmail.com, arnd@arndb.de,
	rostedt@goodmis.org, nick.hawkins@hpe.com, john@phrozen.org,
	linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 5.19 54/64] ARM: 9202/1: kasan: support
 CONFIG_KASAN_VMALLOC
Message-ID: <YwDxnRGKNbk5Chay@sashalap>
References: <20220814152437.2374207-1-sashal@kernel.org>
 <20220814152437.2374207-54-sashal@kernel.org>
 <CAMj1kXEzSwOtMGUi1VMg9xj60sHJ=9GHdjK2LXBXahSPmm56jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAMj1kXEzSwOtMGUi1VMg9xj60sHJ=9GHdjK2LXBXahSPmm56jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_073723_961188_C16BC70B 
X-CRM114-Status: GOOD (  14.24  )
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

On Tue, Aug 16, 2022 at 04:45:14PM +0200, Ard Biesheuvel wrote:
>On Sun, 14 Aug 2022 at 17:30, Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Lecopzer Chen <lecopzer.chen@mediatek.com>
>>
>> [ Upstream commit 565cbaad83d83e288927b96565211109bc984007 ]
>>
>> Simply make shadow of vmalloc area mapped on demand.
>>
>> Since the virtual address of vmalloc for Arm is also between
>> MODULE_VADDR and 0x100000000 (ZONE_HIGHMEM), which means the shadow
>> address has already included between KASAN_SHADOW_START and
>> KASAN_SHADOW_END.
>> Thus we need to change nothing for memory map of Arm.
>>
>> This can fix ARM_MODULE_PLTS with KASan, support KASan for higmem
>> and support CONFIG_VMAP_STACK with KASan.
>>
>> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This patch does not belong in -stable. It has no fixes: or cc:stable
>tags, and the contents are completely inappropriate for backporting
>anywhere. In general, I think that no patch that touches arch/arm
>(with the exception of DTS updates, perhaps) should ever be backported
>unless proposed or acked by the maintainer.

I'll drop it.

>I know I shouldn't ask, but how were these patches build/boot tested?
>KAsan is very tricky to get right, especially on 32-bit ARM ...

They were only build tested at this stage. They go through
boot/functional test only after they are actually queued up for the
various trees.

-- 
Thanks,
Sasha

