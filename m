Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A98C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 04:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhAKrmQp6NenQK/43QV2TtSlhGhnzTUy2QkTNo482HQ=; b=EZPaHMCxkcofM+
	A/40JFPprhP1gEEVSIcEaBOfIMT5pLlxg6nicnZILtA/IMREWZda+ION86xiUNZ/IcakzY393xswT
	EvprgtL2k3dpuEJvZ0DEew49LzD84Kf16Tn1Ud4nFAnjw53rlyTzqqSLN5bMf6NyKfcYH0WYAgWjI
	XN2r0COe3C7xFWNYqEyROD95qSjwuG3aV0oVvPQXqR9MBv5JjY/oCPntDRKi24y5pWzpJFYRnQU59
	Vdux8MAUtqadqwCedcU6tkAFWlHdJAS7bhraIshr2QM+o1I2ri2zK2D9KlK2d/Uha5f1AQ4uBB3cu
	RKW1SsVwpMQZ4NhGN2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrud3-00AVWD-7f; Fri, 20 May 2022 04:52:45 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrud0-00AVU7-K1
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 04:52:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id i27so13454243ejd.9
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 21:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXQ11dkGIoE0lV36QZDgqg8uCYyptybDNTq4ktZBTbs=;
 b=Gn7sIKywSM62dUwnlqYPfjztZlNBpnEvxn/LPGPAND/LIIcY7GDg8EgQIw+Zh3y/U1
 h9lNgaIg/X2sWmLtWsZCJ6kKKaAQiFpLbw531WuTGezENUeCvmgZzu1lNfBWdlyCnfL+
 Uo716ZjvlyclNOH5OVjrtuSR2M+RHKhbiqW+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXQ11dkGIoE0lV36QZDgqg8uCYyptybDNTq4ktZBTbs=;
 b=xEqS9HTsbcWfvZUR/yD6Dn7v6PM07YwskNXBB8DSj6tD6Fv4Rm8eREO+X2VIQqyQjT
 Xb6mQ9Gkj8T+3UlxqpxiKtr1wYxoBQ5FP7AL+1xToiGz7CvMLgLRU3iEFjqVmoIe2WCa
 nzbDEY6EHne0UFlBOmyfzOWO0qhovksv6f668hBHGLDMZZ4ORnMlNb6I2kFARUvhAtLA
 hmvGEOXJVK9kgVppdWxXKdJt1cf0JlGQvEFcSYjwBgn0ImjpQFgS29IUoPZNzMIv6Edr
 a4G2MkztcMpQCSRjrwlp9oLHRNIrsetsP5WF+G03P6/nLU5NqopuM/wkUKFVp6bVxU67
 D04w==
X-Gm-Message-State: AOAM531fGzOKzFZwsIf/E8owF75pwebqk3qqL+Q/KLVffM/0lU/UrMIF
 LmhYNGj/jYH/D9u2kQPUwfFfXbyHBsWDd37sWVGdiw==
X-Google-Smtp-Source: ABdhPJw9Y9lBj9Z5FwDbfz0z2g17IMdLUZaYayEtlHgFK/MU4JnEW8hdabOOpLZh98m29bEIpS/fA3W+v5e7mgJb+sk=
X-Received: by 2002:a17:907:3f8e:b0:6f4:4723:4185 with SMTP id
 hr14-20020a1709073f8e00b006f447234185mr7108632ejc.359.1653022356766; Thu, 19
 May 2022 21:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
 <20220519134728.456643-3-y.oudjana@protonmail.com>
 <CAGXv+5GnjY1DOWHx-B4PZqNi5tnWOgYQ_TCk6YzhtEnPQnVVnA@mail.gmail.com>
In-Reply-To: <CAGXv+5GnjY1DOWHx-B4PZqNi5tnWOgYQ_TCk6YzhtEnPQnVVnA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 May 2022 12:52:25 +0800
Message-ID: <CAGXv+5FO+wZyyORV36+OmRn62M9zxfmB5WaTCkSgWJ6k9=572Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: mediatek: Use mtk_clk_register_gates_with_dev in
 simple probe
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Miles Chen <miles.chen@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_215242_696838_B1A340EE 
X-CRM114-Status: GOOD (  10.90  )
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

On Fri, May 20, 2022 at 12:49 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, May 19, 2022 at 9:49 PM Yassine Oudjana
> <yassine.oudjana@gmail.com> wrote:
> >
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > Register gates with dev in mtk_clk_simple_probe.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Side note: one day I would like to rename all the common functions so
that the follow the style of the CCF. One example would be

  - mtk_XXX_register() takes |struct device *|
  - of_mtk_XXX_register() takes |struct device_node *|

I don't know if I'll ever get to it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
