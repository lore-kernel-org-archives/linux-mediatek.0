Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61181C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZLQgV5OTogJ1ylkCDiOjxfc1T+CJXFQFeKoN9hX3ug=; b=k5sBOBKPdQPDICqpKJPP5DyX0O
	YWud4/CrlHLcgmG3kfMAPrhisyt+zcXi9Ouose7Lg/2Rcynn8rrt5+iL3AtZlubrmFFhlPig6d1Fi
	oqbK9oGtkM3m7jjUsHx2hpO86sMAvEs9EtzSrSTSvlOYpzQV2IlVKH+1Phjiwm6EyCLP8ej7PSUqJ
	PsYhAM8Vx3hqyRocwA5/PFKW+NyKj9TaYHPLFF82ltfTbVWHuDLiCHHOSdFWyZLMstzBmUhawpFH9
	BjL92nykoJshcUUWQO2aUE7R73jk2SS2PgmvP+MGPvkJ+aKQzUFweJuYGps3sHMf2AkfKRNXaP+nj
	B0Yn9p3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4n21-004az9-0y;
	Thu, 01 Jun 2023 18:28:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4n1y-004axZ-00
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jun 2023 18:28:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b075e13a5eso10310935ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Jun 2023 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685644092; x=1688236092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZLQgV5OTogJ1ylkCDiOjxfc1T+CJXFQFeKoN9hX3ug=;
        b=ac+D7llpyM/BXxwdJaEuWvmMQMeui0FxZcRRZfnSpxqEIcArtXlCuZLwdqvfE3qGok
         4YJ2vXhKuTgstjkSaUUfSn4yhgRW5lkYVmqdpxgsomkqIhx3z9M67ufAL1kVHNnkKSkr
         AnBhc03iHLRfh7oBDG/8KKFHGAinTY75WMNeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685644092; x=1688236092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZLQgV5OTogJ1ylkCDiOjxfc1T+CJXFQFeKoN9hX3ug=;
        b=OCRF62ZDzx5wRvjS80J6rjLPfjZT20OmCJ2TV9qB+Ji5y1M7FwN2N6zM6HWIdjTxne
         yyuaY1oYQOp8irR5njhVwLLEYAY4b695/Q1Vvu3elexkv9IOH4y5XFTvQ2skg1PEFoNB
         GbIu1+PzU5/DMHCHf/PxEbPTtyx7kP7EEs8RzSmujqaHf2K4YhToikyJLI0+yj0LCgCW
         DMuPhMCw+uxjJfpiy5r+UE7IufTMaShRUoZk8VyKz2is9RFdpyZNyfu6dSwNT67F7OFj
         OL+vA5StT2K5lQ/uWYV+yk4QTpG5Xk7eUM3eTPXnRVxQgDP7OFZE6kNIIdaGdv+piUL4
         AHMA==
X-Gm-Message-State: AC+VfDwe1HsM/tcA3bzB/dpT6lq+C3D/XgJMGxjNE/4hM2k4AqJ8hWT9
	xSYXxCmLJfLPPckWJf/e7AHMjA==
X-Google-Smtp-Source: ACHHUZ6VsAWG8Oi4STZkNdzz+9GCCgAqrG0b/8X2yp5U2lZsp1m4pLUb6tcFZsc1F6+QClxMAWQwkQ==
X-Received: by 2002:a17:903:2286:b0:1b0:1036:608c with SMTP id b6-20020a170903228600b001b01036608cmr261752plh.25.1685644092279;
        Thu, 01 Jun 2023 11:28:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b001ac4e316b51sm3833178plh.109.2023.06.01.11.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 11:28:11 -0700 (PDT)
Date: Thu, 1 Jun 2023 11:28:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, kasan-dev@googlegroups.com,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>, linux-media@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [RFC] ubsan: disallow bounds checking with gcov on
 broken gcc
Message-ID: <202306011127.B801968@keescook>
References: <20230601151832.3632525-1-arnd@kernel.org>
 <202306010909.89C4BED@keescook>
 <f6fcae8a-9b50-48e4-84e9-c37613226c63@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6fcae8a-9b50-48e4-84e9-c37613226c63@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_112814_036242_00974C28 
X-CRM114-Status: GOOD (  18.39  )
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

On Thu, Jun 01, 2023 at 07:50:38PM +0200, Arnd Bergmann wrote:
> On Thu, Jun 1, 2023, at 18:14, Kees Cook wrote:
> > On Thu, Jun 01, 2023 at 05:18:11PM +0200, Arnd Bergmann wrote:
> >
> > I think more production systems will have CONFIG_UBSAN_BOUNDS enabled
> > (e.g. Ubuntu has had it enabled for more than a year now) than GCOV,
> > so I'd prefer we maintain all*config coverage for the more commonly
> > used config.
> 
> Fair enough, I can send that as v2, but let's see what the others
> think first.
> 
> >>  config CC_HAS_UBSAN_BOUNDS_STRICT
> >>  	def_bool $(cc-option,-fsanitize=bounds-strict)
> >> +	# work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110074
> >> +	depends on GCC_VERSION > 140000 || !GCOV_PROFILE_ALL
> >>  	help
> >>  	  The -fsanitize=bounds-strict option is only available on GCC,
> >>  	  but uses the more strict handling of arrays that includes knowledge
> >
> > Alternatively, how about falling back to -fsanitize=bounds instead, as
> > that (which has less coverage) wasn't triggering the stack frame
> > warnings?
> >
> > i.e. fall back through these:
> > 	-fsanitize=array-bounds (Clang)
> > 	-fsanitize=bounds-strict (!GCOV || bug fixed in GCC)
> > 	-fsanitize=bounds
> 
> From what I can tell, -fsanitize=bounds has the same problem
> as -fsanitize=bounds-strict, so that would not help.

Ah, did something change with GCOV? This (bounds vs bounds-strict) is
the only recent change to CONFIG_UBSAN_BOUNDS...

-- 
Kees Cook

