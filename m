Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD53C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 14:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mtj0EAXN9U90VAEHDyJp+h4NOUaHKEG8aPk/GVml+8g=; b=wTU7c7haF1ftR+32fUZyNK2Lei
	WVOrer6d4adebazplNVlbvTlqNaVf9PaUDLOK5IbTDai6ldTR74/0cNMXZki349nrw2a8qKrWckkG
	foXv58xx7Vx7sKmzgnxzsJazy3HPthz9JcWIuKc2n92gDwvbfJG7CQqAtStU/quTO32mrbiLDDpbR
	IphJjIZafb9cigiDLdC9C99Dpkkgu8+cNCFaEwCC4MmgVKPiwx8zeapo6uqz1005HZHpi3E7JEBjg
	funh/zM7S4PZzmUgyKla+8YhO23Z+UMfWukzRhnVdNsFiv2voP6rNe79bD4tDgEIeROyUjxxZBGza
	U2330OmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRiD-00EfQB-NQ; Mon, 18 Jul 2022 14:27:05 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRiB-00EfNQ-8o
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 14:27:04 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31caffa4a45so109025477b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Jul 2022 07:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mtj0EAXN9U90VAEHDyJp+h4NOUaHKEG8aPk/GVml+8g=;
        b=sdl0ANPhWcYPKRHeSiX1ABKy52Q5uvPDzWi8yihz91FuiqXXxpmBjVZ9WIUQy6cTHc
         SVeSJDUI7mE0oz1+jwRcPlb5SNGDfV6W12sAtvt7t07e1nVG0CA7y1C5GJrYMdhOiTXQ
         zZ94pG2BXNmmp3guQGPtbHGYaGZ6xiPeBWVZacMwDedrGf1lyWCFPkaki4fyOdCWuWhf
         Hjw6S8dfyMpJeJXQ9A8p+Cuk9qR3a3Sjxx3KSzyTuA9O7XbyBemHwAdQGk8SOEsoT7LK
         xd9g/XFSsdVj9oXrndkCoI96eLOyfjql8zI7+HdJ0er6oSeib3d2Gdn1G5gJfE3uIFFq
         Zqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mtj0EAXN9U90VAEHDyJp+h4NOUaHKEG8aPk/GVml+8g=;
        b=qtiuhUI7zKszK0NfAYXjG8D399XZwqsVjaXrdyzBClYY92MUrsi+tMauoL0lKmhd77
         PvIpyYaw9HY/V9pOfwaIT9hA0sVLV1oUT4DQDhTV7TeXcEwtgJF3Z9pkVmMW115pCHWw
         XpataONxHyF11nO3AOnXufTlKtE2bakYZ3kRJQzA5ssb8guL7FMS4wl7zDuVEws9TuLv
         qRkaCSeRdBgcZskijKykAw9mv58FOZfLCbbiw9urOK5ScY4jop+frBBk7Z8Rtj2nhDhY
         vPBagFUKDIcRAM5RfNNcIvjC62cpCBT0rgAcEJNNciCmnA7xElPG1h3ajR26D8z7l8h4
         SUGw==
X-Gm-Message-State: AJIora+RN7M7oePX/5Wsjis9YmhihF0TEI2JKtNzN7kqrq0QaG6iQHka
	ZuGzZwWjgvu2Vnhy9lV2vAO5i7HZtlBrhEXEm5Ojx5hz+L0=
X-Google-Smtp-Source: AGRyM1s20EyQDEGyRPBZ7Wv7r8r/+XMLmzdGIFx3v1owTss4vMR1A0bYTVN4giqCYWmMweRoaJzVLm5YlcC2vG/Heo0=
X-Received: by 2002:a81:5a0a:0:b0:31d:ad7c:8fa5 with SMTP id
 o10-20020a815a0a000000b0031dad7c8fa5mr30075011ywb.512.1658154421240; Mon, 18
 Jul 2022 07:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220628113714.7792-1-yee.lee@mediatek.com> <20220628113714.7792-2-yee.lee@mediatek.com>
 <CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com>
 <20220715163305.e70c8542d5e7d96c5fd87185@linux-foundation.org> <CAMuHMdWSsibmL=LauLm+OTn0SByLA4tGsbhbMsnvSRdb381RTQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWSsibmL=LauLm+OTn0SByLA4tGsbhbMsnvSRdb381RTQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 18 Jul 2022 16:26:25 +0200
Message-ID: <CANpmjNPhhPUZFSZaLbwyJfACWMOqFchvm-Sx+iwGSM3sxkky8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, yee.lee@mediatek.com, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:KFENCE" <kasan-dev@googlegroups.com>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_072703_341547_A93E9523 
X-CRM114-Status: GOOD (  13.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 16 Jul 2022 at 20:43, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
[...]
> > - This patch has been accused of crashing the kernel:
> >
> >         https://lkml.kernel.org/r/YsFeUHkrFTQ7T51Q@xsang-OptiPlex-9020
> >
> >   Do we think that report is bogus?
>
> I think all of this is highly architecture-specific...

The report can be reproduced on i386 with CONFIG_X86_PAE=y. But e.g.
mm/memblock.c:memblock_free() is also guilty of using __pa() on
previously memblock_alloc()'d addresses. Looking at the phys addr
before memblock_alloc() does virt_to_phys(), the result of __pa()
looks correct even on PAE, at least for the purpose of passing it on
to kmemleak(). So I don't know what that BUG_ON(slow_virt_to_phys() !=
phys_addr) is supposed to tell us here.

Ideas?

