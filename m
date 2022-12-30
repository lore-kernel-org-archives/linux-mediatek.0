Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F72CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 07:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77WNp07597wRX7W6AdblvnXM0gbT+J8p0UTrY090tdA=; b=XeCqyOIq1DzaE5i6K4o1KALS/j
	JTnuU4plMMxzIHQK4wl5JnyWGWM73kslUn6rG7llHmXFbWDPwMUxTN2oIkw2/QnW6d+fbOoy/yzj7
	vK44+wIIQw4jxZ14Ky00E9hBcCexfEdld6UJB1WxLUcZ5+iwe3PoIg6VxhDSkJE5t0XYwAV3QqmzC
	vgfZXiLDYHi76TL6NwiuXk+GDtalzyOPj5powc96XrC+hpDSJNDkOU0srHJMZMywM/CATDR5iT4OM
	FMtEUTceGIiTDTYWk7aH4POSUlF7CgMoDwU5Fxk4viV9icvK9NaQC5cqMBNnHFyjOYD+9JqWyRzs3
	hF8ZDhrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9d8-006nuF-Be; Fri, 30 Dec 2022 07:16:38 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9cc-006nX8-M6
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 07:16:09 +0000
Received: by mail-vs1-xe29.google.com with SMTP id h27so6831898vsq.3
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 23:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77WNp07597wRX7W6AdblvnXM0gbT+J8p0UTrY090tdA=;
        b=a1TSSDKNx2rDH/1nQRZ3nsQAgU4EnJrb3cB4rL2w3rGVSnCSdJoydjkUEqg0pkKvwP
         BOUabMFAUBOiW2MctJYO0CZSokjrh4wBmMrUCRZZrhQSowF61LYBSO56LqRh0YyBs6Rf
         Z9XIBDkk2XH4TDTWmiHNCLlO8DF5CzCijXb0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77WNp07597wRX7W6AdblvnXM0gbT+J8p0UTrY090tdA=;
        b=LfASQ3yGPwKaFoaodMLWYpIG+XR2JLBICCr+Wn5qkFVzwmsiNIfk9Yemv7nBARrUwG
         KfCd4DdwpstCMBmmSCTUJeL4nJgzYye7Hqnj4UmLSQDgAHQ88+un1M0OJMcuDe0roPMP
         mHwKnXWFrVp7BXPvmrryC1TdCm6HNCOZPSrrXo20mvDyuyDMkHdhElSrTmjLas26AM1A
         LYHGtiBGoWIb9qa4za9K4/D4Du7WVkOWP8aCtuyIAWdasAzvs5dqJY0FWS1LPslu8Gv5
         Keqsbd6gB2EQd4MWmsqHOVWsit3Gky1Z30M0x1xhrpgCgn+8rDV/fd8vHWCrp/tu9EIB
         L+8Q==
X-Gm-Message-State: AFqh2kpx9BU8TOQmCjg3tSk8PlVTGKJU05GkYbUS8iGPy2INPtUb7uCS
	zqDqrJ4VbA4eOKILOy1+9M0gKqpdEzJKoR6bNW10Lw==
X-Google-Smtp-Source: AMrXdXv0ZVlpanVEg2D1eXiIaHSf5I+bsKPIfCgfS93tmGGPyZU7JO/WUQxFmta6DR2aqOTUfYFciBm2MfmiJHbu/kM=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2663570vsv.9.1672384560459; Thu, 29 Dec
 2022 23:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-14-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-14-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 15:15:49 +0800
Message-ID: <CAGXv+5GBREamLPmjURz5Rb+dYe4oKAxw+gKNqeeSBns_h37=Ng@mail.gmail.com>
Subject: Re: [PATCH v2 13/23] clk: mediatek: mt8173: Migrate pericfg/topckgen
 to mtk_clk_simple_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_231606_841456_85F2A995 
X-CRM114-Status: UNSURE (   6.14  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Function mtk_clk_simple_probe() gained the ability to register multiple
> clock types: migrate MT8173's pericfg and topckgen to this common
> probe function to reduce duplication and code size.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

