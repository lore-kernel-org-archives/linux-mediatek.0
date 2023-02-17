Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65744C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c30mjTplJEZCVESp0l+woRR+5rw1LWREDQPh7nVR91M=; b=sIitTpr5cOhItseJiETpYMxgM5
	t6jQPGWY6NkdS0MjgtbPllQvrQuuSfHmMGIG+uZI+UY1n7fGGwaT2W6rcMfBhULfVTsoRt0sKnK4h
	0w2HKPrHEHYiIyKEUwRoaNV6+MwNnsNISC8cF8ghbL/gM24KXbk3iWbxJBFVHf8wJQVV2Qbrd84ip
	j7ruGB0CP1blOju10hWFNWg8C5FhNBd7Sqos9BmhmLn8I8zkFpSuXiQ4YY+qNAQkYotThepUw4o7K
	ofefhfQOxyi4SmRuEp2G2+SlNyFLq5HQeySBy7QVy8k4S/WEKh2V8PFP0zCUFMS1Ru1uVRjnCii77
	wz88LE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvKd-00D878-I8; Fri, 17 Feb 2023 07:38:59 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvKa-00D85d-Vs
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 07:38:58 +0000
Received: by mail-vs1-xe30.google.com with SMTP id c22so1850359vsk.12
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 23:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c30mjTplJEZCVESp0l+woRR+5rw1LWREDQPh7nVR91M=;
        b=jgBL5pLOWF0bt/V7p0vyAKPNedZTYjko/ej1YVM8IHMozlVAr/TRUr5SV8h+CDpvIP
         z1mRNrUl7+/DUrmCW5Hnv1bHsuioOdZ+F9451vgyWTCDs/gdjpIm21AVOHs/fMpMu4eB
         QzpPZtnXdVNV4kwv6LGjiV+kExHEcdG+cVU+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c30mjTplJEZCVESp0l+woRR+5rw1LWREDQPh7nVR91M=;
        b=0ccKf4Z76FsyGpu4pYBQtVP2gbdqvq3xS/XJaa9WsQ4IV/nordoB0uWyDjadfP5sKw
         G7nj/fxOXZ+bhjlQkI7qJG2rX6mo88cz0Pe9XB3gjWnQs+mCsCQgNoSbwI2u+ahBkBjk
         XKxc4rImJFY1lOvypVzS8yz7M6fF1rdhXGZM3y0FA0U14TV0vhU5QtFp2Y8LZjDv3Fxm
         uNIyeGfnQXlIgC0l4+NbxmiSgfVicjjGqN25B9rtQhBOqK05eEFYS6hI9ZuNXiuXWEFA
         O9F1h/0lUkTha57i/ZMtejkCtAEU86X87Ilbx/CpIMo5tUiWqFRpeBXGKJQJHo5cgG6k
         zP6w==
X-Gm-Message-State: AO0yUKVz2VwH5qBAHvYs5VWrLuNQpwGiAbtF/I5i0OsEjRc8WjmV1d32
	kxLWgAsTrc8t2wsFQMOr7yz2DV/PVC3FsxGdkIRC9g==
X-Google-Smtp-Source: AK7set+a/WKTyAayUh0Dmoeuwng+9YTTbcpU0sI9/QmluIB8LgvKUXYa8Ks+i/UTyvD+529Nrl36N5JZ+oj2i66+wKk=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1604164vso.60.1676619535343; Thu, 16 Feb
 2023 23:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-45-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-45-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 15:38:44 +0800
Message-ID: <CAGXv+5EPU+SGhWmRCiZUNGR=JNBX71dybEq8FEZ-+CCrkHBaUA@mail.gmail.com>
Subject: Re: [PATCH v2 44/47] clk: mediatek: Split configuration options for
 MT8186 clock drivers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_233857_048470_D1EAE183 
X-CRM114-Status: GOOD (  18.52  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> When building clock drivers for MT8186, some may want to build in only
> some of them to, for example, get CPUFreq up faster, and some may want
> to leave out some clock drivers entirely as a machine may not need the
> Warp Engine or the camera ISP (hence, their clock drivers).
>
> Split the various clock drivers in their own configuration options,
> keeping MT8186 configuration options consistent with other MediaTek
> SoCs.
>
> While at it, also allow building the remaining clock drivers as modules
> by switching COMMON_CLK_MT8186 to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig  | 68 ++++++++++++++++++++++++++++++++++-
>  drivers/clk/mediatek/Makefile | 18 +++++++---
>  2 files changed, 80 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 1497171a65ef..706a7cf86ce0 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -596,7 +596,7 @@ config COMMON_CLK_MT8183_VENCSYS
>           This driver supports MediaTek MT8183 vencsys clocks.
>
>  config COMMON_CLK_MT8186
> -       bool "Clock driver for MediaTek MT8186"
> +       tristate "Clock driver for MediaTek MT8186"
>         depends on ARM64 || COMPILE_TEST
>         select COMMON_CLK_MEDIATEK
>         select COMMON_CLK_MEDIATEK_FHCTL
> @@ -604,6 +604,72 @@ config COMMON_CLK_MT8186
>         help
>           This driver supports MediaTek MT8186 clocks.
>
> +config COMMON_CLK_MT8186_CAMSYS
> +       tristate "Clock driver for MediaTek MT8186 camsys"
> +       depends on COMMON_CLK_MT8186
> +       help
> +         This driver supports MediaTek MT8186 camsys and camsys_raw clocks.
> +
> +config COMMON_CLK_MT8186_IMGSYS
> +       tristate "Clock driver for MediaTek MT8186 imgsys"
> +       depends on COMMON_CLK_MT8186
> +       help
> +         This driver supports MediaTek MT8186 imgsys and imgsys2 clocks.
> +
> +config COMMON_CLK_MT8186_IMP_IIC_WRAP
> +       tristate "Clock driver for MediaTek MT8186 imp_iic_wrap"
> +       depends on COMMON_CLK_MT8186
> +       help
> +         This driver supports MediaTek MT8186 imp_iic_wrap clocks.
> +
> +config COMMON_CLK_MT8186_IPESYS
> +       tristate "Clock driver for MediaTek MT8186 ipesys"
> +       depends on COMMON_CLK_MT8186_IMGSYS

Same comments as MT8195 about the ordering and mentioning dependency
reasoning in the commit log.

ChenYu

