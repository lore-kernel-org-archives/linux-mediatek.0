Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D842C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfUE0+8wyxiwCsQStwjldCfWgGu7dAvFpK7C9sCP1Xs=; b=4abM3cGQRSfILt
	mKBG3YFsOqFJhz4OJOKwrGYyy+oNOUk8Yk74NMjF2UXvkEAZuqOWTe/O+ivKBZ0cLU622Q6nhZpXi
	sWcaK3X8apWX/H5r8Py8La1f5HGn3p2iNklhIrXbMasmbO+aNylk7ZISzX98jG1j7jEAmihUSpNB9
	UwKt+SptYrMIPO5/cCi9y/aU3U6SY+MtgZ0zyr7nhWX2luoxOG41nG1Pt05AUJ04FuGsrNpyULCnw
	E9OixWdBhc8kCBQrDU4RjBLBR+dyV+M1Y8ui1G3mFmDZQdYsLmiymALWO/coZzYR4lkUO4KifGCRl
	iLposNJyac0s54dmxhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOmM8-00Dy8B-Db; Mon, 28 Feb 2022 20:10:52 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOmM5-00Dy6K-C1
 for linux-mediatek@lists.infradead.org; Mon, 28 Feb 2022 20:10:50 +0000
Received: by mail-ej1-x62b.google.com with SMTP id bg10so27161891ejb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Feb 2022 12:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uod9R4vPcpqIjzHofeC96qXcIXUlGW+U5alvKq7K0ZA=;
 b=Y+K+LAchMzIcesbCiqrzhisJgvbUIKYh3oFG/AlZJTKul1K9rRfHylHsN/EgM8hdwz
 P3hABFpC0Wcw+/0V4cKR5X0P787Wy9QwMeL5ORY50P9+oNZqmMp6NkFq4yV6NAIkP79C
 0bvk8ZnwfFSPqzKfD7Qqea+fs2YLRTaNcLanw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uod9R4vPcpqIjzHofeC96qXcIXUlGW+U5alvKq7K0ZA=;
 b=6/k5+wzQIKFd3k1qWUMMjRVqq+oll20pfaTlyWAha4/EirH3TI3FQlq45ykweM/s4b
 SHg1naG3YVCH1GLwoVSdW0OW3AunBg3aAv+hyGxUVVLqhTZiba5dAxZzEsawpbxlreq+
 O+Gz7yaN1s07hSkaxZxBHDG23gxGTPs6Sr3QEaVweso3tYiM2lkk0W8WPYM+PJJ2w4iv
 Tz5Jg9wRMW2rUxzmhF5Yr8+xgKiM+8QK1LI16LIrlowZpwMIP4dK9lETBPIZoCwl7MNE
 wsM+l5wXbqmQJq0Aqgc5JFQLnm6NAwyoOJ95gGgc1p8A4kTj+ttv2LzQ2N3GARUB3kvK
 +g+g==
X-Gm-Message-State: AOAM533eepExT3Fzwxsvgx8y3PCtkR/6Q2v3XP1v28EIcig3B3Nz8ll2
 yRb3a1jTk+eg/mH9mWzX6+OYDenzKD4U3Cm5rnQ=
X-Google-Smtp-Source: ABdhPJy8JNV6058u8hTkJlR2k+lfAaD7U1Im1rQ6mWMjrYAt5wSiCP3xLYsIUsNT8Al539hin3Q9dA==
X-Received: by 2002:a17:906:2ac9:b0:6ce:dc0f:9139 with SMTP id
 m9-20020a1709062ac900b006cedc0f9139mr16692534eje.206.1646079047273; 
 Mon, 28 Feb 2022 12:10:47 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 wc7-20020a170907124700b006cd01963298sm4605114ejb.212.2022.02.28.12.10.47
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:10:47 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id g20so19194947edw.6
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Feb 2022 12:10:47 -0800 (PST)
X-Received: by 2002:ac2:44a4:0:b0:445:8fc5:a12a with SMTP id
 c4-20020ac244a4000000b004458fc5a12amr7653619lfm.27.1646078630855; Mon, 28 Feb
 2022 12:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
In-Reply-To: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:03:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
Message-ID: <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jakob Koschel <jakobkoschel@gmail.com>, alsa-devel@alsa-project.org, 
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
X-CRM114-CacheID: sfid-20220228_121049_423392_6439A560 
X-CRM114-Status: GOOD (  13.79  )
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

On Mon, Feb 28, 2022 at 11:56 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I do wish we could actually poison the 'pos' value after the loop
> somehow - but clearly the "might be uninitialized" I was hoping for
> isn't the way to do it.

Side note: we do need *some* way to do it.

Because if we make that change, and only set it to another pointer
when not the head, then we very much change the semantics of
"list_for_each_head()". The "list was empty" case would now exit with
'pos' not set at all (or set to NULL if we add that). Or it would be
set to the last entry.

And regardless, that means that all the

        if (pos == head)

kinds of checks after the loop would be fundamentally broken.

Darn. I really hoped for (and naively expected) that we could actually
have the compiler warn about the use-after-loop case. That whole
"compiler will now complain about bad use" was integral to my clever
plan to use the C99 feature of declaring the iterator inside the loop.

But my "clever plan" was apparently some ACME-level Wile E. Coyote sh*t.

Darn.

                   Linus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
