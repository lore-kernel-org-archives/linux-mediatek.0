Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF34C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 19:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdGH8dJ69kLIlS5JUARA6Ivdm9xkJP3pqf9cRh9NwCY=; b=Gk9p9GHBJetydw
	Dok7R8QDRgFRWIXd8JBJGxUtLDkYZVPk8KPH43kKaAzqXdk7JaBAWs8j4F4PLEzbixVSgCZjTlGAt
	usIvDV69W4dLxO9a8pra3a7a2z8qfKyaLc1aMKlEOSXlpFySWAoHc95vUxShkYSQg/HbrzEMHflm4
	W29Vqrod0nS49b/oG9/jvTCIf08tKv6L+ennTG1Z9gxQpzu0dmiDZppmtZO+nl3ekSqHbhnBrJx3q
	eTFoJX726+2/Dmt7o+NlP3c5vswxKV1JizWjSH0te0Ga5sQfuJtPcDpQN9l19UQPLa/h2hJ9gm7G7
	hxMUKfNA4vjzQ2AH24wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP7qE-000Fl1-0i; Tue, 01 Mar 2022 19:07:22 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP7qB-000FjV-VO
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 19:07:21 +0000
Received: by mail-lf1-x131.google.com with SMTP id m14so28520568lfu.4
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 11:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+FYbGAw6yxU17iUDUp61Ry7f+ZSO9wN0ehJ+hGfk2DQ=;
 b=NEmpYuhxkY3jphhiKwB9rL7CFHETV0OarciDwH/Y25b8gogpFDGLbcsm2Hp5JlhbRM
 fgLdNaX0z1k1bpDTdAa2T+xhPoQGBlkWInAyVtxomjmoWydKKz6S1Vw5P8QyPxUNcXPG
 O8s4ZVUjpR1ZVkG2oqZOMI9ApgRXI/RsyC5iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+FYbGAw6yxU17iUDUp61Ry7f+ZSO9wN0ehJ+hGfk2DQ=;
 b=YWbL+BJ6+lxy99N2eFch50v8AB0I2hEL61Bjh+3x5ShArsoRSo/KWulHtqhNbZ0UEq
 mlMvBEKdcqMqnC7Kgr/z6VH9SGDIbiwq6mYLyG2L3jefH7sm9gbP0/oOvH/vTecTwqpe
 MUHHOX1rgjUDlukLJOL7p8eh6eEVvDcR03lSiV5xC7ujsHgFHO3hwBJNW6rzHlWCY8dI
 IMecplFeYbPfIy5nhoZ5iO1eAhPWOwLh2CO1fqp+XsFD6umaVPuxMvmiLGZbrF/mSVGX
 eD7BRReXbyNtTwhntk0E5+FLC1lMvnH7SwQjz2FpFmMzayiqIqTVDYRbohNDvxlo3mrl
 +jPg==
X-Gm-Message-State: AOAM533ySIq8XFL7DeMNvd0XflncYb5R+/8COWQeq1KC6eEdQQI13QNr
 ZACTYELjaZzYN7V6UBq8YY3xyAcj8uIuDj693jo=
X-Google-Smtp-Source: ABdhPJxvQpHr6tjFmh6b6Xv3qp/YRVkuy/hTBm4US3h3ZC9YAchUnShznlc8BS3c9cMl+qj5iM13Ng==
X-Received: by 2002:a05:6512:3281:b0:443:5944:7a46 with SMTP id
 p1-20020a056512328100b0044359447a46mr16737227lfe.156.1646161635861; 
 Tue, 01 Mar 2022 11:07:15 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 o16-20020ac25e30000000b00442ba66c1f0sm1628023lfg.246.2022.03.01.11.07.13
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 11:07:14 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id f37so28468013lfv.8
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 11:07:13 -0800 (PST)
X-Received: by 2002:a2e:3013:0:b0:246:2ca9:365e with SMTP id
 w19-20020a2e3013000000b002462ca9365emr17902580ljw.291.1646161622598; Tue, 01
 Mar 2022 11:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
In-Reply-To: <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 11:06:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
Message-ID: <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mike Rapoport <rppt@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_110720_020630_A57691D4 
X-CRM114-Status: GOOD (  21.09  )
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

On Mon, Feb 28, 2022 at 2:29 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> However, if the desire is really to poison the loop variable then we
> can do
>
> #define list_for_each_entry(pos, head, member)                          \
>         for (pos = list_first_entry(head, typeof(*pos), member);        \
>              !list_entry_is_head(pos, head, member) && ((pos = NULL) == NULL;                   \
>              pos = list_next_entry(pos, member))
>
> Which would at least set pos to NULL when the loop completes.

That would actually have been excellent if we had done that
originally. It would not only avoid the stale and incorrectly typed
head entry left-over turd, it would also have made it very easy to
test for "did I find an entry in the loop".

But I don't much like it in the situation we are now.

Why? Mainly because it basically changes the semantics of the loop
_without_ any warnings about it.  And we don't actually get the
advantage of the nicer semantics, because we can't actually make code
do

        list_for_each_entry(entry, ....) {
                ..
        }
        if (!entry)
                return -ESRCH;
        .. use the entry we found ..

because that would be a disaster for back-porting, plus it would be a
flag-day issue (ie we'd have to change the semantics of the loop at
the same time we change every single user).

So instead of that simple "if (!entry)", we'd effectively have to
continue to use something that still works with the old world order
(ie that "if (list_entry_is_head())" model).

So we couldn't really take _advantage_ of the nicer semantics, and
we'd not even get a warning if somebody does it wrong - the code would
just silently do the wrong thing.

IOW: I don't think you are wrong about that patch: it would solve the
problem that Jakob wants to solve, and it would have absolutely been
much better if we had done this from the beginning. But I think that
in our current situation, it's actually a really fragile solution to
the "don't do that then" problem we have.

              Linus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
