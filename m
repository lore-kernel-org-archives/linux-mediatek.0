Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5050C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 00:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwDaF3I9yB1+3XS5HJhWN/kHnIzjsgg/rJMWvS5JocA=; b=HgLJD8efn9tOKn
	U5kXZ03OPjVktVtn9VMYPy93O9o/L8AlKMWd++L9KwkGBW0W54WjDF8nk+oCJCsgUUSuUJLH0kDAr
	8+OdP6fklN6gyANbZ2GZTaKtTepR2TuLqs7SLUwk4lVdbZsnda+/WT3+fcm8ovKZfax+sUqqn/PSx
	zjhw/6roWl33O+Xh9pz5hBVYEJpARtiIYSIdv5RGq1uhgsqmBZjsZn+Jff/hMRFp3mCmsXB5cLkc/
	MSxSsI+xN3glUmb+/9/Tv4uozkyi590avPLdFYD7VoIOV9it82T7g+K3U+ij/YQkMcYlweJSw7y7r
	V2On/Po1mA7RD72XJ25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPCTU-000tce-IQ; Wed, 02 Mar 2022 00:04:12 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPCTR-000tcL-8P
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 00:04:10 +0000
Received: by mail-lf1-x12b.google.com with SMTP id u20so29653261lff.2
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 16:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4H0hy1V+vsSL/J4iRHU98fs6Ghx9E/bawvPg5OjXQmQ=;
 b=A1xSV6w+mnGI8KddmZFT+SVp47UhRqZlj7dZE7Ue1BgWjGw2+QCc51Zb6PIPvKiXuh
 /TGd1P3o63R0kiFyLwVU+kzDBf6Kt9wFSZwwJYnrWAqavu9szp3nfmKm0Qe68N3l8Mdl
 bWvesgtwBf4BWRSm4aUiCmj0pmAaHYwmzAjUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4H0hy1V+vsSL/J4iRHU98fs6Ghx9E/bawvPg5OjXQmQ=;
 b=UqdiQKA3shjCZlJXmrp+car2BiogDjvXvra/RBng7rPi6tDLg2WbdSYi/DivM5e+bS
 X+nGEonxXWfoGWkoDveUiS1ZlK57B35Yob6YM8AKdV55TB4GpSVrWIMxhisLS+/sk5Y1
 fS0GX0BCM4oq1TLgwU5pcn2wmHicQ5MRgZh/4N9YXPjrs1C/9eK5QTovdg006YgJF59K
 DOcLpRX11QDyh1kLQgU2va3GIyx+7pB5lEapsM0JotD7hDLMjLjv1OM5Npb3/+xH8I3e
 Ks2HHO8WGV6BLt2oSxk8Z2RWEmhd5P6p9C8U8Y+uawi4e2spihW3xfW+oNhh5dxSZnje
 Bt3A==
X-Gm-Message-State: AOAM530/iQMssIBBlEwGV7Ct5osZQElpTd2ux49FuyfyFD2R4DOHhmf4
 pOvzSV62WxUbU95PlRuzy3duc16ID/1tUHExIBk=
X-Google-Smtp-Source: ABdhPJyKuYwKPtR4f8l5iAqFcNvzTbSSWzd3P78fDGBPRqePtnRAFXXqnQT9CCzz/9p8E32q5aUYDg==
X-Received: by 2002:ac2:51cd:0:b0:443:675b:b1bc with SMTP id
 u13-20020ac251cd000000b00443675bb1bcmr16732414lfm.164.1646179447381; 
 Tue, 01 Mar 2022 16:04:07 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 b17-20020a2e9891000000b00247a36b1360sm463461ljj.28.2022.03.01.16.04.07
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 16:04:07 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id d23so29564833lfv.13
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 16:04:07 -0800 (PST)
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id
 b2-20020a056512304200b0043796f5e68amr17643498lfb.449.1646178958685; Tue, 01
 Mar 2022 15:55:58 -0800 (PST)
MIME-Version: 1.0
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
In-Reply-To: <0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 15:55:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
Message-ID: <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: David Laight <David.Laight@aculab.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 KVM list <kvm@vger.kernel.org>, 
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>, 
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>, 
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 linux-arch <linux-arch@vger.kernel.org>, 
 CIFS <linux-cifs@vger.kernel.org>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, 
 linux-rdma <linux-rdma@vger.kernel.org>, 
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, 
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>, 
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, 
 Dan Carpenter <dan.carpenter@oracle.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, 
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, 
 "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>, 
 linux-tegra <linux-tegra@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, 
 Netdev <netdev@vger.kernel.org>, 
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_160409_311835_32B184BC 
X-CRM114-Status: GOOD (  19.95  )
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

On Tue, Mar 1, 2022 at 3:19 PM David Laight <David.Laight@aculab.com> wrote:
>
> Having said that there are so few users of list_entry_is_head()
> it is reasonable to generate two new names.

Well, the problem is that the users of list_entry_is_head() may be few
- but there are a number of _other_ ways to check "was that the HEAD
pointer", and not all of them are necessarily correct.

IOW, different places do different random tests for "did we walk the
whole loop without breaking out". And many of them happen to work. In
fact, in practice, pretty much *all* of them happen to work, and you
have to have the right struct layout and really really bad luck to hit
a case of "type confusion ended up causing the test to not work".

And *THAT* is the problem here. It's not the "there are 25ish places
that current use list_entry_is_head()".

It's the "there are ~480 places that use the type-confused HEAD entry
that has been cast to the wrong type".

And THAT is why I think we'd be better off with that bigger change
that simply means that you can't use the iterator variable at all
outside the loop, and try to make it something where the compiler can
help catch mis-uses.

Now, making the list_for_each_entry() thing force the iterator to NULL
at the end of the loop does fix the problem. The issue I have with it
is really just that you end up getting no warning at all from the
compiler if you mix old-style and new-style semantics. Now, you *will*
get an oops (if using a new-style iterator with an old-style check),
but many of these things will be in odd driver code and may happen
only for error cases.

And if you use a new-style check with an old-style iterator (ie some
backport problem), you will probably end up getting random memory
corruption, because you'll decide "it's not a HEAD entry", and then
you'll actually *use* the HEAD that has the wrong type cast associated
with it.

See what my worry is?

With the "don't use iterator outside the loop" approach, the exact
same code works in both the old world order and the new world order,
and you don't have the semantic confusion. And *if* you try to use the
iterator outside the loop, you'll _mostly_ (*) get a compiler warning
about it not being initialized.

             Linus

(*) Unless somebody initializes the iterator pointer pointlessly.
Which clearly does happen. Thus the "mostly". It's not perfect, and
that's most definitely not nice - but it should at least hopefully
make it that much harder to mess up.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
