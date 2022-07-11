Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764DDC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 19:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrYdGTk0yKCuMljUwPZ7/uXlafiom1+RNi/pXfEgS+Y=; b=PBcbtnV5keDuPW3je+w2CU07hI
	ecdGrrBJgsT1yA3kkxiW7qbVtAfARVWiNtYtwDKCAPXxMT4BE/v8s/OFKb9Fchur8ZtBAMHwdgd/8
	v6ferm06YLThe26WW5HUMKxnnjNjiRIozSaHAsPCnBV3C642M4Ts8um5cn/Bsi1sjqRpwA/XDE5mc
	PWhxOZAnTY81ZzdJctpIf4PBHOCBTNvNfYmSJemMK1ae1qMgGoYgSNRS+xQliyBuCwo4YlD/qgdUB
	cYptvngGNpzXeTZyCkrm5DA53HYlM/Yo1cBhv7wKjZMG8hBBURViiEzGXQhXsuduKXTSdg767FEnE
	Zfdc6qNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAyxb-004FHl-JF; Mon, 11 Jul 2022 19:20:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAyxQ-004F7O-Av
	for linux-mediatek@lists.infradead.org; Mon, 11 Jul 2022 19:20:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id l12so5247082plk.13
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Jul 2022 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NrYdGTk0yKCuMljUwPZ7/uXlafiom1+RNi/pXfEgS+Y=;
        b=avtznRRY4iS1AmoNE+xFYckNON9ycVHYL5nrww0X0/cL24DXv29e4e7u9Ra3AulsGp
         t8nShsS3H0X29qd3p2cDNwKAQ+T1Lc6bZfy2P+sNHEhC773m5LtNMKtdbh7p4XerMl3+
         WxVrB5yDkfmcO8w7XD9Vna5BS8Y7HSlmDtonN0dcDUgaB+8GsyYbXvPaLe8B8Y15QS5F
         4fpAqxlzmXrZeei0rEj/LduqDgjqPXhsTN5zJeQzqMQGXLs0hKXTbbD81UbEHtdDz6zO
         Yvkseu6BtC9cklXVX5PtKZ568HnkGJJ32D9CrRb+kVJVC4mqqqh2dvIHjoJjg9Mvao4Y
         Lvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NrYdGTk0yKCuMljUwPZ7/uXlafiom1+RNi/pXfEgS+Y=;
        b=cCtVfy66YMV+Td+oNZzTxd9V6nXrGdltbNMOO3vTHS7wexgHmZSHxz0aWpNrKzWG6r
         voqMdqFRRU2A1fKKc2oTS3k+I7BGjphk4yfdSU+RytIdmtw5fpJx5lJUWH+65kI3nBWA
         93KUDdfAslstj2F8dHaMYWJRmAWQBMVd5O0Dj7G6uRs4+UZ2MEErDBdG6Urfblo9Qjiu
         z+VhPp0cJTU9HsE5LJxgoX6zpWMfg5mcblBPVKX9X6EGxzziCz3diqvRTN5PvVTL0AkO
         OEnYcQFgqKPnA5GTnX6svMVJzmv6AZAw/KHRLid6Rm5eVEhaql7HqVrHYKXrY1Kqiqw6
         OIqg==
X-Gm-Message-State: AJIora+ThmxbDrg7lbhbwqlfaZ8uHPpmHwNeEwsTYsS4DMPc28OmPeeb
	zDZMZVWNtabcHnGVgLrP8Y42Cg==
X-Google-Smtp-Source: AGRyM1t/be+eF6H+YW5M2kcvwqqjrTB3VqZ6D3Mx34zzp6TePEh7gNQILyffnVjxOuTtoikVhDnlfQ==
X-Received: by 2002:a17:902:8f87:b0:16c:2c88:39ec with SMTP id z7-20020a1709028f8700b0016c2c8839ecmr17150281plo.52.1657567231016;
        Mon, 11 Jul 2022 12:20:31 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:a8b3:6eff:f380:e88b])
        by smtp.gmail.com with ESMTPSA id o33-20020a17090a0a2400b001ece32cbec9sm7270672pjo.24.2022.07.11.12.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 12:20:29 -0700 (PDT)
Date: Mon, 11 Jul 2022 12:20:22 -0700
From: Sami Tolvanen <samitolvanen@google.com>
To: Haibo Li <haibo.li@mediatek.com>
Cc: xiaoming.yu@mediatek.com, Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Aaron Tomlin <atomlin@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/2] cfi: free old cfi shadow asynchronously
Message-ID: <Ysx39t+I56lDGe4i@google.com>
References: <20220704014046.34596-1-haibo.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704014046.34596-1-haibo.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_122036_384678_A7AB99B2 
X-CRM114-Status: GOOD (  13.82  )
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

On Mon, Jul 04, 2022 at 09:40:44AM +0800, Haibo Li wrote:
> This patchset changes synchronize_rcu to call_rcu in update_shadow.
> 
> Patch 1 enables the CFI sanitization for cfi.c and 
> bypass __cfi_slowpath_diag.
> It is the prerequisite for using call_rcu in cfi.c.
> 
> Patch 2 changes synchronize_rcu to call_rcu and
> free old cfi shadow in rcu cb
> 
> Changes in v2:
>  - Remove _run_cfi_check,add __nocfi to __cfi_slowpath_diag directly
>  - Rename _cfi_shadow_free_rcu to free_shadow
> 
> Haibo Li (2):
>   cfi: enable sanitize for cfi.c
>   cfi: free old cfi shadow asynchronously
> 
>  kernel/Makefile |  3 ---
>  kernel/cfi.c    | 14 +++++++++++---
>  2 files changed, 11 insertions(+), 6 deletions(-)

Thanks for sending v2! For the series:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

