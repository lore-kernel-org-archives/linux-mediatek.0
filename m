Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F07C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtC1ZVjVsrjQWHphqRQAO+GaTarW2UCtU0sDB7OhLOg=; b=a70CYFV2CwsT5H
	SnBp3z4e0n3bsHYZvFLrdoGL7G9y57oJRJ3YoMK4McqodzMcmwBLN7NC+8uqGq9Pmr8cZ8UvOMR16
	m3AZRAnj+pVFqA6yDdV1+V8/vNnnLS1uMMbUT++SfsYMnb1fJwutfBBk6fIsFixSt6FTcryidsWH5
	tXI80INEJWvRrC6cjXxF8sTdXHnNQPA0h9hVl6sluJ33v+3LtxEAnALUO0cBCBuaNXncHWkWbM4Wi
	jETpL4kf4PQXn55EKRI4pO4XJUuumB+qOwLeqgrof55nEVxhc1XvMEUeLooDaYhfpJJBo1Zc5zrWM
	WtVBHdEtBGWJK6LRuVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfDl-00CEi0-Ua; Mon, 28 Feb 2022 12:33:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOent-00C4ZX-T4; Mon, 28 Feb 2022 12:07:03 +0000
Received: by mail-ej1-x62d.google.com with SMTP id lw4so24252762ejb.12;
 Mon, 28 Feb 2022 04:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mpq6EOSgaJN9TDHyutZ1vk7Ts/tQX7VWZG2tuQLEVnE=;
 b=P6Qm9QV+tKwfj02RvG70Y6RM578oBE7xk1h9xLRDl0Phoeno/cOg2X5jGG320h7a80
 51RqQzzCwbkind1CCh/PsD+YJ2xLuw3nTu9DY+Zris5SVOV1FI+8DsU52Jy5KlVydcNu
 G0XxThLJxiMxymk0pHTiYIUYA6Uj3RhvFK2FvOkFF3qdetV9R5zYggWzNl+ojj1OXKZf
 MkNjwD1Q29EHNb+3aSEEQSq9r3HlkkV49QyRIpbAEX1BAYg/I0l3VyVoctyp9PVfLMdm
 3mwm8jDaSc7WWe042oo4mIB/QOs4nHzHS6+i8MWcrLd/SBvvylJKxoeMQwrp3MTt3slq
 2wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mpq6EOSgaJN9TDHyutZ1vk7Ts/tQX7VWZG2tuQLEVnE=;
 b=6evYLouDOgbcMcO2WNgxr5gYTM6HAjq6olegkKCJDhmi0J9ZDvXthT7czjdUn/z1DI
 zlDucEwZgyCjweM7zLKddu1YooOV1lq5k9cBTjwm0cXt+tRARBlVpcafLY78ETm75ndb
 0gnepczOhYhhBmr9xK4nK98bFA83UeY8GuLgy56ibA4zhBCtMtj2aHMooGvHX//+22R6
 VG1XVZrl2Kl7Rampfh6hwJMMXcY7sBySerDfu/S9CM9xN+xDXkIEAP/u2BSCYaFwPoBy
 d1uUyrCXellXzAOU8cuo+Kz25ixAnvPSOUCGjzfRwOKZ2R5snA3z4S2uySeuPwJnYzNF
 zzUg==
X-Gm-Message-State: AOAM531h+QCZ9IXBD4m0sC9640nJQA35xR6Fu/xHnP1vIkxoML7Qki2m
 rXF/Y7UZzowqKBlI0k0P9AU=
X-Google-Smtp-Source: ABdhPJw3Wj1NaKaNlFGnSPXqnbDgppea1F4wGZoXZbWDfwDJgXssQhrPLcI1GM9ROPIg4DuPtt07Tg==
X-Received: by 2002:a17:907:248a:b0:6ce:e03c:e1df with SMTP id
 zg10-20020a170907248a00b006cee03ce1dfmr14689906ejb.258.1646050020495; 
 Mon, 28 Feb 2022 04:07:00 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a1709067a1700b006d0ebe4af89sm4282959ejo.20.2022.02.28.04.06.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:07:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <Yhyv42ONIxTj04mg@kroah.com>
Date: Mon, 28 Feb 2022 13:06:57 +0100
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergman <arnd@arndb.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-sgx@vger.kernel.org,
 drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kvm@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, v9fs-developer@lists.sourceforge.net,
 tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Message-Id: <79FCD5F4-0EBA-4E3F-8B3F-D450BBA10367@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <Yhyv42ONIxTj04mg@kroah.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_040702_011534_2739AA0F 
X-CRM114-Status: GOOD (  22.13  )
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



> On 28. Feb 2022, at 12:20, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> On Mon, Feb 28, 2022 at 12:08:18PM +0100, Jakob Koschel wrote:
>> If the list does not contain the expected element, the value of
>> list_for_each_entry() iterator will not point to a valid structure.
>> To avoid type confusion in such case, the list iterator
>> scope will be limited to list_for_each_entry() loop.
>> 
>> In preparation to limiting scope of a list iterator to the list traversal
>> loop, use a dedicated pointer to point to the found element.
>> Determining if an element was found is then simply checking if
>> the pointer is != NULL.
>> 
>> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
>> ---
>> arch/x86/kernel/cpu/sgx/encl.c       |  6 +++--
>> drivers/scsi/scsi_transport_sas.c    | 17 ++++++++-----
>> drivers/thermal/thermal_core.c       | 38 ++++++++++++++++++----------
>> drivers/usb/gadget/configfs.c        | 22 ++++++++++------
>> drivers/usb/gadget/udc/max3420_udc.c | 11 +++++---
>> drivers/usb/gadget/udc/tegra-xudc.c  | 11 +++++---
>> drivers/usb/mtu3/mtu3_gadget.c       | 11 +++++---
>> drivers/usb/musb/musb_gadget.c       | 11 +++++---
>> drivers/vfio/mdev/mdev_core.c        | 11 +++++---
>> 9 files changed, 88 insertions(+), 50 deletions(-)
> 
> The drivers/usb/ portion of this patch should be in patch 1/X, right?

I kept them separate since it's a slightly different case.
Using 'ptr' instead of '&ptr->other_member'. Regardless, I'll split
this commit up as you mentioned.

> 
> Also, you will have to split these up per-subsystem so that the
> different subsystem maintainers can take these in their trees.

Thanks for the feedback.
To clarify I understand you correctly:
I should do one patch set per-subsystem with every instance/(file?)
fixed as a separate commit?

If I understand correctly, I'll repost accordingly.

> 
> thanks,
> 
> greg k-h

thanks,
Jakob Koschel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
