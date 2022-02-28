Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC741C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7bAugFTVLahsaE1SPqZ9UWRfbCjTABEppkCnYRZ8Bc=; b=NA8Zbf0yIDTH7G
	LccNjrkH00JWl18u/6ZMcGd+cDZEAx+UedFTE+qRlgIBwMk4ro5eQuvOuoRAjiyfeZOFPYDXPJfGZ
	d04XVVwsa1ftRgzeXmNwjykWja+TcmYIoJ8ifi8n78ZobCTBtF6NZ0Y0ptx4r1HMG989vg/IcOdFR
	gXzs5ur6ttlrd2QRFgfpHqs5e4XEfagYShmS//zwJvkQ57gKpb0UlR1yVd8DvtI7T7NFZYc+thnMM
	VLq/moGNkyDql5HYx/ICEWGisBCL/e1Co1Cjqz/qU0X+EbXYuRCdpPI+treuv35DL9I00gsCzqr5F
	3VdKhRaJjVSn9unBflgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOnrI-00EE0y-4r; Mon, 28 Feb 2022 21:47:08 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOnrF-00EDzs-Cp; Mon, 28 Feb 2022 21:47:07 +0000
Received: by mail-ed1-x52d.google.com with SMTP id h15so19491267edv.7;
 Mon, 28 Feb 2022 13:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=;
 b=DcAOXNn/ViLnmA/Pl4xJfWkhBybquVghVb27ULjvzphMd1cBlP8EnT2avc3nlq8Ncp
 XU0OlwqVPcxmpQGfXIX8cDSYeDqzQFDIjUJw6vYkNcJJHsbpQaotozEaUyIGD250VuoD
 60I5wOFshLHgsaHS54p/JatmHLrrllGTo/egDJjxoeGmck3vK6ZaE0ldZN4szqLK845U
 BQNwjpOC8zhohOQR/VOEr6j/DtNOqZN6I6F48XJrq+10cNhH40s7WdjZ8f4gJpCeR9JY
 suF4D0bui+heOiMd0XjHUkKuJX/fj0a+j8l22tTUgDxT9LwW7gkDbHU26uOV2JCB+l1v
 aZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=;
 b=lVoSuJT0vlUKoe8dptjF4JOuRcddLggFWFrFGsgpG1ESvLKCyL9IgzMmDY0kJpBs9n
 7rGlNFaldWEYMaZbmRCEW0X2Z6C1LA8bmu3I52nj+D0tFFOBo1wtBT3qpJ3lvbgOseev
 hDV1aHGrRvRkiezlBTfKlFD0WSx0p2/Cm0O6nr3JQ0vwT2mWweCWnpM667HJEAm6qA7z
 xoaLV/mCJdhjTwBv+tPrekftDcLPj8vV2Z/OI6cHX5mar7G2g/O/JJRGv0Oz85RdMK6A
 TPsCERzg4ysWD4SX5LQJKNPv9Go9DIW0rvTl4mYvMh+rTxZo9Cbs9uzTYZcDiT3ZXX+J
 KvSQ==
X-Gm-Message-State: AOAM531oJ3lJNhJFYlfQuYAqU9o2s7rAx6/Cslg/84b9cLickGcN296+
 ze6dFnDsITpIqR2cqOEXkR4=
X-Google-Smtp-Source: ABdhPJxKG2ff16tCWsK6Ck3Y2a57p3q44AgnQUgUMRZ3ajKrFkwS/Wlp6PHXO9g9MP9OhOujc97TPw==
X-Received: by 2002:a05:6402:40d0:b0:412:f86a:efd1 with SMTP id
 z16-20020a05640240d000b00412f86aefd1mr21791110edb.194.1646084823834; 
 Mon, 28 Feb 2022 13:47:03 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 ce7-20020a170906b24700b006cf095c2f5bsm4701847ejb.83.2022.02.28.13.47.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 13:47:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
Date: Mon, 28 Feb 2022 22:47:00 +0100
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>
Message-Id: <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_134705_459151_7505F0C5 
X-CRM114-Status: GOOD (  23.77  )
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



> On 28. Feb 2022, at 21:10, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> On Mon, Feb 28, 2022 at 12:03 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> 
>> Side note: we do need *some* way to do it.
> 
> Ooh.
> 
> This patch is a work of art.
> 
> And I mean that in the worst possible way.
> 
> We can do
> 
>        typeof(pos) pos
> 
> in the 'for ()' loop, and never use __iter at all.
> 
> That means that inside the for-loop, we use a _different_ 'pos' than outside.
> 
> And then the compiler will not see some "might be uninitialized", but
> the outer 'pos' *will* be uninitialized.
> 
> Unless, of course, the outer 'pos' had that pointless explicit initializer.

The goal of this is to get compiler warnings right? This would indeed be great.

Changing the list_for_each_entry() macro first will break all of those cases
(e.g. the ones using 'list_entry_is_head()).
I assumed it is better to fix those cases first and then have a simple
coccinelle script changing the macro + moving the iterator into the scope
of the macro.

> 
> Here - can somebody poke holes in this "work of art" patch?

With this you are no longer able to set the 'outer' pos within the list
iterator loop body or am I missing something? Like this it stays
uninitialized but you'll probably want to set it from within the loop.

You would then yet again need a variable with another name to use
after the loop.

I fail to see how this will make most of the changes in this
patch obsolete (if that was the intention).

> 
>                     Linus
> <patch.diff>

- Jakob


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
