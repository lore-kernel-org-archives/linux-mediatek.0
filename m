Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0777C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovjF9LP8AGSgXaaf5365MzNw6zGtX3G+dhQI2d2MZj0=; b=Xa+we7HEQPG3lcj5OFYVfc7GMY
	LRiL47WvbmptNbSc+TcVPdCILhVzruMTdIel/SW2TB5aLzlXnjUrq/mvtcW+Exr6gUr0zPjLozNtO
	hsEyyiLA05tXSrXdpsGQCdummyrTVx0dql+M/huYsqmy+jhG8oCbSeLp5FjdqsYD/6wqH4dSQjhwE
	1nu0YYjv1NBovQWDMPEwRrHp9kTeN3yNnlpR702h/pSDm0Bae8yXrWKOPobdRKuAnt4m3nD64xunU
	TQFTKw5/Mh2+GkQAdHz0gDFGSlMynmfXKaz/j8nlgwaraDN+UR7cosPQrnrx/D7ZvdCyRDTvfSd6N
	ovefGuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAao-007DeV-TW; Fri, 30 Dec 2022 08:18:19 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAVd-007B9X-Do
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:13:00 +0000
Received: by mail-vs1-xe34.google.com with SMTP id k4so16538002vsc.4
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ovjF9LP8AGSgXaaf5365MzNw6zGtX3G+dhQI2d2MZj0=;
        b=aMTf6useIPW5ahkjqv6bsmW6ZzSOKFmJYGo1CjnRcdKkeryXRbZbItOjrvSg14iDos
         9TEuP+z48lFXwYWYeXsvOUAl4v5p8GORFfq/vefBEXkVLm8yssJ2zXlS6SnDnXUFX+Re
         oU77MB/+WyaZj7GOn7rFf7dg0x0Mu7uOV/+QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovjF9LP8AGSgXaaf5365MzNw6zGtX3G+dhQI2d2MZj0=;
        b=w6fcNL+GMOo+3v1hm2xPWOzjIlyB/gGsKTMT66HgBIpetkVdqWkplAcObQUsyid/L8
         YQMcM4UlTcr5RuP/RzZgn8zfq8PtvDhTctn6bjZFPdOMdBvZHCRLDLCixI9aDYHqguMs
         z84RLZ0FvT5EiqAXvqB1oIwpYHuNWZDvH8Gt1ymUw+U+tJD5O/tGAyIz+4m2xD/zjSZC
         8jifhuvH/K2PTdB7Zo8iwd/243CNyzmhL7rykhkuuXogiQVX9nXqKzQX2+QJsv8Eu3Ce
         eNIifFt0LA9AM4ka1xZiKVLvtPNu11qsKPysuwEU6B48dE8ITzVwRmupXzIar7ICO4f/
         lGig==
X-Gm-Message-State: AFqh2krL7zNJXdFEd1IcE1+r1dvUoNnUWiH3oHNAUPDZKYMCC06CcNYG
	U1XZWTYGtrg2Q9OnUQvnnf0wnSEVcItRIhXQUfAunA==
X-Google-Smtp-Source: AMrXdXvj4BRr4R5dsv0zqB2v+B0EHWVqgAJmDHpFhhUkVRCeouysE+BnS2J/faKZK+rkLbAqbDs51urSHbAva+OZeOQ=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2676056vsv.9.1672387975420; Fri, 30 Dec
 2022 00:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-19-angelogioacchino.delregno@collabora.com> <20221229082103.21064-1-miles.chen@mediatek.com>
In-Reply-To: <20221229082103.21064-1-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:12:44 +0800
Message-ID: <CAGXv+5Eq=VDfM35u0bxAS_-Dxv9yUpNAFqar_nCyC=5tXbtMFw@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] clk: mediatek: clk-mtk: Register MFG notifier in mtk_clk_simple_probe()
To: Miles Chen <miles.chen@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, chun-jie.chen@mediatek.com, 
	daniel@makrotopia.org, devicetree@vger.kernel.org, fparent@baylibre.com, 
	ikjn@chromium.org, johnson.wang@mediatek.com, jose.exposito89@gmail.com, 
	kernel@collabora.com, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com, 
	nfraprado@collabora.com, pablo.sun@mediatek.com, rex-bc.chen@mediatek.com, 
	robh+dt@kernel.org, ryder.lee@kernel.org, sam.shih@mediatek.com, 
	sboyd@kernel.org, weiyi.lu@mediatek.com, y.oudjana@protonmail.com, 
	yangyingliang@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_001257_644799_A4EE81E5 
X-CRM114-Status: GOOD (  12.90  )
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

On Thu, Dec 29, 2022 at 4:21 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> >In preparation for commonizing topckgen probe on various MediaTek SoCs
> >clock drivers, add the ability to register the MFG MUX notifier in
> >mtk_clk_simple_probe() by passing a custom notifier register function
> >pointer, as this function will be slightly different across different
> >SoCs.
> >
> >Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >---
> > drivers/clk/mediatek/clk-mtk.c | 8 ++++++++
> > drivers/clk/mediatek/clk-mtk.h | 3 +++
> > 2 files changed, 11 insertions(+)
> >
> >diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> >index b0a6225cd7b2..df6281492fb6 100644
> >--- a/drivers/clk/mediatek/clk-mtk.c
> >+++ b/drivers/clk/mediatek/clk-mtk.c
> >@@ -533,6 +533,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
> >                       goto unregister_composites;
> >       }
> >
> >+      if (mcd->clk_notifier_func) {
> >+              struct clk *mfg_mux = clk_data->hws[mcd->mfg_clk_idx]->clk;
> >+
> >+              r = mcd->clk_notifier_func(&pdev->dev, mfg_mux);
> >+              if (r)
> >+                      goto unregister_clks;
> >+      }
>
> Should we have a IS_ERR_OR_NULL() check for clk_data->hws[mcd->mfg_clk_idx]?

With a big warning to signal that something in the driver isn't written
correctly, such as no MFG clock actually being included in the driver.

ChenYu

