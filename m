Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458D3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGvnke5wyXL305/acF/u3V46zyXLzMWYp7c9SJf5t1s=; b=IiM5COQt8WFVgR
	xbqb48LgEU3dPyXXNpxwRJuoR58bIy6pVV0YA9bBRbtchlH19lVhbKzEDkHjacfhOUR1AX4fboWti
	n61xeBPzoPmG/OIvu8Ymz4vhnc55qz8jAkq3zfGBnGU86kiQuI9oEHuFwHR/lcn+Jev82MtBf1uwp
	i9zgQth+K+NowUI9qA/h9q2yPqnyYOffe1y5s1huB/TaGblZG3IELYtCNv9qoQbY9zf/ObyJSOoMh
	YxwgtFPaZGv4VnZfdTzTkgZbdcHlcIVrrhTzAWv6j+pJijLjkz9zNx5PldUxzeITvcysTeEHnux8G
	+2mfRtztuxAnv/EuLgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOqkT-00EXIC-1v; Tue, 01 Mar 2022 00:52:17 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOqkP-00EXGh-FY
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 00:52:14 +0000
Received: by mail-ed1-x52a.google.com with SMTP id h15so19945198edv.7
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Feb 2022 16:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BlmDHl6uq7o6y8aC/cJk7fo5oLGvHdeOO4XUoHPiZHY=;
 b=CuWkmdhnuqYUPLlFfSW5kqvLG+/BaUYxswQvwT5TlbeMKdgX0f6Tdop/2MomIxMIWT
 P4yfskuo3sOir2HSEC5b7N//0EkwPlLVbS+ffho6xWO2QaHJfy0oi9bnLtClO4bSDX+r
 dQzBghLtont2uRRAhfDOfzUglX2wpO3DzhpXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BlmDHl6uq7o6y8aC/cJk7fo5oLGvHdeOO4XUoHPiZHY=;
 b=H35sWdgRyr0Yg6qs/XjeDCFugCAZySn8KJKxjsVW35l/ueO1Kn3Bav25W49XipieUC
 /jtqMVMklqD2Ya+BNmHfxAMIgX5Cz39yue47l7eZNoAqGt3irxUChWI1r/ryrVjg9yRc
 6iCqmiXAkRXQQMI61ObToMvbQP/7i34t7B4qHP0mUxM1sx5Ufp21uwvkQcWdVWs89cyc
 dsj3urpS9fZM5jQhHpEJmcqTLCkhrgrfFA1Xj7EkQtw9QBOCpi7LMdZGofa2dtQj4IG2
 96TGoBcYiistOjCZGOOI18wRp5XLso1xqiT6q4w4ekDs2pnchben7WD73KIoVjQHJJea
 LZYA==
X-Gm-Message-State: AOAM531j4t5A8964oZp3QYiLb6BL3Gw44z6WAEQL1mmZeKMsF5MZU9dL
 5ZF0Yi7zyvmqArxvw96n8enMpdTq2z4maaTx1Ck=
X-Google-Smtp-Source: ABdhPJyC8ebzm+6qa7mHvWCVv9eOnNfC3LwSyX/MpNK8CgiC7uxC+sY0pATpKXIW6KZXr/AF7GPQkA==
X-Received: by 2002:a05:6402:1341:b0:407:cece:49f8 with SMTP id
 y1-20020a056402134100b00407cece49f8mr21913396edw.152.1646095931857; 
 Mon, 28 Feb 2022 16:52:11 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 y14-20020a50eb8e000000b00410a2e7798dsm6548912edr.38.2022.02.28.16.52.11
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:52:11 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id s24so19955309edr.5
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Feb 2022 16:52:11 -0800 (PST)
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id
 b2-20020a056512304200b0043796f5e68amr14778245lfb.449.1646095527444; Mon, 28
 Feb 2022 16:45:27 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
 <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
 <Yh1aMm3hFe/j9ZbI@casper.infradead.org>
In-Reply-To: <Yh1aMm3hFe/j9ZbI@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:45:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
Message-ID: <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220228_165213_548981_819E3CCB 
X-CRM114-Status: GOOD (  10.37  )
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

On Mon, Feb 28, 2022 at 3:26 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> #define ___PASTE(a, b)  a##b
> #define __PASTE(a, b) ___PASTE(a, b)
> #define _min(a, b, u) ({         \

Yeah, except that's ugly beyond belief, plus it's literally not what
we do in the kernel.

Really. The "-Wshadow doesn't work on the kernel" is not some new
issue, because you have to do completely insane things to the source
code to enable it.

Just compare your uglier-than-sin version to my straightforward one.
One does the usual and obvious "use a private variable to avoid the
classic multi-use of a macro argument". And the other one is an
abomination.

              Linus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
