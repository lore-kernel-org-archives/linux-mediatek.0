Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB497EB8FB6
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bq5VaCN58woKfHlu27g2JEDxXsqU8G37VcS/uYaOtG0=; b=N2lsCJ5Odnx/w49Nb2aBFj2pbv
	J5/JjAn1bPHpgVmvBHS2FZWJL+/xh++jfjVZlLnhEmD8m4OXShRpworKcC+cBa+I4RTsF2ZBs3a0a
	1Q7XWc6Fwk3zaC8rFSSp5RHvBbfGWbIrKBHysidXQJW0zwyOW5AeQROlWNIIzfSAzVZv7nFPIMFHs
	YK17unBe9p69DCIQT1G86ipFvxn+7HZ/pS+VV/tSNar5gt+Qefv3+2qST7FtnBX4OCFWmQ3wEehrP
	SbYVAfId1plIuIcPoQayojYXVFeIoVwofzM6HjvgDGEzJwm2SV7m2yioG3He0itxLarA8iVOskyO1
	xFGGYGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpdu-0087Pc-2E;
	Wed, 06 Sep 2023 10:20:14 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpds-0087OY-1y
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 10:20:13 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso537995366b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693995611; x=1694600411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bq5VaCN58woKfHlu27g2JEDxXsqU8G37VcS/uYaOtG0=;
        b=BM+GxNBksMf3gjuy2qY/Rc1BgIoLeqzI9u1QuK8cRddYiNGy1AKSVWanDlOZl4pgTQ
         4PGBYoSCgBocE9WHMf8XmxgKRF6olB9xBbXVf1M/Kv/bC5Apk1OmS//s45IvQ/VsOlpM
         ON612vxSrMAMZ+OAOMw0V48OBxTlpx8AhNCZcwFSJUXwZhbEzjNzpwEJz9dgJTZDETDG
         p04LeItKVHIF9K5+kCR/lVmhFHnYy5DMCKD3HWlLrYilRUOcK7ob7w4V9LmRqTOLvT4u
         VKYu9u1dVhRr8pwy14e6th9mjIz50wQPoZXW+n1EjBx2bJOaRguiCHgD7JDj+LQ7yWKT
         pD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693995611; x=1694600411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bq5VaCN58woKfHlu27g2JEDxXsqU8G37VcS/uYaOtG0=;
        b=DYDM2TV1Lbgax9Jfcdh9FiPMF8MYFf1lBfsgII3ngqXx72qniKjdqwmKr4dzj+zVCr
         MV2o2H1w/NEMA8CRieWfscQHQhXV3Y3bCLTeZDnfqWQP6s5Ts1IXt2csk0DUn90/SpAK
         F4MF2d/FUzoD3BrE3MjMKCvKoLVSEfMaZJuGPu3jYKX9QuyF8H+1BcUe+pYB7MaAIFh8
         adMd13JWv2J1SNp4eRjYL8tQnm7y548VURNNerzIa6OF6zLiOfWTjBIBWngA+1eHaryS
         cCfghMrj59tzDVWtVA/JoHpZhIui9qfdNBJDuOFZjscKDjLYOs827+LiCxLRzrs8UMhi
         IREA==
X-Gm-Message-State: AOJu0YwMgYR+nFaqq7vpNRPkn3t7vdNN90WB2+myhiJ4/+mosq+fWTFB
	KbYJ3sAjxUYh8m4P5H2Im9VAVA==
X-Google-Smtp-Source: AGHT+IECInaTz8AGdtzkKqE3txhHtVT5HkkOVMm7zF06XwaR9R8LGP/zSAC3l08RLFTjiI82UIK5ew==
X-Received: by 2002:a17:906:cd1:b0:9a2:232f:6f79 with SMTP id l17-20020a1709060cd100b009a2232f6f79mr1652416ejh.25.1693995610974;
        Wed, 06 Sep 2023 03:20:10 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id hb26-20020a170906b89a00b009931a3adf64sm8986930ejb.17.2023.09.06.03.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 03:20:10 -0700 (PDT)
Message-ID: <145f9a3e-af61-c62f-1752-2abb7663d7a3@linaro.org>
Date: Wed, 6 Sep 2023 12:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add device-tree for Genio
 1200 EVK board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Ben Lok <ben.lok@mediatek.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-2-macpaul.lin@mediatek.com>
 <2cb8069a-976b-0af4-a427-1e63ba4e7870@linaro.org>
 <951e34bc-dda3-f9d4-b251-7f0fd02052ee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <951e34bc-dda3-f9d4-b251-7f0fd02052ee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_032012_656464_B421359B 
X-CRM114-Status: GOOD (  14.92  )
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

On 06/09/2023 12:15, Macpaul Lin wrote:
>>> +
>>> +wifi_3v3: wifi-3v3-regulator {
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all
>> requested changes or keep discussing them.
> 
> 
> This keeps a format with -regulator is because I've found some other use 
> cases. It seems "-regulator" or "regulator-" could be arbitrary. I'm not 
> sure if it is a new guideline for regulator's node. If there is in the 
> devicetree document, maybe I just missed it?

What is the point to name in the same DTS some of the regulators
"regulator-foo" and some "foo-regulator"?

Best regards,
Krzysztof


