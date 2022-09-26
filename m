Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED9EC6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 03:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpGdo8YLUfNpiiMkdCAL0BS/gMc39qYGqutpqRvM6uA=; b=4f5PNKK0AHb3+QnwDkTIymRAIq
	Mkoz0AILPLikCAg2zNsWqLcvqx9rq4BNjkWWETRTY1rqW8BkcWNH6FZTkTPMN6TuiaDkAP7HlNKw+
	ikeGhriQ7sOE0V+wND97HC2LwIPsTEAgTx/cK+mG8aVO9VE6xQVX9R37WprJo6Av5o5A+bXYcbALE
	oFjONF1RIP06j8UpxmOI14BnFmfdA32VXURhA11wb4DLOBnUXXoyufEB3d1yfYbecSkHAHPLABWUY
	KRklroQMzTUxenaPi97Maa2T0N00UsTAZF9V7mYpgDLNU2yean7eQODshcnsC+7ud2EuPH2Kaq3sW
	TSbqO9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocegy-001Kya-Mm; Mon, 26 Sep 2022 03:22:00 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocegi-001KrV-SL
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 03:21:47 +0000
Received: by mail-ed1-x52d.google.com with SMTP id y8so7218197edc.10
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 20:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TpGdo8YLUfNpiiMkdCAL0BS/gMc39qYGqutpqRvM6uA=;
        b=Ku8e7ipZ1GekiwnoQDVJ3JkQHOLopeFbo0m2ZjlMYrBgdr/57uoj/gCpcGHRIPCzJ+
         I017V06R+QTg7hXPVKORFufeGSAZ+o2rfQGTJ6UF/t5M4bIK/MTlpZxKzi6jdLUMhece
         fYeIccxUh1xMFNl7f0a0VO1snFrDsPeXF2IDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TpGdo8YLUfNpiiMkdCAL0BS/gMc39qYGqutpqRvM6uA=;
        b=AR2Ja2pMFvbAhtgjY4H60V/CfcR2pZCXXXfK4YZ60YiG+nBRaI0wxsQ2qu6dRCj6eG
         aHqpxy8sb1o9vqVkSBdjznEHWt3l0L5YrYICIPCSnxCQE+J0ri0KJ9FadV59ouWtzp8m
         BCsRErC33rXY8MiiCpUbpYjJe8sStRe60EgRUH0/8BJu6PCXlTYYWBFJQYyKPX39NvMT
         DaC/ZUZh2SuxYs511J0oZQOxnPBeqJyo91/cEdPoy0R3GknxZxD3J6vJynPVJEPNnlNB
         L2BL8UlEREaCWRjkXRrei6E1ua53Zl5znijaAk5Jg7Q/j/mZyS+rnslPg1hcKhwqW9Fu
         f8iA==
X-Gm-Message-State: ACrzQf3dpwHYDh8jh3FeRkmfi9BEr1D/A5DtkK1eYKV6hWYeVmwcXgXJ
	jU8ENF0wxnWrex8Myct+9qdLKViIxV5Ka4dZ4RI8Tg==
X-Google-Smtp-Source: AMsMyM5F/Nr1OJV4THk4uYdtJRJ5YC5eyeGm4PFFJUX0ij7oRsxjU9zl5jw8kxgXdLqGd/jHjKoh6ehL9NNL1savbbI=
X-Received: by 2002:aa7:db12:0:b0:457:2973:7e24 with SMTP id
 t18-20020aa7db12000000b0045729737e24mr5740524eds.264.1664162501979; Sun, 25
 Sep 2022 20:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com> <20220915072458.18232-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915072458.18232-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 11:21:29 +0800
Message-ID: <CAGXv+5Efk=EDUp=TBLe-5vQSSsv_YvG2cSmK0pRwLO58tah1PQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] clk: mediatek: clk-mt8195-topckgen: Drop
 univplls from mfg mux parents
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	miles.chen@mediatek.com, rex-bc.chen@mediatek.com, nfraprado@collabora.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, drinkcat@chromium.org, 
	weiyi.lu@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_202144_922935_2D8AAF12 
X-CRM114-Status: GOOD (  10.13  )
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

On Thu, Sep 15, 2022 at 3:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> These PLLs are conflicting with GPU rates that can be generated by
> the GPU-dedicated MFGPLL and would require a special clock handler
> to be used, for very little and ignorable power consumption benefits.
> Also, we're in any case unable to set the rate of these PLLs to
> something else that is sensible for this task, so simply drop them:
> this will make the GPU to be clocked exclusively from MFGPLL for
> "fast" rates, while still achieving the right "safe" rate during
> PLL frequency locking.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

