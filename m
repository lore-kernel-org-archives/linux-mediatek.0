Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F2FCE79D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWsa8Fh/7pxLDTS+dddOiQjrUIU85qgQCUhDdAXOmHs=; b=Ua1tWqw5+pMafkpQ8yYJitc9HM
	aR3oi4mmC9GIYfUCgvNF27sReT9ln8DRDgaHQKNMiQu2XGecAsy3IBKELTxIDfPlR17hSPz3FZKx2
	SgZnKPyoa9O4feLFVv9w0Wzi7pyp5Ag2KFS+wKscIAdq5fX/Hcm08QI65GhX068d6I8ShOpODPbB+
	JBvgKq9h4eyStSpLsRMUyhhyKjL6WYWZwkvlai0tFJViy4lnpaQOLtZFaNI4XiFvj7euIw8UQgo1E
	zuSCGWOnlcY9huGCkWPH+B6yXiBsiKjSLC0EoyKMbHy+X3UCPh2aJUy/4Yu2UU33ByndEfJg9eE2d
	+Zwq8HEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixbW-003EFV-12;
	Wed, 20 Sep 2023 13:50:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixbT-003EE5-0N;
	Wed, 20 Sep 2023 13:50:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D53B617A6;
	Wed, 20 Sep 2023 13:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9AAC433C7;
	Wed, 20 Sep 2023 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217853;
	bh=ZYMgDvz7cLiEi48+fLoU5oYwxYC+RNXpuugTwerelA4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WYgV42Q41zYcX7fcsQWLwwrxbrrEfVse9h5Cv+phqauR1/HCAert4KodJzA2HkWy3
	 5wb0UyHx1o0VXHcCKUn0jNRzJu6mPirdPh0AkNjOfjEPMcqPrX6Ireg2yoYheIqCBy
	 ldUg/NPOhKMcsQgNwz0zG0fd9GnxJnb/ulC14E2LjwHAL95gx65ZV8wVCMjDGBlPh9
	 vv+8yLllFz9LnvyNzDaIvrT/CHK8cT2GuvVL2I8zN5MzJy5HdZJRhRpgW/JDNIaD7C
	 UUHRvK8FRsxpNZa6IRv3BFf2JudeMvzr4gO5/I7NJindbB8LJ388l971g3oLd9K6NG
	 RG/djIE3eg1eA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alice Chen <alice_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 ChiYuan Huang <cy_huang@richtek.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
 kernel test robot <lkp@intel.com>, linux-leds@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20230915201051.never.429-kees@kernel.org>
References: <20230915201051.never.429-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: mt6370: Annotate struct mt6370_priv
 with __counted_by
Message-Id: <169521784990.3449392.15396251707007241017.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 14:50:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_065055_198892_165D57A5 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

On Fri, 15 Sep 2023 13:10:52 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mt6370_priv.
> 
> [...]

Applied, thanks!

[1/1] leds: mt6370: Annotate struct mt6370_priv with __counted_by
      commit: 799107c1bb9049f9b3f28b5d651e336d09856019

--
Lee Jones [李琼斯]


