Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CFEC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 22:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owwtlW3rOL0CNBfDOH2DnKrzgv4WQIHmvViMboW6yHk=; b=dRNMFYX3Yl2pexzEYaW7lMnXm3
	p1hAGSMuOKC45UHWe/DHmhgfqSFgYbtxL3Km5j8M9HfKETGLqwAQnGCXDtJ0Z1Hf0MYsIhvi0t5FK
	R2IKtF7epzQb8u/d+rL+VWYYMPpStOuwyNxsSnIQgb6ge019h7QWjBzQq0VHYSK9ynK1k0vs3Z6I+
	Bdm36ixCNcj64Kpk7N9TmJjD3Yo6SYYVWFG6/29Tb318Kp1SRa7wqb/nI24tnoMp70FltmXqKiZrC
	DNwmgw4M8UyMqIwiz7BlwArh9uJbTMirenxIUnk0WM74SzCQ0pQXXQvOf83WpWziMXZidkauQgX6J
	ApyVauXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6pR-003RnU-7j; Mon, 25 Jul 2022 22:45:33 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6pO-003Rl3-88; Mon, 25 Jul 2022 22:45:31 +0000
Received: by mail-oi1-f169.google.com with SMTP id bb16so15173866oib.11;
        Mon, 25 Jul 2022 15:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=owwtlW3rOL0CNBfDOH2DnKrzgv4WQIHmvViMboW6yHk=;
        b=AjlH4FdbFm+uJSMYy3myBSLSV7r2j/ZM72fsT7thgE7s4cN7Xs7I95b/iTNkG4c8Nd
         9xyfWIbqH8n1g6pPBZw0YON8cOBMLA0IUQ+TND3ycSxGti+7gQT6xtMVYJwPfaxZeJoG
         gGLlMCkLzWYsUfpOchZdwJmpYTG7Ke1STyM1h5NdI01leFYNNjU/28UNlFkMW2aW0w4a
         2A8nyTutKh6WundEOrHml60wyaQpzr9yBj9Tw1Lg2eQgIEcTk9CaByUPZYV6rHK+i+vu
         u7ZTDNOLmDrDu2o7d/fL/WZTe4VQyMx1cjrgBlQ4jr/BdfELW4CiTEsI8fe37v9ZRvJw
         R6SA==
X-Gm-Message-State: AJIora8UERDSz6lKXlTa19o1XteIxb8FHwcSzHyF168Xdbbv2gJ2cL7K
	MTyIJNz+lbfXXNISIEbGdQ==
X-Google-Smtp-Source: AGRyM1svwSsqAhx+tdPya8Gp0eQkBxcOlgC+d6J8MbW4VLKYGHrsTs/zO+0aGudl40kpceveJ48bmw==
X-Received: by 2002:a05:6808:1514:b0:33a:ab72:ffa7 with SMTP id u20-20020a056808151400b0033aab72ffa7mr10961459oiw.100.1658789125525;
        Mon, 25 Jul 2022 15:45:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id i6-20020aca2b06000000b0033a11fcb23bsm5317942oik.27.2022.07.25.15.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:45:25 -0700 (PDT)
Received: (nullmailer pid 2886877 invoked by uid 1000);
	Mon, 25 Jul 2022 22:45:21 -0000
Date: Mon, 25 Jul 2022 16:45:21 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rex-bc.chen@mediatek.com, ikjn@chromium.org, wenst@chromium.org, sboyd@kernel.org, marijn.suijten@somainline.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, paul.bouchara@somainline.org, p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org, ck.hu@mediatek.com, bgolaszewski@baylibre.com, jason-jh.lin@mediatek.com, mturquette@baylibre.com, matthias.bgg@gmail.com, miles.chen@mediatek.com, konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org, tinghan.shen@mediatek.com, ~postmarketos/upstreaming@lists.sr.ht, sam.shih@mediatek.com, linux-clk@vger.kernel.org, y.oudjana@protonmail.com, kernel@collabora.com, robh+dt@kernel.org, fparent@baylibre.com, devicetree@vger.kernel.org, martin.botka@somainline.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 4/8] dt-bindings: clock: mediatek: Add clock driver
 bindings for MT6795
Message-ID: <20220725224521.GA2886831-robh@kernel.org>
References: <20220722090609.52364-1-angelogioacchino.delregno@collabora.com>
 <20220722090609.52364-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722090609.52364-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_154530_307248_8E52AC08 
X-CRM114-Status: GOOD (  10.25  )
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

On Fri, 22 Jul 2022 11:06:05 +0200, AngeloGioacchino Del Regno wrote:
> Add the bindings for the clock drivers of the MediaTek Helio X10
> MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++++
>  .../clock/mediatek,mt6795-sys-clock.yaml      | 54 +++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

