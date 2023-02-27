Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7991C7EE31
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBRobdlQ8YA7xmWGDg5XN98xb2FG1Y6yDjdmnPMXjHs=; b=J+8wJzI8d7iDaxJRHggyWlMdPU
	McZeNa80WL0gvGXwon2T2HvDfIijWI96PwqQnzrAQOoxqJs+2w7peNzv+MXahQ7/Bz7KhgGkhjwA8
	H44Eks2Pyp1bed8ZnjSFrCKZReAnd/DDUId5e+jqp03dCzEnio3/Dzbd1JruYsmqRao2CUG4PRRFf
	2wT3y8rBlMESwL1+vP22BM0CHY53fuLcc8ND/0N3FBzKXm2Fx87kwn2Y7sBUHTH2gRrrJL6DGBoO7
	C1JRWeqZ8beyG2vXPQVpuWrOCHrISzD/IoJ1JpgWrvHcPTB2Y5J+4HOEIX7zTaG3j1kWBFbHFG43k
	9aRcQkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiAr-00Ai0S-If; Mon, 27 Feb 2023 18:24:33 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiAk-00AhxO-Uq; Mon, 27 Feb 2023 18:24:28 +0000
Received: by mail-ot1-f52.google.com with SMTP id v17-20020a0568301bd100b0068dc615ee44so4053977ota.10;
        Mon, 27 Feb 2023 10:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBRobdlQ8YA7xmWGDg5XN98xb2FG1Y6yDjdmnPMXjHs=;
        b=tG9J/BB7uiyY4fgh0d2xhdqS6KaZFS8TihbjKeLoIo+OJ4FFpwANsMwEvo+EAShbDb
         fHrvJFkbNGujKf4Z5K6Poc+bmSCE1glcU7w6yoIukNgbMnG2m8n2Gfn4D1tGzXFvcWH6
         tIqubARQfoKaHk9q3i7rrzi91P4KyWomitvm9VmjCrOy23ZIbiGRzI9kXSVKbO59VV4B
         22wJzYCKf9O+CRqA4JmZ2ffOTItWrI+btDRk52O/IAA2BayeubbsrkWFG4sbJ+o9o+y6
         y1S58vINUbH0SnmTQmtVffn6YuGbuzVhlPVEo+K1HDh+PEKtK7iSw7GZwzPag6LAM0fD
         skOw==
X-Gm-Message-State: AO0yUKVXgBFZPy8feS8LmDbx9+B3Nou7IoxNIGLDNJJN6OwAZM93y+xM
	Kc299skjd8YS55uroaRREg==
X-Google-Smtp-Source: AK7set+Ys4nnlOS3/X7NRt+FPf7ir4AayFIQQPwQKAmmm9O8i1Mg3oL2w21eYgZx40eoXJYpxKqXUw==
X-Received: by 2002:a9d:367:0:b0:693:c7e4:dd4b with SMTP id 94-20020a9d0367000000b00693c7e4dd4bmr11433543otv.6.1677522264892;
        Mon, 27 Feb 2023 10:24:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j3-20020a9d1783000000b00690d0daa17esm2880309otj.3.2023.02.27.10.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:24:24 -0800 (PST)
Received: (nullmailer pid 605232 invoked by uid 1000);
	Mon, 27 Feb 2023 18:24:23 -0000
Date: Mon, 27 Feb 2023 12:24:23 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH 15/16] dt-bindings: pinctrl: mediatek: mt8195: rename
 to mediatek,mt8195-pinctrl
Message-ID: <167752226279.605012.9223812860970122515.robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-16-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222183932.33267-16-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_102427_041204_148F758D 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Daniel Golle <daniel@makrotopia.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, linux-mips@vger.kernel.org, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 22 Feb 2023 21:39:31 +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Rename pinctrl-mt8195.yaml to mediatek,mt8195-pinctrl.yaml to be on par
> with the compatible string and other mediatek dt-binding schemas.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../{pinctrl-mt8195.yaml => mediatek,mt8195-pinctrl.yaml}       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/pinctrl/{pinctrl-mt8195.yaml => mediatek,mt8195-pinctrl.yaml} (99%)
> 

Acked-by: Rob Herring <robh@kernel.org>


