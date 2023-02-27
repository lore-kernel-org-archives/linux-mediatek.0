Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEC7C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 18:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAghNcZOo+DAEQczVV+zv0Sggl3SkEdcXf3iJdRX+qk=; b=yUNbPNKdcw5lv/2pfd5+uyXLUN
	TcABp67Lpl2yXg1qulkQtrJhzsQ3bXX4dMHLo+RNJAikySMxv3jqfyihtdT7lo2zjT4p7Nrav5oX1
	jJ+dTpdu5o+HY38q3BCoAQnrJBWNMrpZ3ZQVOZa11Fveu6WCX1a7qiNb82gthegb8OA6kXYymgKEZ
	+/0fgHO56x5upYP3pJ8Qyn07ftTdpQLepoRAv+oAe+GqehrFVtWlITzlyjaTkz5Fg/pUOYQPmxOuG
	JmRU6nGD2ORzVCBPYDKj497CTmK7ohxdDNDHldKsQiVZ7nfO5GHWiM3Yz5L9ZXKJm1YTaAM/c5ZFr
	huu8RMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiEr-00AjI5-L0; Mon, 27 Feb 2023 18:28:41 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiEo-00AjH0-K0; Mon, 27 Feb 2023 18:28:39 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-172094e10e3so8313352fac.10;
        Mon, 27 Feb 2023 10:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAghNcZOo+DAEQczVV+zv0Sggl3SkEdcXf3iJdRX+qk=;
        b=ZjWy6BlMsiq+OXBQ8jwtbEdHkmQAY6lH3G1oFlqeyFvw7I9Q74aMglcKU1b0QIxIVU
         rhdNY/eoYJWXsmUF4oWMkjvmCx1ZTyHuQJPKd6fY85gsH2WOUHM80nle5QfD8VQGIgUV
         AEYMn8rcnSIRjAfKWhheZpghcBpxft8F5SLAoWKlpN2Ts8fbhwRpWA6rNDwA2Ygi8CHN
         QitwIu3d69WcbXX0N/C2PbOUibP2MLuQQWAlQIJzoz6jRoIS9MV6Ma8Y8OJkLf70ebTn
         Nl2yDsxxgGlmztG3PpoTuev9eFWC+MYMb2HoYHFB8nBKVd92HQUexJxW4JYfy+o8cQGR
         odLw==
X-Gm-Message-State: AO0yUKU6yPRidUCdfrvgye6mvJMfV9BacvQ1+n3fcj7vFzXtFfBKZjM0
	nhJ5BsN4Ai7kwK0grq9Y8h9Z9wTMVg==
X-Google-Smtp-Source: AK7set/ULx8pV2pjX31TC7ROkyj+jY51+b6GTXfea/+pI9KrZayzKReMok9/Qx/EcdnrO9jg9Ki0Ww==
X-Received: by 2002:a05:6870:350f:b0:172:6b1b:ea34 with SMTP id k15-20020a056870350f00b001726b1bea34mr11703038oah.8.1677522514914;
        Mon, 27 Feb 2023 10:28:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n1-20020a056870034100b001724d631f92sm2520796oaf.30.2023.02.27.10.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:28:34 -0800 (PST)
Received: (nullmailer pid 639117 invoked by uid 1000);
	Mon, 27 Feb 2023 18:28:33 -0000
Date: Mon, 27 Feb 2023 12:28:33 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH 16/16] dt-bindings: pinctrl: mediatek: improve schemas
Message-ID: <20230227182833.GA605986-robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-17-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222183932.33267-17-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_102838_676772_54BE0CC1 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 22, 2023 at 09:39:32PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Some schemas include "MediaTek", some "Mediatek". Rename all to "MediaTek"
> to address the naming inconsistency.
> 
> Change the style of description properties to plain style where there's no
> need to preserve the line endings, and vice versa.
> 
> Fit the schemas to 80 columns for each line.
> 
> Set patternProperties to '^.*mux.*$' on mediatek,mt7986-pinctrl.yaml.

This at least should be a separate patch. Really, this is probably 3 
patches.

The changes themselves look fine.

Rob


