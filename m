Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14704C7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vUINqOYszvGwT0XKdDs8Gu9wUN5D6gThM9IEXkJj2w=; b=xkWOdqatz2eH2yaFjgFkmqT3NR
	3h6sGMPf5IIrfGnAWjrmO6NdCWAA41CwaiIZjsMXpbkzDxgdewHXqQN1MxMcCytrdSxKBISRlehxu
	UwtD/JHC2GRY+kLtPYcsXlbAUuMCGCkPuOKSx+fuyzLBrYKCpXM18FdVSbexZT+FhmEWDJFAqK7Ei
	mbHfyBMzZxWMRDNa2Q/TJ4RRMUSfnQJ6IoIbgNPwmEXYJVLW3BfFYIbOPaw8zZ2Rft3YdO8bhxNmC
	avNxgO2y3hvYxSXIEI2Pcrhi2484rurjS1joRsoDi+SEyEy6igpomSfJgpw+71h2a+Eu3YTtM96l1
	aaj/waew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUxe-008M2n-0e;
	Thu, 06 Apr 2023 19:07:54 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUxb-008M1L-0V
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 19:07:52 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9188b85a615so161928666b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680808069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vUINqOYszvGwT0XKdDs8Gu9wUN5D6gThM9IEXkJj2w=;
        b=j6pFVDBS2MI/Ihhuw3fRPk/bgetdTJnUSrfSjSuWPWvnCXZ5uVpE0fvtFH1oXeTgC6
         99ux2icL3Obo4pvFwyTd+/J6EKX+B/17rRLMhSm/g8S7lJXXrW8Ml5glYE1m0fM/cBzw
         vswDUO1N5t5W2NiKCv3zjCbH+lJActf3RkEEaZDLBEkfXfy5HcquovIQ7NJfDq3NmFAM
         NoMIY0wle6/pxEbiAS2tjkVQsF7SypnUlz/uIKd13jeY2BR8GbpdFOwoMxzGNK552VXc
         NN+s0OTeVACT7FXt2ujbb4dJQyuXk5LKdw90H+6K/YjqMJQP8ofWfO5nzFjPeus2zn1d
         RqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680808069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vUINqOYszvGwT0XKdDs8Gu9wUN5D6gThM9IEXkJj2w=;
        b=GAUwIvHixdBm/wHgBE3JQ0I1cu4aVRbMZn6X2xQTJzPGVDE4yQ6zPbPX3kbhEpHP8q
         mndAABmWdCdiRucfJuBmVBWjzYEoPe3LyzsfCYwyIhHOaKJbjSFUYLUnefGAFfO/RRk0
         YiUGC/KE15gy4VpnysqhBwAZMO2fg0AnNs5Ym56HintUZ7dICkTo9L65uVU0uvE8Kcz8
         eWuyqiOmb3F3wLAYu77acEqPiXigg7hNk56QzhVhDgydUXNRHeYwphuIJHdjVzDjvOqZ
         HwoaLFfCB264hexryr2Fin49oH1BlhDULLGd1GOgqNaqMySpchHAw58RsIfxGGsPFcLg
         oPZg==
X-Gm-Message-State: AAQBX9fQd+5UzLqbED5Mlz1dmuRZnLJGsR0AT5iqxuK5wK6xWYfTqwjf
	yAE+I//kCQh50GMOEOq6e/VF9w==
X-Google-Smtp-Source: AKy350YwR3t8xnRd20pwg1W8Z/XQGMKGP6GoSbJXEkmmNkumWPAdRpK+bEf2QP7xEZ3diRjVyfh3Lw==
X-Received: by 2002:aa7:d290:0:b0:502:928d:4c93 with SMTP id w16-20020aa7d290000000b00502928d4c93mr491440edq.14.1680808068721;
        Thu, 06 Apr 2023 12:07:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id t10-20020a50c24a000000b004aef147add6sm1060608edf.47.2023.04.06.12.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 12:07:48 -0700 (PDT)
Message-ID: <23c8c4b5-baaa-b72b-4103-b415d970acf2@linaro.org>
Date: Thu, 6 Apr 2023 21:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/7] dt-bindings: net: dsa: mediatek,mt7530: add port
 bindings for MT7988
Content-Language: en-US
To: arinc9.unal@gmail.com, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
 <20230406080141.22924-3-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406080141.22924-3-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_120751_192978_EAB9540B 
X-CRM114-Status: GOOD (  18.34  )
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

On 06/04/2023 10:01, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The switch on MT7988 has got only port 6 as a CPU port. The only phy-mode
> to be used is internal. Add this.
> 
> Some bindings are incorrect for this switch now, so move them to more
> specific places.
> 
> Address the incorrect information of which ports can be used as a user
> port. Any port can be used as a user port.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 63 ++++++++++++++-----
>  1 file changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 7045a98d9593..605888ce2bc6 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -160,22 +160,6 @@ patternProperties:
>        "^(ethernet-)?port@[0-9]+$":
>          type: object
>  
> -        properties:
> -          reg:
> -            description:
> -              Port address described must be 5 or 6 for CPU port and from 0 to 5
> -              for user ports.
> -
> -        allOf:
> -          - if:
> -              required: [ ethernet ]
> -            then:
> -              properties:
> -                reg:
> -                  enum:
> -                    - 5
> -                    - 6
> -

I have doubts that the binding is still maintainable/reviewable. First,
why do you need all above patterns after removal of entire contents?

Second, amount of if-then-if-then located in existing blocks (not
top-level) is quite big. I counted if-then-using defs, where defs has
patternProps-patternProps-if-then-if-then-properties.... OMG. :)

Best regards,
Krzysztof


