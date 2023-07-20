Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6743DC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bM5fwQZuavzr0KLXlSpBqYe6ZYyOnK6tAtOA/McGh0=; b=Eie5HZsXoY6ZwtGdKnDJla3zNs
	viWWfghppZoj/Js4JzsrZGYftqOluo8X001d8d7o6BOT9ayUM0wdiPpbsUp6CgPzQ1aK+CPj0QDqc
	pEBK+lf9h5QR6dNz4ZmorcYW5t5NHf4IA7qjR7QjSNXcizW63X8pzbawW/nOjL28E/JdGRNjoV2/Q
	M5rhX7OIhaYpHSIegyb3Vsi5yqD21Y7HaWHgcy8M1jtMp/FL2XuAn6sZOsKTzFSSK7LoEcXcdOVhK
	3MhCYT/YqNnTuLFS25j/Zwj2QwQoHMOQA8hUXu6aJgnwyxFn3aHRLVAgGaL2U33DTXY0DnULNoec8
	xe9y/tgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUXB-00BNKB-15;
	Thu, 20 Jul 2023 14:21:37 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUX7-00BNI1-2g
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 14:21:35 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6f943383eso12412281fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689862891; x=1690467691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bM5fwQZuavzr0KLXlSpBqYe6ZYyOnK6tAtOA/McGh0=;
        b=spUGuRcegEQPc3fc25t8itt8SEf8ygAVohrhUn1ujEk4I9NT0xUvIMs1yqyuWqxNFr
         fBngMP/QWUKoSJ4W5c8y5CIpFFLT2NdGs7KcRmUv/FP+F2rq6dMQaol9zCqPj/y+WTED
         2PSRgpO+AuKpqQjbbAcTkKACjlLeF1nbuCreWEGmYWXHj2dY5nBdA3c0ybQNAqoK1TUq
         kekBLt7Ich29WT7xHej4Hzg7GCemUc/EmRGwPy7fQEuunSvGNdqxqNwLHTK/PQwA40Dp
         BwJdBbnoarNMLasaotpymgCSCXe725rnTO/e+1odjR+bU2WyYT4CLBrdqgOxxsPSCDk1
         B2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689862891; x=1690467691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bM5fwQZuavzr0KLXlSpBqYe6ZYyOnK6tAtOA/McGh0=;
        b=PoIguHjAHGm6qmBPuVC+VZ+mIx+qNPJW0bYB0DB1W+feWekU/t008IjOjAkgDgggMo
         12PeLhA04h+/ZJNfQzI4aBYjF0rndr+mhqqmNxOrH+210Ofoab1KfFqGMtFclUefFvIf
         WDC1I7xB6TswRleHmJZoheQVdRiAsQWz0GanUWJPuD3b4i4x31IVV96CpMU5WiFA+iCn
         B4sjpp/o8ULSSuaApUszgi3Q3yOazCU+/gMqnhLVdd7o/aCdWj3OwKdQkTFTfJyLH4f5
         h7Ay9Nh+HSfFJwMJSfzUk72twoaVPeTLbNfhW5lRTf4a5jmF8pOd6Xh2fwMzuIxPILiw
         3IbQ==
X-Gm-Message-State: ABy/qLZi7By5u5x3jkutMio/2MF/IZuooBpZv/H3RZcVmZRghj/F3xWU
	Q+/er6/uLmfJEVUM39irFoKa4Q==
X-Google-Smtp-Source: APBJJlFpdXWglTYxIM2Ehzj8JoGpf26cOv1zlpe0BemO3ScIjse7kYRRtbcG/801j62owMtgpgABCA==
X-Received: by 2002:a2e:3310:0:b0:2b6:d137:b5a1 with SMTP id d16-20020a2e3310000000b002b6d137b5a1mr2400228ljc.43.1689862891321;
        Thu, 20 Jul 2023 07:21:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c10-20020a056000104a00b0031434cebcd8sm1490017wrx.33.2023.07.20.07.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 07:21:30 -0700 (PDT)
Message-ID: <2b5b982d-5a9f-810a-ec3f-df65e6c8b83b@linaro.org>
Date: Thu, 20 Jul 2023 16:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
 <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
 <8374cb80-749a-401d-2d88-48001ad614c2@linaro.org>
 <2640608.BddDVKsqQX@steina-w>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2640608.BddDVKsqQX@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_072133_865861_FB913DF9 
X-CRM114-Status: GOOD (  14.90  )
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

On 20/07/2023 15:58, Alexander Stein wrote:
> Hi Krzysztof,
> 
> Am Donnerstag, 20. Juli 2023, 10:07:04 CEST schrieb Krzysztof Kozlowski:
>> On 15/06/2023 16:58, Alexander Stein wrote:
>>> Use id-gpios and vbus-gpios instead.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
>>> ---
>>> Changes in v2:
>>> * Added Heiko's A-b for rockchip
>>> * Added Matthias' R-b for mediatek
>>
>> Please split patches per subsystem, so this could be applied. Or send it
>> through soc tree, but you chosen the middle way - neither per subsystem
>> nor via soc tree - so it went nowhere :(
> 
> How do you distinguish that? 

You create multiple patches per each DTS subdirectory. Then you send
entire patchset to all people (might create too many Cc addresses) or
patch-per-maintainers.

> Almost all maintainers and mailing lists from 

Yes, and they can only Ack it. If you wanted it to go via SoC, you
should have Cc Soc. Since you didn't then it was not the intention, so
only the first option is left - split per subsystem.

> get_maintainer.pl output for patch 1 are also included in the list for patch 2 
> & 3? Do you want me to send two series (1 binding patch and 2 DT patches), 
> which you will receive both of them?


Best regards,
Krzysztof


