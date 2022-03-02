Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758D2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgbNugry4Ew6VOGMDpyZPf5GYCGR2WcjMEhGD+VDZCM=; b=WQ98yO+lOeX+dc
	irkb2sxaxa1kT6Qkyt6EbborO5vUBErJDKXgEM47BH16csMX7WVUGjn48wsRS/wUfhgyT2TJ4a4aw
	j2DQ/eYgVhqGAl+l2K9oP5NLMkTSTVWZd5zS5UURE1apNHwksSt0/JIWSVc0dNbl+GQ4bEQscRuS4
	IY4n3++vB8wssE3pJPfJR3OXAM/lUD74CDMWf6nVYN8rfa4FTxeE6xkQI4r4af69jUMDyTbtCoMVi
	/MgH/BhDwb3xVh0MRkmbZavW1lFFEOq3l2EkYQ4vFeckhq7Nc2dUFbcW1Afb7SjJEnirkiYs/Tt/L
	LjuyPPhUKyUrn76vpDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPLKb-0023qT-Ro; Wed, 02 Mar 2022 09:31:37 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPLKY-0023ot-EA; Wed, 02 Mar 2022 09:31:36 +0000
Received: by mail-pf1-x442.google.com with SMTP id t5so1413329pfg.4;
 Wed, 02 Mar 2022 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yRnvPGVK9XQdKYPg/H0ecgdZJeSxpiKw/X1pv37GC+w=;
 b=FSwFYVuD0cAwR74FpWh/UVnJlZEuhHuzmEJF2CmWuTU5VQk08y1iQ6Cm+4Kk/IHZ7f
 ykn4dSn+LtVJ/QNPcAOF0Kr9OP0uyQbpGUjZhyE2BsGEuIYzlTgMZwHl/BYpjMpkMG0+
 P9mnuSE0YONb1xqLwPVeO/elgzKWhvv7I7OGEBThyQYghI00EIr5RS9MGp7GsCYrqLUi
 wR7dcG4fdae3Ke7WyU9tBlNyUPSMcC8RmnmBsmKYAmxRcsIUhLqhpYW4uCJTlnf3AogC
 YxEVbABh4/fwCz1Lhf2xi5Cnii6w5cwNjqEkAadiEwyP0C/cLXPnnAaLLll6ns+CdAHq
 Ceuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yRnvPGVK9XQdKYPg/H0ecgdZJeSxpiKw/X1pv37GC+w=;
 b=iqWNK80+oBdMsdgJm4zWQfaP207d6LvVlgBIAtYLMvRng+trc8EYudNhgxi5RAxRmk
 9U+a0GlBSEuxYKrmRUQcDCdJw9BltrtPuTqz/LQo/ZM5ZkE9J5HO1P26VIgXVP9BOZbd
 acucuQSOdNlgr7vSdJLEO6wagzKUnWooiqrwyI4dVzDm6w7BLVDv/qlejcIkA60g7Y0r
 9IjNYdhHCFQAOP+gWxBmorJOJ1TTxKWMHI7iGsq3IbSLFu+3LLNXGHFF1/um4H5Um1Y2
 qQ6Pozzdv5B82nLuYpXr6z18onn5i8/DM0QcZWXHLEbTctLwQSEJ8oIYuuUfJXkPauqm
 vYvw==
X-Gm-Message-State: AOAM5338GmO7RaDlXj0pzD8Ww8DjzqcJVoiuXrMcRS/yTzaHuw5a7t+1
 xdABm9B8njvKUpetbflke+g=
X-Google-Smtp-Source: ABdhPJxxYDNcbSMxl56+YduSTiv9ULKN3/PKEO9PEtlxvCfSyuhc7esxotc8paaSBF6ReGk5V/MJxQ==
X-Received: by 2002:a05:6a00:244b:b0:4c9:319e:ecb7 with SMTP id
 d11-20020a056a00244b00b004c9319eecb7mr31990006pfj.58.1646213490674; 
 Wed, 02 Mar 2022 01:31:30 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.20])
 by smtp.googlemail.com with ESMTPSA id
 y74-20020a62644d000000b004f129e94f40sm19496506pfb.131.2022.03.02.01.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 01:31:30 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: torvalds@linux-foundation.org
