Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA33FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWWZ38xBlh3IVnKVLJVzuuNvI9iBwD+sciZ9Pk3h+ho=; b=X4cOYcSJETtPBkVwuOTHT2dKz9
	M20djvDXBtx1SbMo5ZLPkTTleRxr2y91SqyY5RXkngPbpPM/LMZQEOXIys7L+pNDm163QWHWnav2f
	np0d9lrG/Hhkg6IsZ0Ytq4Khxi/s7zeZktH87b69RoCliIvT98kxY9VFC9jPE9WB/LXJ/Tga4//x+
	1M6XkenAM5AqBT/c3bayGNn8jLV4OllQ251FyvtkOet+Klv63kiiS/mfIAbzY7ZtRyL8jnl/VcdnF
	6VvOldZATRtlRAQBX4+PKGpqfI6/GJTrKym0LChsIp+nCvEmyL/yEabt6XB7OHs8rjqA4eULNLbhK
	AnrXTrMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq3C-000eDj-BQ; Fri, 03 Feb 2023 06:59:58 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq39-000eBk-TV
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 06:59:57 +0000
Received: by mail-vs1-xe36.google.com with SMTP id k6so4448552vsk.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 22:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yWWZ38xBlh3IVnKVLJVzuuNvI9iBwD+sciZ9Pk3h+ho=;
        b=Htk4ARYKUfpuvvqRJ2EeEUMvEHXAwrSb4+aIGuFbpWu72hwBzv7b3TBWYbT2WQhSKd
         P8TqXPmsrih4nuOihR7J87XRnApwAKXOxOqcU7LscwlLkh355223dPFLMU71E6OGPQ8s
         LRpy8cdSz+Ppo9W6DlE9HNaYjnMNkqN82kktU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWWZ38xBlh3IVnKVLJVzuuNvI9iBwD+sciZ9Pk3h+ho=;
        b=k5whQVehvi1GsbDrPLOS7rvxl1zCa/K18jbvCEDkshnKrh2iBThdq6f7ueWgNBhwmC
         lkeUHuTcgzSRdOPpeAcFTlJru5sUHACHUt33sWgRynOsjaSAydnRCC65JCaDtqDyLQfh
         S1swwAoQxNHzV4z41M9/kRmC4m35Lnd3BE7PGsqvUsjJgy1Sii2CB3MhRynIeaJC1+rk
         KpBGcR14RbHIYc6fG3f5AIYfd+GP0w9T/cJb8QZKCsghFoSDgKGAnJnBXWe8ARqGeGyA
         dNGaroVAQTm2kH1EIFgJB6XqQnW4jSx+djW2wQ1BOS0dbdQe3bsIjPrukWFHY0TRKWMH
         FyDA==
X-Gm-Message-State: AO0yUKVHhMDq7DRQb38bKVCWnEBN2tzxS8lYrwI01iVaI9L07k4ss8yv
	PI5KgI5dOvQGv59oGSwG6s/Y4RcE2Yjxc/X8mbqfPQ==
X-Google-Smtp-Source: AK7set/fvJef55OrCmgQPy2cey2QzW2vrXkOL7NADQDH9KEQEyy17KPIvRILeWRl3DyHoXydzUx1IzSjdM17JG3i+Jc=
X-Received: by 2002:a05:6102:23f2:b0:3ed:89c7:4bd2 with SMTP id
 p18-20020a05610223f200b003ed89c74bd2mr1663573vsc.26.1675407595078; Thu, 02
 Feb 2023 22:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-10-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-10-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 14:59:43 +0800
Message-ID: <CAGXv+5Ef_=s8nXQn_rtaSgdx0jroKoaJ7DdxxyumKfT2SaLV0Q@mail.gmail.com>
Subject: Re: [PATCH v5 09/19] clk: mediatek: Add MT8188 ipesys clock support
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_225955_997988_F10F393B 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 19, 2023 at 8:54 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 ipesys clock controller which provides clock gate
> control for Image Process Engine.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

