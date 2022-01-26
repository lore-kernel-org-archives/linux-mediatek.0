Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 22:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NhVH3y+RO2HfoDzjXZPi+LugqF04Pa45CsIIXSc1PM=; b=XlXGz6GCWsvX3c
	yuPIRg5Am2pWV8SEsYepczcqsM3Flx9ao+Wpr2QdPAsnSnVo9faJQeeBv43q59SHzJSz4mCUWhZbw
	dOo/046BvWkGWKze7DCOoZ0BSIfH5RMshOewcPwG84jJuB+5L0O/mtLgXAnIFKwRwTrNKKk+vigF8
	BzWvtqrrSijbUBTjO2Z+vmB6r2o8EHjXENCwyoexrFLAITHtpd8hakJBtu4FHGtLguXTrdxTdp3xi
	FqnZS0kul6gNSlH6VDKbnzd/4rdpV7u95iQYuSxRPTXDW+h1/doLudvjYBTyNr8YYg4TO8FkuF6Ul
	6vLd6/agV/6X32nt4SvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCr9J-00Di5C-NA; Wed, 26 Jan 2022 22:52:21 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCr97-00Di2P-0c; Wed, 26 Jan 2022 22:52:10 +0000
Received: by mail-il1-x12c.google.com with SMTP id z4so998940ilz.4;
 Wed, 26 Jan 2022 14:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbX/CA9rx3VdoijI1jnik093tt/YSMZq2p12OY56GJE=;
 b=FDvaV/SVpssUS1kX5dDZFCvk8MRpwyvPx0Z+IIgr78SYs83UY/9cNwv7wxVU1y71zf
 YFn/8hqfrl1wpKm+qrMwLTtYLgFwIHRyIQvqaO8hmWCF3/DT0nR2VJbNPIhsV+2792di
 Ndq/uKMuB8daKf19+dT1VHwKgYjzr9DN4aHQKfqjtxDYXvNa4EFjA5GxA22vTDUcn4JF
 6jMRF8eZyCPe0ilfZBvCGqBHNsU8fABVwF6U63Hq6deKhB72TpkZyGtaZvdCyfVw8icq
 cbAnBwyH1JDD81+4HRRQ5b+NL34bUnHL/pxfxb1FCI+VZh3/OMe0W+NyRVlJWZqseDyF
 +ZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbX/CA9rx3VdoijI1jnik093tt/YSMZq2p12OY56GJE=;
 b=2Hcp08FQ4HGRDyJya2Q29492JArLlTn6JC0SP5Fe/5Psl6lkCvZrzjcuk+FMoANkdP
 I1Nb6FprJisia515iwSktl/w/P8b7S/nAyrKc3nA29bZRinWAzwsz1MzoDX8oY4q99zt
 kWp20Ik5JB+9f2w9h/i5MRCSeF4mZ7GKmSODKUlStMgS1kj4KtGD1G91h3oL2IlhT1ax
 cQlaEZj817X1vjX3kuYLzdu3IhVziUg+xd75LO8v0OYA69TAAm+vjTHe2hjs4gg2icbl
 LlxCOi2Zb05W01DICuFGvUZYDUbnJiCK78RqUGhvs0aEioFjIbMFYH4L1cCACLSnbfWr
 sxQg==
X-Gm-Message-State: AOAM5331oZQJwRaIEeO3epGI904wpXMMyHlPKbhHrtrm2EWOcamm9GiU
 YYmwFk+Lq0Gz0Kjdlu7JMhDMh7ckdBowQ6QDx2g=
X-Google-Smtp-Source: ABdhPJz7GBY/JMkN6SYLj8sxtQBg5EJtrS4PlUVpZ/JYCUtK5E7iqpZDgUjlCM2KZJxqGEF7BOK/ADklNvpBSQT7mZ4=
X-Received: by 2002:a05:6e02:158a:: with SMTP id
 m10mr925657ilu.59.1643237523612; 
 Wed, 26 Jan 2022 14:52:03 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qVMomgb53rABKsucCoEhwsk+=KzDdEcGKtecOXuahTZw@mail.gmail.com>
 <20220119135450.564115-1-Jason@zx2c4.com>
In-Reply-To: <20220119135450.564115-1-Jason@zx2c4.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 26 Jan 2022 14:51:52 -0800
Message-ID: <CANcMJZABKTdwU8455pLfBjMjgsDO7BNjNWTvwx0sP+3TcJw_XA@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: avoid indirect calls to compression
 function for Clang CFI
To: "Jason A. Donenfeld" <jason@zx2c4.com>
Cc: Miles Chen <miles.chen@mediatek.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Nick Desaulniers <ndesaulniers@google.com>,
 Sami Tolvanen <samitolvanen@google.com>, 
 YongQin Liu <yongqin.liu@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_145209_084503_A40F8387 
X-CRM114-Status: GOOD (  12.70  )
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

On Fri, Jan 21, 2022 at 11:17 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> blake2s_compress_generic is weakly aliased to blake2s_generic. The
> current harness for function selection uses a function pointer, which is
> ordinarily inlined and resolved at compile time. But when Clang's CFI is
> enabled, CFI still triggers when making an indirect call via a weak
> symbol. This seems like a bug in Clang's CFI, as though it's bucketing
> weak symbols and strong symbols differently. It also only seems to
> trigger when "full LTO" mode is used, rather than "thin LTO".
>
> [    0.000000][    T0] Kernel panic - not syncing: CFI failure (target: blake2s_compress_generic+0x0/0x1444)
> [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.16.0-mainline-06981-g076c855b846e #1
> [    0.000000][    T0] Hardware name: MT6873 (DT)
> [    0.000000][    T0] Call trace:
> [    0.000000][    T0]  dump_backtrace+0xfc/0x1dc
> [    0.000000][    T0]  dump_stack_lvl+0xa8/0x11c
> [    0.000000][    T0]  panic+0x194/0x464
> [    0.000000][    T0]  __cfi_check_fail+0x54/0x58
> [    0.000000][    T0]  __cfi_slowpath_diag+0x354/0x4b0
> [    0.000000][    T0]  blake2s_update+0x14c/0x178
> [    0.000000][    T0]  _extract_entropy+0xf4/0x29c
> [    0.000000][    T0]  crng_initialize_primary+0x24/0x94
> [    0.000000][    T0]  rand_initialize+0x2c/0x6c
> [    0.000000][    T0]  start_kernel+0x2f8/0x65c
> [    0.000000][    T0]  __primary_switched+0xc4/0x7be4
> [    0.000000][    T0] Rebooting in 5 seconds..

YongQin also reported hitting this issue(also, only in the LTO=full
case) on the db845c dev board. Sami pointed me to this patch and I
just wanted to confirm it gets things booting again.

Reported-by: YongQin Liu <yongqin.liu@linaro.org>
Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much for the quick analysis and fix!
-john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