Cc: akpm@linux-foundation.org, alsa-devel@alsa-project.org,
 amd-gfx@lists.freedesktop.org, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com,
 bjohannesmeyer@gmail.com, c.giuffrida@vu.nl, christian.koenig@amd.com,
 christophe.jaillet@wanadoo.fr, dan.carpenter@oracle.com,
 dmaengine@vger.kernel.org, drbd-dev@lists.linbit.com,
 dri-devel@lists.freedesktop.org, gustavo@embeddedor.com, h.j.bos@vu.nl,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 jakobkoschel@gmail.com, jgg@ziepe.ca, keescook@chromium.org,
 kgdb-bugreport@lists.sourceforge.net, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-block@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sgx@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux@rasmusvillemoes.dk,
 linuxppc-dev@lists.ozlabs.org, nathan@kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org, rppt@kernel.org,
 samba-technical@lists.samba.org, tglx@linutronix.de,
 tipc-discussion@lists.sourceforge.net, v9fs-developer@lists.sourceforge.net
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Wed,  2 Mar 2022 17:31:06 +0800
Message-Id: <20220302093106.8402-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
References: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_013134_487622_E5713837 
X-CRM114-Status: GOOD (  29.97  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 28 Feb 2022 16:41:04 -0800, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But basically to _me_, the important part is that the end result is
> maintainable longer-term.

I couldn't agree more. And because of that, I stick with the following
approach because it's maintainable longer-term than "type(pos) pos" one:
 Implements a new macro for each list_for_each_entry* with _inside suffix.
  #define list_for_each_entry_inside(pos, type, head, member)

I have posted a patch series here to demonstrate this approach:
https://lore.kernel.org/lkml/20220301075839.4156-3-xiam0nd.tong@gmail.com/

Although we need replace all the use of list_for_each_entry* (15000+)
with list_for_each_entry*_inside, the work can be done gradually rather
than all at once. We can incrementally replace these callers until
all these in the kernel are completely updated with *_inside* one. At
that time, we can just remove the implements of origin macros and rename
the *_inside* macro back to the origin name just in one single patch.

And the "type(pos) pos" approach need teach developers to "not initialize
the iterator variable, otherwise the use-after-loop will not be reported by
compiler", which is unreasonable and impossible for all developers. 

And it will mess up the following code logic and no warnning reported by
compiler, even without initializing "ext" at the beginning:
void foo(struct mem_extent *arg) {
  struct mem_extent *ext;  // used both for iterator and normal ptr
  ...
  ext = arg;  // this assignment can alse be done in another bar() func
  ...
  list_for_each_entry(ext, head, member) {
    if (found(ext))
       break;
  }
  ...
  // use ext after the loop
  ret = ext;
}
If the loop hit the break, the last "ret" will be the found ext iterator.
However, if the "type(pos) pos" approach applied, the last "ret" will be
"arg" which is not the intention of the developers, because the "ext" is
two different variables inside and outside the loop.

Thus, my idea is *better a finger off than always aching*, let's choose
the "list_for_each_entry_inside(pos, type, head, member)" approach.

> It turns out that just syntactically, it's really nice to give the
> type of the iterator from outside the way we do now. Yeah, it may be a
> bit odd, and maybe it's partly because I'm so used to the
> "list_for_each_list_entry()" syntax, but moving the type into the loop
> construct really made it nasty - either one very complex line, or
> having to split it over two lines which was even worse.
>
> Maybe the place I looked at just happened to have a long typename, but
> it's basically always going to be a struct, so it's never a _simple_
> type. And it just looked very odd adn unnatural to have the type as
> one of the "arguments" to that list_for_each_entry() macro.

we can pass a shorter type name to list_for_each_entry_inside, thus no
need to split it over two lines. Actually it is not a big problem.
+ #define t struct sram_bank_info
- list_for_each_entry(pos, head, member) {
+ list_for_each_entry_inside(pos, t, head, member) {

I put the type at the second argument not the first to avoid messing up
the pattern match in some coccinelle scripts.

>  (b) gives us a nice warning for any normal use-after-loop case
> (unless you explicitly initialized it like that
> sgx_mmu_notifier_release() function did for no good reason

sometimes developers can be confused by the reported warnning:
"used without having been initialized", and can not figure out immediately
that "oh, now i am using another different variable but with the same name
of the loop iterator variable", which has changed the programming habits
of developers.

>  (c) also guarantees that even if you don't get a warning,
> non-converted (or newly written) bad code won't actually _work_
>
> so you end up getting the new rules without any ambiguity or mistaken

It will lead to a wrong/NULL pointer dereference if the pointer is used
anywhere else, depend on which value is used to initialized with.

Best regard,
--
Xiaomeng Tong

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
