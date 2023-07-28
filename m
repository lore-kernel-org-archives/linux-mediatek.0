Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA72EC001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRiix5Wbu8cUEwewXZbHXypVIH/8I/HGpsd1Ld0zKcA=; b=euC8l6YWP+mug9MywiB7nqji5k
	+Eo8i5WKXn2gsjnbbV+6yf6s42UjwVkTzfdX/OITjYDM3T/RP3eavBk3/GvAQEnNUaKJ+q92OAGhe
	jo1B2rKOKtiSrn007+rWeQBwrhqVf1vAENIaPNS6nVZu3b+Fz5FH6bzmxN7xrMHXBZ6w3frMX48Ul
	0/k8g3U6Q9mT5h2OB3FID9Ob+5d5baB5NeV+J6dYShC6bnDRlpreIfB2YxtqOF5ELIt0rMYYdOez6
	YnFuwMpuGjmJd8bNSlCVkTsc1Cvi6UFPQRofzPKqqrIf/3V+KlVZfo81/s9uaVW6Hz0BNp5iYkfno
	oaH6A1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN5F-003TaZ-2P;
	Fri, 28 Jul 2023 13:00:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN5D-003TXv-0k
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:00:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-316feb137a7so2168814f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549234; x=1691154034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRiix5Wbu8cUEwewXZbHXypVIH/8I/HGpsd1Ld0zKcA=;
        b=uHTsjZTdPbQOhN2xXT6vdB0e9iO2q8OEekgi3R6Xo0vBRxfuKAXOdM3HXC2odGRF6g
         5kH+wW4g1ClRUuR8clAablsRloAM2bbpa9geV5YCXqHdwwC5Ukq2oCs2TF+/zkAT/QQr
         TzlOqqsX4DFI+O0mCYWL76K/Km7TOj96/J4JfrcaOHHN6C+pjBhJxtT90ZZILcP1gsyt
         5eZHOG+BeJxR8jz9RpVGayWNNxlXU1KpLdNIoM4/nIdlSX73xh3G4E54Q6n4dQKRnh/P
         Rciqu/UaxuYOfL4tfruaUs+27zxYNsTJfKLEhmWxYGce3PoXcwg4MWJ+v9E1kj/ak/RP
         K1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549234; x=1691154034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRiix5Wbu8cUEwewXZbHXypVIH/8I/HGpsd1Ld0zKcA=;
        b=cvzERavOnoVcRsjiQ0XtvGeL3bVp5Sv6Gq4h6jtrQcm9XBhmNsfVq6HN5TzOFuxMob
         tksSyd4bzGq98Bg5F/viEt12FjbsrtEkIwgselUqqi5ecgVD/sb81IFfol+w98jPx8zs
         4QbuWTZ0TiEwdBPfvKxuWPMOiJrJX++4EUsVFu7yEiHDkxMCQDUkFUH0YgM+ubTEOdcz
         2Higm6dxDDR5Y2alIeWcMoNsq8z25i6pt6qvWKKH/XCBEMLgeXnT0aTHHmpiI3fzWUCE
         JNloSo17vQzJL1NhM/UakKj1vyUjZpdc0tssy5SLbfkbSetdyBHyGLwfNMB0IjH0Le1d
         JBuA==
X-Gm-Message-State: ABy/qLYy0SPcHLChUTvgjNVOPERXcQjvBl+8YJJXbf5TWNBTTB+eTZZI
	gL+qLVyv9b0tgTnoleRw7X11dQ==
X-Google-Smtp-Source: APBJJlGf644aS69IfHiGjdU78DPSh3l7c3O8DBAe3QaqLPykUWVJ56ZWmKuFuzDN/9JXfQ8Mwtgj9A==
X-Received: by 2002:adf:f009:0:b0:306:2e62:8d2e with SMTP id j9-20020adff009000000b003062e628d2emr2022404wro.1.1690549233876;
        Fri, 28 Jul 2023 06:00:33 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600012d200b0031753073abcsm4756456wrx.36.2023.07.28.06.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:00:33 -0700 (PDT)
Message-ID: <550b9775-e11a-7481-4b4a-0f4512d3bd26@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 03/11] drm/mediatek: gamma: Support SoC specific
 LUT size
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com, ehristev@collabora.com,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060039_268982_81F8BA88 
X-CRM114-Status: UNSURE (   5.78  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> Newer SoCs support a bigger Gamma LUT table: wire up a callback
> to retrieve the correct LUT size for each different Gamma IP.

-- 
Regards,
Alexandre

