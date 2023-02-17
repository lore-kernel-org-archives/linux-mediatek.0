Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D33C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 08:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeRQ8wllN3fSx/sorPDxTIgU0OrrDmKry0tPIXvN7Uk=; b=o24oHzycpOhKMkr1J97fEqlB3o
	e2o0eCr4AlShQZZ1pQCV/pS9cIMXr2qmTMaurBt+g34EP+QWksMxIWosisVMVCjC8RLfpBEjMYgy+
	M256lvQIPLqIsV75VZjmi62YanI60EGSnG1ijSfuFsgTijb9nMsgVHI722VAffRROEEZvaj1N/uDl
	r15f30xWzbrpOe95htA0rSswq4LqWmuWJ4YEIQXRNSILVZbm1rnxuCBVqLZxv8/pwRQemt7SPEAwk
	f8H0Oi1k/W5XMx4SKR/8v3oy/Sgz9BajwxQtJsTh7yzhqlG6mOXLqZMH7pSZoTKmwlqfvziX8JKu8
	I2/m/DBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvk4-00DDXj-RV; Fri, 17 Feb 2023 08:05:16 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvk1-00DDTO-1H
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 08:05:14 +0000
Received: by mail-vs1-xe30.google.com with SMTP id m1so4752043vst.7
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Feb 2023 00:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EeRQ8wllN3fSx/sorPDxTIgU0OrrDmKry0tPIXvN7Uk=;
        b=SnTHTOgJjuXl8DOkKBIpg88cQ+grTfSC8WmJOR4VpW4Q4UtYnR05e7F3+32Ch13Uxv
         pw7SfZOUbscY1uo2Mq5a9ug9N+Tb0zEuKAfeENogGYaRyjKbezhY46uEGoFxvljZEL6p
         pLaHHrTQyFU3eZPP2pA8tIceWodcSWC+0K/ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeRQ8wllN3fSx/sorPDxTIgU0OrrDmKry0tPIXvN7Uk=;
        b=iKZzYcff7uwdXBbQpG+V2k/1rzcerfXsxwxm+Nu8+vOS1/bX4UYyW+IKywbRTDiJUF
         WyqOrCi3UmcQ79TN62Z+tGHhm4k9IbcCq2HsL1cCJ77RBRceFApYzYAYxTDUwYd++8e0
         vp5c0hvj+5nY8Vy+t4K4y7ybidv0B8/1/RkYSsxYK2w6gxfMBU3EbkYfAI87RXzbHVw8
         z24NZSbUs1ABfKrfV1Eo4DLCEeT6SyppaJetRePzReWUG1GKVuoiLSiPTNzuM+R8GE/p
         LpBvBtExyyfZCZA9EhpvMqM/CZfXtO6eMUTR/CdMHc8KGrhL+zGjiDgtYu4kiFdSUdmz
         fJRw==
X-Gm-Message-State: AO0yUKW7p/PnOk3zL8CFbPpn38LNtjidTdb+WZkz4XDOx0tWnAK/Qrrf
	eqWcCYYysM4O2bhnBjhlcNqtsX/fxDInQwNWVgAujQ==
X-Google-Smtp-Source: AK7set9pEGiUlwznvRLCIKFI6anMPSKgYHXbx2RNDKwGHP2jw9728TFy/wcMO/sbgddWinMcfY44dyhrBL5zpZwByuc=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1615594vso.60.1676621111880; Fri, 17 Feb
 2023 00:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 16:05:00 +0800
Message-ID: <CAGXv+5HrP2TCacuOBcF3OG-22pAuukhtTHUoA+D2zY6wNfoYAA@mail.gmail.com>
Subject: Re: [PATCH v2 00/47] MediaTek clocks: full module build and cleanups
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
X-CRM114-CacheID: sfid-20230217_000513_115994_2F9BB337 
X-CRM114-Status: GOOD (  13.18  )
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

On Tue, Feb 14, 2023 at 9:41 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v2:
>  - Fixed issues on MT8183 (thanks Chen-Yu!)
>  - Changed builtin_platform_driver() -> module_platform_driver() for
>    MT8167 vdecsys clocks (as that was a mistake!)
>  - Some patches were split, some others were reordered
>  - Summarized: applied changes from Chen-Yu's review
>
> This is part 2 of the "MediaTek clocks cleanups and improvements" series,
> which was already picked.
>
> If reading this full cover letter is too boring for you, here's a short
> summary of the changes of this series:
>  - Added mtk_clk_pdev_probe() for mtk-mmsys probed clocks;
>  - Added divider clock support to common probe mechanism;
>  - Various cleanups here and there;
>  - Converted most clock drivers to platform_driver;
>  - MediaTek clocks can now be built as modules.
>
> NOTE: Applies on top of [1] and [2].

I think I covered all the patches. Was there any particular reason for
skipping clk-mt8135.c for the conversions?

Thanks
ChenYu

