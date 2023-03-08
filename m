Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BB0C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZdO8B4SE0hK6baO5Lz8pAHYpW240oNtgnEAr4GbZks=; b=cAG1Ns2oE/JmyCzmUerIBSCJPF
	PqFCUWZiSduZPAxtNrtyognvfz6t53yuQd1JiHi1MfBQ3hX/uLtG7VqYNyxgM1a3Ofdhq3NrV5Plb
	NMGI0Apn+nP1HTx1SuliRb3QuzRws/LOMM94k5/66i2GGBm9vI1sYJtqEcSOc+jw9hkNMTXJBCsoF
	hRqvtDiqKz6gX5LcUGW5vk3gnr9bJmEOFqSdYYEIHgYGFbTcDTgitGetMMze2FKB8OwJNev/Q33D+
	HZINHlgc+VEnXL1c8Njd3XO3/23bYasluLAAOmZsZ9lhkuxQeJIhgw2z3UJQxxSbXcnFScZMyqTzo
	U+4KBcAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa0tf-006kN1-NL; Wed, 08 Mar 2023 21:00:27 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa0td-006kLm-Es; Wed, 08 Mar 2023 21:00:26 +0000
Received: by mail-ot1-f53.google.com with SMTP id g73-20020a9d12cf000000b006943a7df072so9709295otg.11;
        Wed, 08 Mar 2023 13:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678309218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZdO8B4SE0hK6baO5Lz8pAHYpW240oNtgnEAr4GbZks=;
        b=1j5om/V2d+NyMXAq6taIdTxEuuiwopdM15PlFGnJHSwb3Pv6LxtZIjk/4cliRbColD
         uIJ51w8Nn91KN8u40cZG3BOLyKG371QAxDxsJ5s15WmzXJ9NzrIujuQsPhBxOW7MMqRv
         r1MoUM1ubFjq4FgUBuGiK61WGH1TElrFrj+N/RXOUWCJsagBkfkruAQyFJRRuNToRn6v
         nJAVqCeZpuiuCS8HUrR6ysua9W+XBXMT7g/XxEPMzSbBXX1daBbkltLecCqr5yZ4OrQU
         gQX7aW9D7sMUpDlxVvKVGwjJ1DMUGMZfrfLRfn9nm/rVWERAwDpvpjNug6NCEInZZ7Xx
         TPTg==
X-Gm-Message-State: AO0yUKXlCfcyuYTksGpD1bsv6pMIg+eVr/OrjoNW60tT9fW7iJggEj54
	7UMhVgaK/l+coCLQ3naywQ==
X-Google-Smtp-Source: AK7set+tW7tYKfBIsVQdLPPlbctu7CwHbL8aGPyNilvWijRtLffT6epCXw3arwIWAtYdIAEiSgtH4w==
X-Received: by 2002:a9d:715e:0:b0:68b:dfcc:bed with SMTP id y30-20020a9d715e000000b0068bdfcc0bedmr9758516otj.15.1678309218403;
        Wed, 08 Mar 2023 13:00:18 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f9-20020a9d5f09000000b0068bce0cd4e1sm6804531oti.9.2023.03.08.13.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:00:18 -0800 (PST)
Received: (nullmailer pid 3767368 invoked by uid 1000);
	Wed, 08 Mar 2023 21:00:17 -0000
Date: Wed, 8 Mar 2023 15:00:17 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH 08/20] dt-bindings: pinctrl: ralink: add new compatible
 strings
Message-ID: <20230308210017.GA3744272-robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-9-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303002850.51858-9-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_130025_522912_6CAB83CB 
X-CRM114-Status: GOOD (  18.52  )
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

On Fri, Mar 03, 2023 at 03:28:37AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Add the new mediatek compatible strings. Change the compatible string on
> the examples with the mediatek compatible strings.
> 
> Add the new compatible strings for mt7620, mt76x8, and rt305x to be able to
> properly document the pin muxing information of each SoC, or SoCs that use
> the same pinmux data.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++++--
>  .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 6 ++++--
>  .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 5 ++++-
>  3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
> index cde6de77e228..a94d2e7a5f37 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
> @@ -17,7 +17,10 @@ description:
>  
>  properties:
>    compatible:
> -    const: ralink,mt7620-pinctrl
> +    enum:
> +      - mediatek,mt7620-pinctrl
> +      - mediatek,mt76x8-pinctrl
> +      - ralink,mt7620-pinctrl

To repeat the options from last time:

>Carrying both strings is a NAK. Either you (and everyone using
>these platforms) care about the ABI and are stuck with the "wrong"
>string. In the end, they are just unique identifiers. Or you don't care
>and break the ABI and rename everything. If you do that, do just that 
>in your patches and make it crystal clear in the commit msg that is 
>your intention and why that is okay.

Marketing/acquistion renames was just an example and common reason. That 
doesn't make other reasons okay. I don't see any reason given here.

If you want to break the ABI (do you??, because the commit message 
still doesn't say), then you don't need "ralink,mt7620-pinctrl".

Rob

