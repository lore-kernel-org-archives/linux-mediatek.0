Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7CEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/T8BRrZawbKJF3h2h2LgXpJsvHhiDBHRU67Xykyjz0=; b=rQuCn3a/TDbIFP
	XF1BsQi2altIoBiEbfdOqTZZrENlCwBaC/sZcaCWcaDGshqn5NMk1oVhS/mongBiuV3cAbI0ZYG0p
	z6bw/7BtNon9fGw5O+k9njoz3F2Vyl6FIEO99YEq7IW7pIu9N1HJKbeYEBhGJ8/MpwCTetl2hBxcO
	qkCoRVK2MWv6pDdNq01J3BQR5btgMQv84mao2EyHW+DPYd6M5FAd/Py/JIhHv0vB1fZk8pq0zibDX
	bqaxZsd5XdBgTLMLxy+zMvfsLOE2y58Lp7OO4XXK9t+bp9FoQAsFkuzeK6lrpQCWVP9qSAugTBaHw
	IzO1hFBpVAXsXF9/uJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOmmE-00E2tx-LB; Mon, 28 Feb 2022 20:37:50 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOmmB-00E2rw-IK
 for linux-mediatek@lists.infradead.org; Mon, 28 Feb 2022 20:37:48 +0000
Received: by mail-lj1-x22a.google.com with SMTP id y24so80401ljh.11
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Feb 2022 12:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/LNP14iVGpJY7HEU3KoWC3rGBeIOldyeXi/18P4YEg=;
 b=JCfpf2EkV0u8p2DIwI3SoZoRhHthQMEAy9/7LEkowc8JnTmPgsFXHlzh4U3t+Q6SEk
 Lc7ftzGO2kIrejoWkV3dzzd0jpx1zu67BigJ1Dmt6MH2aSREOTU5VOooJKZjMGKU+kco
 F0IyOo2hDxkf3WtcbllN4ffR7kqC0AZqO0I4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/LNP14iVGpJY7HEU3KoWC3rGBeIOldyeXi/18P4YEg=;
 b=V9kVsi32Sy8sBHO03wisc4OiW52EWQXH+MXKVg6ILlzR1JBsUvQkVL0DKCOI8DzoTr
 ncEyYp6x4MUOJnEHCpmW3i4qH+oSPYwwVDLYT67whfFNh1Oem2msFxZo6aRKKfvG5aBM
 /9ZdOoXEDqTUm6Y2WJ8FdoObwC62rud3AksGTDd2kDMcA5XDt5L1gGNrN0Hu9YTyHYBE
 J1Kc4YRd8UIeyinKnpWSAvpcboc5mm+/0mFEZMeSJTAmcZxZArUv4q8FNGvfUYyzI/5y
 7Nqh7Lt17/QPqPGI3tKI4Pa03IXBAaNliOzHTeEUo3MlZlorDwjhix5w7/5ompZPrY/w
 RMzg==
X-Gm-Message-State: AOAM533zuwsOhAFQHCs00FMACDsR2Isw3oqGHfm7x5Ja6E0PvfEQlgu5
 ynY1z0QfLbExtLJPpjBeRshFU+V8z470X53ViH8=
X-Google-Smtp-Source: ABdhPJy7ZiGdGUz3MKsijNaz0Fk5ws6QDN5R17uu5/gae9LLnJ+hbynLSGwHseXK5jhYZnzPQslA2Q==
X-Received: by 2002:a2e:7d16:0:b0:246:3451:5190 with SMTP id
 y22-20020a2e7d16000000b0024634515190mr15376762ljc.498.1646080665119; 
 Mon, 28 Feb 2022 12:37:45 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 y23-20020ac255b7000000b004304710b837sm1126828lfg.135.2022.02.28.12.37.42
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:37:42 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id w27so23433328lfa.5
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Feb 2022 12:37:42 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
 v13-20020a2e924d000000b00246370c5618mr15158756ljg.358.1646080652034; Mon, 28
 Feb 2022 12:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
In-Reply-To: <Yh0tl3Lni4weIMkl@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:37:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
Message-ID: <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Matthew Wilcox <willy@infradead.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jakob Koschel <jakobkoschel@gmail.com>, alsa-devel@alsa-project.org, 
 linux-aspeed@lists.ozlabs.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net, 
 drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>, 
 CIFS <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, 
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, 
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>, 
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org, 
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com, 
 Dan Carpenter <dan.carpenter@oracle.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, 
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, 
 linux-tegra <linux-tegra@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org, 
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
 linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>, 
 tipc-discussion@lists.sourceforge.net, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_123747_615934_DCF8BAEA 
X-CRM114-Status: GOOD (  10.96  )
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

On Mon, Feb 28, 2022 at 12:16 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> Then we can never use -Wshadow ;-(  I'd love to be able to turn it on;
> it catches real bugs.

Oh, we already can never use -Wshadow regardless of things like this.
That bridge hasn't just been burned, it never existed in the first
place.

The whole '-Wshadow' thing simply cannot work with local variables in
macros - something that we've used since day 1.

Try this (as a "p.c" file):

        #define min(a,b) ({                     \
                typeof(a) __a = (a);            \
                typeof(b) __b = (b);            \
                __a < __b ? __a : __b; })

        int min3(int a, int b, int c)
        {
                return min(a,min(b,c));
        }

and now do "gcc -O2 -S t.c".

Then try it with -Wshadow.

In other words, -Wshadow is simply not acceptable. Never has been,
never will be, and that has nothing to do with the

        typeof(pos) pos

kind of thing.

Your argument just isn't an argument.

              Linus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
