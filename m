Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E09CD128A
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRL6F0Y7GWiKLw5ZjSnTgJyOyz7w6uvipEUuFAhRYQ8=; b=cCtySD3kY1qDkU8Ekhz8TbGb2P
	gjO438Jo9gu3H7SuQcMrWx0uv8n7i0Fy2/702t0A8iigGcJkmMdDFv5mKqL4oYaEvg04GcI5knLf+
	AmEBE/fYPNIFq/oh47WETy2jM2x/wI72/Bj8FUx1/DmpDlC8e0ziGm9skppCTnUJ5s4uxC2Gao0sY
	sMGs1scinYvCXx0zTR1pKtCZMJwMODEQqL0WRLvWdp7WqTgre5k9EWE+dkyqekoyeQxc8IIEMrnON
	abnoq4SPE2rYiRRZx6v1m/sMzai0a0Ig7SzaU1eCCV668iyM/JqevUsL+pezwwiyJ+TUNBo/LmExl
	wM/g3cTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVvX-0000000D6LK-0fm9;
	Sun, 07 Apr 2024 17:03:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVvR-0000000D6KY-3nbg;
	Sun, 07 Apr 2024 17:03:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-343c2f5b50fso2378010f8f.2;
        Sun, 07 Apr 2024 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712509402; x=1713114202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRL6F0Y7GWiKLw5ZjSnTgJyOyz7w6uvipEUuFAhRYQ8=;
        b=jQ8b9dD6K42TcLj0znwux5OOla5k3sABs61k3qvUuMsxa3a0kNqo3qD1SKrRcebgQT
         ZmCC/MWFhwGV9WKicpzbtdtNA9jvpKIWMia9ibarOwysYwm/ifQI/H8Kthfj+ZGdQGs4
         a1ZSjjFhrGw4qm8/8waocNTwnjXzALvWylJpH8JTBnmkKeqe4w9hdSsUQutGQaRURpVo
         g+bftC1FPEXG3gOAGprq7S9GZ4iiWv2ur/lW7qimtSA1avvn5AmmaWaL421ez8jGJBB3
         CpV9/i/ZPTNyeQ5EkViz/SC8m+tGmrCfwiMe6vDJazRrI9ureG22U62OOpNj4lDU4IvL
         +O6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712509402; x=1713114202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRL6F0Y7GWiKLw5ZjSnTgJyOyz7w6uvipEUuFAhRYQ8=;
        b=S3L/P4YMV+BsqhY3KPsS7xYQhHqZI/oBrMdlZWbXGLA8G2x3Ce8J54exrd0czsGmkC
         XlEPVmKFIbsOR53ZgVXTdRCV+quzKviWJ/FOaBSGFC5YmgYC3pgGpeB1rzECzNPbkgWz
         9dfUzLzyZDUp7x1BOU142QzmaGOWgdZ32k5C253Fg4A9Ag63+fBBu+HSae5cBonrYtau
         q9F8yClrv/PNCan5FeagPBuGyEqo3O4+sF8hgiGi37XSUEQiSsABlabEz6uEZlktQHvH
         wkoQZugG1Uz0gEY4AdFbDsgSupg6YKatPBkj/XLjlD/GCQgv8AoBUaKh46bhtgjmb6rw
         f8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWbLqPpd3MT/bDmiqXFb+zD1gzjvCu80GXxOqn0ZbrH+bcfxPAlc4yus34o33MSkJelFcvCvtwCawE8mb5qgbtStYk+Av7tlTojJQtFBDpsnzv94Vixm8hoqrPCVAu+MlxQ9oCh797CP3SymcPmhDAj1BmXhGUI8Wk=
X-Gm-Message-State: AOJu0YxWWi82adahCjryT0VOX453GA3NUJGbeCGFTJKC8yAU30gLqFBz
	ByvdT//2886qToTC+mVd4pNy/2N+U3djbN1hvB+rBva+E5M1EfDeMXr7u6WGM7/Qsn5+acBqXCT
	mLTmPVZaTH1X186kkUMeoja9x7W4=
X-Google-Smtp-Source: AGHT+IHJQxJHl+wPj51rspPjpYHaysfsWlIxLTCgpIveJzPwDf+CTy65VL1Y+YNaoJwGVL0dTTu913oNCo9Ck2pbQtI=
X-Received: by 2002:a5d:6c64:0:b0:345:8c1b:32f with SMTP id
 r4-20020a5d6c64000000b003458c1b032fmr1847452wrz.26.1712509401720; Sun, 07 Apr
 2024 10:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240407130850.19625-1-linyunsheng@huawei.com>
In-Reply-To: <20240407130850.19625-1-linyunsheng@huawei.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Sun, 7 Apr 2024 10:02:45 -0700
Message-ID: <CAKgT0Uex+e_g9nyqk6DiB03U4zs_A1z2LoztHnpYbJ9LPm=NFA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 00/12] First try to replace page_frag with page_frag_cache
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_100325_967580_D55FA9B2 
X-CRM114-Status: GOOD (  21.45  )
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

On Sun, Apr 7, 2024 at 6:10=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> After [1], Only there are two implementations for page frag:
>
> 1. mm/page_alloc.c: net stack seems to be using it in the
>    rx part with 'struct page_frag_cache' and the main API
>    being page_frag_alloc_align().
> 2. net/core/sock.c: net stack seems to be using it in the
>    tx part with 'struct page_frag' and the main API being
>    skb_page_frag_refill().
>
> This patchset tries to unfiy the page frag implementation
> by replacing page_frag with page_frag_cache for sk_page_frag()
> first. net_high_order_alloc_disable_key for the implementation
> in net/core/sock.c doesn't seems matter that much now have
> have pcp support for high-order pages in commit 44042b449872
> ("mm/page_alloc: allow high-order pages to be stored on the
> per-cpu lists").
>
> As the related change is mostly related to networking, so
> targeting the net-next. And will try to replace the rest
> of page_frag in the follow patchset.
>
> After this patchset, we are not only able to unify the page
> frag implementation a little, but seems able to have about
> 0.5+% performance boost testing by using the vhost_net_test
> introduced in [1] and page_frag_test.ko introduced in this
> patch.

One question that jumps out at me for this is "why?". No offense but
this is a pretty massive set of changes with over 1400 additions and
500+ deletions and I can't help but ask why, and this cover page
doesn't give me any good reason to think about accepting this set.
What is meant to be the benefit to the community for adding this? All
I am seeing is a ton of extra code to have to review as this
unification is adding an additional 1000+ lines without a good
explanation as to why they are needed.

Also I wouldn't bother mentioning the 0.5+% performance gain as a
"bonus". Changes of that amount usually mean it is within the margin
of error. At best it likely means you haven't introduced a noticeable
regression.

