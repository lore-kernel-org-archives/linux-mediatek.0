Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17A2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4jzyxz7HPtxQYCG/IXOIdObcFPjgyuzGEn/USHnbq0=; b=qgZcGAdMINWY1c
	/etL1lqRNmyPX+f9HnoXapwXS4aQl4RsOo+edwOAhF6JFGsyeG7ok6A7p4Vx3pz+UbbIFrPX0aXjo
	KroDh8wfSbg6wJpPMoKIfZlcZS9OIBO5qJzYItHKUwp3LzLnXC5KQhb5uZnFuneBLFSMyZCNsrWeI
	EwrtldCljn19+Q+teKKOn+nLx0/5gL+jmS3fijiEi2urWs2/z4aU0j9iTtcU+lPrKRGtfg/+lbRNT
	RkM/NEPlrYX/bwIHdWZOGwuJ4vZzkLyIzZOvjUJz9LKAAvyL4IsqBS7JiLaorHA8DjSdTLms/5uQH
	P+yeBNPio/q2W5Pzg0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPLIi-0023RV-CO; Wed, 02 Mar 2022 09:29:40 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPLIf-0023Pp-EB
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 09:29:39 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 29so1346038ljv.10
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Mar 2022 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XH8CYV/Z50iBLZ27uSo3DlVY0KhJ8ZO+RiecWTcYel0=;
 b=IQg4uBejV+wOE9gbvRPz3nvi4LkiiVw4YSIjC8NPteocLXX0uLpiZyGXJ60leACu72
 E2mMgbaj2BDeYnhoOw0DKPRcT2bjIlB4yRTWQZ65OcYRTHhlWzgeq8LyFprIEpiij6N8
 YNaymndxJaFKphqyYHlKdyPolm4uaJOX+WJuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XH8CYV/Z50iBLZ27uSo3DlVY0KhJ8ZO+RiecWTcYel0=;
 b=N4pry7erG4o+rXrmMLO3eU47mCQE+hf3tC62ubn+CqrqKvqJ6mFVoXK3qXcNlsE5ez
 Awd8yxYwPTd6jTneos3uSqjrYYo0RvmiEscMLHI6uv+PqQtvFlbo8lihr5R/p70pKSEm
 jCo/9yksUT+/nPINZ3fscPwSQ3Fnr6CqzcKyGvgkI94DRDb2sR0HbGa+f/qDgiMoTdYC
 UkpefiR3l7KFZLfiew+4WQiknpvfnjKgL3w0RcjkJ/8DgqEoWPKIgiV9wHYc2Ib4W0IK
 7494y+VYVfSE/8zLu4nnjsgQS8qk4lf87trW6qjt+1cMCTTBiHLmhVV9ovJfjGq5AC2c
 FlZg==
X-Gm-Message-State: AOAM532Q1EmTEVtkHTbo/KTxEVMnMHhAzau6KxIHktUBL+TUbrFINDq9
 J0DULIDPVcyKq+RrqbEmfdly8Q==
X-Google-Smtp-Source: ABdhPJxPRWTwhfDKGEWi/HTZUmtnN6xoKL1T2KNwEAF9KgB2sMMXSt6lke7BfBVtPRIEaNMyntkyzw==
X-Received: by 2002:a2e:3c0d:0:b0:246:3c52:7ada with SMTP id
 j13-20020a2e3c0d000000b002463c527adamr19885072lja.459.1646213374808; 
 Wed, 02 Mar 2022 01:29:34 -0800 (PST)
Received: from [172.16.11.74] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id
 f36-20020a0565123b2400b0043795432e87sm1960430lfv.150.2022.03.02.01.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 01:29:33 -0800 (PST)
Message-ID: <78ccb184-405e-da93-1e02-078f90d2b9bc@rasmusvillemoes.dk>
Date: Wed, 2 Mar 2022 10:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <David.Laight@aculab.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 KVM list <kvm@vger.kernel.org>, "Gustavo A. R. Silva"
 <gustavo@embeddedor.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe
 <jgg@ziepe.ca>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>,
 "v9fs-developer@lists.sourceforge.net"
 <v9fs-developer@lists.sourceforge.net>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
 <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
 <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
 <0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
 <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_012937_668210_66FAB06F 
X-CRM114-Status: GOOD (  21.28  )
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

On 02/03/2022 00.55, Linus Torvalds wrote:
> On Tue, Mar 1, 2022 at 3:19 PM David Laight <David.Laight@aculab.com> wrote:
>>

> With the "don't use iterator outside the loop" approach, the exact
> same code works in both the old world order and the new world order,
> and you don't have the semantic confusion. And *if* you try to use the
> iterator outside the loop, you'll _mostly_ (*) get a compiler warning
> about it not being initialized.
> 
>              Linus
> 
> (*) Unless somebody initializes the iterator pointer pointlessly.
> Which clearly does happen. Thus the "mostly". It's not perfect, and
> that's most definitely not nice - but it should at least hopefully
> make it that much harder to mess up.

This won't help the current issue (because it doesn't exist and might
never), but just in case some compiler people are listening, I'd like to
have some sort of way to tell the compiler "treat this variable as
uninitialized from here on". So one could do

#define kfree(p) do { __kfree(p); __magic_uninit(p); } while (0)

with __magic_uninit being a magic no-op that doesn't affect the
semantics of the code, but could be used by the compiler's "[is/may be]
used uninitialized" machinery to flag e.g. double frees on some odd
error path etc. It would probably only work for local automatic
variables, but it should be possible to just ignore the hint if p is
some expression like foo->bar or has side effects. If we had that, the
end-of-loop test could include that to "uninitialize" the iterator.

Maybe sparse/smatch or some other static analyzer could implement such a
magic thing? Maybe it's better as a function attribute
[__attribute__((uninitializes(1)))] to avoid having to macrofy all
functions that release resources.

Rasmus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
