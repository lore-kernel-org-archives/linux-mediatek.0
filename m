Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F0CECAAD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8shYHI5qnyesibZOJHcF69skgsSb++vkrS1ksDjd804=; b=ZA+fzAO194cPLxVjlXU70b82ha
	D+uNtJ1DFg5OF3SoUTU7XrxXxiurSWNHeeihMT181kpVwPWU9UVeLSKSlE/uqDfNcy/341Zp7tsCj
	6rh26SOsfkQgAZ3nOYkqSa45eHXB5yrcv8DToE/QaBDIGCyXk6B+f0UNFcCjcaO04QFxoHuUu7uxV
	Ol+siqDYa/LVhk74G6j3+oAvynN5veEzUsdG09vtfgvnXJvZr+zvW+6VraKtHkcdZSwj+DFg5H/fA
	vlrJUt9MWTB1D1izKAd+DJdzeG+GHJ7T9qpVcAhe+cCEIn9WPvFEIt3ul16HUfJf2LKdwlXFujAg3
	ZwBY1+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT9T-00EuIt-9m; Fri, 26 Aug 2022 06:49:11 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT9Q-00EuAe-R6
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 06:49:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id bq23so803253lfb.7
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 23:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8shYHI5qnyesibZOJHcF69skgsSb++vkrS1ksDjd804=;
        b=MH7c4PTN5491vzJaxItrJvsp2d54VdHCleNKYtUufTivwe8sp8YtCzh0L2FmeW9dmk
         cPC6Giw77c99htJDRJsu1c3pkn0AE/2MmQEO5RXvMKpobhfK6ybYGyCI03FLGHYre8Ff
         FnVmEb2Hqs+bP4F0rdJnDpuC50IHB0b6+QfNx9fOR+MQMrkZ+uk/iKSQzG2jJwmrJW65
         kX+eQtPxqW9fBgeKH/iHADmXjHLdCHAcemrawwjCu/PqirMZxeIgJ3FhJlSwnxMY+pdt
         qCWT+VH0PjC7BeGmrh5ST2hkUxAHCn39yxaoTC1Ca2f7reZc7/lmj7adqCxUvhfGpcxd
         ABDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8shYHI5qnyesibZOJHcF69skgsSb++vkrS1ksDjd804=;
        b=ImXF52YlSO22jYIOdNsyGTfCv2DOx4J+VzLWoh3EzfTZ/8mWjoSJ4KeFBujjwk5KxN
         LDf8PqR0OxEzhmG5gotiHpNJEthJRJhNUJ+eL1tlwfsk4nIHsU5ZcR0vaIlp7p5D/A4c
         23QRo0xstLXZnlg1jhZbfLXuN04VNXqb7Vxd7tGRwPmb/BPVuGW1vGhLb0QXVT8bqgz8
         NJg8x6VKdtVkLj8MFKiS9vDAxyAsz3eMWhAmE84N9PmhBqwbpOfd610uNOiC1/Skowzf
         lA8AKbrkXYplJ5Fq8hjPqa0NZjVU8mOius67HvhHcxFjHH0t2CX8DnM5uXKBOpLXgBkz
         9LTA==
X-Gm-Message-State: ACgBeo0O9KppVtDW1pAaobHQzcjLzJvI+VZyJOJRHXOwAyG/ThQZauzp
	wwwBAR4n3b2V+L4QdITC2Pg85A==
X-Google-Smtp-Source: AA6agR4n8wu6cU+e1LJN+2qT52EhS0729YcyXjrhMcjUf6IOv1gJPCfT/e0dK9/QvHZSzhUsmvvuXQ==
X-Received: by 2002:ac2:4907:0:b0:493:266:74d6 with SMTP id n7-20020ac24907000000b00493026674d6mr2270018lfi.36.1661496546143;
        Thu, 25 Aug 2022 23:49:06 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id w3-20020a05651234c300b00492eebe1f09sm269321lfr.74.2022.08.25.23.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 23:49:05 -0700 (PDT)
Message-ID: <a1c4e262-caf5-7369-f8f7-02d790fa1947@linaro.org>
Date: Fri, 26 Aug 2022 09:49:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 5/6] dt-bindings: net: dsa: mediatek,mt7530: define
 phy-mode per switch
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
 Sander Vanheule <sander@svanheule.net>, Daniel Golle
 <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220825082301.409450-1-arinc.unal@arinc9.com>
 <20220825082301.409450-6-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825082301.409450-6-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_234908_901695_B5ED6D01 
X-CRM114-Status: UNSURE (   7.37  )
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

On 25/08/2022 11:23, Arınç ÜNAL wrote:
> Define acceptable phy-mode values for the CPU ports of mt7530 and mt7531
> switches. Remove relevant information from the description of the binding.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

