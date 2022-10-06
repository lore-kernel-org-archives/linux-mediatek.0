Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD01CC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 19:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQkts9CNxdGnPqsZmG5kji7cxN91mZuegt3zYk6RMWA=; b=umcpvAGcEIO3CRUmkwQXI2hw2C
	PruUsanglqPBwS9fXPtOTJcsp2HjPDVaMvYIjMCpr3/h/e6Mr5s3jcW0XW4osAsJqhVGv+52DFHbM
	I1TEWsvC+U7NDEVylNQGfjfhZCyQbq4HhrydPXYZf5buRdUxT7ayRCyFf4jsyFF7iCPyEZnWYheBq
	IEuKkACeb1NiHfTOC+r1yDwW7WskyWaHzovuZF6xPhlIGw0UdBgVTxfRyi2iL8Kf6aeomYdXeu+i6
	K3X2nQ3ha/lyKzw4gSgHJTjvIYhGBqWM7QGVS0oVALImymaw1mWE657XdCFDjXmfBFTN1OAa5tqgZ
	4q7pbxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWOW-004hWG-GG; Thu, 06 Oct 2022 19:18:56 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWOL-004hR8-Pn; Thu, 06 Oct 2022 19:18:47 +0000
Received: by mail-oi1-f176.google.com with SMTP id d64so3117650oia.9;
        Thu, 06 Oct 2022 12:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQkts9CNxdGnPqsZmG5kji7cxN91mZuegt3zYk6RMWA=;
        b=ulPOClpe0L9EmUaLHb6de63QWGJ7FjOTtVYBQu9OXkNlUgHxoFmqLiS12pWiUSnDm7
         E4VBYJsoPMl5ZxAG9S/QOTIJDKP1RocIxAJ+u4Wj+F+65jYKUdOnuRR+2e1X+8bJG4NV
         ISkf07jLPAfM7HwgAE4vA7AcXUj6n4Ybk3ONIgv18ULYIUvQa6RCxcaZ5//Wf2X3XwdX
         fzZoBF5GacAfR7kXUj1HKl+5xWDNnl1v+sWAaJbVfK0Zp0smnc8DaZ1+maDS46pN3fDq
         j0rNjiKaR2EBFNY5kh+v2C0irbuLK/BMLVutrZNYkvs61psiB8eiNSkY50t3Q26sVSB2
         Vl2Q==
X-Gm-Message-State: ACrzQf3UaFmHN0enukJCHWolgo7O3kDnfMIUwAMAnJol6J6JKbtJC3pi
	aIXnqb+jnQm1u+S7RJqaOa9ke7Fx3w==
X-Google-Smtp-Source: AMsMyM6ypf9p+1I9VTj+vf0h/kRsTUojNGHIiIUFRRCgojLkuZMfvn0DQT8twZAsW2xqs7Tp2rzWZQ==
X-Received: by 2002:a05:6808:1281:b0:350:7aad:9f4c with SMTP id a1-20020a056808128100b003507aad9f4cmr595892oiw.21.1665083924329;
        Thu, 06 Oct 2022 12:18:44 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id r41-20020a05687017a900b00132f141ef2dsm179838oae.56.2022.10.06.12.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 12:18:43 -0700 (PDT)
Received: (nullmailer pid 49467 invoked by uid 1000);
	Thu, 06 Oct 2022 19:18:42 -0000
Date: Thu, 6 Oct 2022 14:18:42 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-gpio@vger.kernel.org, Andy Teng <andy.teng@mediatek.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6797
Message-ID: <166508392222.49416.1999405507084139523.robh@kernel.org>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-5-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005174343.24240-5-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_121845_858232_B9CC0CF7 
X-CRM114-Status: GOOD (  14.05  )
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

On Wed, 05 Oct 2022 20:43:37 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Combine MT6797 pin controller document into MT6779 one. reg and
> reg-names property constraints are set using conditionals.
> A conditional is also used to make interrupt-related properties
> required on the MT6779 pin controller only, since the MT6797
> controller doesn't support interrupts (or not yet, at least).
> drive-strength and slew-rate properties which weren't described
> in the MT6779 document before are brought in from the MT6797 one.
> Both pin controllers share a common driver core so they should
> both support these properties.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  87 ++++++---
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 176 ------------------
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 67 insertions(+), 198 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

