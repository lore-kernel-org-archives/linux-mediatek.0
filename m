Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85538C19F29
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7X8iIHy3LYj/4krwug3nx931AvXti0vH9iBS7pE2K4=; b=QPgbHkzQdL5IkmzyFFTX4SVncY
	Eg1Qgijt/n7IfNLVqrIsLnCxScl7jclDeH8c26ECpPiY0tq6EDW7dWpsy7X4murBKaXUYjs1EBP/k
	9t8cZQ/Qzz+iV4Z+t/lLu2jFF67V4rQ04Uj31Sp2SldTsWHe0qLydYQz8mwxY3h1mZyLpVhPpkZeJ
	hQbvX6i+HLF+nyLpLKlcFhKDIvU1CVwT810vVF5n1NxudmajjR8WIbQQucL102teTGpfh3u0LCVJi
	hTZ4xKfP906i8TR3n4aJyiOHjpQW9NMGbScs0nB4v9ajd20jyII+36ow5xVHhoH9UF5noRKlw/44M
	pHQVqJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInXm-00BzFs-Jx; Tue, 02 Aug 2022 08:46:26 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInXZ-00Bz76-70
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 08:46:14 +0000
Received: by mail-lj1-x229.google.com with SMTP id s9so8914870ljs.6
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=K7X8iIHy3LYj/4krwug3nx931AvXti0vH9iBS7pE2K4=;
        b=gKMlaGsVh25UzUYMjr4Vs6/HiaqzYMDs8EuW9FSc8JTkLiwtIaBKAxFLYvLHzemfv3
         B/QzgEil+FtNljhSp9oMzcgbbnJn7osjyPu/4UWgeJoh/x6rrUitpXjrSL3ie13n9rGp
         u+7fk1bI+8s7iyQ7YODEmTTs80gLAw8YYnrhYcfwiYdm2MOb2mlzqfwKKLyYi9uD+tgv
         CCfK4OvfjAozqBZq82yurA4fnzOTHtXX7JcCrsN9TjKcuNJrZNG8FnWN+6KwWcAyv+Gd
         Bv5yoNZzwmUMv9/c6GucJm5fWWITzEHEJrTeO5HA2tNWtU/Ms9raJprzMkBypZjxXA1E
         CmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K7X8iIHy3LYj/4krwug3nx931AvXti0vH9iBS7pE2K4=;
        b=o1Yj4NyTERTbGoCdedWLlEbT7U0EsXmwqFLfTzOD1oqTdBmwa60VPi4Neb3gC/fHFL
         owg7/jzsqn0kTD8T+dSAjzzLbqLqL3fTFpNFrb4uha1aSROL+1IeGkwdOO5bKW+a7sz0
         IO8BrKKP8fBtMJP/oP2hhNBeZC62Iv8hrO6WZAtzzE13JYStY9txIolvEBTs7ylgJR+K
         5i9GDyVUkx2aLZcJoTzgrdEAm4mG9n7egrqdNSpo9E1feT/+oEhCVe+TE1mYTm70hR+J
         U5UBfx3Xrd+8E/Mx/O1pdq9br115HMg0vrOZuztCFXHEQTwnsSs32yuLoOXLC68yncw5
         Z3tg==
X-Gm-Message-State: AJIora+NbJUQ3QZSQTvc9DZRXKzDpG14oAwTHHx+nSHu2zqGhu/qjawZ
	yylC/UxMAHyCFeLbWdMtoIqy7Q==
X-Google-Smtp-Source: AGRyM1upmtLknsx94k+qHnKPOHBBNE6qH3/UR5Vxo+HHCzeGIiCrY7Pv1IO/NKUma4lABAzfE7WyEA==
X-Received: by 2002:a05:651c:1504:b0:25e:2443:9bfd with SMTP id e4-20020a05651c150400b0025e24439bfdmr5832466ljf.104.1659429969357;
        Tue, 02 Aug 2022 01:46:09 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id r4-20020ac25c04000000b0048a9ec2ce46sm2012205lfp.260.2022.08.02.01.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:46:08 -0700 (PDT)
Message-ID: <e5cf8a19-637c-95cf-1527-11980c73f6c0@linaro.org>
Date: Tue, 2 Aug 2022 10:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] dt-bindings: net: dsa: mediatek,mt7530: update
 json-schema
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
References: <20220730142627.29028-1-arinc.unal@arinc9.com>
 <20220730142627.29028-5-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220730142627.29028-5-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_014613_610608_4893B7CD 
X-CRM114-Status: GOOD (  16.87  )
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

On 30/07/2022 16:26, Arınç ÜNAL wrote:
> Update the json-schema for compatible devices.
> 
> - Define acceptable phy-mode values for CPU port of each compatible device.
> - Remove requiring the "reg" property since the referred dsa-port.yaml
> already does that.
> - Require mediatek,mcm for the described MT7621 SoCs as the compatible
> string is only used for MT7530 which is a part of the multi-chip module.

3 separate patches.

> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 220 +++++++++++++++---
>  1 file changed, 191 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index a88e650e910b..a37a14fba9f6 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -135,35 +135,6 @@ properties:
>        the ethsys.
>      maxItems: 1
>  
> -patternProperties:
> -  "^(ethernet-)?ports$":
> -    type: object

Actually four patches...

I don't find this change explained in commit msg. What is more, it looks
incorrect. All properties and patternProperties should be explained in
top-level part.

Defining such properties (with big piece of YAML) in each if:then: is no
readable.

> -
> -    patternProperties:


Best regards,
Krzysztof

