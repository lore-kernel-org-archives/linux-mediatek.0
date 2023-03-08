Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F558C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 21:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I60t2b90wzss81s3fKq0o1a4IobvW8p+fvRrTeKfSkI=; b=G1Qhvg1GPBd0P9/uzz60NBP/Eh
	TQmiS0Z7lumSlUPHEapKRoKXL4Sbl/qmgzf+IOQ9j+0ZTDr8lSXkGQkQmF36szKi3aMf5WVE92kpz
	v8xVwau/OjzRBvVmgGcXLRSBGBbpZs7vlTSLlx57+BJ2pOTNQ+5ji1xnhUtrxKrVJk72N13q1ymuQ
	3CEHsW9ENXeYAIov7bZtSaC3dkvn7hbYT2zPlsiHIUwRxE9f6BKt++AHSRs/xd2kY+2C0JRgon6CO
	UdcMJEQ099zKKKbBrTfvt1PMemLGjRNXWpUdfVRjvvD17ZZJWA53b/zHvnIybOSmkRFhReNlllzo4
	HlIuBr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1FN-006ocA-8O; Wed, 08 Mar 2023 21:22:53 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1FK-006obI-W9; Wed, 08 Mar 2023 21:22:52 +0000
Received: by mail-ot1-f42.google.com with SMTP id o4-20020a9d6d04000000b00694127788f4so9758276otp.6;
        Wed, 08 Mar 2023 13:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678310569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I60t2b90wzss81s3fKq0o1a4IobvW8p+fvRrTeKfSkI=;
        b=uQ7fBKjT+YbwvhFg6nDYDyhzkm0w/hkTZlTy6P+fx4ChXzxKasJOHZExpaCJVjIkjI
         jKCZ7L3KC8WExIJc/p+9NZhjjVlkhwP2CjZmlUKHrd+/2LijNdq7A5qIZtEHkAqM8tbK
         HU5pLw/GUlfHhLRN6jkpEtsvIqMU2cauf+7m4MWct7K6T1zBi+z5B8e+qqgkeT5qg8Ch
         1HjTO29oM8CYMekK7xbEdOCOBdcZRKYxdIc1hDXSllJAw5Lu4bICfTjthb/e3nixuPyW
         9g/YRm8MsNyVHyLppx11uvc9xULRL5YB94kYsC5DW/ghbzCGl/wh2gGKEcX27x9qxwA7
         yexA==
X-Gm-Message-State: AO0yUKW70/HAojFtSX8TaD5klgBpu9dcwELUdmc1Z7SjsFMjCNCLO+TJ
	k9hyczWLAXq/T20JRhd8Qg==
X-Google-Smtp-Source: AK7set+PTfJOJQBTkd9lD5mgbdaKikQsLsBMNOdi9P+5Ho56tU02sSuQtD0n97ZBDotTbKjZTin1uw==
X-Received: by 2002:a9d:19e8:0:b0:694:7da5:d045 with SMTP id k95-20020a9d19e8000000b006947da5d045mr4325288otk.13.1678310568875;
        Wed, 08 Mar 2023 13:22:48 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a5-20020a9d4705000000b00684a10970adsm6860770otf.16.2023.03.08.13.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:22:48 -0800 (PST)
Received: (nullmailer pid 3865582 invoked by uid 1000);
	Wed, 08 Mar 2023 21:22:47 -0000
Date: Wed, 8 Mar 2023 15:22:47 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH 19/20] dt-bindings: pinctrl: mediatek: mt7620: split
 binding
Message-ID: <20230308212247.GA3858368-robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-20-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303002850.51858-20-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_132251_061229_5945E4A4 
X-CRM114-Status: GOOD (  13.71  )
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

On Fri, Mar 03, 2023 at 03:28:48AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The MT7628 and MT7688 SoCs contain different pin muxing information,
> therefore, should be split. This can be done now that there are compatible
> strings to distinguish them from other SoCs.
> 
> Split the schema out to mediatek,mt76x8-pinctrl.yaml.
> 
> Remove mediatek,mt76x8-pinctrl from mt7620.
> 
> Deprecate ralink,mt7620-pinctrl. The reason is, the DTs for mt76x8 which
> use this string will incorrectly match the pin muxing information for
> mt7620. There's a new string, mediatek,mt7620-pinctrl, which makes the
> deprecation possible.

This should be 2 patches.

You aren't deprecating either. That means still documented and labeled 
with 'deprecated: true'. But again, just 'fixing' the vendor is not a 
reason to deprecate and for us to have to carry the old compatible. We 
deprecate when there is some advantage to it such as using common 
properties instead of vendor specific ones.

Rob

