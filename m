Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C3BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6UZKlIWa79mHvlwGbxRRi4mKD6ADaytb2sskGTD4GM=; b=TBvvzxrm7cBHCj
	4RmifuUgPlQHM7RVtvO4gfFccWhdIk9kCK7FR+TaWyaydoHzIb6peyui7JM2fqBQPQaB6OFUuNr9o
	FNkBIo90GDE8E6i5t1RKjpOucsUxFnx9TYJI+VkT+dIm6UK0N6rnhPgYlF1GjTZP1TIC1cG9deJdC
	HbOiFu779QZqESn80W6TsFKnQcmFT8f3cQfWJ/eOzS5P6KbiLJhH1COpIhL3dzXq488gklskKQ72o
	EmFmCDoxutFgwSczcEWPU0GK0uB/yAnzAe+yFaS8drkrtePK+JEIxN7jkV2T+f0GkYMtrK/Tnu+83
	t7O/FKt3/U7Rrmg0JkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRudZ-008KAJ-9z; Wed, 09 Mar 2022 11:37:49 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRudW-008K8i-3F; Wed, 09 Mar 2022 11:37:47 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id w16so3648815ybi.12;
 Wed, 09 Mar 2022 03:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bxMvV+bx53OR04oEq6pVUj4tVj0Qc+qef7HYHf0+lCY=;
 b=MpQcKjC96J8iGl5tiHhFdFEEF1giiA3PnHgy7qsCGXBK6EfdTQe0ej5hBu5efwnGbt
 H/74iMTDr6D84nZDQXfWjHbypl1JDDeCLYGl9qYvUT+dEsxZk+u13iDnMd7eo8i2I4sG
 DZL7hFGqUbF887LgcrNOUgyBqmekpkChPfaRloPnhQoUBGrtF4jHB5JU8+7NUzbLnkxM
 f7UmfZe7x9/0AiJnXRH0ygM5lfobAAv5qiqrxA3XHIPmj2JjbO97+OprYBJWQfocaPjl
 zg0mVUOvgy3E8Q7DQKukDhggIXsX77d01b2cPdfi6mkXxJ8fjdE8AEQYUkVg3HA9CLpi
 WPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxMvV+bx53OR04oEq6pVUj4tVj0Qc+qef7HYHf0+lCY=;
 b=XIiJyl6yHHgGQRW2nkuR4GAFGnJ3wYBYTyP2mOMt3Zm765o/oit43pGaoWJqxQm6v8
 fkVxcRCzwMh2QhHiZS1AcjiXiERKJwTrVC2Qbq/TJKs6Fw5AmPE7dbHpeNbBF3EkEOXl
 27MAGs81jKoiNKWrkWyER2hguV1NvwctHJjJJWFMxFO+zz1YliwAvCs+D/uS/x+ULxQ7
 VrMN6XvFN3ab2yk3tQVUv0E2QZO0roeIYliezYMk8h4oudFy8oq8T+OwMjuVpJLQr298
 jteqV/UchjbEvDww6ca+csMBpjYs4S6ny9ksSb+7Cvvz1PshuyabEGiYwDAlRW+vCe5N
 DBOQ==
X-Gm-Message-State: AOAM531ClYxiut5I+c2bPWDmcS8MR7dAw5NayP4Is5J6aNhMTbb+JlZj
 8T+ZXYbNdA+2GG2hQ3mKKbbzu3H5bX8zF+1OZHc=
X-Google-Smtp-Source: ABdhPJyjT1XMmvGArHs0YWAEfrQifrydGlHqwcYTqh/8PFo9WPq1chBNi+TetzxTe4byJoKtP2kE1FgvoHk4cWaMduI=
X-Received: by 2002:a25:6b4c:0:b0:628:757c:a379 with SMTP id
 o12-20020a256b4c000000b00628757ca379mr15983075ybm.645.1646825864230; Wed, 09
 Mar 2022 03:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20220104163519.21929-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220104163519.21929-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 9 Mar 2022 11:37:18 +0000
Message-ID: <CA+V-a8sRizPbhG1qrFy1SLhWWuL2AM4ZM68y_jb4cg0_G5VPUA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dmaengine: Use platform_get_irq*() variants to
 fetch IRQ's
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 LAK <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_033746_165239_0476515B 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Sean/Vinod,

Not sure how I missed you to add in the To/CC list.

On Tue, Jan 4, 2022 at 4:35 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series aims to drop using platform_get_resource() for IRQ types
> in preparation for removal of static setup of IRQ resource from DT core
> code.
>
> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (3):
>   dmaengine: nbpfaxi: Use platform_get_irq_optional() to get the
>     interrupt
>   dmaengine: mediatek: mtk-hsdma: Use platform_get_irq() to get the
>     interrupt
>   dmaengine: mediatek-cqdma: Use platform_get_irq() to get the interrupt
>
>  drivers/dma/mediatek/mtk-cqdma.c | 12 ++++--------
>  drivers/dma/mediatek/mtk-hsdma.c | 11 ++++-------
>  drivers/dma/nbpfaxi.c            | 14 ++++++--------
>  3 files changed, 14 insertions(+), 23 deletions(-)
>
These patches aren't in -next yet. Do you want me to resend them?

Cheers,
Prabhakar

> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
