Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C27ECAAA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiR3kqY1FtS7aluiuV2htyDwOrHtB3ABTNirVnY7LY0=; b=jZ/Z8RHT5axSupNBiWW0VbAtbC
	us5S8xLLxqeaWIaXM6+/kLIIdGOKlVHwdVbV5IaMBiyx7nd+auU/XViwKXUbO4d94hEsQiWhXJPup
	zTR2D9SaMjQEvQfbGN7pjh2zl8Z9CEepQFKyqZjxhtdFqPV9orDUFeRhrZTD1Dvb+qk0a+2fTMvCQ
	8TGZ0Sr7FuiwvoskvJTiCB8UvLVm2MUie0yAHSS6ojJiJxRWwueLtwuGXd1nHURWosYCHgue2vPI1
	7d4LDkMuL5IcHrH2gDHD05KlXccuocp21xz4PIvzmc8HaHLRwTVVPKcowRSc2xTcZdX1qIXGsWFXV
	/LABGhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZTc-0047Gb-7k; Fri, 26 Aug 2022 13:34:24 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZTK-0046GB-S0
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 13:34:08 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-324ec5a9e97so36197637b3.7
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Aug 2022 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qiR3kqY1FtS7aluiuV2htyDwOrHtB3ABTNirVnY7LY0=;
        b=Badek9Z3Zw7k7MP3T3YzVdM7CAxTgNBC24Y9sxs8xUcI7ApWgF7W8s+Gcvz5ZVhKP1
         Gv/BM4JpKuQ0UsB3GLYAcuMHJrwhuMYNb4FXaxY6qW5KzLK0QVcBuDwguYH4jNNxTedj
         lCUZuv+5g6OWaGpzsg7CujNCCX8jo0zwxY/d62havl0hP9HtOY07Lla1ygso+jhceuRo
         c6zerpixbQK+eKtQ2/j8/OVTJ7t+7dCHSEbF6H4JAlv0ncMGq4l8alqAwd7ZBJWq49W7
         dduQbKTdmgNjW5trp2/imaB1kqDb2eJN79QRGfSzutp/zKzz9em/stAFPeeyWGJku245
         agtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qiR3kqY1FtS7aluiuV2htyDwOrHtB3ABTNirVnY7LY0=;
        b=69rAAGgC7TUgJt8nLHe9q7jGzKne6f2MLuYQD0v2xNCIk6c0IotjSsba+8uLO2Lw19
         bc8JhbLPtolt9kZPco8MWIGB9SmXSuyOqaVU0EHMKR/CJEMBTk+Tleu1VRDssrxOFES+
         0DOpmyXHJcg7FXpoHN665YgQbGRRe9j5gC3/zTYG+8tcnxT6aXx6ZBdYzBv5ihYTD3Zh
         95BxURH4+dYBoR46Lmvu4r8AZAWeIQr0QmTsNyhEFDjMAyLtzrVz8de6WsX+tH937+gy
         p0zg5KDbWAR3GFL4xDX7IhAVoQyqiDOE8DWNMx9jOdpZux9nbi6E8tAI4fpYU0bOqQro
         ZS3Q==
X-Gm-Message-State: ACgBeo1cSkpjCtOyPAvNaioGFSORarkMEpnnglvUyqo3YbkcShXGU5CF
	oycXNY7C9OXkKKmlC4C+rPwuDXLhGQQqOKB/6E1vPg==
X-Google-Smtp-Source: AA6agR4cSYDUjHjKqgs9zKaZ58NNESabUJfIrLT+OTCGH4HwSfACpDx/ctbx5ozgIrEgXjQk7zDpKuMhmKfrTiLRGm0=
X-Received: by 2002:a05:6902:124e:b0:668:222c:e8da with SMTP id
 t14-20020a056902124e00b00668222ce8damr7302689ybu.383.1661520843052; Fri, 26
 Aug 2022 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220823145649.3118479-6-robh@kernel.org>
In-Reply-To: <20220823145649.3118479-6-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 15:33:51 +0200
Message-ID: <CACRpkdZ3syQzLaZJ1aksB6o7Q_xOMGSC1RfT_9iVYgpXHi_mfw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Add missing (unevaluated|additional)Properties
 on child nodes
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, Andy Teng <andy.teng@mediatek.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_063406_954910_47015060 
X-CRM114-Status: UNSURE (   8.62  )
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

On Tue, Aug 23, 2022 at 4:57 PM Rob Herring <robh@kernel.org> wrote:

> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied to the pinctrl tree for v6.1

Yours,
Linus Walleij

