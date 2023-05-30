Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04161C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Dej/FFOhlE209KZmIstjtLDQxOMnp2DLbpIJPYah0A=; b=IyfJDSpuO0utoLpcOcl8YaFP/T
	j52/EaObZmBCihaS0H2wc9kyueh5q3lPpkX8gRz6LzSyv2UXDUdgJRJg5GalkvDGnM0jjxNhszSsO
	GMEsv1PApYyG3xMcT8noturmFpw/yhXHbutej5+b2s18G+7+cMja/1KxNRg6oWcBUQ/SUaMdWez4r
	QUXuzmMoiS6ZZ0mRkcfjwh51RZHo5XuO6qhtnR30R5cJRCLGqmlxZ8HG4wQZcpT0pW6XcLNrEmkWh
	19MUgMO6Utzfn3d/CJcrsUktbvRwAguurgOQBEwcXDjwHZAgQcF5HwQuORCIv98smFqAzSHq3gp2C
	6XznEXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uY0-00CtXw-06;
	Tue, 30 May 2023 08:17:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXu-00CtS9-0F
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 08:17:35 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-974265a1a40so47698766b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 01:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685434648; x=1688026648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Dej/FFOhlE209KZmIstjtLDQxOMnp2DLbpIJPYah0A=;
        b=rEufenXkmE+fxdBlKUC1YtyC9X07+Ci2rPmXRsV3WUV9jRjRbQuIrPDnNZvxSM2mxf
         X3RNTWjoWWpRxl8BL/JW5dYXMmPsneBLDl1Dmc6BP2bPa1lDf2bE33qwb4Prv3FsTbML
         /71z6JhU30309RGtVFkstiUwREa1kJ5ofNQ6vN5Dlh/dhVBM23xvaiD/ufCjCYPAjBF3
         XI4+MVi9AXdyxrFKwYuvqgdQ96YEo1lXf5Xs7b+rTjAiHGiy8iOscayzY2bWxOH5iwrW
         pLzGv8SgZ58jXBhoR0tSMtOHn3g+APVxq/t6A9dCV+PFv/YPhbCNsejnl+LzPM1udCKI
         1dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685434648; x=1688026648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dej/FFOhlE209KZmIstjtLDQxOMnp2DLbpIJPYah0A=;
        b=TAaFz4nfjoyGzm0WO2sygk0wVUnUoGN2vScjnRQLOWtWPvHniPeGhgUrj+U5L+Eptr
         Lv+Va6MlceZnfAP5bnIoMUJeaZKsIiQvfNkHoZSb9v4WEUrJKgNl2vYMN3IpVP4zgm0J
         DAg+cpl50BFCIhTSSWzzbsjSKjprgyxV97fAuYEJ27IwI0Y5SSB0LNr6kbu6PDuCK7QF
         iFoa49pCbxMnAM3fz9FoQAleskW9B1d8K63qNsAKUeBfJe4xXrnIN3JrvG6qCMvjUpsJ
         LkRLb3jZRCJXhA1yhSSeqFda3YZVPo11q5zSAW2I/SbkwcWhVxIAbYH089TkK+JW5PD0
         X2tw==
X-Gm-Message-State: AC+VfDy4mtADTsccl/4/hzWvszUqoggi6P/i2pjo+OMQbHqTaKY91WSI
	BHs1mF7IWKhzddXg2ZKDlYE6ng==
X-Google-Smtp-Source: ACHHUZ4yZU/IUfHWVCAaHSvVKWusYU73uAxcR1RUnuf/v1Ip6xt3HYUd1Y/9cpLkPOB1X4DLiH0K1A==
X-Received: by 2002:a17:907:784:b0:96f:a412:8b03 with SMTP id xd4-20020a170907078400b0096fa4128b03mr1486035ejb.5.1685434648674;
        Tue, 30 May 2023 01:17:28 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:802c:bc2b:8db8:9210:41eb])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906494700b0095807ab4b57sm7116229ejt.178.2023.05.30.01.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 01:17:28 -0700 (PDT)
Date: Tue, 30 May 2023 10:17:27 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] clk: mediatek: mt8365: Fix index issue
Message-ID: <20230530081727.br3fm6zombgipjer@blmsp>
References: <20230517-fix-clk-index-v3-1-be4df46065c4@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517-fix-clk-index-v3-1-be4df46065c4@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_011734_112792_70A59BC9 
X-CRM114-Status: GOOD (  18.72  )
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

On Fri, May 26, 2023 at 03:10:43PM +0200, Alexandre Mergnat wrote:
> Before the patch [1], the clock probe was done directly in the
> clk-mt8365 driver. In this probe function, the array which stores the
> data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
> the clock lists [2]. Currently, with the patch [1], the specific
> clk-mt8365 probe function is replaced by the mtk generic one [3], which
> size the clock data array by adding all the clock descriptor array size
> provided by the clk-mt8365 driver.
> 
> Actually, all clock indexes come from the header file [2], that mean, if
> there are more clock (then more index) in the header file [2] than the
> number of clock declared in the clock descriptor arrays (which is the
> case currently), the clock data array will be undersized and then the
> generic probe function will overflow when it will try to write in
> "clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
> function returns an error in the log which looks like:
> "of_clk_hw_onecell_get: invalid index 135", then this clock isn't
> enabled.
> 
> Solve this issue by adding in the driver the missing clocks declared in
> the header clock file [2].
> 
> [1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
>      mtk_clk_simple_{probe,remove}()")
> [2]: include/dt-bindings/clock/mediatek,mt8365-clk.h
> [3]: drivers/clk/mediatek/clk-mtk.c
> 
> Fixes: ffe91cb28f6a ("clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()")
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Tested-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus

