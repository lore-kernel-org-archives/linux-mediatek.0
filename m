Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2C4C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdjlbixNksyWUmSwVA0oszzukvQJyBdRdSXeK1Q7UgM=; b=AQc82821owfY4FAwuoRtSVsOEX
	/qtIzPknQumXRZo3tnogghA9LJLXUjNXcXnWOA58zikEYdGbtEXqpEqs1z9jKbxtqwwwqk8sVxnX7
	epNg+8H4Jm82u+O9nis0Qq2sFEB+3btD0a2KGd/t3M9HxefeUTeUXKtfKk3rnt2JgzZOnJQjuzGIZ
	tnStoY/zQDIuzjje4I9s5bGCPVLib34Bz/BoWEj0fDQ8hRBrxmDG53drbneaW+7X+Vxl9YjN2GLjj
	xpT+E4CltfCQ/2O4qsA4Y9aL+9HcMtQvg55M11fgRoHD6DNpiAznan1KcCH5WujTBh+ruUJDhbIKl
	3H/evKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouZcG-001GZy-8t; Mon, 14 Nov 2022 13:35:12 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouZQb-001BGh-Ju
	for linux-mediatek@lists.infradead.org; Mon, 14 Nov 2022 13:23:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id z18so17249252edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 05:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdjlbixNksyWUmSwVA0oszzukvQJyBdRdSXeK1Q7UgM=;
        b=Voqp3oaFTueqHJ5jpTyX8MHk0ZEQn9jwK4nyyO0uhP+iTVeqdQKo/TXXxQmvVEBdPs
         Sw+iGKIUvtqYYOgR8ZFhVsWwU9c9UGAn2jVLOADgMynXMR9S8b55F+Hkl9Ak5nDgDDQb
         hJH08eEp53gOqcf5QzZ4w3yVVyoXcmy20HWIx+cpcyirc0MmNzXD0yYHFTR9kmEwebUR
         OSI6EFp7MGMenJBOhgzAZ5DaRe1oI04e5wFHP3YWiQHPQCoQ7aIyiBmnPK3Btvjos1Bf
         uKXhcGKHVb8TZSBpaqBIKbV9T7qsGpFfQneHeBnmnRoyFVs273eVwMDtRCpo2P8pQLpu
         frfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdjlbixNksyWUmSwVA0oszzukvQJyBdRdSXeK1Q7UgM=;
        b=wsQTscnuf08wKbtCA7eQyPccNUga27TqQ3OBnEUOevBPgD3CR4b0e0qxT8IWeR8cGp
         g8fgYEmJcVT48ljN4O3pO7YGGO/ZQGcbARNQpeddJ8xPFKeyG5Ht2NqPZQ8BYWRFE4YO
         W/71BJxrZlAg39CXEoSopsm8RhqmEwU9XKmiyoJtFsxU04KH0dxNpGcrlKWzc0eJlR/m
         7/Ed36Q1fI1Q9QUV6axTp+PaWcJwxaxiioq1WxC15FJtl0UoN0+MrJydSN9tJcC/1KMQ
         +Tdv7krxHFAHmdGpaG9LArezZd6o2V47Qf3qdlE4XOECj/hMvCX9HB3x5CA8MsePc7DK
         wIEw==
X-Gm-Message-State: ANoB5pk+DeEBazPuU5flMdSl/IhZyaB5tweW9WGVhPVx3kcKYTSVyuUy
	hzyaUK2VM/kNKsFs2xJ5DREQpjmvBqqANDiJKpBC7Q==
X-Google-Smtp-Source: AA0mqf6K9UdLNkuoM1yV47dlYKLSc/9xdfJA+YA8IMuwuRw1bt7cE7J5tOY7mfFjmQ/o8fEmPNLBHZ7WiHiycebyGkQ=
X-Received: by 2002:a05:6402:2931:b0:463:ce05:c00e with SMTP id
 ee49-20020a056402293100b00463ce05c00emr11088202edb.46.1668432185632; Mon, 14
 Nov 2022 05:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20221111094106.18486-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221111094106.18486-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Nov 2022 14:22:54 +0100
Message-ID: <CACRpkdZ_FYHBn+d9Q4w3U4=CzCaC0U81n3kJeCDKwKtSi9+RPQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix EINT pins input debounce time configuration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, nfraprado@collabora.com, 
	marijn.suijten@somainline.org, jami.kettunen@somainline.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_052309_703790_88B7C47B 
X-CRM114-Status: GOOD (  14.61  )
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

On Fri, Nov 11, 2022 at 10:41 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> The External Interrupt Controller (EINTC) on all of the supported
> MediaTek SoCs does support input debouncing, but not all of them
> index the debounce time values (DBNC_SETTING registers) the same way.
>
> Before this change, in some cases, as an example, requesting a debounce
> time of 16 milliseconds would mistakenly set the relative DBNC_SETTING
> register to 0x2, resulting in a way shorter debounce time of 500uS.
>
> To fix the aforementioned issue, define three different debounce_time
> arrays, reflecting the correct register index for each value and for
> each register index variant, and make sure that each SoC pinctrl
> driver uses the right one.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied for v6.1 fixes.

> I know, this commit is a good candidate to get a Fixes tag, but I
> couldn't find a way to actually do that cleanly...

I don't super much care. If you need this backported to stable,
suggest it to linux-stable once it hits Torvalds' tree.

> The only way would be to split this in one commit for each pinctrl
> driver, but that would result in a series containing 21 commits, of
> which 20 are one-liners... and that didn't look right.

Ugh no this is way better.

Thanks for fixing this!

Yours,
Linus Walleij

