Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A7FC32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKznTXWDR+Kv5wQQVujXep0zxIuY4TU9+ONSWdaXIj0=; b=XMp8HvG3jARoEQZ0EAR1EhB1Oe
	/1pLm06tpBkvIG2k9MBqBtgj3LrtIeQv2uwSOPSho7JJiXpAcOBSbo+bAVLwdHitHoV8NNSWOLvYm
	fStTYpKapLFOBpmFIHJfHDnIw8TtgwUebhOpZCmSy4cf1PwtkQ+8DcaGedJMOOa/E+dx5olpzGN04
	Tadfuf2maeqnjnUb1Flzep6dUaUmo30AQ0SgNEVlruYdIroKyv7zUKB4SRrojqTUEpE4OWNmb7Bwj
	NderTkUnl2DsvqUQO1ZAXGcRZ9VN47zJd9YJwYEOd1r8SMrSkUxvq5zmU53ul0F2nCWgmRGb4Pos4
	t4gMc18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Lf-008A0r-42; Fri, 19 Aug 2022 12:43:39 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1LO-0089V1-4a
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 12:43:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id l19so1266756ljg.8
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Aug 2022 05:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=pKznTXWDR+Kv5wQQVujXep0zxIuY4TU9+ONSWdaXIj0=;
        b=X2S1z8Ms65wvTrKmPx1zZ3BXZ/jEe7vsC1zkUhzletCMhS3LPvh0wLsK/4P3KZzXMB
         NjAAEr2lIP/vb4atBN5tHBFAmNM5awZsEW06f3Qaj2WhXfruiaHRMvKxCzRFqt7oeFmh
         HxaCVBML4Kf1LL6WxE+bSea5/Mfv60uHlhtnqiWWVl3fOQw+fUlzGiUr7UIiJPHCuFod
         5yFGJ6gFOqIspdQYL89Y8PvcOu9Q35LPazGjSaw3ihZZ0taDrkeiWe3/8eAJjE9W8Ch6
         OVWI48njeIbvwNUj5qKAt2ruXfi9dttRjFhBbT7Gv64NxTyO5cCTE8vhmIO2epkZbRyQ
         nXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=pKznTXWDR+Kv5wQQVujXep0zxIuY4TU9+ONSWdaXIj0=;
        b=DDLEfeEPEocpaB0AXwmqdxBYDbKe+Co/apXO2PgVoQb0gOuA6B8Dfka0SzYVy7P9fu
         n6lm3o41/3QJS2IyRDUvprAqRDdOamChfUHJ2xK/E55aZ4onmuL7viIPvpHWx3tIs6Ra
         dfA/gFvXgdXrV8+hxkG3y7rA6V5NXT33KcPXGfrgKdH2fMt+ngsA2n8hZ3ixUFStGLBv
         m9eH+XrXWz1w1QjqDYXv9B1lggnAvkik+5pbfEM9L7vga3slSCRG1cvtQCc4AJ0DqKit
         RvaZETFZWMauT9p21LGorJLYyYOl0RM6T/LQHitSpPpjdEdBim7SsyvuVvh7FtPAnLt6
         HTEg==
X-Gm-Message-State: ACgBeo2BdXPT496HLvHiKxzYWEvTYqgO3luBkqVAsHNGS8nRFJqwpQzM
	yHvOffl7+j0Uk+uqywiChOfeAA==
X-Google-Smtp-Source: AA6agR52ozPQssGxEMx7KiQ0nCmu0UHipXpj72bnOAWi1YYRjmW1LEVpZTXaQqqkvF5L1ZwhnbVJ6Q==
X-Received: by 2002:a2e:9985:0:b0:25e:c148:dfc4 with SMTP id w5-20020a2e9985000000b0025ec148dfc4mr1958412lji.69.1660912999706;
        Fri, 19 Aug 2022 05:43:19 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id k14-20020ac257ce000000b0048a7d33e0f0sm623640lfo.261.2022.08.19.05.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:43:19 -0700 (PDT)
Message-ID: <d2279a7d-bbc3-c772-1f30-251f056341bb@linaro.org>
Date: Fri, 19 Aug 2022 15:43:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/7] dt-bindings: net: dsa: mediatek,mt7530: define
 port binding per compatible
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
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-5-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220813154415.349091-5-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_054322_239042_52B7B94D 
X-CRM114-Status: GOOD (  16.77  )
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

On 13/08/2022 18:44, Arınç ÜNAL wrote:
> Define DSA port binding under each compatible device as each device
> requires different values for certain properties.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 116 +++++++++++++-----
>  1 file changed, 87 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index cc87f48d4d07..ff51a2f6875f 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -130,35 +130,6 @@ properties:
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
> -

my comments from v1 apply here

None of the reasons you said force you to define properties in some
allOf:if:then subblock. These force you to constrain the properties in
allOf:if:then, but not define.


> I can split patternProperties to two sections, but I can't directly
> define the reg property like you put above.

Of course you can and original bindings were doing it.

Let me ask specific questions (yes, no):
1. Are ethernet-ports and ethernet-port present in each variant?
2. Is dsa-port.yaml applicable to each variant? (looks like that - three
compatibles, three all:if:then)
3. If reg appearing in each variant?
4. If above is true, if reg is maximum one item in each variant?

Looking at your patch, I think answer is 4x yes, which means you can
define them in one place and constrain in allOf:if:then, just like all
other schemas, because this one is not different.

Best regards,
Krzysztof

