Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5473FC5475B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJQbdgZKjt3hC5Lxf1ZMX53czAKc6KU0YHiAPB7jJT8=; b=uv7COfsJ78/UA8TvAxzvtjQAJG
	fW/LJDL9iaicrj04jP2PryKNXICdDXMmbSjQQiH6uvN38e+v/iyQNC1/GBk6cwXkXWg0yPARiSkcS
	JTUv5+m9C/ECEN3fIDKCF/yU/LjGcHTVeOvOQlK/sbLM0sfmVKoIv5Zc8ejZS8F4S/IXTRIKcW+1p
	bb6RlOLCtPNCyeu0IIEFfyp0POLo5xrB1nNFS2TYM6IT+Lz4i2PezuJtTuenr1D0YoVk8Bqro8AMX
	dpO00TVjzADI2sNXFxGWN6r7QlfJAACp4C1Wr5heR4/ryKtf+OgJyK0uDIhRqoLPucRud6uIu4Y21
	xdj9sFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhx7s-00000001ezo-1Lqx;
	Wed, 06 Mar 2024 19:40:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhx7o-00000001exG-0z0f;
	Wed, 06 Mar 2024 19:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DC8761A15;
	Wed,  6 Mar 2024 19:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15D6C433C7;
	Wed,  6 Mar 2024 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709754023;
	bh=5/Zn7NHW1uTwkwELhBiHm6Z/dCQjigrm4gBqAaJY9Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JKLC432oMy/qlvpf9vVwvVrMXSu9agkHKeeO3zV41CO6dZ20Sm+V1eNXj22cNLo5Z
	 G+5sWuR3L6AmhazuPitHyEI9Q62kI8Foz0g935QQYo5vAzrjZ8nDxoXm0R/Wr/9CFG
	 vPXG+0e+XKAtpxEOR49vSMOYzsg0x7aSvwcfzAYphXrOpC1eDjwtgQjdyTDVvoqQSC
	 SuqdIW6aNwut2F9YETPd7sXXRv9mmM45omYm/5wkTilQZD9GK9SEX1YNN/R2vmh6sP
	 W8ymyxZAaL1dbgbc4v+T12pja5MoSTS/EQylltQZ+i5r84F3qO2rQpqaPUmf0jdR02
	 kkHwk+XGSsg9Q==
Date: Wed, 6 Mar 2024 12:40:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Chunhui Li <chunhui.li@mediatek.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH] printk: fix _entry_ptr build warning
Message-ID: <20240306194020.GA3711543@dev-arch.thelio-3990X>
References: <20240306092647.16010-1-chunhui.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306092647.16010-1-chunhui.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_114024_416440_AF5F6E6F 
X-CRM114-Status: GOOD (  20.02  )
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

On Wed, Mar 06, 2024 at 05:26:47PM +0800, Chunhui Li wrote:
> We build with Werror and suffer build error when
> enable CONFIG_PRINTK_INDEX, such as
> gfp.h:223:2: error: unused variable '_entry_ptr'
> ratelimit.h:31:3: error: unused variable '_entry_ptr'
> kallsyms.h:172:2: error: unused variable '_entry_ptr'
> [-Werror,-Wunused-variable]
> 
> Fix the warning by appending __attribute__((unused)).
> 
> Signed-off-by: Chunhui Li <chunhui.li@mediatek.com>

Are these warnings being emitted from an Android version of clang,
specifically 18.0.0 with the build ID of 11209041 (you should be able to
tell this from the "bid" field in the BUILD_INFO file in the clang
toolchain folder)? This seems remarkably similar to
https://github.com/ClangBuiltLinux/linux/issues/1977, which was a report
using that version of Android clang.

Ultimately, this warning is a bug in a clang change that was quickly
found and reverted upstream

  https://github.com/llvm/llvm-project/commit/f0f395e00e2ec3f1f20ca9021d1554fde73d56c9
  https://github.com/llvm/llvm-project/commit/cfa578cde0314935c6eb5d7fa19ec26390d431dd

but unfortunately, Android picked a revision for the 11209041 build that
was between the landing of the broken commit and its revert. It was
quickly fixed with the 11368308 build

  https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+/42d100b025eb5f4a41781348016c148e9e912cf9

so you should just be able to update to that version to resolve this.

Cheers,
Nathan

> ---
>  include/linux/printk.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index 8ef499ab3c1e..749c1c4257f1 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -392,7 +392,7 @@ struct pi_entry {
>  				.level = __builtin_constant_p(_level) ? (_level) : NULL, \
>  				.subsys_fmt_prefix = _subsys_fmt_prefix,\
>  			};						\
> -			static const struct pi_entry *_entry_ptr	\
> +			static const struct pi_entry *_entry_ptr __attribute__((unused)) \
>  			__used __section(".printk_index") = &_entry;	\
>  		}							\
>  	} while (0)
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

