Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F7BC04A95
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxvp+T0nmPNAS5r7Bc6SkAzZFGyMPUN1eLVnGVUBPPc=; b=GDLu/YpaYnymq2iKj5UHnTVchd
	6VdNsX1oallvokM0gUQpOGMXtBG0Xvq4fBmqHwwCn2JNnxd+QkzgHpwppguYR/sZs9dUyY60ixs0F
	rzF5DyvfhUYZG6iAMZZJTJFZKDLZx87I1WEBv94j4lxNT1ARG4p9XYe4Xu16H6+2QUb3J685ZnEsl
	wgAexgqJIBvM3CQPzG5blrA6jo2qTgq2+RJTRc4aT1F1Y92jDveefk6H2U1FYjfGNVelv6V0yAvOs
	SOGEYWZdmptoUV/Cb4ooObwXlfw54HzAcZsg178VsJZF6Pt0VkWQlSpIpva7tHN1IzYjZeo8C15To
	T3z6Xcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oceig-001LlC-4T; Mon, 26 Sep 2022 03:23:46 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oceie-001LjV-24
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 03:23:45 +0000
Received: by mail-ej1-x62c.google.com with SMTP id y3so11361399ejc.1
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 20:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lxvp+T0nmPNAS5r7Bc6SkAzZFGyMPUN1eLVnGVUBPPc=;
        b=a4B7p662s2cugcXrV/HHOV8DNtByQMTkUBkwzRLjrJ400RI9k5DhbSdm+Y8nvVNGe1
         2GrIMo7f5EMtHnZ8zJ+VxBHnLbFRWe2U8xgptKsM1MnEkOKvXjRwenRDLAezNavD35TP
         4qQawu698yOuRu+1TQMjkGvKS70t8zxTM3a3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lxvp+T0nmPNAS5r7Bc6SkAzZFGyMPUN1eLVnGVUBPPc=;
        b=3+iQrhi6ocXH0GhjWEM8AXDswLZbheLXPm7ucBXCyFE+PKnMaLPSJqyfYs90YTNMs+
         f9B7fBgJTz6FxIjT5KubqqKB5Dusmr0f9doDMnoWvEMUoaXKQDQ5i3xypvi/oS6MdnGd
         dg8ZtmVJHDmpZhjwDZdGHpoxbAu7MrECX2TB5QA2qPBFWk9H8S62eDWKyYnm4VT6pyna
         Fmu0O6Weiqm4bRkOvH915vBK+Rb2pxDPfybWkTURu1RtDJjubFbb0ajVBbElSyjUiXTa
         nczSzER1IXEUPeJj94tjbbQGHFSqYWR38jTq3s4NfFP+KtjhNVEIYrsgzKHoSFQnOX5k
         tGng==
X-Gm-Message-State: ACrzQf2QNjUB4Xw5xB7vyl/INIh11MOUbvFODOLkF/57g3T5U+bVRvqv
	EIGsGYx3WezLctLAu8dbWKmZ4j0iqnEIJJ6mv9kGVQ==
X-Google-Smtp-Source: AMsMyM7614BUgahOMwJWu9MHtouT3NLfNy27XW7Lv6OZVc+xsfxGx4XppqGFaREEVBKwAdnU1WmvNJCHo+/NFhY0zHg=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr16502807ejc.323.1664162622513; Sun, 25
 Sep 2022 20:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com> <20220915072458.18232-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915072458.18232-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 11:23:31 +0800
Message-ID: <CAGXv+5EtRTux22ERqCXTDL-Ooo5qa6u=KWO5=m_s4U3sPoLp3g@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] clk: mediatek: clk-mt8192: Add clock mux
 notifier for mfg_pll_sel
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
X-CRM114-CacheID: sfid-20220925_202344_116775_279787BE 
X-CRM114-Status: UNSURE (   7.98  )
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

On Thu, Sep 15, 2022 at 3:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Following the changes that were done for mt8183, add a clock notifier
> for the GPU PLL selector mux: this allows safe clock rate changes by
> temporarily reparenting the GPU to a safe clock (clk26m) while the
> MFGPLL is reprogrammed and stabilizes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

