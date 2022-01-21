Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E93C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zH6cX8C78tArvc0r33zPFj+VPheklc9eoJ/c70qxivU=; b=l+2UqswtMu/w+U
	gJ9R1Tx4RXmEUKIYnAqk05It2U1YLQOSKxZTkNch5lcW/11LneVg4pddzBPVEJbh3Ta1DUBXnW7vP
	xOKnd/wNs633YZDx0ZZAFjyWJgzDLTFUF0eQg1KzYjw7xhx+V6Ybhf22g2PYx3r7xeKMpY9GMFAaz
	MLwyLHAmYleZBvsIVYt/+wECzOSu471VCgP+11DzTMXHB04HmIyI/fFUTWbsUr4szhLbpLSzhFeol
	GlODV9OnCb2GWfGVjQ6pohqbCUxna+jQqXA2wqdQdDzUpyGe4g9uJWRBGr8lEyfUktFXSY3H2k8qz
	rEAM0guDqlJ/Y0kFr+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAzzm-00G0Qd-8K; Fri, 21 Jan 2022 19:54:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAzza-00G0Ng-1R; Fri, 21 Jan 2022 19:54:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FD34616EF;
 Fri, 21 Jan 2022 19:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DD7C340E1;
 Fri, 21 Jan 2022 19:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642794876;
 bh=C7b5I+hDM3u7jSdl9XELS34WhxUJsTVhZpt6j4FOljY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ku+dDBqU5FvjVhQAUwJ24NyoqaB9BmTN50WqAoLXPhIDErCUpb6iXh0yhnNIj1ML9
 pne49JGIv7tFU/QDlVdMMeVRipgZWMnd67hUneYHAB57k5YHJ9nhEbQebIibrEMUrq
 h8gyKdCrl7wHd+xg7irdV2DOEkgCo+ZTsMeuuK6IuU6VQDGAEGlLtpzuDxMSWlEXrU
 UsUMsl7LTdkehHltiyy2bF3I0QiEk0N7Pe52UrgefBw7FnSihS9nZ1jEw31z8T/SLv
 rXov9H2AOhSV/kjJsLS308OGUhGcii4PEYeTLgZAwd/Utk7M0zBCOWIx4oMEnDtJ3a
 34u/wpZwmRtWQ==
Date: Fri, 21 Jan 2022 11:54:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Miles Chen <miles.chen@mediatek.com>, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] lib/crypto: blake2s: avoid indirect calls to compression
 function for Clang CFI
Message-ID: <YesPesOhftSzp2ft@sol.localdomain>
References: <CAHmME9qVMomgb53rABKsucCoEhwsk+=KzDdEcGKtecOXuahTZw@mail.gmail.com>
 <20220119135450.564115-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119135450.564115-1-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_115438_204180_5CF6AD31 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, Jan 19, 2022 at 02:54:50PM +0100, Jason A. Donenfeld wrote:
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
> 
> Nonetheless, the function pointer method isn't so terrific anyway, so
> this patch replaces it with a simple boolean, which also gets inlined
> away. This successfully works around the Clang bug.
> 
> In general, I'm not too keen on all of the indirection involved here; it
> clearly does more harm than good. Hopefully the whole thing can get
> cleaned up down the road when lib/crypto is overhauled more
> comprehensively. But for now, we go with a simple bandaid.
> 
> Fixes: 6048fdcc5f26 ("lib/crypto: blake2s: include as built-in")
> Reported-by: Miles Chen <miles.chen@mediatek.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/arm/crypto/blake2s-shash.c   |  4 ++--
>  arch/x86/crypto/blake2s-shash.c   |  4 ++--
>  crypto/blake2s_generic.c          |  4 ++--
>  include/crypto/internal/blake2s.h | 36 ++++++++++++++++++-------------
>  lib/crypto/blake2s.c              |  4 ++--
>  5 files changed, 29 insertions(+), 23 deletions(-)

There are some lines over 80 columns in this patch.

Otherwise this looks fine.  It would be really nice to fix this in clang,
though.

- Eric

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
