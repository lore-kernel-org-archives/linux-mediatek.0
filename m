Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4441BC07E9E
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 06:29:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB21B61407
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 06:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB21B61407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RItMupMkcFRLEhNsQkUKwMDGoel1VGV3WIboLNzhQPY=; b=lGS7mbKjHLD1AJ
	rirrWDtqnMSYURcmmgQNEnQixlZq4Mw1RP8jNabom1LSWdsrgz5jljZP5GO5ji8S+xVal9uZfOmwo
	9aHiAOSkzAYHBTGVVAqYYEd7W+gyD8Vm7AXMyUgBIuk/JOKJHUFbKkFViS3pntFzleNSE8pvg+qbx
	wef1i5HCSbeNkmhvGFLQlngWWsHIlwFMyXLkA1MSxlGLS26m6oaHaHyn4k+CgCWGeprdufaSCxwnY
	0ai0rawcWnuCWrS60y1oML9jIKMOBG5NmO+kE8lxh1xgyVxQ8sh0Lcy3cr+zYBIpM/JKkjKLHx0Gq
	2Ofhyk5GQeZ+OA1SXGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1k19-000sYH-Sj; Fri, 09 Jul 2021 06:29:43 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1k15-000sXF-RD
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 06:29:41 +0000
Received: by mail-lj1-x231.google.com with SMTP id 11so2306488ljv.1
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 23:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rx0EbhWByOl6cO2pdh8SAXgIpsICZIPHug/dkp8j8A=;
 b=K65KQSyKS71qo3hjtjQy+Y3yBhrGXDAuaTt6jzAsnooUZXo2J8oG0tpn5NA01Vm2rK
 OSs3VphgbYYpymPYEoYMQfNT4+zKaiJSHeGAga2GHPIfhVEIr14FvLQ471ZZm19q2emT
 whq33uc06EG8sPFqkVKmJgjrar1rTea9O7Kzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rx0EbhWByOl6cO2pdh8SAXgIpsICZIPHug/dkp8j8A=;
 b=dxCztSqUml0cyMbVZODygsdkHOrokUzo9e5R4K/Ucgrq11H8MYm9bF6n2cV3FOU4OZ
 eTTMXllSuYd21t6F2t4c1ltMa1FBvlK5hsKrAtI6iaOay8gidj5dY61RHCzUTgwp3Sor
 IPSJGq2zCKlyqlg8Oq3Z1W/QWqpskMWnATsk8hxJBewg3MDsOIMYFY6pu3H/quzu6Ec3
 lIuK2qeHnmeXzqzNUUeI/dznX5bP1eCFoKolBptHlbouFZuIrZc2C31SkG8+TfZ5dCyr
 0RQFsgp04nABy8lWogwefTY+yTX42FU1NAqpMYaE8PJWVdeFB+gS+zbgYj6+t183MVvz
 nj5w==
X-Gm-Message-State: AOAM531arXAivRKoDlVjL9HErv63MsrW5Fku1dticViy9EubF3fRA64l
 gmqVMCzB+XDND2ov3JQmbNgOFo6+sRn+AS44ZYVuBA==
X-Google-Smtp-Source: ABdhPJw6yDemUk5wkz0plF6I4pQaqZpW7hTyE9DIQd88yVnnamwNZrem1BKYanDJeNzgbs5JjEnnE681wN8bzDJ+uwo=
X-Received: by 2002:a05:651c:2115:: with SMTP id
 a21mr27409410ljq.185.1625812176116; 
 Thu, 08 Jul 2021 23:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-12-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-12-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 9 Jul 2021 14:29:24 +0800
Message-ID: <CAGXv+5GOK=iVxxEj84tnxH=UgLfh1kKNZcVxzM7DkFP=XjodFQ@mail.gmail.com>
Subject: Re: [PATCH 11/22] clk: mediatek: Add MT8195 mfgcfg clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_232939_951003_6DC2C451 
X-CRM114-Status: GOOD (  16.88  )
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

On Thu, Jun 17, 2021 at 7:08 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 mfgcfg clock provider

Same thing about the commit log. More context please.

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig          |  6 ++++
>  drivers/clk/mediatek/Makefile         |  1 +
>  drivers/clk/mediatek/clk-mt8195-mfg.c | 49 +++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-mfg.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index ef7d4b433eee..066c14a89cee 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -624,6 +624,12 @@ config COMMON_CLK_MT8195_IPESYS
>         help
>           This driver supports MediaTek MT8195 ipesys clocks.
>
> +config COMMON_CLK_MT8195_MFGCFG
> +       bool "Clock driver for MediaTek MT8195 mfgcfg"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 mfgcfg clocks.
> +

Same thing about the Kconfig option. I don't think it's necessary to have
separate Kconfig options for clock controllers within the same SoC.

>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 991a9be7ac46..9b09e7f640d1 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -87,5 +87,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_CAMSYS) += clk-mt8195-cam.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_CCUSYS) += clk-mt8195-ccu.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_IMGSYS) += clk-mt8195-img.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_IPESYS) += clk-mt8195-ipe.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_MFGCFG) += clk-mt8195-mfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c b/drivers/clk/mediatek/clk-mt8195-mfg.c
> new file mode 100644
> index 000000000000..a9b1d337cd01
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-mfg.c

Code looks good.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
