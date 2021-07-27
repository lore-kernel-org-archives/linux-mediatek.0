Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BF1C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:27:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A9860FEE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56A9860FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82xi4BzdEZ+XhlkT3KT5gVgY3DkkrRbz07C9VmHHOU8=; b=Tp72ZiP4A77gvR
	jwjkcLfmYnIhW3vbkrOiZSFpLe+pcJ32U+GuBFAmBWbNBomddbWB7/YodIhNadGID6ZlpgoD8H7lc
	6UlNtlly1C24POyNpxOC14vUdLlMUD8MoRzzflxs6+e7iay7zzMiA4RnEWrAW42b66OPEtFvd+Cvd
	2GMTuZJxgJsrUhuwv1JxwN7U88haWxFFx4iy2oCuKq6qtt9bDDMzk1SHd/oZC5iPXqGmLYwUOV3OB
	0Y7vFozt2Wgagmwr9VwV5iviwbT26sSR0U6xaZiMG1p4QR9Zc+cf7yyVnrl2NitSRPPyGHE8HASLu
	ggnw+vqYLhGnwG4cAVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Egm-00D9mk-V7; Tue, 27 Jul 2021 04:27:33 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8EgX-00D9h0-Fh
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:27:19 +0000
Received: by mail-pl1-x62e.google.com with SMTP id e21so9843780pla.5
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sdwvl61i5SSr72A1wNEXSigDuGMlyueFRl9jC5UcLTM=;
 b=fiCAH13QQvfQEiBIFIxPs62RPX5gqegSZMdKrGdTslIr/gcABKuuikkT5JCWwZp+T9
 KqYRzosKgBxoJp3aXqSuElWpqpOERGxmphtHmJGaWky9MseC/DxrXFMEh7vO78ST2GCd
 PbbpBGktrk1CecGCiigahfhpWmPaNeHoWiiRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sdwvl61i5SSr72A1wNEXSigDuGMlyueFRl9jC5UcLTM=;
 b=aV9v9EX41KUKFiSTW3NYQqmKAsyuhw2fkJ+hJpbruRz5APLq2Qf3RqeHFEOe/TbyGb
 feNRdCN8GttcvIq3dDUx2XrmkOsPej++Tr4YiJLSxur4cjun3xxS+S2b7r2xJUlCG00H
 pT0pR+yvVOu1FbVYrvlzMrn5znHko2zHiyZYot/zZNLXQDU49T1pCcbOFTNcKKelOjEw
 rSxPNoz7h7ieuxSkjB9Mo8HyQtSSAgZ7XZbYTXF1PwGCTNV1qlyecKQSpy6MIawW1cJS
 o6Ct2WhZHDRw7A0AL3h9lyAnl07aJM5BQc3qVxj0OSfihYCELRghGWKOipbzIYfBsmzr
 dGxg==
X-Gm-Message-State: AOAM533/cd148kJGGBUH8JkL6KiVZh7Yh8+mL4QgEvWMjsp1pMk5Sdji
 q8AjJPDad0nMk6CMyaVlniMOJj/rZuMrX6g49GqcLg==
X-Google-Smtp-Source: ABdhPJyqsyW0xGABCf/mom9fkaS3LgNNSRqGblYnv/wzrO7YNfrjvXDqeqf1bKoDmJ00ZYmCj0KiIsXT33Vxw0gtfUo=
X-Received: by 2002:a63:8f04:: with SMTP id n4mr21040588pgd.317.1627360035875; 
 Mon, 26 Jul 2021 21:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210706061920.16013-1-chun-jie.chen@mediatek.com>
 <20210706061920.16013-6-chun-jie.chen@mediatek.com>
In-Reply-To: <20210706061920.16013-6-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:27:05 +0800
Message-ID: <CAATdQgB5XoO_oEW-CQC1JsFGPJj+PL_K9myvnhDo5H1NxEpF8A@mail.gmail.com>
Subject: Re: [v13 05/21] clk: mediatek: Get regmap without syscon compatible
 check
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_212717_548010_4AD194BE 
X-CRM114-Status: GOOD (  17.05  )
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

On Tue, Jul 6, 2021 at 2:28 PM Chun-Jie Chen <chun-jie.chen@mediatek.com> wrote:
>
> Not all clock providers need to be marked compatible with "syscon"
> for system configuration usage, so use device_node_to_regmap() to
> skip "syscon" check.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/clk/mediatek/clk-cpumux.c | 2 +-
>  drivers/clk/mediatek/clk-mtk.c    | 2 +-
>  drivers/clk/mediatek/clk-mux.c    | 2 +-
>  drivers/clk/mediatek/reset.c      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
> index 79fe09028742..61eeae4e60fb 100644
> --- a/drivers/clk/mediatek/clk-cpumux.c
> +++ b/drivers/clk/mediatek/clk-cpumux.c
> @@ -84,7 +84,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
>         struct clk *clk;
>         struct regmap *regmap;
>
> -       regmap = syscon_node_to_regmap(node);
> +       regmap = device_node_to_regmap(node);
>         if (IS_ERR(regmap)) {
>                 pr_err("Cannot find regmap for %pOF: %ld\n", node,
>                        PTR_ERR(regmap));
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index cec1c8a27211..37d2aa32175e 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -106,7 +106,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
>         if (!clk_data)
>                 return -ENOMEM;
>
> -       regmap = syscon_node_to_regmap(node);
> +       regmap = device_node_to_regmap(node);
>         if (IS_ERR(regmap)) {
>                 pr_err("Cannot find regmap for %pOF: %ld\n", node,
>                                 PTR_ERR(regmap));
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> index b0c61709bacc..e97d58db28cc 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -165,7 +165,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>         struct clk *clk;
>         int i;
>
> -       regmap = syscon_node_to_regmap(node);
> +       regmap = device_node_to_regmap(node);
>         if (IS_ERR(regmap)) {
>                 pr_err("Cannot find regmap for %pOF: %ld\n", node,
>                        PTR_ERR(regmap));
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index cb939c071b0c..e562dc3c10a4 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -98,7 +98,7 @@ static void mtk_register_reset_controller_common(struct device_node *np,
>         int ret;
>         struct regmap *regmap;
>
> -       regmap = syscon_node_to_regmap(np);
> +       regmap = device_node_to_regmap(np);
>         if (IS_ERR(regmap)) {
>                 pr_err("Cannot find regmap for %pOF: %ld\n", np,
>                                 PTR_ERR(regmap));
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
