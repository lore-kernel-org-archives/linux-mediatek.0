Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD61C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZb7Mmg4r/Ou83sIwjBpzD29kSEyxiaGz1gGE/U0X0c=; b=T/fcCD7lM+Aap48AJxI1oPFxWS
	sFu3jpbUmgI1ZrqzbcMgi+Rvt8DVeEiD4QOdYNe7zi85IbOBmZS/37QjqeDibt3lJmMm7kj7LEJeE
	o3ErnKxz8fIpCLVNi50nZypCSRVztpVnyWY96Gfu0PKyYMhlYV7wRLbS9CLHVicWufHF+wg7jAOpt
	ts14grXEDt3OHm+rUoDlz3G+DqBxfg4WN7Z19esLGQRMKyHLeQRs56aB8VVBDfrr3ezNw9xXICytc
	pJHx41tEYKMffRpcc/8/2F6Q9KtGKSFXtUEWFiAIFs2cPKGy3XIeWbvvAFrqdYisQtDDzTH8///0+
	oW0nFB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWi8q-00AhEG-QX; Mon, 27 Feb 2023 18:22:28 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWi8o-00AhCO-8K; Mon, 27 Feb 2023 18:22:27 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1720600a5f0so8284444fac.11;
        Mon, 27 Feb 2023 10:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZb7Mmg4r/Ou83sIwjBpzD29kSEyxiaGz1gGE/U0X0c=;
        b=6PikcDkdUz7xvSMISwVkrT4wckRahQNzxCxHFXLLf6d78rsUCNVAE91apSQ05Huy0l
         pqDTnjVR56WoSP/s9qgPS/+vI9/QWkU0l8gb4cW/zfu7Qy40Kmhv8C5kwtf94xC3uqoU
         vGnwR4B2rxEBxa5kHIuZW+oDmFgsfEQ9toKA5elKCmOcnTfoanTc0ofowTPdRsFSYeou
         +SJtc0w3U+YozlsB/RSd+fSvhOBT5Q9n5wqG1xQz+IrJJmsuSuU6UqmSudFvNi/OXTvv
         Vyd2caWVqzDgAIthNYgZTXl9uC8raKk0kfISMHsnZXMl3Mgd4uloF3nn3gsxWQW29l7a
         vvqQ==
X-Gm-Message-State: AO0yUKUMkRLdAcGY1DZr0KvUdKESsSor0/c5e0aqlwy++yrxd9fnAl7/
	E8XG6ETrHORea6wY4HnPYA==
X-Google-Smtp-Source: AK7set9uOX6VKlcSXFwpXBebth0qSdciLFGEC7y3xDECB+S+bSftgJmahYyBxIo/9OFbzMZ+yuHZNg==
X-Received: by 2002:a05:6870:d688:b0:172:8986:be34 with SMTP id z8-20020a056870d68800b001728986be34mr7284010oap.49.1677522144002;
        Mon, 27 Feb 2023 10:22:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id do11-20020a0568300e0b00b0068bcef4f543sm2885393otb.21.2023.02.27.10.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:22:23 -0800 (PST)
Received: (nullmailer pid 583536 invoked by uid 1000);
	Mon, 27 Feb 2023 18:22:22 -0000
Date: Mon, 27 Feb 2023 12:22:22 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH 12/16] dt-bindings: pinctrl: mediatek: mt6795: rename
 to mediatek,mt6795-pinctrl
Message-ID: <167752214197.583308.8702991633165881328.robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-13-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222183932.33267-13-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_102226_321126_3846F76A 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Daniel Golle <daniel@makrotopia.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 22 Feb 2023 21:39:28 +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Rename mediatek,pinctrl-mt6795.yaml to mediatek,mt6795-pinctrl.yaml to be
> on par with the compatible string and other mediatek dt-binding schemas.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  ...ediatek,pinctrl-mt6795.yaml => mediatek,mt6795-pinctrl.yaml} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/pinctrl/{mediatek,pinctrl-mt6795.yaml => mediatek,mt6795-pinctrl.yaml} (98%)
> 

Acked-by: Rob Herring <robh@kernel.org>


