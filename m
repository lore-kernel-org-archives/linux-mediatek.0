Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED37C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 06:38:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 942A8611CE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 06:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 942A8611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/4Y1ltNE/AOpmAIDsamn7hB2uRE8vXtrJZRL9uNo6c=; b=4xyA2jGYrXrxd+
	lstI1DygMapESBM/D3X6kVojo/eOD47E6aWCeh42oUzeDKgnuj7PHhym8oE66tBxdAT6GPm+z1JBh
	WLjGkYYKkNvDD6Ht2mKA+cA6uCr1r+Q2l4qBdmAAXy9SLW7rtJvgY+6QPH0R3xEYzACMdF1KUi15y
	3NqjjIdT7OVzP/bUNc4Xkdnj734Obc5YeA3unvSJYqnJuEPW50X+opLF9AiroXE6pDXhFfGjvjG/2
	e09IqpkksPAxMCjuyEbbPb1YTR7HxRH2+PsJeKz2sHmxFB4mfdGydA3SmJ7Uu85CqVjtXIClMY4ni
	d4Kv+3wdpKxBuo18tX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq8te-001k2T-9N; Mon, 07 Jun 2021 06:38:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq8tH-001jr2-Ql; Mon, 07 Jun 2021 06:37:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 103ED6121F;
 Mon,  7 Jun 2021 06:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623047859;
 bh=0YmlqGb0FyE2AjCwbtQ/9mSsCd5wlLanyBCpjo5ZUnY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FdoO8D5OBQkjg7pxfi/bbd40E3tMYAAwR7NCYNUkuSLZuC5YZvG13KsnU635mBP11
 RP9T9KV0EYMwz65lCzzn800HQX+FQJqYWIrnybmyECoQms45kdCgJo0L2IXmu6wf3D
 +dTecYd16rQQOUexTi3vmJltQ+1JCen5hDg+d+Y5gt2IHSkQrvzMtyDgPZJSUbQYO3
 Z6qUezNr6ieUDxTjYod/OpEG8D0C3fCJsQtrHXwADac3jmJ8eQkKUDMF+k9zhUj2hJ
 Uo6q4ecLCo+2vXyzi6JwAx4WAH5DUcnfEEXLlonxWUZPd9hh9oBgk3cQcZTJMTwabq
 WYDtaRppfEDtQ==
Received: by mail-oi1-f178.google.com with SMTP id x196so16638899oif.10;
 Sun, 06 Jun 2021 23:37:39 -0700 (PDT)
X-Gm-Message-State: AOAM531tSyWGdcHlAFQM/Cr2y+qXOi/HTGdZLnXO46ek9hNdaS+Dhz6j
 RfSVzs+fIOb5lnIT75wjhDBa2FlnDk7ybNyTJIc=
X-Google-Smtp-Source: ABdhPJzOcTVXMD+VQv+VmTWQFeXQt2medBnqUlrqmgcBlwFaQTscifvcpNqNxk2KNhtQsPa7Yy7AFUlOgLk8vUGpmTE=
X-Received: by 2002:aca:4343:: with SMTP id q64mr10379921oia.33.1623047858403; 
 Sun, 06 Jun 2021 23:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210607023839.26387-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210607023839.26387-1-mark-pk.tsai@mediatek.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 7 Jun 2021 08:37:27 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE3faN7nSSdoSU=ed+OPruefD_vJuhyRnsMuNiRygZZbg@mail.gmail.com>
Message-ID: <CAMj1kXE3faN7nSSdoSU=ed+OPruefD_vJuhyRnsMuNiRygZZbg@mail.gmail.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Matt Helsley <mhelsley@vmware.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_233739_947335_4054BFE5 
X-CRM114-Status: GOOD (  22.06  )
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

On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> Avoid using ABS symbol, which won't be relocate, as reference.
>
> On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
>
> Section Headers:
> [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
>

A RELA section's r_info field points to the section to which it
applies. This is why in the example above section #65522 points to
section #65521. This has nothing to do with the numerical value of
SHN_ABS.

> find_secsym_ndx, which use r_info in rela section to find the reference
> symbol, may take ABS symbol as base.
>
> Symbol table '.symtab' contains 453285 entries:
>    Num:    Value          Size Type    Bind   Vis       Ndx Name
>      6: 0000000000000002     0 NOTYPE  LOCAL  DEFAULT   ABS section_count
>
> Which cause an invalid address in __mcount_loc.
>

Could you give a better account of the error you are trying to address?

Also, arm64 no longer defines a section_count symbol (since v5.11), so
please make sure that the diagnostics of the issue you are addressing
are accurate for mainline.


> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  scripts/recordmcount.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> index f9b19524da11..9b69167fb7ff 100644
> --- a/scripts/recordmcount.h
> +++ b/scripts/recordmcount.h
> @@ -526,6 +526,10 @@ static int find_secsym_ndx(unsigned const txtndx,
>         for (symp = sym0, t = nsym; t; --t, ++symp) {
>                 unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
>
> +               /* avoid absolute symbols */
> +               if (symp->st_shndx == SHN_ABS)
> +                       continue;
> +
>                 if (txtndx == get_symindex(symp, symtab, symtab_shndx)
>                         /* avoid STB_WEAK */
>                     && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {
> --
> 2.18.0
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
