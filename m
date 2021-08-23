Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A352C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 06:43:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7638611EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 06:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7638611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOSbf76Cf1DTCoszu9WVF7sJDQXNGcjGmG5wn8pTHxA=; b=0OWg96RFTc1ong
	K93/EPOcdOpsD0Kyao3YNmmIl40VsjZtyqmZBA9ZHmhy8pQ+HxvZOG3BzztHc0p6nRQQMbJQFH2cd
	t4KXDJCvJtGF+rV0rBOpuKIXTTg0H2LmLTF9iP7Ye8QSeLaQo5n4jD0QBAdnA/c8dLZPxKUDn64Ie
	iB7H5DUD19iX+UlSf00WCsTMJzfnjiUHWrZXaihKWWeqGIfn5exWpEd2Pe1vbgPXueC0Wmianz3pa
	W8TWPQfXg603dvlNtHj33vux29S56PE97ZWWNEgYBKQPectHmc7UrJikjBgXDT2wn4tm+41Ee9X+H
	/Opfgb4ABHtCVoXNUGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI3fr-00FXFx-AE; Mon, 23 Aug 2021 06:43:11 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI3fb-00FXCj-7O
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 06:42:59 +0000
Received: by mail-lj1-x229.google.com with SMTP id f2so29602745ljn.1
 for <linux-mediatek@lists.infradead.org>; Sun, 22 Aug 2021 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFJ5qArshzVHf3q7jRlOWQagxpfLOrv79VSjCdNEbCA=;
 b=Zf7g29E3w/mMGEQGTHke0IP1vIqXBP/xGjiHyLab7RfdnbLe9ZNKiyevv6kO2oi89n
 3wsWr3eIiIFkS8ODwd2HPqhiTr/XmNhM2RqeP8M7oo/E8+KI1mkd/dwW5x0YHqVVg7ii
 Gbc8dt9O4AM7OBaotSD53oVjK7yj0Ezk2OaJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFJ5qArshzVHf3q7jRlOWQagxpfLOrv79VSjCdNEbCA=;
 b=fc5ETyFZqnoC+DoXa+sHKL8rNjLhqIQzD1Hw7poaQF0PV1sXRczmvPj598V5tk0e40
 J5C+CgN3RkNhAlv9WJacdVuu/DhEzPMjVEJTQkQaf50cBZrAAeKQMENB2VJwCoWLDPpA
 Cc5Dolh9KlEzuUDQqj3tM85meI6AtrFTBjK/QxUWvmolruuUnqaOAMjKuuY6+n/wcEeE
 HceXCgpOcGB4FmNFngK/NhnhAmN8HO6CpbnyecHBqaaM51fonVKzqlAN46n3gDCRTXbn
 zYgc69DPcW5BHyFXxePWf2lLLi4Slh/scR54aVSZIdTKvWL05Z1jA1OD0c3RRFoPrwv+
 6iBA==
X-Gm-Message-State: AOAM531k/8xDv14VKy7TjxF/PxLb0gt4+8Gb+Z3PUayHb59RhYMUW2vZ
 3YWIVRtjBv9XJXyvLMvXGGmNfmIfzUIB4gobT5QoVw==
X-Google-Smtp-Source: ABdhPJxTuOEDNkFKHBotXobJuIjH4Z7qG0KV3mS8Xf0E+WOygl2HTPZPkLpJ47L2eJAse8NeczQkwyQsSN8xFb81ERI=
X-Received: by 2002:a05:651c:211a:: with SMTP id
 a26mr12902308ljq.305.1629700973307; 
 Sun, 22 Aug 2021 23:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-6-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-6-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 14:42:42 +0800
Message-ID: <CAGXv+5EReMTGS02SgVO_yrpChOiw++3rwfc0Jx66CBzuDHOXAQ@mail.gmail.com>
Subject: Re: [v2 05/24] clk: mediatek: Fix resource leak in
 mtk_clk_simple_probe
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_234255_296032_217EF10D 
X-CRM114-Status: GOOD (  16.64  )
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

On Fri, Aug 20, 2021 at 7:19 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Release clock data when clock driver probe fail to fix
> possible resource leak.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/mediatek/clk-mtk.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index c3d385c0cfcb..74890759e98c 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -314,7 +314,15 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>
>         r = mtk_clk_register_gates(node, mcd->clks, mcd->num_clks, clk_data);

Note for future reference: there is no unregister counterpart for
mtk_clk_register_*.


>         if (r)
> -               return r;
> +               goto free_data;
>
> -       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r)
> +               goto free_data;
> +
> +       return r;
> +
> +free_data:
> +       mtk_free_clk_data(clk_data);
> +       return r;
>  }
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
