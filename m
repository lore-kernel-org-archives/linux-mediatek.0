Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 23:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qHGZpAmYmuQUqweYSkXVBx50PFucYXJr1gIqHeVj44=; b=sCyFOLfgkvCg8V
	mv8gvHNr5tsvmb+9a6j7GuFPqnscHucIUO0PTvmvtWyAALBbDhy+i94eqXaAy2UhF+a9uG8VwW3GT
	AM5WO6l5l1WeK+8YC9E7v8XZGx1mQEfCTkU8QWfbrFz3nrEJDh75Rwgl25i1zcqNsm6XyEI3a8bOA
	wEoYHOfUNH1s/qHJi3zX1R7tX/9hmtjkvGEH8wGTMX6mx+oXpOgf9nMVwmBhznaA0XL3lzEv+uhZy
	vyltqReyPUhrBMH6PgGpTPPZV4++8y+l7lNgw8kOq+rabVjMdEHmQQOM5XwjB9Z0B5T1Hsu4Wow3c
	eD913/aBHEFpUTWu31Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPBe6-000qSe-TW; Tue, 01 Mar 2022 23:11:06 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPBe5-000qRr-6y
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 23:11:06 +0000
Received: by mail-lf1-x133.google.com with SMTP id j15so29417765lfe.11
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 15:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ojIOUCrgcIak8ZCc1skMdXRKcTVmt9Elm/o+1+I6jGA=;
 b=fmg4LXx5HRB2mrrWsHndl76rC2chdk1sBRQyNWtz+o2V+K2vg9psF6vr/ppax24roG
 0IEY6nkgVM6qwn95jhK4YeupoNeTj8/flkbxBQUDmf863ReCVguQlY3gsMWixLyIz8Mx
 ewpCP9yjbapnom8xtoCAmNy70uRnweYHKzlsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojIOUCrgcIak8ZCc1skMdXRKcTVmt9Elm/o+1+I6jGA=;
 b=UD+Ohmx1c19WfaDBXo6vpXJ6FkPqXPIz4XMeY6cvD/uoWheUriP+MVwj/WiJwGso6b
 /G8g7CL/K0GikWDOeb3EQOESTvxPAqu9b2wI3+AjWujgtGo56B/MuBZEKqfQNZisssDh
 836vvJM6xvKR7mXsf4mJuwLKcwvL+TKZ7NOWPpi0EsedqGhheyPk/qEvA8ncVTqLcXOf
 bl/d7TL2ubyjAkaH/74GMTCWGilxjuZufGqecAYIl1GZ5vpXDHU5nn1ixyFzgreWxhL6
 jmXZkSJWYN27X/byUfOvTZAV0Fas4n+k4e6OOXl0XAR2wdz8tBWH77zek4uSyt/C44p5
 VOpQ==
X-Gm-Message-State: AOAM530S8uD7dAxVullgmuahbx76aLDUk6uTqIN0MwfqzI2cotdCW5BH
 J9J1yH7PRN/WKI8kDQUlliL9ePii5PI/pbWGrjg=
X-Google-Smtp-Source: ABdhPJy7rzm1pPXloIozQCrNqPWyEKCVU9vuNGo/Ca4pRFuvSFotcUgz0xhbVLDYMZSCEza/07ckoQ==
X-Received: by 2002:ac2:4202:0:b0:444:14bf:86dc with SMTP id
 y2-20020ac24202000000b0044414bf86dcmr16858476lfh.126.1646176263208; 
 Tue, 01 Mar 2022 15:11:03 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 r4-20020ac25f84000000b00445b86dd0f3sm201708lfe.141.2022.03.01.15.11.02
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 15:11:02 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id w27so29477664lfa.5
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 15:11:02 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
 v13-20020a2e924d000000b00246370c5618mr18436468ljg.358.1646175815802; Tue, 01
 Mar 2022 15:03:35 -0800 (PST)
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
In-Reply-To: <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 15:03:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
Message-ID: <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220301_151105_263651_22A88505 
X-CRM114-Status: GOOD (  11.30  )
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

On Tue, Mar 1, 2022 at 2:58 PM David Laight <David.Laight@aculab.com> wrote:
>
> Can it be resolved by making:
> #define list_entry_is_head(pos, head, member) ((pos) == NULL)
> and double-checking that it isn't used anywhere else (except in
> the list macros themselves).

Well, yes, except for the fact that then the name is entirely misleading...

And somebody possibly uses it together with list_first_entry() etc, so
it really is completely broken to mix that change with the list
traversal change.

             Linus

               Linus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
