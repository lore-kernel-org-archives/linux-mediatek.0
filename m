Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC71C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 04:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKd+KibcA7wD8ErQ8sO7ehtOzCO6uw/Hd3dxETjovTU=; b=poIDSGBoVfz+GLv7heNYA8AeZy
	VOWIMWl5z+UFgX67PUVWruhbjBOVVQNjPO/HNj4fGunomuj9ZWxx9R7tl4VNGSgwJnE4r1kKg5xx9
	/X3ohDI7eKlCfYBYteZUXzvu6mSBTKu0YVu6sLsPTdZEyC0YgLesVlM8bSH9CWDr6Xf3ooq8JSpD+
	rGCJ/9rJ1UJyCA/YGxPUzTJ2ZIXIIivGE/buikPE8gDgBGCSy4cAA5YOMQCSffB+PlmyqkV0TBuT0
	aF2SzVndMFhS6cnD9649LtMbdR583HzHQ+oFC97+mDx74yU+88t5UQ//t0Sz7iPtrk2l4g3aNIf+l
	+pYS7HgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocg0b-001koT-La; Mon, 26 Sep 2022 04:46:21 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocg0L-001kdW-GB
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 04:46:07 +0000
Received: by mail-ed1-x52d.google.com with SMTP id y8so7352166edc.10
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 21:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GKd+KibcA7wD8ErQ8sO7ehtOzCO6uw/Hd3dxETjovTU=;
        b=MisSV+HRw/LJWZJcvdnRBsPW9i+WLR4S1mM7YIkWHfEv15TthAYsnjbrw6YLWbO9na
         X6lDHFY4Dj+sfKrfioRsI+OIXJ56vWLuiClvMpNnNSVmZk9Tvk8udewqTVwN9vTZUrlq
         bsiuLN15l2QYRQwh+Q5BkU/k+1YD/kk7F3/KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GKd+KibcA7wD8ErQ8sO7ehtOzCO6uw/Hd3dxETjovTU=;
        b=5gdusaBhSd6oaxQLVUSASbXmRP4L14U2zCdqN0y6GhxUSOS+MreTyMHeHRj7KvBoVE
         rqhcqGTj2DI7lkyrVnLflVjzYpTAfWAQUnyAYRg6oJGcKYlBfAC3i0nePDxYu34xhsxM
         op+QPVP+tcdZSaxROglz7nWkJzYmCOcQiLm86UdqOufo/rODVjAP9QJYufyuN+Zo8ZTK
         9Y+h5xjUn4kWF58Fcx0AROCgEvGn8L9Rh3mpMRvQN3dTTgWt+b5CPaQmO4UiMFh5RPCX
         5NC7iKtEzbl2xjBGaOQfbbr3m/C3Plx2uD2ViRedvRdCPlRYjk/qY5NafWykNhkcQV5m
         9cnA==
X-Gm-Message-State: ACrzQf2GWyIOLI+731kKNy+fyBOBY1WZ5Y9Jjl7OimMI53OSfiRISGTr
	qGBMVfCL+YWfeGomueNA6q6hfid/82E+jwHVHzE5WQ==
X-Google-Smtp-Source: AMsMyM74bWt/B81kSLAhztgFdynh6LDkbwyJGa1xI5v9ufRmkfPJAR5bmcGaTQGc7Yq0TXJgiLXm1wIg2wUX5kApuSg=
X-Received: by 2002:a05:6402:280f:b0:44e:ee5c:da6b with SMTP id
 h15-20020a056402280f00b0044eee5cda6bmr20473424ede.256.1664167561950; Sun, 25
 Sep 2022 21:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220922091841.4099-1-miles.chen@mediatek.com>
In-Reply-To: <20220922091841.4099-1-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 12:45:50 +0800
Message-ID: <CAGXv+5HT4w+y8ntSgBdpYPc4M5=erQNxYOc3-jGFNrZ+HJTA=Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] clk: mediatek: use mtk_clk_simple_probe to simplify
To: Miles Chen <miles.chen@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_214605_564948_5A5F1CBF 
X-CRM114-Status: GOOD (  20.66  )
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

On Thu, Sep 22, 2022 at 5:19 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> Hi everyone,
>
> This is v3 patches to use mtk_clk_simple_probe to simplify driver. It is almost
> a RESEND patch, the only difference is adding reviewed-by tags and a tested-by tag
> to the commit messages.
>
> I tested the series on MT8192 and MT6779.
> This patch is based on next-20220921 and [1].
>
> Change since v1:
> - Angelo's patch [1] already exported mtk_clk_simple_probe and mtk_clk_simple_remove,
> so drop this part from my v1 and depends on [1].
> - add a reviewed-by tag
>
> Change since v2:
> - add reviewed-by tags and a tested-by tag
>
> mtk_clk_simple_probe() was introduced by Chun-Jie in commit
> c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to simplify clock providers")
> and mtk_clk_simple_remove() was added in commit
> commit 2204d96b1919 ("clk: mediatek: Add mtk_clk_simple_remove()")
>
> With mtk_clk_simple_probe and mtk_clk_simple_remove,
> we can get rid of defining the same probe function in clk drivers.
> mtk_clk_simple_probe and mtk_clk_simple_remove are used in new platforms
> now, let's apply them to old SoCs.
>
> The process is quite straightforward:
> a. Look up probe functions which can be replaced by mtk_clk_simple_probe()
> b. Add mtk_clk_desc and add .data
> c. Replace the probe function with mtk_clk_simple_probe and mtk_clk_simple_remove
>
> Thanks,
> Miles
>
> [1] https://lore.kernel.org/lkml/20220921091455.41327-1-angelogioacchino.delregno@collabora.com/
>
>
>
> Miles Chen (7):
>   clk: mediatek: mt2701: use mtk_clk_simple_probe to simplify driver
>   clk: mediatek: mt2712: use mtk_clk_simple_probe to simplify driver
>   clk: mediatek: mt6765: use mtk_clk_simple_probe to simplify driver
>   clk: mediatek: mt6779: use mtk_clk_simple_probe to simplify driver
>   clk: mediatek: mt6797: use mtk_clk_simple_probe to simplify driver
>   clk: mediatek: mt8183: use mtk_clk_simple_probe to simplify driver
>   clk: mediatek: mt8192: add mtk_clk_simple_remove

I've queued this series up here [1] and will send a pull request to
the clock maintainer later this week.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1

