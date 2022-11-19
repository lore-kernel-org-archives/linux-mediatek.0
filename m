Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC1EC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Nov 2022 06:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLYrlsSUJ/3iV70MlNgEm3O6sI1BB8dOzm7Fo6KqsgM=; b=AtUnObz0hWMOJ0QPZ+JN89RiuE
	szHuc/qKFPeLZbMEzb7qTUEWD2tRgPRQRUfLnmF33hStdTRMYrPMexvsT30cDw0M5xfEE9oa5CiFc
	2IlI3qNJhztVaumhf08iONs6V5JbxcFaozlMNjOi7QQJXNY7dhRL7dtB45ss/xhua/Q2LEV/Z29KL
	M9zUD0ObVPxPmbqIrRDbOKUp37R31Tq6ZE8XOszUFJ9O61QtTzhkyNWrFFnaQCI4DUu8x/u21i9vB
	uyClwIZubs18GmBstpVv/+54vHfvHVEsIJI3LkaeEfqFqiCoSmW1JPqllhs+jofugl7GLnvKFZ61t
	ho9h6BtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owHUR-00BjDI-Qx; Sat, 19 Nov 2022 06:38:11 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owHUD-00Bj2u-LC; Sat, 19 Nov 2022 06:37:58 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-142b72a728fso706936fac.9;
        Fri, 18 Nov 2022 22:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cLYrlsSUJ/3iV70MlNgEm3O6sI1BB8dOzm7Fo6KqsgM=;
        b=cNFOo+VqMgo+mnOiJFXxMwMeFQLoitwcWJzIOOFWlhDZn66wiP2M4eBUI7NktrM1uC
         yaoxkbPYDfgg1iDxd9fZ4xi9O867toY85OU0FO1wgrIcYtErgNqSkIaDFS1yLEWy06Ze
         Nw1/AIkSKmJKMc018JElW0dxYRL+GkqGyoV263phPIjoXOrycZ0f4UAzEZVysgHM2sCC
         u3DTAZg7k0XUYqkROhzjmjl20OPHdLpF2N4VWXL/gTSjK7lRgBotEJdsiOLa4wIH6cX7
         RdwHdpMT7MwsU0JqQ6wxuSX6BvrKyH1TcIs0CmWyKM61aIq78ZXPr1jlmFDGDcT3Hvct
         8DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLYrlsSUJ/3iV70MlNgEm3O6sI1BB8dOzm7Fo6KqsgM=;
        b=0iGvQH25rgcrPshHg+yk9k6v/vCnXFbBKWQpQjQZAuMaSANmXnZodk3NcZrvNT68vM
         eh2oTg1K+wFRIX4LJEtjY20Q3RsAZUqoFAlIpRnSRIO7erJz+gZsq9Q9L2cdTfWr1gyX
         Qdzmp1DBpyxXnPDmoW7HohTW1n2Dz+CSgfhlvUnZ9FT0YC3H7YGb3WTk/ZXg70BUbrUU
         yIAShab0QCAgNZpOVZvivpnRAFx8yqcTEk1AqDJHaWYAEOdIt/D3nneL9vVsB6KDpt5M
         gZ61sFL5yGqLka6sHP0sI5Fm9/vZYZRCya8UHY51itLknFsjZifsFe9W1jHB0UlHsBEW
         zPrg==
X-Gm-Message-State: ANoB5pnq0OH8VSYxnJCSisK90uRRzPptUKwLHlBMX7zcFHAQLxs7RjLU
	trlXPfGQRZP3W4jVHARvjNU7JFoHF0GeHi3rZeE=
X-Google-Smtp-Source: AA0mqf4YHBgpQyRnlsR8IJwpaWfoiK6RVHKjHFNz8PNwpwXg9+N4cVuAs+273DwuP7yKjh9Nyq4wN2dl85vztU/s7dM=
X-Received: by 2002:a05:6870:9591:b0:13a:eee0:b499 with SMTP id
 k17-20020a056870959100b0013aeee0b499mr378364oao.83.1668839875548; Fri, 18 Nov
 2022 22:37:55 -0800 (PST)
MIME-Version: 1.0
References: <20221118223728.1721589-1-robh@kernel.org>
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 19 Nov 2022 07:37:43 +0100
Message-ID: <CAMhs-H99X9aV7cdotCPar6g50KXL+qNS+jM16Tveq9nxfUY4Rg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex anchors
To: Rob Herring <robh@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Maxime Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_223757_730146_39A132ED 
X-CRM114-Status: GOOD (  10.83  )
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

On Fri, Nov 18, 2022 at 11:38 PM Rob Herring <robh@kernel.org> wrote:
>
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

