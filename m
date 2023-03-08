Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C8FC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 21:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeQp6dKSczEGqXYWcLnOyHbInXrv8V5R99QgTmD64v8=; b=GIitY1+3mqhTdZY+ThKH1GB9IH
	AJqdf+pLJUZbxV4UayCRLlm6B4eEOCvWL8wpgxPWmrlY6dfD1HKJfKQZ/WnaaPOerEbyp4IQNWJqK
	L+VxBPZ8R4gEYLRWJ5EPNTLb/QzMpgf3YV9V/Wc7zlroRassVNWZ4SBa/sJTmpwn54di+upkr0VHj
	hYy3mBSuDNPoiQtOrp0csUGnXSKrwKRsCxuQlVb3jxNOAYbsovGuDheOo6QoCabSQ7n7yu3AUQ7ev
	nHUVzuSz29CgvHTYynXmhf6WhqdYEP07/VNA4G7QOgrCsgS77KOm0b0PNfQMVImOSVHQheuTp9u/I
	kcOX/UYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa0yy-006lKL-4g; Wed, 08 Mar 2023 21:05:56 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa0yv-006lHp-Tj; Wed, 08 Mar 2023 21:05:55 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-176eae36feaso129230fac.6;
        Wed, 08 Mar 2023 13:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678309548;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GeQp6dKSczEGqXYWcLnOyHbInXrv8V5R99QgTmD64v8=;
        b=52qBVY6iFCdWUgh+RdcSCe0CM4hCm6nHzyllBDKwOnfVV+NNrZhtaJHibZHWGvaI+8
         g1b/bQg5roI/P/x2NloblwDlQk4eHLIV1CsP1u6tkZzl0D68KZNBWlFZtdk3+dLVaBFB
         iy9y+/ezp7lDSNQHNNHZEsFEOoTgKy7R2UYnkVu+RmSQEb3JlP4c7MF8JGpYdWYIHHSJ
         p61hhhK9kAriDgdJOYvefjBewyw3O/U79mmF6YXdJkGUEtJ88MBWSuR82Q/5Cf9vCOVq
         WuuFunpGJVzwL7LMzcuYu/J0tisdVvSkaKg6CdP06zKqK9ktmS4GVWINqw7okUZeL/nj
         Q5aA==
X-Gm-Message-State: AO0yUKWb8ELfE1Dyffulf8DcsVdrEqXtQHqiNeSpv6DR+Rm+Cz5WC/jv
	Jc+6vjIgnuNm81mskW98vQ==
X-Google-Smtp-Source: AK7set9dVdsYtXev0xuuroPAn21gVWk1G0tiJ6YTdGRV5oxphr0u0DE/s7Nv9KPM78TWMAoVKrrv0w==
X-Received: by 2002:a05:6870:20e:b0:163:595e:3655 with SMTP id j14-20020a056870020e00b00163595e3655mr11805478oad.12.1678309547895;
        Wed, 08 Mar 2023 13:05:47 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ds38-20020a0568705b2600b00172ac40356csm6650113oab.50.2023.03.08.13.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:05:47 -0800 (PST)
Received: (nullmailer pid 3802779 invoked by uid 1000);
	Wed, 08 Mar 2023 21:05:46 -0000
Date: Wed, 8 Mar 2023 15:05:46 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH 14/20] dt-bindings: pinctrl: mediatek: fix naming
 inconsistency
Message-ID: <167830954579.3802526.13749539102063089321.robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-15-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303002850.51858-15-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_130553_980284_77AAAAF2 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 03 Mar 2023 03:28:43 +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Some schemas include "MediaTek", some "Mediatek". Rename all to "MediaTek"
> to address the naming inconsistency.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml  | 4 ++--
>  .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 2 +-
>  .../devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml  | 4 ++--
>  .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml  | 2 +-
>  .../devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml  | 2 +-
>  .../devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml  | 2 +-
>  .../devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  | 2 +-
>  .../devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml  | 4 ++--
>  .../devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml  | 4 ++--
>  .../devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml  | 4 ++--
>  .../devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  | 2 +-
>  11 files changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


