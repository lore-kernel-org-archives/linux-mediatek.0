Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922D2C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 04:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3lxBXUFe2SO1/WOkyBGclfMOHB8JIgACPICm4umc14=; b=EBR+CQCM+8JWYr
	5Q53e+10KkMCxEibowmkE3oJRPmGG4DLG0HWCL7bxzt063mr9m+pT2aWu4KXN1hawgi8ocNETLVsJ
	4cY3LvzA/QhsABj2VFqFSCp2cV5xGNStLx5Te4/Pp6otu20F8xA/4/1QsUw8n0vgqB9c/ftjDU1vn
	mDs8XS12aHwgAJ4fP3s07pU1WHUSAv3gqX+iFELOXjNpmqdSSqo92mwZUuK0dw4RKPIpC5pRwOPUm
	o5LAK4/stQMitB6y9A62Ojn3oRVOIjsdDOQVaIhBW/dBIUl5esZus19+yUZFSSD+2jnjVkouIpEvn
	b0Z9S84Iw9ibAAUwo25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhkh1-00G0SZ-F7; Fri, 22 Apr 2022 04:14:51 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhkgy-00G0Qm-Oz
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 04:14:50 +0000
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f16645872fso73192757b3.4
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 21:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R7jGqyYJMUVo08fKH+szIIQUXUxBVoUo95cPDD/inJ4=;
 b=I9zUiMzdx0x2AlBPle+xfx0YbHSjxYYQzMOxKnLzS5AN60wHrUGdTUNXRzRKZNWmRB
 9/3o8X4D7FM5xD5BeHyIcf8ZQ9PSZkS6eg6Sku3+6xyQH3NVx54VTYCYGsVZsyq3yAZz
 vrLRrZwZGIuU8vS6PrH96FzJkh+IepxJW45pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R7jGqyYJMUVo08fKH+szIIQUXUxBVoUo95cPDD/inJ4=;
 b=54nBPyATF9tC1GvGZQ6NrrA/cbvJFvclK+XkkZmYjjTou7g055DWSwqldYL7xCqgeL
 FS95wOEio+ZSkB8VO78+og0hqn1Cymfg2GM4yn1gzujM7uFvVpBb6Vy5t/efL+2eACs3
 ArV9lk/Lb6CHMDd+UCmKO4tAqOSaMxtnGLwyLFbJnHAvgKMVwHyVpAskb6iDCmRTbYIp
 QRFP4DHJylyt6g+fof1Hox54OurjgbXami/nzFzh4ezsAjyMrAry9YopQ8n9SAReqtxd
 283RwvMxgJMUG2ec3N9k87I3aaAEl4srGa80jCOAxcncxCSPZ3jEDY/TQqeOMZera6DB
 Kl3g==
X-Gm-Message-State: AOAM5323eWR2KjQGlxB6UPfmqK1wuxEF4JUlLOvEvTRXqMAZOPJyktSS
 kDsmvhL7M2p7DAe7u52YdrdwMranbTOw5nRR3jrGKA==
X-Google-Smtp-Source: ABdhPJzT2Ffgf1KZKr2ZKeMbm0T2FTTmEEP6KdtEZrJKSquU8IPPEsmgOIJHitJbSdrl7JmX2J8oRdgb7gZjDarf8wc=
X-Received: by 2002:a81:ad1f:0:b0:2f4:da5b:5133 with SMTP id
 l31-20020a81ad1f000000b002f4da5b5133mr3074648ywh.105.1650600887150; Thu, 21
 Apr 2022 21:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220419081246.2546159-1-wenst@chromium.org>
 <3591fcc1-d34a-b40a-4e78-edcf9d2ddf08@collabora.com>
 <CAGXv+5HhcQbdGLQFtgPnvzVbSKaQ5GQGvmjwPVOVxjrYnMh1dg@mail.gmail.com>
 <ca8048f4-2e75-a49b-6c54-9f6abba6ead3@collabora.com>
 <CAGXv+5G2Uyq5fdMUnhr5wOm6O8M3dHNKGaSP2L_Vv1o28mXmOQ@mail.gmail.com>
 <20220422014044.16530C385A7@smtp.kernel.org>
In-Reply-To: <20220422014044.16530C385A7@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 22 Apr 2022 12:14:36 +0800
Message-ID: <CAGXv+5HJ2EmxH49L4a3t-gGcQpNLwgi74=uZ1iB1fNzSFz7Gbw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] clk: mediatek: Move to struct clk_hw provider APIs
To: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_211448_892776_54CE3A61 
X-CRM114-Status: GOOD (  25.59  )
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

On Fri, Apr 22, 2022 at 9:40 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Chen-Yu Tsai (2022-04-20 23:05:10)
> >
> > Not exactly. All the clocks in the MTK drivers are allocated at runtime,
> > so we can't use clk_parent_data to point to not-yet-allocated clk_hw-s.
> > Instead we'll need to have
> >
> >     struct mtk_clk_parent_data {
> >         unsigned int clk_id; /* Match CLK_XXX_YYY from dt-binding headers */
> >         ... /* remaining fields same as mtk_clk_parent_data */
> >     };
> >
> > and create the actual clk_parent_data at runtime by looking up clk_id in
> > the set of already registered clks:
> >
> >     int mtk_clk_register_XXX(..., struct mtk_clk_parent_data *pdata,
> >                              struct clk_hw_onecell_data *clk_data) {
> >         struct clk_parent_data data = {
> >             .hw = clk_data[pdata->clk_id],
> >             /* copy other fields verbatim */
> >         };
> >         ...
> >     }
> >
> > Obviously this forces some ordering of how the clks are registered.
> > I believe the order is already correct, and if it isn't, it would be
> > easy to detect, and we can reorder things to fix it.
>
> If this is a common problem, we may need to come up with a generic
> solution that either adds a new clk registration API that fills in the
> clk_parent_data hw pointer or add another member to struct
> clk_parent_data that says "index into this other array of clk_hw
> pointers".

Looking through the large clk drivers, at least Rockchip and MediaTek
drivers would benefit from this. And maybe the Tegra ones as well, though
I'm not familiar with them.

Meson, Qcom, and sunxi-ng all use the static clk_hw scheme, so they're
unaffected.

I can think of a couple ways to tackle this:

A. Add a new data structure as I showed above, and a helper to fill in
   |struct clk_parent_data| from said data structure. This basically moves
   what I planned to do for the MediaTek clk driver to the clk provider
   API. This is the least intrusive option.

B. Add the |clk_id| field to |struct clk_parent_data|, and a |struct clk_hw *|
   field to |struct clk_init_data| for the array. Lookup would be done at
   clk registration time in clk_core_populate_parent_map(). This still
   forces checking of the clk_hw pointer and proper ordering of clk
   registration though. And it also bloats the data structures for folks
   not using the feature.

C. Same as B, but keep the pointer to the array around (in clk_core?), and
   move the lookup into clk_core_fill_parent_index(). This provides similar
   behavior to using global clk name or static |struct clk_hw *| values in
   that clk registration order is not restricted.

All the above options are designed around the desire to be able to make
either the new data structure or |struct clk_parent_data| constant.

Thoughts?


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
