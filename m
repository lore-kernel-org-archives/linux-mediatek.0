Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253EFC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:08:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB4D66135F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB4D66135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4eJqAjmfLgGZo4YrRIAy3+io9HbXRglXbP2CjpaE+I=; b=SX1qBJ3fqiW6eX
	Nbhh8LlC0bD3d/ldkTiUi9QtDibYcHfj2ZJgLsF45BdyWcxYunwnz/oU8zdZQ+t2camL5oMxCMmR0
	sHxteS3AyfbLaFPYXiedJzoXvzn18u04kY4kDk/F+1xpzL22mf9HctnKthbibEbPamGNRGzrOJp0W
	r4aQaeKRmadgnayzVA65dGVwDhxwYk3nTbEc7rHh+5qudIxOOzdVM1Q/+hdZYcmcB4e4uNQgMJHow
	E6p/F4iCBRa4xjuLVqVTuNu1HD5TJZeeFn1KotLuG9Jhx/iBf7x2td3F5wPOnbdsBonlsN4br64p5
	9fHb5QZRKq64kEhVV9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI8kj-00Ggce-EI; Mon, 23 Aug 2021 12:08:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI8ke-00GgX3-0r
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:08:32 +0000
Received: by mail-lf1-x136.google.com with SMTP id v19so12205029lfo.7
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 05:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Hsa6LzSuh4SnPB+dspMsqJmQ70/0sIoH9+uWFl96VE=;
 b=cXWu4Tgd2N5ECuiQcdYmburQAuy9zZ8n/4WN+QAAvwWjEseQSvH8EZNRV3xgSm9uGH
 PDCvGppJ0Qe1nyQfHjp2xZ7Q0YhBU+5K57JqS4ASjxPHLSGfM7Jyg6peTKl5cvq5gHbG
 FUBZ5mM2vrd0+AU9BXpvgnJGAaUnZIiy5Idos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Hsa6LzSuh4SnPB+dspMsqJmQ70/0sIoH9+uWFl96VE=;
 b=Jy6Bzq6WGgxO6A677AEehhxOIoWakEXrtKcBtldAPeinCI3w6cGBu1T95+FHuNJr6c
 qkz4V9DQr7mgY6JCZYxnIqiKkfNMmD7dkw3+DifhEvJ3VbrL09b9akYM82wXQeO7VpVn
 gvqKGzxTm4W9qWeGH3/XeHIFJbRuIp6saQbl41rq4owyijh5D3OPxD0ZzzLqX6Q4DLrL
 NWqKzibOL8EPVm6Yp3MommbKgVV+3ThsqKgUPp3dR/Wq9FYb9FU7R7Y/JKwtqTQd7nbR
 8z1H4/XQV3b3PMhR5PHwDlYzjSedPVqSwhdv47ZkZnHRq1m6QnLZZOlBGIwY8xuN9q/5
 xtgw==
X-Gm-Message-State: AOAM530/8yoq1apYXM+TGHTQtMM/c07F8O5d6/9ywYO+Pl0XHDe5t7/r
 +xhj4WTdLG5c6ceMmauqa/B+ZXXC3KjgUrmdVRQniw==
X-Google-Smtp-Source: ABdhPJyzS8m5t0li8KicBhE6A/4pI2DH+LUTJ6HsAjU3uRg8k0SlYkSR0AN/jSdIKZo30cWApO+L9hMdKMOVWdmdslQ=
X-Received: by 2002:a05:6512:456:: with SMTP id
 y22mr24337026lfk.647.1629720496635; 
 Mon, 23 Aug 2021 05:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-16-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-16-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 20:08:05 +0800
Message-ID: <CAGXv+5FcV0NrA+gES78jUSgWDt15q4h66=PkPGGT_85QOVMGqQ@mail.gmail.com>
Subject: Re: [v2 15/24] clk: mediatek: Add MT8195 scp adsp clock support
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
X-CRM114-CacheID: sfid-20210823_050828_138779_57826F5E 
X-CRM114-Status: GOOD (  13.12  )
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

On Fri, Aug 20, 2021 at 7:27 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 scp adsp clock controller which provides clock gate
> control for Audio DSP.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile              |  2 +-
>  drivers/clk/mediatek/clk-mt8195-scp_adsp.c | 47 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-scp_adsp.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 042db433245a..472e5bc40fcb 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -81,6 +81,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
> -                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o
> +                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o

Wrap line, please.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
