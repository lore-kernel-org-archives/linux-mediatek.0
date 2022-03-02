Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FCDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DNg4d4S4lsZw9PSedVClUUoWuWeyHB2IKfLGbNZdL0=; b=twLLtsUyWnmeLR
	CLLA31KU6qpA0GE8ORa/MIorJYPz4PjFJO0uuRNX/1U0rCH3yJ7swhizBVMo7Qg9KH4VrQ3AK+OSD
	WM8WHtvjcvuu4vgN9hRMktQ/Pl99dvImhEA4XOii4FmIYvWzJ4wky0/19cFGM4yX4o8GZsHKm/Te5
	4+cJveFjgx6cjxEgJ2c8N9B2A7m3O1r7SJ4KvJVlyFkzhuEVEv5IaWcx9tiW7jzP7Un25NXNJ3d4X
	k5EszJ8FF0sjQEgyBS9d9xZymIke1ln7CFjMhLAUD5AdDaaOeZy13ud8ZU0oWz2iJbBB5RTKfJEIR
	kK2pvR2nnhQz+YDwWqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPVYL-0045mb-6O; Wed, 02 Mar 2022 20:26:29 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPVYI-0045lE-Om
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 20:26:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id g20so3884243edw.6
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Mar 2022 12:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uy+qIY61mUv01aVZ77KYqcI4VQ6CnEr5ehBFaIlKwdg=;
 b=Be+smD91jIehBxsphVP8GxPmG9fZ7UzsziFVI8sCcayH4ghcjVwFadN69qX3SSZZfA
 w/nKcppYscRVDTynDM99u+3Int1mDvzuW1vHPoDdJ+8JxYLDdH7+xaY9DZL7COnmW4q3
 yEVm7FisHcBkdW7xwzBny/SyDipBoZU1ONqUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uy+qIY61mUv01aVZ77KYqcI4VQ6CnEr5ehBFaIlKwdg=;
 b=XUTZqAk9Hh9uQODvCM52KlSWBEheFOUFNPe+1ei74JVVhfz6quM/RD+rlhoRt8SP7P
 PI1qJ9s9G32vHz68kbllAdj8r/1xUJHK3AYAR6zjZqXOESYY8OzgvhPPK46moKoBWBq7
 xK4fipqGzafcg+TtOcmPD93R7mkeBJeKwOYD6ZdB1wicuGXStOEVF84CT0nJLOi+ng9E
 DyMPnXlZCwX9DsBbuLG/rWFS8yhf5MTBe3FI1tKASXXDlOFiZc7qi1Q/YqjQkndzReqN
 FJB3Vdm+bBVuTF/asBPvHKJKO6gRYTJp+5gjifv1PQ+8tMULHrOGUH/NH7iXn0DLz8kM
 O6Pg==
X-Gm-Message-State: AOAM53100u89ZVC+o751Rbs5YpXA1Ov/aRgoVF5me/B3ysbV2HIGWgCf
 YZublHRew+ezwvxUtSkJlwpQ1tk+utofyRBoDiE=
X-Google-Smtp-Source: ABdhPJz1c9HLUH5uKLE4sLDFGTfVqAQb0PVs2VxbcXE78g/qMTlYjvu5UzNFcNywYVOWEbiCAmJRKg==
X-Received: by 2002:aa7:c401:0:b0:415:ce8a:9397 with SMTP id
 j1-20020aa7c401000000b00415ce8a9397mr1788754edq.389.1646252782990; 
 Wed, 02 Mar 2022 12:26:22 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 cf10-20020a0564020b8a00b00412b19c1aaesm8843211edb.12.2022.03.02.12.26.22
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 12:26:22 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id qa43so6136641ejc.12
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Mar 2022 12:26:22 -0800 (PST)
X-Received: by 2002:a2e:3013:0:b0:246:2ca9:365e with SMTP id
 w19-20020a2e3013000000b002462ca9365emr21092331ljw.291.1646252342192; Wed, 02
 Mar 2022 12:19:02 -0800 (PST)
MIME-Version: 1.0
References: <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
 <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
 <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
 <0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
 <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
 <78ccb184-405e-da93-1e02-078f90d2b9bc@rasmusvillemoes.dk>
 <202203021158.DB5204A0@keescook>
In-Reply-To: <202203021158.DB5204A0@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Mar 2022 12:18:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wikKPC0LUqZ8++EC5JOvGdBqVH9uUaTX=DvBioDoReYww@mail.gmail.com>
Message-ID: <CAHk-=wikKPC0LUqZ8++EC5JOvGdBqVH9uUaTX=DvBioDoReYww@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Kees Cook <keescook@chromium.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 David Laight <David.Laight@aculab.com>, 
 James Bottomley <James.Bottomley@hansenpartnership.com>, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 KVM list <kvm@vger.kernel.org>, 
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
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
X-CRM114-CacheID: sfid-20220302_122626_828370_C0ECFA09 
X-CRM114-Status: GOOD (  11.78  )
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

On Wed, Mar 2, 2022 at 12:07 PM Kees Cook <keescook@chromium.org> wrote:
>
> I've long wanted to change kfree() to explicitly set pointers to NULL on
> free. https://github.com/KSPP/linux/issues/87

We've had this discussion with the gcc people in the past, and gcc
actually has some support for it, but it's sadly tied to the actual
function name (ie gcc has some special-casing for "free()")

See

    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94527

for some of that discussion.

Oh, and I see some patch actually got merged since I looked there last
so that you can mark "deallocator" functions, but I think it's only
for the context matching, not for actually killing accesses to the
pointer afterwards.

               Linus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
