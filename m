Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F29C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 20:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4uIHk9a33Tn7TPIfW0Urf685ookO6jScyAf6n+v8PQ=; b=oUWYmRTnogof4Z
	HimzNOohuEfAhWD/zJgN5+Y7zN1MhFkdrqLjPN+b4NnVTO+1JH1KJc40QqwMtPj0S9pqHx9Kkvhbw
	ykuIAuaX8xo5UKysISUoax0hQl+RicCmHZxUk36HLgVgbOmYyWPRJz663MBQWjHM6OrO5s27hWWTc
	RPFEjEwsKVT1A3MZFvCf35Z2N0LGqC1XolXSEksaN0EtIK7C0r7ZSBroD+hnX6wmGDmccLuCg2jyH
	x0xi73FkKJJpe00Kzk0M8CeOBVPMq3/zL+0yJePXKRCoNLPi3lFOdDNRNIwxOEPNw0AMxxjiXbyWC
	9WKBnGUWi3EEjojESU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP9KY-000VFq-Vf; Tue, 01 Mar 2022 20:42:46 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP9KW-000VFD-GP
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 20:42:45 +0000
Received: by mail-ed1-x52b.google.com with SMTP id h15so23617073edv.7
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 12:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=;
 b=F+7BPGYsO9QeRc6BTbvPUJxguXCTYika7fzNVLbSEfMjTVK29FjvhOtCtbBO2oalkB
 9cweHARFFeQAeiDWhTrtcdfTzbCEOfTOrVCN9rTTV3Ek5jpvIVUt3aua8OA61CgDhA1w
 zQABsshAfnGl6gFdFI9HcnnKU8AOre3uWnEew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=;
 b=gKUN9kLcIQ21H970th4wyyrEWskc++XSQ4ZpLo9PDwQwIT5ykw/h0he0h6jIkV9kXm
 VzQqjae0acWbve5mmtJTycxlSHgocFfiwXbFk8Cz+jTr2TBjkIzXuA3KtygXuQTQpYMg
 AvNmoaxrigHVceSI6+3G2rArT173vFcVsphD1/oJIqbPKY9xpm+bDarHRj8D29imp3Lq
 riAsUJ4Q+W+SpjqDZjmuTSJQgnZptmOYd5JaaatLwQOHbR40tQ4+oYZIQmTjSUXPQcqt
 TtH+nCLeBulZAF87N1oTVyQRWkE/i6fzO8wbh51ZAsgzZZAsJp3RynXV1yjrqyehULZ7
 bApA==
X-Gm-Message-State: AOAM531IwJGtysBjO0Gn1z8xJc8vpIHY2xvMPGkD/3wp8k7PHYVe6e3U
 4MCxRZAZ+aeOXV1M5dR4WnQbPL0dWzjtfzS2maM=
X-Google-Smtp-Source: ABdhPJwcvgoc8WZjCftFsx83EgumqDsG8r2rw+C1ks7nV/Toc//YojxCVm9JEQbweWDTYqgmXB8biw==
X-Received: by 2002:a50:e004:0:b0:410:a39b:e30c with SMTP id
 e4-20020a50e004000000b00410a39be30cmr25625264edl.198.1646167362361; 
 Tue, 01 Mar 2022 12:42:42 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 bn14-20020a170906c0ce00b006c5ef0494besm5474724ejb.86.2022.03.01.12.42.42
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 12:42:42 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id x5so23581262edd.11
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 12:42:42 -0800 (PST)
X-Received: by 2002:ac2:44a4:0:b0:445:8fc5:a12a with SMTP id
 c4-20020ac244a4000000b004458fc5a12amr10608648lfm.27.1646166980002; Tue, 01
 Mar 2022 12:36:20 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-7-jakobkoschel@gmail.com>
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 12:36:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLtKofBbn9kSXRU3MpdX7S2OxN1V5Mc679oJpFnp_VnQ@mail.gmail.com>
Message-ID: <CAHk-=wgLtKofBbn9kSXRU3MpdX7S2OxN1V5Mc679oJpFnp_VnQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] treewide: remove check of list iterator against head
 past the loop body
To: Jakob Koschel <jakobkoschel@gmail.com>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergman <arnd@arndb.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
 Mike Rapoport <rppt@kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, 
 "Bos, H.J." <h.j.bos@vu.nl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Nathan Chancellor <nathan@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-sgx@vger.kernel.org, drbd-dev@lists.linbit.com, 
 linux-block <linux-block@vger.kernel.org>, linux-iio@vger.kernel.org, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux1394-devel@lists.sourceforge.net, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, nouveau@lists.freedesktop.org, 
 linux-rdma <linux-rdma@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 intel-wired-lan@lists.osuosl.org, Netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, 
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-tegra <linux-tegra@vger.kernel.org>, linux-mediatek@lists.infradead.org, 
 KVM list <kvm@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical@lists.samba.org, 
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, 
 v9fs-developer@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net, 
 alsa-devel@alsa-project.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_124244_560212_9FA66E7A 
X-CRM114-Status: GOOD (  21.81  )
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

So looking at this patch, I really reacted to the fact that quite
often the "use outside the loop" case is all kinds of just plain
unnecessary, but _used_ to be a convenience feature.

I'll just quote the first chunk in it's entirely as an example - not
because I think this chunk is particularly important, but because it's
a good example:

On Mon, Feb 28, 2022 at 3:09 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> diff --git a/arch/arm/mach-mmp/sram.c b/arch/arm/mach-mmp/sram.c
> index 6794e2db1ad5..fc47c107059b 100644
> --- a/arch/arm/mach-mmp/sram.c
> +++ b/arch/arm/mach-mmp/sram.c
> @@ -39,19 +39,22 @@ static LIST_HEAD(sram_bank_list);
>  struct gen_pool *sram_get_gpool(char *pool_name)
>  {
>         struct sram_bank_info *info = NULL;
> +       struct sram_bank_info *tmp;
>
>         if (!pool_name)
>                 return NULL;
>
>         mutex_lock(&sram_lock);
>
> -       list_for_each_entry(info, &sram_bank_list, node)
> -               if (!strcmp(pool_name, info->pool_name))
> +       list_for_each_entry(tmp, &sram_bank_list, node)
> +               if (!strcmp(pool_name, tmp->pool_name)) {
> +                       info = tmp;
>                         break;
> +               }
>
>         mutex_unlock(&sram_lock);
>
> -       if (&info->node == &sram_bank_list)
> +       if (!info)
>                 return NULL;
>
>         return info->gpool;

I realize this was probably at least auto-generated with coccinelle,
but maybe that script could be taught to do avoid the "use after loop"
by simply moving the code _into_ the loop.

IOW, this all would be cleaner and clear written as

        if (!pool_name)
                return NULL;

        mutex_lock(&sram_lock);
        list_for_each_entry(info, &sram_bank_list, node) {
                if (!strcmp(pool_name, info->pool_name)) {
                        mutex_unlock(&sram_lock);
                        return info;
                }
        }
        mutex_unlock(&sram_lock);
        return NULL;

Ta-daa - no use outside the loop, no need for new variables, just a
simple "just do it inside the loop". Yes, we end up having that lock
thing twice, but it looks worth it from a "make the code obvious"
standpoint.

Would it be even cleaner if the locking was done in the caller, and
the loop was some simple helper function? It probably would. But that
would require a bit more smarts than probably a simple coccinelle
script would do.

                Linus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
