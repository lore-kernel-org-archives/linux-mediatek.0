Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CAFC7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbB0xd6Ry0dq/EUwrtpVYTX/9vI3J3IlZ8nKsAKcFys=; b=xvB1U1oPST9c8Vy/nGe+7TQ9+u
	P7YxrPFH3z4TdLvsDI6iE23TKCO2XQxD123LWuMBv+ZKxOZ1bjY+kmj07R0t+hVYoUNelNUt6cDRZ
	PlTBBVIo0LYlolBHAGYFYeYmSBL9PyzV9lJhFiyO0UsN66WzfV4oGWvgCLRVSKrBmH5gs0Tvo+SkQ
	hB26NgJV70qnoXdgl5HKUiS1fAunReGyoii5BguAjvndXe9+sXY23qvrt4kq6pzsYeNOaWC+7kY//
	bBdh8nGyv9VnC6SVdUmbcWEfSd4s5A+jTjFEnoR3JsrFUO1DbFbyWvDQU4jDjxqvxY7HEBuOeulsU
	ZbgNuppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AVZ-008TE2-0J;
	Thu, 08 Jun 2023 07:56:37 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AVV-008TCb-1y
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 07:56:34 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977c89c47bdso62623966b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686210991; x=1688802991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbB0xd6Ry0dq/EUwrtpVYTX/9vI3J3IlZ8nKsAKcFys=;
        b=g/wq6BrlRS1cNZYAuGFoeGlt12YYhRA1phpG6vyWII5Cmb7tl+Dv9TrhWYedJMCeOL
         IYBx+Vfy/CzizH2j4g3ttNvnyz2uJpMYsFrvhfy9y5ffmroM+kfVvGEbCvPJimmNkCyy
         835jAz47QNG7whyEwF118Q1fMOldwVXs4M/LhdDu72Ncy+p7GS3JV1bsu8CarpCn122Q
         USLMU1Ml1mrEOlciZWBDk5BgAtvXYwnUGYFdYXzKHQfkWZsPPl6+A0bi00DQdbk4Xr/o
         E0z0o4My3CnkrC5vzF0nnuusMDfsr08o1iGgM4/OI9Zc+qhyoetuIOugxvg3Aux4Ql2D
         P9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686210991; x=1688802991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbB0xd6Ry0dq/EUwrtpVYTX/9vI3J3IlZ8nKsAKcFys=;
        b=VywUci3AgR5ZGefC6xZLHLruh9eSRORx5tZ//YL+vSPI4d/CbaPf1GAbmIBP8J6QhQ
         GhHeobHF75LpQ2yZoYb01sBD/r8pm4PqMNkdTPvJZIoFtW4Pi+cJtsaDEuPP0YfNLmCh
         Gyn6oOQajyVwbVimqSCakI1FlOzlfpR/3MPGJePLdg9H3CZzQ+75X77xsOcUbvjBj69q
         kXuU6zb7hP+UlfIEWv0jSCy2XjeIhbhlZV/HzI9c1F0iwF0aSJoGNyrwi9QwrJ36yUGG
         cedj9nQx6WsHvKRKNNUEhHFXNX+0+xz3iA+nJ+BHZRIzoA+8MUqdTRKbc9hGZIUB+f0L
         9yCw==
X-Gm-Message-State: AC+VfDwzm8e6shOTB27MzOKZbsoy1a4jKXlEuuzA9ioEDMxrQxCZ1YZx
	jtt6xjX/GABeT/1zn4YrIe5zTA==
X-Google-Smtp-Source: ACHHUZ77/ckL41yrT5rLCVmYFC0CptMhtYaSudwn5rglft7nJjnm4nUfaMEkIqEbduj4o8OyC6hKkA==
X-Received: by 2002:a17:907:961c:b0:96f:f046:9a92 with SMTP id gb28-20020a170907961c00b0096ff0469a92mr8989606ejc.37.1686210991390;
        Thu, 08 Jun 2023 00:56:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709062c0a00b0094f23480619sm345792ejh.172.2023.06.08.00.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 00:56:31 -0700 (PDT)
Message-ID: <751e5a36-5313-7d5b-7c2d-55322f2850f4@linaro.org>
Date: Thu, 8 Jun 2023 09:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 2/6] dt-bindings: reset: mt8188: Add reset control bits
 for VDOSYS1
Content-Language: en-US
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "fshao@google.com" <fshao@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
 <20230607061121.6732-3-shawn.sung@mediatek.com>
 <72b71e37-f9e7-b182-824c-163d920723b8@collabora.com>
 <a769105743d480c0da846a4c50de43811382626e.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a769105743d480c0da846a4c50de43811382626e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_005633_652080_2192C12F 
X-CRM114-Status: UNSURE (   7.36  )
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

On 08/06/2023 05:01, Shawn Sung (宋孝謙) wrote:
> Hi AngeloGioacchino,
> 
> Should I use enum instead of #define if reset ID must starts from 0?

Open existing bindings (there are many, many files) which will give you
the answer. It will be faster than asking us and you will learn something.

Best regards,
Krzysztof


