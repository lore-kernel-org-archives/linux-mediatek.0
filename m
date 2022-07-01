Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A35CC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRqXDVBh2tyzQxE0lZROBHIZNd62HH6YkugnzahAVfE=; b=pteoAqKxAabMZymJHnqRRCNCzY
	ok6mn4YafBso44/PSBpLg44Kkyh/cI2U8Pz1B+2V4UcK8fWzV0DQr7ytfYl/d0wc2SoMwyYvdY7wF
	ARt0QLLtcgGbM2IQ64AtaTSn84O35FEjsY0C3yOXstVhbvBgPboMnQcE+tpcPHkvSe5RfUttXF7Nc
	2+MTG/Sz4JDDFpTTqe+m8Fvr9JA+GPTZfxl+rDQ63koizXOqV9gbhdw1qEVj1rwpYvVDQ7dTfTXTu
	hRzOqOcWi2ZpnbuffdqDPBWqpseWDIe3Ql1CXuFQP62uvYMTHS9BUdsgfRBVkJlrFLUk586tEyX09
	0cJgU9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PAI-007EHh-F5; Fri, 01 Jul 2022 22:31:06 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PA6-007EFG-U4; Fri, 01 Jul 2022 22:30:56 +0000
Received: by mail-qk1-x72a.google.com with SMTP id z12so2845607qki.3;
        Fri, 01 Jul 2022 15:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZRqXDVBh2tyzQxE0lZROBHIZNd62HH6YkugnzahAVfE=;
        b=DSaCxZBgTmQp1xce3Jhu90CL1ztuJjAzTXLm35TAcdlEwGPjL8vSEQH7DxAmv/O/39
         uWskVo1L2IAhL6MYAVGTkn3tB+IrMnep4ORmEqpwbA8qzRJbaWJxhG7y5Vxw1Q4SL8lp
         HR85ZmyZWwvviBhDk73MDgMkRjWnmBKFlO1RbXW2GW27wjK3i34h5wd9BhfXxeME/5Nn
         vJwqzWzdVhWwF6LafX0GhhxljaQUnYYp/DplBCRCd7UDPhinw4luglRUCkEYaOsXKc5Z
         edE0fg6BBBQO1I9bfOQmC1ZaEa1Qu8JWRROn6hw4RI/BbLfftcARZO6wDbvvrmy8Id51
         IY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZRqXDVBh2tyzQxE0lZROBHIZNd62HH6YkugnzahAVfE=;
        b=BKa3atggpIhXJAZvxy/9NJTWCOrhs0KUWg2wPhE/mcyII1wHIHJk/Gkg2vzCVzcip+
         QicbzkGkHflcLr702yEQlsKHC+BPeb9hrxG3PbTmeuUiguDANo5HSdGVQXwt42yv2hPS
         XBgs6JCG0HR6oBuB23SVf0mOKBfLMtPWkY3CbremWlN6pPU/z8OHnR6UqDQnchbGLup2
         C3jtgOeGLDXPC1eekZOSP3GVhzsQyOSiPCH9l3/SkxlBDLm7Fp+KO1jbrcHPZgm7bpy5
         ncMYkf8t1sqXEsKWkZZiuil13yuE10st9fJ7NLoY2CfO5VF0bZ1Dkw21rOrU/AzHVh2o
         oYQw==
X-Gm-Message-State: AJIora8YA+COdKWBl6RxaqTqRLN58QYIEunk0BoLJRSvnStDhkQRHAfX
	QGZW512pl6dnYxtreS2Uc1k=
X-Google-Smtp-Source: AGRyM1vB1SZ62N+Gy6jjsx4kJJzWeanIHG6jkt/r0+yoo6UePFIYHvj4XFuf4u/EPQXOjEjQmUmhxQ==
X-Received: by 2002:a05:620a:3c4:b0:6af:6468:1c0b with SMTP id r4-20020a05620a03c400b006af64681c0bmr12494113qkm.584.1656714652751;
        Fri, 01 Jul 2022 15:30:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id h2-20020ac85482000000b00317cd3edab4sm14284228qtq.11.2022.07.01.15.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 15:30:52 -0700 (PDT)
Message-ID: <fe25fc8a-843c-72c2-e352-88fe9d819ac2@gmail.com>
Date: Fri, 1 Jul 2022 15:30:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: Add missing 'reg'
 property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220701222240.1706272-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220701222240.1706272-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_153055_051513_9F6BAE7C 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

On 7/1/22 15:22, Rob Herring wrote:
> The 'reg' property is missing from the mediatek,mt7530 schema which
> results in the following warning once 'unevaluatedProperties' is fixed:
> 
> Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.example.dtb: switch@0: Unevaluated properties are not allowed ('reg' was unexpected)
> 
> Fixes: e0dda3119741 ("dt-bindings: net: dsa: convert binding for mediatek switches")
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

