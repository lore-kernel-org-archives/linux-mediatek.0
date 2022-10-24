Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EA7C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQO3SP/T7mx2gTBdrb26vhHeh//fHC6TncgJjNKUlYk=; b=D67InKzy3QpElLHOtdKgiMr0ti
	J5Vb7O/GG80NKiEVrWdkYoA0tCIGaWUwOujMZTa4Hg+yKwHKFMjFowTUwf5oL8QqoJB/IzsFyqAQB
	xQG9kHp1wgHzl2Hx2I5FVvP8Z4mcJwP47RfTAADZNowSM0JexN9K8ppt1v7gT0xfuTvQrxQkLmI4n
	JpO6OCRz9TxeSnILredqCogS8GSn4G+UtThk7Rfl3GumFXYcvTtIgl3CD2rb7DbQPbvh6lLl2b97U
	F03nEBfJRFoW5v2rN4Z30qXewaSiVfVSnKxZsQao5I7LnWm1jtGfWEy3gLepPv4GYDseJWo8exoUf
	B7Au6ZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5XN-003BmP-3l; Mon, 24 Oct 2022 22:03:13 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5X7-003Bff-KB
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 22:02:58 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id 189so7953870vsi.9
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 15:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PQO3SP/T7mx2gTBdrb26vhHeh//fHC6TncgJjNKUlYk=;
        b=Z2jdLbMLpmR99cxAypgqWbtshKYj35Ebkj3fTaxTstePFu0H4CEsORE/+N7wFrwEmz
         S/V+Csf+m+CzpG6iUJdChy/UPbuZNn5bkt0lnfgo9MjI+y6nCdCgZI5ZXuAWjBjy2q9L
         C/NwSuG10/nz1AaJX3BLGjYT8/toKDF0M0nco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQO3SP/T7mx2gTBdrb26vhHeh//fHC6TncgJjNKUlYk=;
        b=le8uaxht0LilN8VNE39fXMUAygkLJQBOlbMYgBmUdiPKbxh3SUiP17ocWrEEW8Tnrd
         1dgrVjCR6HqPufAveulRoOmEj8Mleuqfuwd6J4/ukgwaW6aC8FzKZHuOhFLwAC+SRub5
         eO+2y4a6KqkGes0dNZlUBPG0QGG6Bv5dS5R91aZ0R85Q9WcyL95m7Ph3/gwxBU6ch2x3
         7QJs29j5IebieCAPt8m+39jryOf1meuWS5Z6h5sADJmabLsg78c1MkrJBU1Mfa25SAZ8
         rwKR+eacHCkGcEqk/TOTsmO/ZskEwT/s9XlV9U4MUCgchi/hNTHFjaTy2AR1FfKHsYre
         j8Vw==
X-Gm-Message-State: ACrzQf0vhIoDqVf3pE9JWIJ8C+/HbQogOgbDJRh832VsU058aTI65/UW
	2B9FEazRsReml45HrXHyP3C8rkFLeyWaYX4LmbdwDw==
X-Google-Smtp-Source: AMsMyM4Nc2SEf14KxCoAjSdAd9I9wEQsYdGBrpODBvx0PQyqe810u6vS6uHm6Jb+ldd50UX+leY9mLoXV+Dk3qKhG48=
X-Received: by 2002:a67:f684:0:b0:392:ac17:f9b0 with SMTP id
 n4-20020a67f684000000b00392ac17f9b0mr20548005vso.85.1666648974339; Mon, 24
 Oct 2022 15:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 15:02:37 -0700
Message-ID: <CAGXv+5HgWwjNz73wdvQv-9qTiQCvbmE9kMp6ts+DccdBUQZ9HQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] clk: mediatek: mt8183: Compress top_divs array entries
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	miles.chen@mediatek.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, 
	yangyingliang@huawei.com, msp@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_150257_714362_4A1DE74D 
X-CRM114-Status: UNSURE (   7.20  )
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

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> There's no need to split each FACTOR entry in two lines, as each of
> them does fit in one line just fine.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Git word-diff + ignore whitespace showed no code changes, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

