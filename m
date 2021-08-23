Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBB7C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 11:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19D9F6138E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 11:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19D9F6138E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBrsT7qxLgTLdplnA19CHRN01CfGdfsdUpWirzv7mjQ=; b=NnXauA7z/t5wgO
	FWFftMihS3b7m70L9adn2Y7q6ZDK6s8eOCylYZYpOvae7Ep29yP27pKjKFnYThmBQPeSTPL1M+/yi
	AA+5RNHKJCN4Yv6eq2yBPlrbPaBo+cyFoVY1Mef0dqBFNYzHOcVr9+U4dV7EjVO76Qu04o67a8gmr
	0XEFJFb46ardPSk+0II1ZqCzqSsioyVxkTFqbTIOVOptAdtBOIu/831O9uscshCr6WGOlSnkAo7QS
	REyrKRWsFbRNkJ7QI44rvMOZD6so78a9S21IGMSF+UbVjQ5ZC7XipQfOcNXthLz48I2Ujk/dz1lRZ
	623caU9fJv2KdeaqlWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI82c-00GYV6-0F; Mon, 23 Aug 2021 11:22:58 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI82W-00GYSE-Jz
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 11:22:56 +0000
Received: by mail-lf1-x12c.google.com with SMTP id p38so37300321lfa.0
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELGM60ioRNSpEBzYZwyHjOCmGIGPOYG6GuLk6IRUkX8=;
 b=Zltmc5NLRVbIQ8NyRHU2exemKEv33SP1S6SB4IcnWOtnDM5jBR+Kaq6FJ37spEGpU4
 9xILArIF32MOXrRQA6vRU4rd+wWWbkLgyQbBgKSAImUFGA3B3/zXzkBY3uncPeM8kSFB
 FzQk8innsUI2hULjvtCr50zg667kzG2noY9gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELGM60ioRNSpEBzYZwyHjOCmGIGPOYG6GuLk6IRUkX8=;
 b=Uh2vVeptKVMre0QUdkLSfFYicfq9wB8KB+UUwBVXQkbwB8fdjUmum8Mz41gwXEBkX5
 pPJfhBjtvXTNzXkzNH3PLK6eiQCwkbHm3yEmfSRTCty4/TbhDNofdz75+f2WIT2ddX2f
 9k2toLDLoggLKq+KelkJh12Ul90TqsNCZrw3Vcqiv5CgzmGPlIoWNcZPrNxjWp4MiVb8
 RApluWWSPe459sF8uGaUzqvTA+JIDvoV2PAvD/tn5fF4k9Vp1MJ86C9RHThb1k3g7BMg
 wvSeGPu3LMA+nPsO3iv6+YBB3lDKn9PUEAjZDkB2HW96s80yvgeKBrQpKFA4MWPJZHOX
 5oNw==
X-Gm-Message-State: AOAM532s2ZxE7C5krXGC1It8WilE0BALDPB1CUztY/f1A8pOfeYZqlk2
 9Kjz0MWHoeDtjaYcHQj+lYE7GIs3jkMwBip5U6J6jA==
X-Google-Smtp-Source: ABdhPJwP9D31B1uYiBuq2tMnF2HScsZGxvRJlqQkq5AEq3DdOVXuXbdYvtGrLT0w0XdcfiX69R1/S0lj0GEqrYmeyrU=
X-Received: by 2002:a19:ca09:: with SMTP id a9mr9039073lfg.342.1629717770496; 
 Mon, 23 Aug 2021 04:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-9-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-9-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 19:22:39 +0800
Message-ID: <CAGXv+5GqELj5QEx7bCvyMkKdjG5jOFziefA4pHZGqiZgHR58BQ@mail.gmail.com>
Subject: Re: [v2 08/24] clk: mediatek: Add MT8195 peripheral clock support
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
X-CRM114-CacheID: sfid-20210823_042252_696743_1D244E41 
X-CRM114-Status: GOOD (  13.53  )
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

On Fri, Aug 20, 2021 at 7:20 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 peripheral clock controller which provides clock
> gate control for ethernet/flashif/pcie/ssusb.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile             |  2 +-
>  drivers/clk/mediatek/clk-mt8195-peri_ao.c | 62 +++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-peri_ao.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index a142342a0cea..d5ee396dcded 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -80,6 +80,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
> -obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o
> +obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o

This line is getting too long. Please wrap it to within 100 characters.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
