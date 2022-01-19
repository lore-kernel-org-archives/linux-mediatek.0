Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861C4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjUXTpEtkFadoJTjViBhs/hnSssMjjDu3Fr5SfpOA1c=; b=xS4kP9lSpwewRd
	dsodJ/slBzia6jK2GBDySJ98YX8MiYGwfdVVEugdzyECRDqDL0EoK2MXU09kHrK5OHH5BSkJfuBni
	jZ29Jvoc2L83Dwt6SJxBQ6hGHJ9IS72Khtj4P9k754M3o+Ao7FRKa+ahPuokv3920Nrf+GzemOi+F
	uhhrGVAorHigRx1eVBMD3B+EavXhFwI7ZpmvmmTrb0VovVjCQEf8gFDc1olp36Ei6SXHS22sxMJjy
	P71G5HrMHOmNzbuIqymEGyeZQjK1XiTcILN5IQTb73UELoOxFQSNVPgFQjyjqEUR/mLGtqTNtxnz6
	92ce2ZoC6BPcOYKUb2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA850-004sjW-Dj; Wed, 19 Jan 2022 10:20:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA84o-004shS-G3; Wed, 19 Jan 2022 10:20:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72A8661567;
 Wed, 19 Jan 2022 10:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C018C340E5;
 Wed, 19 Jan 2022 10:20:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pzCb1EEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642587621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AB3FPF0PWILNkb7gaXOI95vEqUZ5994CRNrN/w78cI8=;
 b=pzCb1EEQcFUzN9yRu8u5sT2Be6L9JiPSihgpKwRzMiqSjjCWSiEyfmKxTsVnURi1V+xo+L
 YcSP0+/S+QLlbBJ/vaM1HactjenuvmSnS2VPJVx/uRGShzP9rIIqslr9C+dwbc0gYNnnIO
 Za0l+EvdKKltVcjNRAPkmnz5FaUv/dg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8dceec6e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 19 Jan 2022 10:20:21 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id p5so5788524ybd.13;
 Wed, 19 Jan 2022 02:20:21 -0800 (PST)
X-Gm-Message-State: AOAM532h8zZknUA2flooZOwX8M16Ju5SBVCGcpw7jZJRrJwEvnHU8VuG
 Hwz2qse6u+H3Qk6XXevOWQAgkpLMI/6gl6s1mn0=
X-Google-Smtp-Source: ABdhPJxkL+8NhfTkbWqgVwGhaqfAeaKm7FaIYTp91pt11kI9EDshoZkY5I8wsKGSuxuQlLcEkQvSDynZCQV+wge/lWk=
X-Received: by 2002:a25:bc52:: with SMTP id d18mr9483510ybk.255.1642587619663; 
 Wed, 19 Jan 2022 02:20:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:209:b0:11c:1b85:d007 with HTTP; Wed, 19 Jan 2022
 02:20:19 -0800 (PST)
In-Reply-To: <CAMj1kXE_6WboUK0VPbTwzTbMNxv8b4XUp7USQUp=YqcCRMTZig@mail.gmail.com>
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
 <20220119100615.5059-1-miles.chen@mediatek.com>
 <CAMj1kXE_6WboUK0VPbTwzTbMNxv8b4XUp7USQUp=YqcCRMTZig@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Jan 2022 11:20:19 +0100
X-Gmail-Original-Message-ID: <CAHmME9o-=q6jT6mF3XsfoA17756YVEWdXGHukP=rxWS1gs5irg@mail.gmail.com>
Message-ID: <CAHmME9o-=q6jT6mF3XsfoA17756YVEWdXGHukP=rxWS1gs5irg@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Miles Chen <miles.chen@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_022026_638363_DB27A79C 
X-CRM114-Status: GOOD (  24.31  )
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

On 1/19/22, Ard Biesheuvel <ardb@kernel.org> wrote:
> On Wed, 19 Jan 2022 at 11:06, Miles Chen <miles.chen@mediatek.com> wrote:
>>
>> Hi,
>>
>> >Hi Miles,
>> >
>> >I'm actually not able to reproduce your oops. I'm using vanilla clang
>> >13, cross compiling for arm64, with thin LTO enabled and CFI enabled.
>> >Kernel seems to run fine.
>> >
>> >
>> >Are there other settings that are needed to trigger this? Do you see
>> >it in upstream clang or just the Android fork of clang?
>> >
>> I will try another clang (the previous version I use).
>> I am using Android fork of clang and there is a clang upgrade in this
>> merge.
>>
>
> One thing that could be worth a try is to make __blake2s_update() and
> __blake2s_final() __always_inline rather than just inline, which by
> itself does not appear to be sufficient for the code to get inlined.
> (If it were, the indirect call should have disappeared as well)
>
> Given that indirect calls suck on x86, we should probably apply that
> change in any case, regardless of CFI.
>

Had the same thought at first, but then looking at the original stack
trace, it looks like the __ function is inlined:

[    0.000000][    T0]  __cfi_slowpath_diag+0x354/0x4b0
[    0.000000][    T0]  blake2s_update+0x14c/0x178
[    0.000000][    T0]  _extract_entropy+0xf4/0x29c

So that makes me think that the issue really does involve calling
through the weak alias. But why should weak alias calling trigger CFI?
Compiler bug? Some other subtlety we're missing?

Jason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
