Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF5EC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 18:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4F3gMakR5EjuEaFBMZ7D8qgSZpXpMhQV5Lb3h6YkX4=; b=bXJuybNXFY7R4Q2F7mShlZM0kE
	4jyD4TrJcbTToa9dimP6Lttq6SpITw6y2rpMUlAHeMSoYZZCArKZ1aoaEVdVGur1IxWTHygWb5Cwf
	D4ZZ8bNAoTtFsE/nf6IQoB0e1ClVPrEoA2/6UNPzuFkzsfXdUTd9tBAguKIUTiVmpiFPDzxldT27X
	LSkEXAFGPD/qaph2AEzWTiU5k10IZVeZQdhWVVU61vhos8cEseY9ApZKXvkjwWQFaAj2tD41SW2hC
	CXyxeOpZREFnY1G1AVTq2XCN0x+5r3jfE7XCTHOlfzL4G3E6O1essjqkpCD9QGzozaHuYEgPPgYZk
	7lE+aJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGOv5-0044Es-7B; Fri, 13 Jan 2023 18:36:51 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGOuu-0044BM-Co
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 18:36:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so25224176pjj.4
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 10:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j4F3gMakR5EjuEaFBMZ7D8qgSZpXpMhQV5Lb3h6YkX4=;
        b=sqwP3bvcIkIkHlOHuaj7PzhrogErMceNfkIz1l7wmrEJ52RKt1ZoLaNFxbpOSA3UpL
         wq1sh1ojD/X7Iy6a9obxqvPAX82NCW94JSqZoXJ4VPostzzk8OBUzRW2QZCxPsty/wXb
         9IXClLbv/GxUW9SLkr6zfzlHZd7HpiTaZ8Yvy9soWUs1OemOk/v/NO8MYlwrCl9zXF5+
         HCfWR+ud6GaZDcvdGETTwikzINdoumIpGP5pl8ezxXEzc3zwN5BIhZBeMaQiCdi43Xmr
         yAQ8h9uEbmzXOuUyEHA/9lDV/SU+Yesi9ACAmnts4FF2odbDNYPf5Uon+/q/RdhTXpub
         HMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4F3gMakR5EjuEaFBMZ7D8qgSZpXpMhQV5Lb3h6YkX4=;
        b=qGcq3rzXy84W4sL57XstRaux5QmrdjnIsnLwUtskF675REjFjcZzu/vNR8e7DUf3IE
         kO5NvdphoUuJ2Mh+8L4Jnwj0vUtQiPSJ8oOU+6R2+/wkzLXIYaAymTDgSKu8st5KcqSJ
         ukKa3WeKd8yKR1USuoRYS9YTkt5cDpGHxELd7amqGoMbrAhrNnIq2DpmswyUhoCmS2OR
         nzILlgd/cPXiv+ZcCYoB+Z/cQoPHV3Kn2IeX+IWcTwFIm/5VZP51sFnS68XDX/4DTyZ4
         vd0k0OgtrfgLYXQyKQKWrfWbj0xm+iEYzagK62GnJ8bSwXEQDovlvzqPVmC/PXHI8uEQ
         Lwnw==
X-Gm-Message-State: AFqh2krpAak59FknWhhQgt1BzGAJQtDW82oSUnF/WLq88yXVZCjRd2/m
	E8DDeucJARpB4DKjgS3HDwt1/6r3RrfVeUGv+oGFNA==
X-Google-Smtp-Source: AMrXdXut+ZVz9p9DBkW4zfz3GUwV90SnmUswJaW85cGYlU4XXpHCwXHrnm3bYtlfE6P1Eb4qY9jWr4Npr5okcAdcplU=
X-Received: by 2002:a17:90a:488a:b0:226:b5f4:d420 with SMTP id
 b10-20020a17090a488a00b00226b5f4d420mr3958048pjh.102.1673634998456; Fri, 13
 Jan 2023 10:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20230104132646.7100-1-chunfeng.yun@mediatek.com>
In-Reply-To: <20230104132646.7100-1-chunfeng.yun@mediatek.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 13 Jan 2023 10:36:27 -0800
Message-ID: <CAKwvOdnMF4LRhTnQ3Rg+q3hd7jm2tS0aTHmwU6isKJHL2u9Q-g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] phy: mediatek: fix build warning caused by clang
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Eddie Hung <eddie.hung@mediatek.com>, 
	kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_103640_448375_68568D27 
X-CRM114-Status: GOOD (  22.16  )
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

On Wed, Jan 4, 2023 at 5:26 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Remove the temporary @mask_, this may cause build warning when use clang
> compiler for powerpc, but can't reproduce it when compile for arm64.
> the build warning is -Wtautological-constant-out-of-range-compare, and
> caused by
> "BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask)"

Can you please include the text of the observed warning?

>
> After removing @mask_, there is a "CHECK:MACRO_ARG_REUSE" when run
> checkpatch.pl, due to @mask is constant, no reuse problem will happen.
>
> Fixes: 84513eccd678 ("phy: mediatek: fix build warning of FIELD_PREP()")

Uh, why was 84513eccd678 sent/reviewed/merged if it didn't fix the
issue correctly in the first place?

Is the issue perhaps that your mask isn't wide enough in the first
place, and should be?  See:
commit cfd6fb45cfaf ("crypto: ccree - avoid out-of-range warnings from clang")
for inspiration.

> Reported-by: kernel test robot <lkp@intel.com>

Can you please include the Link: tag to the lore URL of the report?

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v6: modify the title
> v5: no changes
> v4 new patch, I'm not sure it can fix build warning, due to I don't cross compile
>     it for powerpc using clang in office.
> ---
>  drivers/phy/mediatek/phy-mtk-io.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/mediatek/phy-mtk-io.h b/drivers/phy/mediatek/phy-mtk-io.h
> index d20ad5e5be81..58f06db822cb 100644
> --- a/drivers/phy/mediatek/phy-mtk-io.h
> +++ b/drivers/phy/mediatek/phy-mtk-io.h
> @@ -39,8 +39,8 @@ static inline void mtk_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
>  /* field @mask shall be constant and continuous */
>  #define mtk_phy_update_field(reg, mask, val) \
>  ({ \
> -       typeof(mask) mask_ = (mask);    \
> -       mtk_phy_update_bits(reg, mask_, FIELD_PREP(mask_, val)); \
> +       BUILD_BUG_ON_MSG(!__builtin_constant_p(mask), "mask is not constant"); \
> +       mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val)); \
>  })
>
>  #endif
> --
> 2.18.0
>


-- 
Thanks,
~Nick Desaulniers

