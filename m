Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B85C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFMrPDdfxqpyd5M0MFhyXhLRTCbXShwPMfjjHKdui1k=; b=o6Pn/3tOjTpdS9LBel2wJTwSlM
	TOAbbquSQv9e/kIN1vyIuPD0LvKcmSuuWqcCdm/UFctGHM83mN4ADw/9ruGRJeSe8+BGTQkjDOdwU
	2hw6aLyFcFvyQRZozS5y09sXnhHKxBwoz+eUd/mNbddxHicmjE/c8AgntOB1hNRdkrQ6/FcdlShNg
	HWTRTASlgREW22vkoS48eviow2bHvRO9EUIpt3QIFoTsEjlhXNUzJ3+9rzAxtwHPLr5ncMyTZfW7t
	6dDafuWh8RDEVz7CKVPAv4SQeQtWFN5VhENdzdDtzEdKn8E/afKPr2v8tSzc7anbeJxGOgqv9i3bj
	rtxrczfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1A3-006nER-EQ; Wed, 08 Mar 2023 21:17:23 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa19s-006nAX-E1; Wed, 08 Mar 2023 21:17:13 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-176b48a9a05so229443fac.0;
        Wed, 08 Mar 2023 13:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678310228;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFMrPDdfxqpyd5M0MFhyXhLRTCbXShwPMfjjHKdui1k=;
        b=B8HV1oMWYf9CYBqxaaAmltY37Ad/hP2DC0whd8ZsEfPNtT+5GXn6rrgQVwu3V3WgyQ
         eapY4vJJ3glAC1saLJgDrWg5EntVQ2+AIDaHhYznj1bwhB4Bn70HLQLQUnChDHhA52lY
         SMeAuwJuEwYPO0eC+ApXPMedWsvyzSYq2qa5f2Yje4uK9V4REdGx0dB9mOXmF+W3iFX2
         AcaLuCJuBhGZb6gFY0IY/DO+rtNIpmcuCo/TBlJYToWqWsnrxvd9f8tqqj9M3Ssk8Ro9
         JSsIjG+NvcezM0aJ/mrkimiIcMLfsyLWCwFBhfvPwA0u3gxtnkCy3zaBBZK5tOz4JRBA
         qZ0g==
X-Gm-Message-State: AO0yUKW12ReqOs+KpOyLmTVnqHUsDnYujxcbJdSOXT++wP2S9Ij8Ru7Q
	yoKT/ooh85NUcgMuYSchJqD4+Fyz0Q==
X-Google-Smtp-Source: AK7set/7xk8grsaUoItOT2zuhVY8yeSb4zRNZBFmcFxRvaK1MclzUcTjoY+J1wTX6sQa1dIgiagbXw==
X-Received: by 2002:a05:6870:8293:b0:176:770b:5e8 with SMTP id q19-20020a056870829300b00176770b05e8mr9332124oae.3.1678310227940;
        Wed, 08 Mar 2023 13:17:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dv23-20020a056870d89700b001728669a604sm6705945oab.5.2023.03.08.13.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:17:07 -0800 (PST)
Received: (nullmailer pid 3858258 invoked by uid 1000);
	Wed, 08 Mar 2023 21:17:06 -0000
Date: Wed, 8 Mar 2023 15:17:06 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH 18/20] dt-bindings: pinctrl: ralink: rt305x: split binding
Message-ID: <167831022612.3858198.10046631784617358105.robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-19-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303002850.51858-19-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_131712_492374_AB64087C 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Daniel Golle <daniel@makrotopia.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, linux-mips@vger.kernel.org, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 03 Mar 2023 03:28:47 +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The RT3352 and RT5350 SoCs each contain different pin muxing information,
> therefore, should be split. This can be done now that there are compatible
> strings to distinguish them from other SoCs.
> 
> Split the schema out to ralink,rt3352-pinctrl.yaml and
> ralink,rt5350-pinctrl.yaml.
> 
> Remove ralink,rt3352-pinctrl and ralink,rt5350-pinctrl from rt305x.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/ralink,rt305x-pinctrl.yaml        |  83 +-----
>  .../pinctrl/ralink,rt3352-pinctrl.yaml        | 243 ++++++++++++++++++
>  .../pinctrl/ralink,rt5350-pinctrl.yaml        | 206 +++++++++++++++
>  3 files changed, 455 insertions(+), 77 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


