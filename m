Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED47C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDFb6KeNmasOI1qk97qirsv6TtkzS7nvrtVQovIHZ00=; b=QGKNEVlYfZy0ok+Lbkt1W6dNr5
	H4XlJPSoG22ty1/UfouzmZf7uX6y1Jk+yW3dOdpUOz6jXRJ6/eEsRIZKkI5+O6CFx3SIBmXmDa3EA
	7oySFZIQnAnpT1esKOESJvlKabYWfAhY2x1iUDSFVuDWki+EaIOeeduh4q0F/uIC0mFg5yV94gNt9
	mqPj8jXDd5bN7fCphUdfAs3nCADjQZzSWheLcwwsSOWCr9uADCVlYktElRdaFQx7b+c3wiLF7pcps
	RQy6MFfCeuOmGQS3UYwStCy7Na9ATi6YUWDydElsv0IbuAC0yNI7MbedgJN8MrsA9+INM2eF9KwSv
	DDhoSzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUsy-001pRO-KO; Fri, 24 Feb 2023 10:01:04 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUrj-001ogA-Qd
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:59:49 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id o6so21006607vsq.10
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XDFb6KeNmasOI1qk97qirsv6TtkzS7nvrtVQovIHZ00=;
        b=LSmpN9MlszDsbEDP8QIsbK73FRDgKC/rd7maeEsnoqDytLsGWPmglbaxivl4STVvh0
         SNbZ6mC13X+83SRqHUVG1o/ex6xdorycgF+G3OhN+w+u7i6+gbdHoZRjA5j7Et577BzX
         o2wY77iHLN0epiYsWcUGhdte3amFGW8fhfIYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDFb6KeNmasOI1qk97qirsv6TtkzS7nvrtVQovIHZ00=;
        b=YveGydGmiRc/seZyfkXlYkihegvkycx0UuzzuHRopyMImqWXBzXBa2YtOn3mR3vpfh
         4PpuKPlfSjP+am1SjWIszCvZL1mx59dBKBGyek3K3HbQP8dWAcFDb6HuygpnwIIAF5aQ
         LU/Th2vjtDKqdPFPpwWhFahD8C4FU+7b3rKWy1iZ9xWLcUdLAyKhlVhsFgMor3IFnoUo
         IERx2W+OkBSPG7dZTskpb0XFIdZHzBWN0yraKKkcho6HsUDCUrdlUL73TvygVZyxbmJx
         jyuMQ+9SkcsNR8y+WnYvNUr+taUEn8/OjCZ0i0OiZJ+Ut/b4ZHVybdS0A1JWUx8JPzeW
         EOkA==
X-Gm-Message-State: AO0yUKWy26Of773Q1ks82dxD4+n0rfxsuz+onqhKam93oVP/dfEZjbmQ
	KtDsAB7381G0R/U1Goz6KQFNfEEpViYE62ox1VNJ3A==
X-Google-Smtp-Source: AK7set+aMwFWGjpsMC5b96w+gUlhNcPIgk7qkMUNRC4SeaL5ULZphNqq0SXxZFrs2voH/SGCxlw7aI9cRmd0865OK7k=
X-Received: by 2002:a67:d21c:0:b0:402:999f:51dd with SMTP id
 y28-20020a67d21c000000b00402999f51ddmr2202544vsi.3.1677232786837; Fri, 24 Feb
 2023 01:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-14-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-14-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:59:35 +0800
Message-ID: <CAGXv+5GPki1Oz-yF-kReoTGV9eA2io==rQCR3A2L0R4zzj8Wtw@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] arm64: dts: mediatek: mt8195: Add mfg_core_tmp
 clock to MFG1 domain
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015947_906836_AED8C40A 
X-CRM114-Status: GOOD (  11.72  )
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Similarly to what can be seen in MT8192, on MT8195 the mfg_core_tmp
> clock is a mux used to switch between different "safe" (and slower)
> clock sources for the GPU: this is used during MFGPLL reconfiguration
> and eventually during idling at very low frequencies.
>
> This clock getting turned off means that the GPU will occasionally be
> unclocked, producing obvious consequences such as system crash or
> unpredictable behavior: assigning it to the top level MFG power domain
> will make sure that this stays on at all times during any operation on
> the MFG domain (only GPU-related transactions).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

