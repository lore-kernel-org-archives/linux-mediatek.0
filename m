Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0125C32792
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPkz8CIReFRkXXNi+9wXJA08oHYjzaiWMjPixEXkoww=; b=qlYthP3LPbl0W/9gIUSCTINjAw
	Wo39fkK3K6C8dhkcDajwSR1YirMPRkwDRxRmhgtXUAODVMP+TwG7YGkvd2bURF7QR+wF8RVbMQaf4
	sPRWQAWjd3t2jYjeLDwlz8IVLVn3WugkzJFnF+9khVNzEicurrPB0HAgnrP9ToJAlJyLuTU3dpSnX
	e5mYWZfzshu6SonSnPJW5vdbqTcNyiVJdtBfab7m77xEUAXv8aH0j8f8CK0YjqCLVmMGT1fFWnEGF
	G0x8hou6snuzt4N2OFadOPSfnhXzoFeT81/4ZRDCfOkIipBD/PTu2TXsAs2iX6nSvx2mb+M3AM+IL
	gaAEznmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRS0-0055cY-Mg; Tue, 23 Aug 2022 10:48:04 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRRw-0055We-JW
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:48:02 +0000
Received: by mail-lf1-x12d.google.com with SMTP id l1so18579022lfk.8
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=NPkz8CIReFRkXXNi+9wXJA08oHYjzaiWMjPixEXkoww=;
        b=iigcejhnAnjVrYq+8ynJNXJJa0Vfsj8KP5tp65+xPF/AC9cPRgUrB26NE3gtauWUwx
         qQD9jaFSKTuo5y6taEgj4zT5WglBx2XFrToeNbs7P2yVO/qXm550HoYgwANo/8U3l2X/
         qD6uIGFVGhfDTFVBzn0eLuBTuJDoRlIwZQ+IIvjVqLH3q805BXxLnwm4kY/v8HsVVfbb
         a8o8/TZEs0PF91gyok9kM1GOBPuEXGkN/kg9f0C7mM/4R2yBD7QZXsKgCsCNKc0P0EIV
         jbxzrxOeX0LPVaXkLwbTQ/iqDPUtOab3XBE2USm0iPAzVuHlVxBxdzZJjjqrjHU3TtnO
         r1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=NPkz8CIReFRkXXNi+9wXJA08oHYjzaiWMjPixEXkoww=;
        b=hw50Ykv8yCK9NLfZI2s+c42DTas9Y9r4q6kBiWYURn0OuYB72HxbfOj9MfDb005lzm
         p46S+IK5G+z796NXoWsdUgGHw3CUHmxTpVLDhU1jymgte72dVLOqvjo8ZAw5hcfD4BWN
         UgSMILERy4Vgy47HmlHOUZFy9XAxhJbN9rN5kv77vaHDUWeDUYla33eZdK7FoYILyIue
         N50FezV36yd6uK8Wcljw9Us2gNFmaKG+i1IuBjXUfyvuWcyHKpYW6yDl1EAKYQA54gNY
         ZsjOLFQl+q8U1/LV4OkSN8hjtVzRQIUPf5Sc2e0Zrw7dSPnQGPrXdMuojRsWrNPQutRt
         e5NQ==
X-Gm-Message-State: ACgBeo1YHmZ601AMrjilHV3nBVgvOHVuhzky3SfyRFRuJf7mAvfj1qoZ
	j5Y73rv5rp3HsbRVeVzgR5Prkw==
X-Google-Smtp-Source: AA6agR7u26JTojsyB4JuWJX8y8BItLKRip4aR1+/399iD/iKWu9l7BTdi42s42J+uuQrVDAiJBBmGQ==
X-Received: by 2002:a05:6512:c10:b0:492:d263:f918 with SMTP id z16-20020a0565120c1000b00492d263f918mr5533940lfu.501.1661251676796;
        Tue, 23 Aug 2022 03:47:56 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id x16-20020a056512131000b00489e812f05asm2441697lfu.21.2022.08.23.03.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:47:56 -0700 (PDT)
Message-ID: <c24da513-e015-8bc6-8874-ba63c22be5d6@linaro.org>
Date: Tue, 23 Aug 2022 13:47:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 4/6] dt-bindings: net: dsa: mediatek,mt7530: define
 port binding per switch
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
 <20220820080758.9829-5-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820080758.9829-5-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_034801_375688_FE15DB2B 
X-CRM114-Status: GOOD (  13.22  )
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

On 20/08/2022 11:07, Arınç ÜNAL wrote:
> Define DSA port binding per switch model as each switch model requires
> different values for certain properties.
> 
> Define reg property on $defs as it's the same for all switch models.
> 
> Remove unnecessary lines as they are already included from the referred
> dsa.yaml.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 56 +++++++++++--------
>  1 file changed, 34 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 657e162a1c01..7c4374e16f96 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -130,38 +130,47 @@ properties:
>        ethsys.
>      maxItems: 1
>  
> -patternProperties:
> -  "^(ethernet-)?ports$":
> -    type: object
> -
> -    patternProperties:
> -      "^(ethernet-)?port@[0-9]+$":
> -        type: object
> -        description: Ethernet switch ports

Again, I don't understand why do you remove definitions of these nodes
from top-level properties. I explained what I expect in previous
discussion and I am confused to hear "this cannot be done".

Best regards,
Krzysztof

