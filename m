Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 06:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XP8GcoqhMmEE8O52diABied3M/+MsTQpsRcWyYY0afE=; b=Qu69Un0GrLrQJw
	OS9qYs4QfQjJBxcYAwBbZoBIg3tS9ve3MVu9oKNIL0W55O6C/fl+iZuJZm8gIpE/ErPC25ajlC72S
	hmMx8Td4zL+9/ksa2AN8Bz8M+mhAogewSL8YeE72LFL/1rapiOtEubyOg1K32pemPNTCriiVk7Grd
	cX92jyZzgPjdkBbMqjHk+CaBtv97TgWuDjyoX3zcXM49OdsbgA+6Zv9+IBSVxdPhYMHEpibcULtuX
	A9PJLOrOA50W/GJwW0b9EdPDG8bw+Qo3eP6XGOQNgO9Dw2b+w+vRRNXNeI2YTn22hZbK/CzFe9btK
	Q7DbWDZwhxGO1NabS8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnxCg-00CkvJ-1J; Mon, 09 May 2022 06:49:10 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnxCU-00Ckry-IU
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 06:49:01 +0000
Received: by mail-ej1-x62a.google.com with SMTP id y3so24812339ejo.12
 for <linux-mediatek@lists.infradead.org>; Sun, 08 May 2022 23:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q1uIYNMhCGy4rHwwDKHArD0ERJS+cdwEigc/mkUrZDE=;
 b=Mb0zfiXOc10IiOZfJPPokzGs7XcA/7jpw/OIqiOD+eKHEEsR1Q8LBthkF/q+eCNL29
 CNGF1orY/xbxnus7pNzHJc2rJ4hOzmuJys+rDQCMyCEucN8qhlKgNcvURUdntg2LzHu7
 7E7lQyEi2FDEMzsqYFb2X+SLS1EAc6JlpK5VkFRL+zO5uZKLmlpNioK4Fj60HzsZN1vX
 ec7l2HQWwDeLv+WTTo+80RDvwoc1NYTcGHJmLSv7VC6l6mmS2ZGxNipWSLC08vksFOL0
 /M3W0fCxSW7ck/tuBf9nezQw4LZIk2fYn+hF5ajNJZzP/Ex0N+VLa979LoJK3QdeyuSK
 l13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q1uIYNMhCGy4rHwwDKHArD0ERJS+cdwEigc/mkUrZDE=;
 b=mcMlAbTxXDCVYUs9fxwbku4RboZPGRgO+papz3n96orOrtLTa/vptZStnnNwIk6E4A
 P1JWDvme7Lq8dgIhqV98lpp2ggAynXaVspxtiktiooGY6+gLZswJqkI+wotxmrK2s3wY
 ohdex4yiqQejnhxLNyG/iNp9cgoyjHQjxGUsbKlSCXOqeul1ClvOu0lIa4AXjTr7NmUZ
 v2nRpkceCs8cv6hekMyNezsSYQJnT5uE9Mxee5moMIFZgk3ZnnBa0rDJW0w0xbXK0+lx
 rELpKT0ALNyUMI3UOFH52yPIxTkiGx/DcueBea2+YM9d1K8wnvyOYBeKE5Suzzjlvw6W
 JETA==
X-Gm-Message-State: AOAM5330NISqVul96gnV8mtCSWZcDEhVCFkDX3Sp95PgFPCtUism1jEF
 Kt+7liRfbVOcn8OnDuWZ4exmYA==
X-Google-Smtp-Source: ABdhPJyVxgI4jg1+VhdIEC/Y1keifAQgLTtp3IHMJw9n628QQP1fmw3bGVB7LsEt9DCpBaOcdsvJsw==
X-Received: by 2002:a17:907:1623:b0:6f6:e9ce:9926 with SMTP id
 hb35-20020a170907162300b006f6e9ce9926mr10073326ejc.360.1652078934509; 
 Sun, 08 May 2022 23:48:54 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 e1-20020a1709062c0100b006f3ef214dafsm4714932ejh.21.2022.05.08.23.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 23:48:53 -0700 (PDT)
Message-ID: <41d6b00f-d8ac-ca54-99db-ea99c9049e0a@linaro.org>
Date: Mon, 9 May 2022 08:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 5/6] dt-bindings: net: dsa: make reset optional and add
 rgmii-mode to mt7531
Content-Language: en-US
To: Peter Geis <pgwipeout@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Ungerer <gerg@kernel.org>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?=
 <opensource@vdorst.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20220507170440.64005-1-linux@fw-web.de>
 <06157623-4b9c-6f26-e963-432c75cfc9e5@linaro.org>
 <DC0D3996-DFFE-4E71-B843-8D34C613D498@public-files.de>
 <2509116.Lt9SDvczpP@phil>
 <trinity-7f04b598-0300-4f3c-80e7-0c2145e8ba8f-1652011928036@3c-app-gmx-bap68>
 <CAMdYzYrG8bK-Yo15RjhhCQKS4ZQW53ePu1q4gbGxVVNKPJHBWg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMdYzYrG8bK-Yo15RjhhCQKS4ZQW53ePu1q4gbGxVVNKPJHBWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_234858_664660_509FF450 
X-CRM114-Status: GOOD (  22.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08/05/2022 19:04, Peter Geis wrote:
> On Sun, May 8, 2022 at 8:12 AM Frank Wunderlich <frank-w@public-files.de> wrote:
>>>
>>> I think the issue is more for the description itself.
>>>
>>> Devicetree is only meant to describe the hardware and does in general don't
>>> care how any firmware (Linux-kernel, *BSD, etc) handles it. So going with
>>> "the kernel does it this way" is not a valid reason for a binding change ;-) .

Exactly. The argument in commit msg was not matching the change, because
driver implementation should not be (mostly) a reason for such changes.

>>>
>>> Instead in general want to reason that there are boards without this reset
>>> facility and thus make it optional for those.
>>
>> if only the wording is the problem i try to rephrase it from hardware PoV.
>>
>> maybe something like this?
>>
>> https://github.com/frank-w/BPI-R2-4.14/commits/5.18-mt7531-mainline2/Documentation/devicetree/bindings/net/dsa/mediatek%2Cmt7530.yaml

Looks ok.

>>
>> Another way is maybe increasing the delay after the reset (to give more time all
>> come up again), but imho it is no good idea resetting the gmac/mdio-bus from the
>> child device.
>>
>> have not looked into the gmac driver if this always  does the initial reset to
>> have a "clean state". In this initial reset the switch will be resetted too
>> and does not need an additional one which needs the gmac/mdio initialization
>> to be done again.
> 
> For clarification, the reset gpio line is purely to reset the phy.
> If having the switch driver own the reset gpio instead of the gmac
> breaks initialization that means there's a bug in the gmac driver
> handling phy init.
> In testing I've seen issues moving the reset line to the mdio node
> with other phys and the stmmac gmac driver, so I do believe this is
> the case.

Yes, this seems reasonable, although Frank mentioned that reset is
shared with gmac, so it resets some part of it as well?




Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
