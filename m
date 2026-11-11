Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0B60A2601
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 02:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vq6ZDCR6;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wm84xdic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=; b=vq6ZDCR62Ae7Hp
	PZI91n9cGUucioBMmY2z2Wsdjw7NTdYxekIbNjfJf1f5wNvdCvnQYKjLMKQw2oQtfun7kisNOv3lg
	DDeW+5gN4+nN48WFomRvugybcCGfq4LoL7wqBBkyhVl2mMm0SPlEQ9MvSSqXRs0NlB+c+msK1/aPq
	TyQjPqsttY3V1t2DKlbqKN3CPDK578u8Lez0sUfbTxeHbRjn58NpEnQYHvTCUcWh1juI80lGJi4Gi
	18nhLIT1ny8S+gq6i3AeWu00y3mXaCH9hA3rlfcHh9zz+693cd2ffd6zA9C9TC69CHpfj0VqRlH7o
	HgQmjbz6XdPG9BNvKnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy6w-00000005SEL-2wzg;
	Wed, 11 Nov 2026 02:30:54 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy6t-00000005SD6-23MV
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 02:30:53 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b335eeb340so22899317b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 18:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794364250; cv=none;
        d=google.com; s=arc-20260327;
        b=nGmwYkO6tK1JLRGkKaRolM6AKndVepkeNwDPwout5WFeqSkXbQ4n4TEYGx1Cr8OyVk
         SYGFJExoLtDxGB/DXNWRstJeJMUw7yHm8zOXpjscAmJ2xDq0d7blBYX8lks5dairQOBn
         mR7koF2WzNF//YY5Pa0GGy2uwDkuhKBRK4JM+72ctapP0eelR/XUAvw8Qj8lQ4csdJW8
         Hv3eAHkrXJKVw2g0SrBMEXYPPgllGijWiHvaA5bfJPKazOSXBoY0vScUiKEyC5uTiZBC
         XAHZVOYXbfqfPNPFJiuz8Tmq+p39e/n0qGyItxioIKKZeeGp0BxgxOLWzQ30aZC+YxsH
         GxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        fh=ZgZDJeNEpwUy8WCFGfV+tqz+1/LmsAHZxOhFnvlaZp4=;
        b=DddGQ09mSmRhV6PdZVtUlQqCmA7x2+YOPifK6S2wH1v8t1XwyJLX6YGj+XhqeYqv03
         zcIC/ltQwF/4YY2eHCOEFpZu0B2bsQfgqH8TTAjZqRDlW3APndCDzKQSEoEc6uIHQGfs
         /UJNl1P9DnWnoSkhyi1XPVxPrZRCIfqy2NZTVesp2AhTFPVeJxthp/WNxmOm0FlIPQDM
         Jb/3nxXUUjxqRsBba4eimbbn0sI4iMRgCMsLoZnoz1kumepVSm1G/Cn0WeaUW0S9djWy
         xthgg1/w4ddxaOmKH1w5EWYhEmH5Y7WjZD6KWNqTPwXPSrAaetFl/SKZ/kqR080GaZys
         NhwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794364250; x=1794969050; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        b=Wm84xdicY3pqkdrNu+YCBF8RVyUnYSRuCIEFt4eCCN09uxcLlr6uJnes6LDYfSNZjF
         8WJZCDnLtaEW4KZvSj4O2rmphiBqU/N6/UI3o9qevr4GzD8q61Tgmw4Uv0UDdk5xdLeD
         7JBwENO/nChmlZjZLFKc/UYmgBaQ00udABk28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364250; x=1794969050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        b=fOQDSdTT3NqjmTBwyGdma68uJmEaMTXlHJ6wX77BBvTlxdwI9hBtxebqnmvvc8EKvb
         kE/o1yQy1stWGml0MpfYvoETg2j+UypiPvWy+74I90oHM5eKbej51PsgtSgJa769lDn1
         F0DW5mX3t3KcOeIKvTgXokwlUvlQNhSeY4aVET7XRwnw8nqWfDplRSNkyqphZEX8OMvY
         gLSCypyS85sCRR/i0PUAnirviXkn6oOLZTAb/0RB8eUV6gOO2p6NsU+Zba8GmU2wcqhp
         JOZsz79tULHMg21O6hDJHQQIZsLJnOUpsb4QGTSAYlfrWI/slRA1X3tcJcw/qKOYcCPG
         IUPA==
X-Forwarded-Encrypted: i=1; AL+hErFe9Zk5z7AXZy3OxY+Q/RQydNEl/otEb8CK3xUHey0mhQsQ+Awl/r23t1J95k0UJuF7GJScwZXHgo98g0lIJw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+zGMn4NObkm2uV5eMU1CMGVsgAD9ayfODTL9RjcB9tPmFz0/W+
	ywCEjcdHWjO3HGWWZwBp8sUZ5q5u1KfTjJLgIl7mOAMj7I+esuHUa3uOCqj9z/dOCRMp98OeJwc
	7f7twNfSUfp6khK/ujqINbIqwcWQsrvK+kT7LOpVt
X-Gm-Gg: AYBFou3vqTdcAafW2ZpD/Pm7nJo7Gu3RlajtZFg5Kj0JSOKAPVbztrN9q0fzkAB6Gj7
	G3m9c1fD7sMgluQfsmk8H3tEhvrkOfSjujZlMiLKZUSjNpVn6yAYgAt+8R4+LNdnQwApl6/pjgJ
	tZ3nFCzDbN1tamQ77huFPdTCbE5QamDhhuHiJ9gY5ZB8Bn09eMfqacE9TtSGowa0EJhzGES75B2
	VG/3i+6soWC9Y33BdlrC9OiKwx0gCLewyr/pl4EXaokUeHJ/ZTi+QuKdSWFVqhixagcUTjEXdCm
	XlBoU0aPKmaAt58GWXpvcYjzFKY1A+zltWH7F5IAnT6ctTDj75bwNqwCoAtMAKB4IG2YSNNApEF
	p+2uE/bO8q5qNH8WfHtwfWeGruC9NKyBQPdKHmSozZ67rQutsjf1MXMpKusDVqYZNxc7OoZAvTZ
	XfbGx615R13m6q
X-Received: by 2002:a05:690c:fd0:b0:8b0:cdf4:94a2 with SMTP id
 00721157ae682-8b3a81ab7e0mr7261967b3.84.1794364250231; Tue, 10 Nov 2026
 18:30:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
In-Reply-To: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Nov 2026 11:30:39 +0900
X-Gm-Features: AclHuK9ModA0hBuzgJ5zuMaqQJM9UHprenTTXYDmDO2P6KUA8OGeZIXeF99lf3k
Message-ID: <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for
 domain creation
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_183051_584849_F7507D8D 
X-CRM114-Status: GOOD (  11.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 7:51=E2=80=AFAM Ben Grisdale <bengris32@protonmail.=
ch> wrote:
>
> mt6397_irq_init() currently creates its IRQ domain with a fixed number
> of interrupts (MT6397_IRQ_NR). However, not every PMIC supported by this
> driver has the same number of interrupts as the MT6397. The MT6328 has
> 47 interrupts, so its interrupts above MT6397_IRQ_NR (32) are currently
> unusable.
>
> Correct this by passing the PMIC's actual interrupt count to
> irq_domain_create_linear() based on the chip ID. Define the missing
> interrupt count for MT6328, as the other supported PMICs already have
> it defined.
>
> Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Changes make sense to me, and it also seems to fix MT6332.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

