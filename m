Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B19C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BW5cwmKaNCVLs9nRl+n6ibFBEWSsqnffbwe6y2wYCQ=; b=jr6UVit+Sj51FTN/fPOJ25BCED
	UmqGEwLFISPXi8mmFj2937rEoZY7GkSQqxxc4KInmEgaDvPt2qgrO4VLE2nTvnNMhsB+Xt2a+I6Tm
	khIIci9MuTpCBcuzwzeLKA+v9kDtmnUfy1Hqd1zkEO7q7HOicgF5jNNlbq9Xgaa9/VTonX5x1OfuT
	c9rAWYWy6XWxEQxHD4JHmBHaApSG9fqjMFBDm3nVF9zQxlYI3ukp5Fw8JDZ24Frp136i1yCFoaTOl
	RF+XoNgE8vde5eLZVJeyXVnnO173MkcLCIsDxinadive5yoxrGWpm/BuO8OElpfTgPRD7IpLnW2Pm
	HP3vtLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAbh-007E3j-9B; Fri, 30 Dec 2022 08:19:13 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAWZ-007BYF-38
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:13:56 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id x65so7117744vsb.13
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BW5cwmKaNCVLs9nRl+n6ibFBEWSsqnffbwe6y2wYCQ=;
        b=nGPjclbubWrpPTtxt8FKiL1BFgbol42KKil8hX/0VmVLK0i8/1yA/SP4ogoO1eSLpR
         OFPrEwUbyH9DylcRkRPvTa8+iLlXVqsLLYJ2/h0vxjUCsgedaM3/JW8hI8EkozA1MS2O
         UnOJedj+iKcCyGhpeAaF5RccFV3t/B7LWrrAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BW5cwmKaNCVLs9nRl+n6ibFBEWSsqnffbwe6y2wYCQ=;
        b=qtVywW6j4gk8BHXhKyFYW7Z9oAxuqkCnIVwZ6NoWgtOHSOtWVJO3JgRJnstmzLdKIL
         d11PXN2aiX0lengQcWJIz0j6weeoPiOx4CYz5lKeGtVWJbV7FKAnjVLq/8pHbQGlIAox
         lKFMUryl1xaNWDVWte/RKpMrgSZhQllFxCbgxyzQGxg2GBDtGZRLbmJuVUbCu/QdqybK
         1ooEVWZsPvxO+9yf051sXwl0ge4LZSEtqVxItryyD6pX+4Z2RrbrRdA7iPdRjJJZOBKv
         ylpRqwsC6V8x/JuO8/n1DIjK7iMIc+pwQ+Ic3WJ2h1EtWtNTDEqxHqNV8muadJwVZgJN
         yrZA==
X-Gm-Message-State: AFqh2krIdBOf3RQOjshQ2ysA55L5eieIi6OxmFC62DdVtZQctJn6ama0
	7CTRZAlxRzQ+ebRk5UdLZMc7l+3eQr2rD3g3IzcVPw==
X-Google-Smtp-Source: AMrXdXv7CHafuypiXlQL438o48Sf7M0d8IvDMBWqWekllpFk+gsVlFTfotR7uZXiHjjbfDtmSkoKdZZraclEPUo0lLw=
X-Received: by 2002:a05:6102:74b:b0:3ad:3d65:22b with SMTP id
 v11-20020a056102074b00b003ad3d65022bmr4419162vsg.65.1672388034106; Fri, 30
 Dec 2022 00:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-22-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:13:42 +0800
Message-ID: <CAGXv+5Eoiaf7RovpHeizYxpFO-xw2NHneig_CUc4cxL-i7Xhew@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] clk: mediatek: clk-mt6795-topckgen: Migrate to mtk_clk_simple_probe()
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
X-CRM114-CacheID: sfid-20221230_001355_284318_35541139 
X-CRM114-Status: UNSURE (   5.70  )
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
> Migrate away from custom probe functions and use the commonized
> mtk_clk_simple_{probe, remove}().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

