Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13939C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jr8oE61NhRIq5ZsnsT8b0rg0+Oxtl2j72+/LPlx4O9U=; b=VSyBSKyvDSmays4vCyRVvIXjuW
	CSak0PCm3SaWc1gyCjWJjH/tYEly1uK6nBHGS/09D55+xh3Ojaq41NAr4YPTxZXV/p4lm+B+4hm01
	xrz7rYjfMB0tKyger1vv6td5XSIOFEPVUuf8O4XHJA0jpdxN54wOIEvyd1Rmiha2u+NMf5V7sz9Xd
	KL38ItOIeQvdQ/i0nus+5IutICh1slz5/deHHEvqXakZQcP0NO/Lu2+r1vLm1TDL3YsSUfD+4JUkC
	wq1zOSjs80TSflyWOJKBye0cwW3wVfoMiuqEd8Gp44AJBLtYHKfP4CnQNyb6BxNsk6MgQwNziYDlN
	cpP8++VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaw9z-00ASgv-HN; Wed, 21 Sep 2022 09:36:51 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaw4B-00AQBT-TP; Wed, 21 Sep 2022 09:30:53 +0000
Received: by mail-ej1-x62a.google.com with SMTP id dv25so12136004ejb.12;
        Wed, 21 Sep 2022 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date;
        bh=Jr8oE61NhRIq5ZsnsT8b0rg0+Oxtl2j72+/LPlx4O9U=;
        b=TMKQLD+XciKaaTQSYkvB3tJ8eNcp4xWvlqLGsi5r3tIQqHj2qxYrC0WoiDJfaWogCw
         x33dXgcrIMpKRIp7/Zqrx8QlRwgFz+GZcQVN0ArhSdwUlXHpPGoshEaTjPOTcEvvVX6p
         YbO1pHD7FxOCpqLTU8pg9+Xrcxqvp5/OG7MvB0QoFrKLoRnIyeIk8ogaUBdXF9lgpk1P
         7k2Ihf04SW2jzsrcocHj5VWOKHFktP+0r4C1yM9PGmLUopDDE7bB4BF/iE1BrD479DNz
         jq3JVoJC8QMPsPEcknhqMdWKUt8iIWUP4pK+Yk3o1ZH/KFKRHah129vMoQii8nA5I6AL
         Y3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=Jr8oE61NhRIq5ZsnsT8b0rg0+Oxtl2j72+/LPlx4O9U=;
        b=jKVuehl6HgR2YpVcIHtARqANHCQ611MYPnwtptFxQunV00jMpmpqFDcvF3PtUbRPGV
         F4QxU7o5tj9jcOfju/mtBNHnBnEdoOvkCVYMOnk/ZOmEpyKBfpvHSYgZOgppPLsUBBFx
         RvEaeZ3rMxRF3DdMuIg3NPZQm3zhw4DPiUyPKNobP1Fi79WncMZyH7xdfLvDSQc2H1/F
         eRq6GGtoY9GbOMSIjMOJbSrlkPdU4jaBq+fCXLn6CVpF7bmUB7tod5BQFi/ZAxl9FgHm
         ncGvg9Wtpo6x2tV8BEvYBKUiuVpy9ZRJN4etUbTrOfUpbFcHTQ6O2/X/tfmuaSu9ba+b
         YDwQ==
X-Gm-Message-State: ACrzQf2pB7gL6kUm3AN7cI9eLKfbCPNM/6kZiZhq1wLvshx4Fl/xo+bo
	x5x/bSPcQl8f7QPNYB52iZc=
X-Google-Smtp-Source: AMsMyM4NZ0hTTtsK2z2By1E+T/Uxaefrn9FUpIRfGRW+qR5bcdHeJBDFr5WP1T1tpANx/WVSreO0Jw==
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id dr9-20020a170907720900b00778e86e0568mr20854264ejc.659.1663752649092;
        Wed, 21 Sep 2022 02:30:49 -0700 (PDT)
Received: from [10.31.3.208] ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b0078175601630sm1057335ejh.79.2022.09.21.02.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 02:30:48 -0700 (PDT)
Date: Wed, 21 Sep 2022 12:30:34 +0300
From: yassine.oudjana@gmail.com
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Combine MediaTek MT67xx pinctrl
 binding docs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng
	<andy.teng@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-Id: <YQZJIR.QQOJU0071T1J1@gmail.com>
In-Reply-To: <1860b0ff-5544-5e74-ccfc-beda18824927@linaro.org>
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
	<20220919170115.94873-2-y.oudjana@protonmail.com>
	<4c425cf8-f9ca-969c-f8ed-688410bfb922@collabora.com>
	<1860b0ff-5544-5e74-ccfc-beda18824927@linaro.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_023052_016292_5DD38400 
X-CRM114-Status: GOOD (  19.27  )
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



On Wed, Sep 21 2022 at 09:11:12 AM +0200, Krzysztof Kozlowski 
<krzysztof.kozlowski@linaro.org> wrote:
> On 20/09/2022 10:06, AngeloGioacchino Del Regno wrote:
>>  Il 19/09/22 19:01, Yassine Oudjana ha scritto:
>>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>>> 
>>>  Documents for MT6779, MT6795 and MT6797 that currently exist share
>>>  most properties, and each one has slightly differently worded
>>>  descriptions for those properties. Combine all three documents into
>>>  one common document for all MT67xx SoC pin controllers, picking a 
>>> few
>>>  parts from each and accounting for differences such as items in reg
>>>  and reg-names properties. Also document the MT6765 pin controller
>>>  which currently has a driver but no DT binding documentation. It 
>>> should
>>>  be possible to also include bindings for MT8183 and MT8188, but 
>>> these
>>>  have some additional properties that might complicate things a bit,
>>>  so they are left alone for now.
>>> 
>>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>  ---
>>>    .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 207 
>>> ------------------
>>>    .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 176 
>>> ---------------
>>>    ...6795.yaml => mediatek,mt67xx-pinctrl.yaml} | 181 
>>> +++++++++++----
>> 
>>  Hello Yassine,
>>  nice cleanup over here!
>> 
>>  There's a catch though: as far as I know, wildcards are not 
>> permitted... so you
>>  should, at this point, merge all of these in 
>> mediatek,mt6779-pinctrl.yaml instead.
>> 
>>  Before jumping to that, though... Krzysztof, can you please confirm 
>> (or deny)?
> 
> Wildcards are not allowed in compatibles. In filename wildcards or
> family name could work if they are really going to match the devices. 
> I
> have doubts here. 67xx is quite a lot of different devices, so I am 
> not
> sure this will cover them all.
> 
> I would prefer one name (oldest SoC or lowest number).

Lowest number (and probably oldest too but not sure since mediatek 
naming conventions are a bit weird) currently documented is mt6779, but 
mt6765 gets documented in this patch and mt6735 (this one I know for 
sure is older than the rest) in a following patch, so do I just stick 
with mt6779 or do I change it in the following patches documenting 
mt6765 and mt6735?

Thanks,
Yassine

> 
> Best regards,
> Krzysztof



