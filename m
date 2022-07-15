Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D42C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8U10zfMg2MHnCiIBNObwk422GWQl02SfoTHfiQ0fc8=; b=knix5y8J1HBX2lycG/7BR7pIlk
	MVNdUAqYBEGBOM5Ai6B4TSlCPyjcW6INmDfG10mtI2HsGT+luNtBBlS3JE5RzDmYOkls9a8uPYmcx
	uAQaEoQrdTa4H3pedQh5YTU/1vejFaBWmIVm0Ixp4s+HrNbi847Z5BrUv+nZuHSainR0aeGpiWB77
	GMgSGlOUGwNbzqI0BM3mgXSQjvnvxP87zzmHIRbfuSjwmMllkR9mSeVT7bYhNwdkMJLodfK6jIp/g
	HbTL/iiyb9z0W+odE2oHEeJbL1otTrcQTvuPxp0YOSjHtotzhK/8iEfB0cpXeSscJA3XNyNzP8JVP
	Vdktnh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGWZ-005aMD-Ep; Fri, 15 Jul 2022 08:18:11 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGWO-005aBb-9F; Fri, 15 Jul 2022 08:18:01 +0000
Received: by mail-qv1-f45.google.com with SMTP id l11so3204717qvu.13;
        Fri, 15 Jul 2022 01:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8U10zfMg2MHnCiIBNObwk422GWQl02SfoTHfiQ0fc8=;
        b=2NWZNeZXjecMDq40K1hFGqNQ9QkL9xSvyvSygpwGfrdhT8POOxNCuDn6xdQNtaN2c4
         ng2LYi2uJDpP42Ns83p2Xi3X8Fgcm1zX56bZLKnvziep3nJj3oLtIoLP1ensPgVF04+j
         +nE5wleIfMo2vOn+957C53Tzp9bh4X7U47muqTeV1xXpCvjbLmw8FQuFhstAfnVWyDAN
         g+0uxFRoItr2+G4EouX5s1FiYM00ufy9m4ST5hfTu5WlN6QUjWdIyEh66dpx4ZrXp9Rr
         tU4XFr0yrYs670G3F7AFsHr2wqQpep42ikqb8W3AO29ucIwlUXazXnlLWmCYMYxGvu6Y
         V11A==
X-Gm-Message-State: AJIora9Cuhx+8Z3aktR53Wt4fmwRRdgPjUmtQMDNSrel0exoKqx+UIVx
	UyU8ltP65uMqO7HQ1SVGXpUOKCxVUxFsMA==
X-Google-Smtp-Source: AGRyM1u2Q+Hh30fBDLHsOsIHoETIyeKCreyNe/xYkwTmmLsaZhPiYJMUKsfxQmjqqxMW3VlDRb0jTg==
X-Received: by 2002:a05:6214:d0f:b0:472:f446:4322 with SMTP id 15-20020a0562140d0f00b00472f4464322mr11202276qvh.0.1657873077988;
        Fri, 15 Jul 2022 01:17:57 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a25cd00b006af20edff0csm3383033qko.58.2022.07.15.01.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 01:17:56 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-31c86fe1dddso40442737b3.1;
        Fri, 15 Jul 2022 01:17:56 -0700 (PDT)
X-Received: by 2002:a81:af27:0:b0:31c:833f:eda5 with SMTP id
 n39-20020a81af27000000b0031c833feda5mr14511861ywh.358.1657873075845; Fri, 15
 Jul 2022 01:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220628113714.7792-1-yee.lee@mediatek.com> <20220628113714.7792-2-yee.lee@mediatek.com>
In-Reply-To: <20220628113714.7792-2-yee.lee@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Jul 2022 10:17:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com>
Message-ID: <CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
To: yee.lee@mediatek.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	"open list:KFENCE" <kasan-dev@googlegroups.com>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_011800_336865_0A9810EC 
X-CRM114-Status: GOOD (  20.43  )
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

Hi Yee,

On Tue, Jun 28, 2022 at 1:42 PM <yee.lee@mediatek.com> wrote:
> From: Yee Lee <yee.lee@mediatek.com>
>
> This patch solves two issues.
>
> (1) The pool allocated by memblock needs to unregister from
> kmemleak scanning. Apply kmemleak_ignore_phys to replace the
> original kmemleak_free as its address now is stored in the phys tree.
>
> (2) The pool late allocated by page-alloc doesn't need to unregister.
> Move out the freeing operation from its call path.
>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Suggested-by: Marco Elver <elver@google.com>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>

Thank you, this fixes the storm of

    BUG: KFENCE: invalid read in scan_block+0x78/0x130
    BUG: KFENCE: use-after-free read in scan_block+0x78/0x130
    BUG: KFENCE: out-of-bounds read in scan_block+0x78/0x130

messages I was seeing on arm64.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

