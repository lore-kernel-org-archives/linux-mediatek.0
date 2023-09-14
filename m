Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6DFEEAA5D
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3P8BZDl5uXhLdi7mCkkSTzXwn0E2WaaQT91SGIepdI=; b=XO+rGm5FgoxFOV4+ffuQjEQXoD
	dnliMzSmLFeE3U++lYUksQQZ5CY2FLSTyfsHSYxXs1sGE+rnRmB02sKTs8Umm/IUdskyhmJ4AwAY3
	qv8Pzq7S2EilRbEPJCehWmHhgekGcTHp4guR214IUlIsQnywcDP0297e0DGNsK/Gt9DpiYeGZYshE
	sQTet9sQiHRLtSOukJoVQL0OE07obDXPVIWdSQxqmSvrDh3LGFifc76lbLCDbLLWTvyopYpfW8gg/
	+RHcbsvQm9IXRX6vNlEe32kxXo0Eu8+r0e50dj80gzpLJo8HOMLoOeLCg3av2TjwpyG0aKhnBCQAs
	gyU49rCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqQp-0090yv-17;
	Thu, 14 Sep 2023 17:47:11 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqQm-0090xi-08;
	Thu, 14 Sep 2023 17:47:09 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-573d52030fbso1042702a12.0;
        Thu, 14 Sep 2023 10:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694713621; x=1695318421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3P8BZDl5uXhLdi7mCkkSTzXwn0E2WaaQT91SGIepdI=;
        b=NxlljxNe9eyMUJlTx+16JPtgWVjP0cwdfXVmZFEnNNp/8C8YLWp/hyhBBzHoPbqcHq
         A9gYPLPzMggMctGoJqqI8wbp6DUTdHzq8gVLVZ3/GXvvQrfdcpkrJlrmpumCh3NmOlma
         L3nLGH1vaIBEOWn+G/Xhnuf7YC4aPyvn3YLG/hNaRi2cex8za0e0usKIZYHfe+ZQt+Iq
         tYAegzTcx2KStIw/Y9+FRbKfeYDCKAmZY5VXy/6o9XD89WjzugHbRX0eiQsBFy+riNaZ
         rrdNLCCzIgfxQyVUsdC7VpDjX6RfJduDdcb1xXpH0b7+W85BcZhmb0ej90DjGpa9QvE4
         RG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694713621; x=1695318421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3P8BZDl5uXhLdi7mCkkSTzXwn0E2WaaQT91SGIepdI=;
        b=sU39wEF7UDPr7KIX2mH2r/2hrcArSk2GHKKGIIQgVk4hyt+lwTco47XFlGa26EgARL
         Rl5XeqsxE6WNkC0n/AKAHpFOUGyLQEgRXhy+TzLtJomBNI/VF5wafg5i3W1FRvY6LE34
         ayIPY8AIduH9s1VxufjuMRg1d4LvtxSeNX1gU9gqylwr7LAP3gdutkhc4CIDBJqtqmt+
         yj6ch+Ql7KhHr2QZ+VO2bbrctJK/6gC/rhzKS7YIsJN5FmkKCA6zHNMcQRXFAuHCrFB4
         Jjp//d2vyKbJAL1OaRnQekoH02PoNUe9mpr8KKIdMgx3V5CH2ekKUnSXeklL2A8H7nBL
         WFDw==
X-Gm-Message-State: AOJu0YxfuJja3P06W/8c/5JcwJy2qSbQ8lqKj0Xlr9p97e3ogK2nTeLH
	LuN3WZdgo+fV0g5fKT1JPcGXECkfDjVb1oP5xnjFqPag/bg=
X-Google-Smtp-Source: AGHT+IGPp/DAIdRihdOyWbn7a+/dY0934SRhirtwacdlLAZjTTKnNrCTNn7WivJjY3pfaJKBk1H17/lGSRWMortnyyU=
X-Received: by 2002:a17:90b:1d87:b0:268:5bed:708e with SMTP id
 pf7-20020a17090b1d8700b002685bed708emr5548210pjb.24.1694713621533; Thu, 14
 Sep 2023 10:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230914080833.50026-1-haibo.li@mediatek.com>
In-Reply-To: <20230914080833.50026-1-haibo.li@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 14 Sep 2023 19:46:50 +0200
Message-ID: <CA+fCnZeHNoccoiUy11pmCG9LWHAxyB+6C7+GTc3ixj8iBnbi0w@mail.gmail.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
To: Haibo Li <haibo.li@mediatek.com>
Cc: linux-kernel@vger.kernel.org, xiaoming.yu@mediatek.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_104708_079097_367D083F 
X-CRM114-Status: GOOD (  15.59  )
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

On Thu, Sep 14, 2023 at 10:08=E2=80=AFAM 'Haibo Li' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> when the input address is illegal,the corresponding shadow address
> from kasan_mem_to_shadow may have no mapping in mmu table.
> Access such shadow address causes kernel oops.
> Here is a sample about oops on arm64(VA 39bit) with KASAN_SW_TAGS on:
>
> [ffffffb80aaaaaaa] pgd=3D000000005d3ce003, p4d=3D000000005d3ce003,
>     pud=3D000000005d3ce003, pmd=3D0000000000000000
> Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 3 PID: 100 Comm: sh Not tainted 6.6.0-rc1-dirty #43
> Hardware name: linux,dummy-virt (DT)
> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : __hwasan_load8_noabort+0x5c/0x90
> lr : do_ib_ob+0xf4/0x110
> ffffffb80aaaaaaa is the shadow address for efffff80aaaaaaaa.
> The problem is reading invalid shadow in kasan_check_range.
>
> The generic kasan also has similar oops.
>
> To fix it,check shadow address by reading it with no fault.
>
> After this patch,KASAN is able to report invalid memory access
> for this case.

Hi Haibo,

I thought this should be covered by the kasan_non_canonical_hook
handler, which prints some additional information about how the GPF
could be caused by accessing shadow memory.

Does it not work in your case? It might be that we need to add
kasan_non_canonical_hook to some other arm64 internal fault handler
functions then.

Thanks!

