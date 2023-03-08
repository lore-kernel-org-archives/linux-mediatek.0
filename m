Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB34DC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 20:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bx+D/aRg96Xv1xhHfuRNJtHE/XSALiBjprbVX5obgUQ=; b=aO66RVJtJeqhQnnpaowECKL8PP
	HyLMRuXyFeOYOfWM8c2yB1pmr7MfpKI+Tgzjy4BG/zQofgvllUzS67BDAmh5pNeAyC58oFTOJGT2o
	DfcnmxCkNwvp2qq4EmSn9h9IvnhorIZGP4LZsH4TVdgQsgupyRRn2CdUOfklD0D+nZQQeVWn7KLlj
	kbkGI8dHAsvHwcBqlbvDqa2WOB/vZLjg6HWC2M3kHcTxt18+7eCCbqBJkkPYaRfZ8/ciVSdoWnSlq
	y2q3V+EAcstNAlYnH/v8FZuqqBLgR8QMx09bPOsQw3gae6XdAxLP8WnoELGXU1nE0ss/InE5PQvPh
	Dql+JG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa0cc-006hjk-MS; Wed, 08 Mar 2023 20:42:50 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa0cZ-006hiV-Rl; Wed, 08 Mar 2023 20:42:49 +0000
Received: by mail-ot1-f45.google.com with SMTP id r23-20020a05683001d700b00690eb18529fso9705415ota.1;
        Wed, 08 Mar 2023 12:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678308165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx+D/aRg96Xv1xhHfuRNJtHE/XSALiBjprbVX5obgUQ=;
        b=WchtdCD+DGMkju2wGt4RuiF5oN/l+xCRu+lg8JcdDhriTuFvId82orWBKMg81j8z9J
         eu/t5ve/CDIUQvlko8rPf0yQhnk8dAVnZimm7iDPSgUmkVWU1DZWYugZssqXZwNyXih1
         4EebxO5t87v0ZBh/AapDTK6XgVs7+EHi9e5vVr/eVDke5nQkNGa8Ozw754qQozz5rJ1c
         xoM0AiOowp4UlojqL7kLege6mml7gNT+Y+EYQj2XcBSjIrGkA2mRAL9bYf0Fi491BHzS
         qmys9oL69ZDDJxKyN5e0doP5NxpqQQvFJyt4WDS3QmRES7cy9PyhqkqJ9yk5amD95GWR
         uwdA==
X-Gm-Message-State: AO0yUKXwAoexST2e2Ce6YqMvALhWc/hzOvJaA2WbT5KVsJtCLJ75NAUb
	+3yUsK4z+NjRr0Z0ji+dZg==
X-Google-Smtp-Source: AK7set/6BsPdujjJq8G0YkPgYq2OeOO2li/rSi30P2jJIG98XFB0DpAns146xxM0NNpmfpFIsy83JQ==
X-Received: by 2002:a05:6830:565:b0:694:88f5:f5ed with SMTP id f5-20020a056830056500b0069488f5f5edmr2829378otc.24.1678308164741;
        Wed, 08 Mar 2023 12:42:44 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k3-20020a9d4b83000000b00690e6d56670sm6980752otf.25.2023.03.08.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 12:42:44 -0800 (PST)
Received: (nullmailer pid 3744004 invoked by uid 1000);
	Wed, 08 Mar 2023 20:42:43 -0000
Date: Wed, 8 Mar 2023 14:42:43 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH 07/20] dt-bindings: pinctrl: ralink: improve bindings
Message-ID: <20230308204243.GA3735537-robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-8-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303002850.51858-8-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_124247_915279_F7CAB0DD 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 03, 2023 at 03:28:36AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Move additionalProperties to the top. It's easier to read than after a long
> indented section.
> 
> Drop the quotes from the referred schemas.

Not the greatest subject as every change improves something and bindings 
is stated twice. Hard to come up with something better since you've 
combined 2 different kinds of changes which you shouldn't do either. So 
I'd split this patch into 2.

> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/pinctrl/ralink,mt7620-pinctrl.yaml          | 9 ++++-----
>  .../bindings/pinctrl/ralink,mt7621-pinctrl.yaml          | 9 ++++-----
>  .../bindings/pinctrl/ralink,rt2880-pinctrl.yaml          | 9 ++++-----
>  .../bindings/pinctrl/ralink,rt305x-pinctrl.yaml          | 9 ++++-----
>  .../bindings/pinctrl/ralink,rt3883-pinctrl.yaml          | 9 ++++-----
>  5 files changed, 20 insertions(+), 25 deletions(-)

