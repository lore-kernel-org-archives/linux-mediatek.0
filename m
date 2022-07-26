Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4A9C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xkx90yalUpDf8aSv06wMYT+1OK70L3/9oGj4foZkji4=; b=DElNmzoLeIOiZWIGJfWNAxJsm8
	66ZuQiF7S1GCiLphjakuwxI9qv40cjaRuf8OkKGDT2KX0OQhzPaVRxUuvDcBkuvB1GfrzIChhLLZ/
	8yomMGDHTzGnNuMjoTWm2yDZFyct5Pfej/S4qLZNoiQLG3L2sgqX9HHPAGH82pYgvAb8BJisj+dvL
	cIAIoTDM0opNhJ4dtzGeqNZb09bGXvw03kQCmvxuXi/S1wGY/GL3G9e69m/jqzuMx/eX6pdnf8vf8
	dzFVKdMk3UFoBRxBdaDtJ3LkPsnagn5pAk9H34O4XmxSEpME6ao46SojJBCOLDeEAdCdXzu1B0/EK
	Tk3LprWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFtQ-00A9Ad-7T; Tue, 26 Jul 2022 08:26:16 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFsU-00A8MN-Ud
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 08:25:20 +0000
Received: by mail-ej1-x635.google.com with SMTP id va17so24868669ejb.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xkx90yalUpDf8aSv06wMYT+1OK70L3/9oGj4foZkji4=;
        b=PL30xppZg3iWeTQBfl/NslL+mcaXclPdlk+1wI7jRhfUpQ2/rkYxew0zX1e8T8Xq1/
         ielzAEIqp+hl4Ay7ucnestwlEE79+0jLp2ojtxc0OkoEzvsT55g0IlEWW+4iisNUBLmo
         7L29LStoWdJxteClj1Qy8TxWXNvkUFVgrZFoVsedFrRuxuDhjFkg0+A4l8HY78sEx4VI
         4IB4r6s9zP960K9aI1fhTcbgTrMtauJYKtjox/9EgWBpu2nbxNmsmtI0juHmEx4SpBrz
         hgO6A0A30PwLRsBhYJEJR9mWGoUfmpjclgYcaAIgndBHP4bPAieoWukNB0ZR+LD6hnON
         +xyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xkx90yalUpDf8aSv06wMYT+1OK70L3/9oGj4foZkji4=;
        b=BcnDBHL7hKma3l+1Q8Ut5QFOstI48twEuJAgxrhIxACjqCdP83vYnVk/KMa+x1GsXe
         1qBYsufeKnOE1R/T+bHpxZr/xu5wJILae/ZY0JGNUU4jAo3YtauS3ABARnLBrsTs9rgs
         w5xLhNe/QSpAcywb8uQ0YJIRJq8eEZ8Xg009PNraYzTKZrAvuGGo6s46bfCKID/bPRvm
         iSkY7bVnjozMAOjLYqnY7RJy0w8wouaeBml/eRRiAJ9sEjXz3plvVLnwWv0AHQUNHU+U
         G/1xWdHgk+fdfhduqZlDs7YQUBZ6vP5bYnVw85WqpJgaXpm0BD/VeFqNkB5Vcyul0hxK
         gcug==
X-Gm-Message-State: AJIora/v70kagqGPQzeeYcQ32U8TYQw5IWR7e31wgLg82wlpEcmlrZ8t
	p/si+BgkFxHrPLe9tbEho7vgoytakcOTtpZPOIaGwQ==
X-Google-Smtp-Source: AGRyM1u3yOCOtZopLwlF/RFirrjzaTrdWVKOaATw//UrBRVUyQggv2JX7KeYTgtrklwgYzdWDacIkTm1zvszXD/o/TM=
X-Received: by 2002:a17:906:2ed7:b0:72f:d080:411 with SMTP id
 s23-20020a1709062ed700b0072fd0800411mr8498136eji.203.1658823915420; Tue, 26
 Jul 2022 01:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220725110702.11362-1-allen-kh.cheng@mediatek.com> <20220725110702.11362-3-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220725110702.11362-3-allen-kh.cheng@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jul 2022 10:25:04 +0200
Message-ID: <CACRpkdZjMUqzwqLw0LyPSw-TsYhXvNXr74vwW05LMKaE-n2=og@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: mt8186: Add and use drive-strength-microamp
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_012519_013872_B855ADBD 
X-CRM114-Status: GOOD (  10.48  )
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

On Mon, Jul 25, 2022 at 1:07 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:

> Commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
> PIN_CONFIG_DRIVE_STRENGTH_UA") added support for using
> drive-strength-microamp instead of mediatek,drive-strength-adv.
>
> Similarly to the mt8192 and mt8195, there's no user of property
> 'mediatek,drive-strength-adv', hence removing it is safe.
>
> Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and binding document")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied.

Yours,
Linus Walleij

