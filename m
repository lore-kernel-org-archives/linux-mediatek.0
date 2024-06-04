Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF330C25B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 07:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O0SMHNCQdNY7eE1ZfPsRKnx5uzxN0Q7ClqTL82kBfE=; b=PSf2H94B6SEe8rZcaNQX+H0OKV
	s0U752IwrEHdzqPy363NskxwIRlYmjfXxdA+q7Wjft0ahPgojSzdfUWDp2LsYPvAx05C4kts23Fy2
	74EUtxhMpr4L302BAJudE1Sw9nX14ARxRG09TPcr+dWyzJDDzA/7mfeSFB3zc8sRa620S2kifsR2M
	smWWUse86cnxNPAhMmeSo0IqgXCN2MEMxV07eGVoMC1lXio4MZHsEAp+krFLSLoZLY5iTVLiuQl+v
	bki2cwwAT9aIkdwmDwEhnJTfaq+ep3DYqmlGcjeIYsmyYMjasSBsfF/Wrk+DOKYPt7oS+rVSumg6L
	k1lRXbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEONU-00000001Trv-1WiT;
	Tue, 04 Jun 2024 07:14:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEONP-00000001Tqj-2CjT;
	Tue, 04 Jun 2024 07:14:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a68f10171bdso251595866b.0;
        Tue, 04 Jun 2024 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717485273; x=1718090073; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1O0SMHNCQdNY7eE1ZfPsRKnx5uzxN0Q7ClqTL82kBfE=;
        b=KWDz98PUWs/2xoaTuWX4UCnX0glN11DDj0oJGl7VHR/F54xW+9R45/TK0Clp2HKxGT
         dwzEf4I2KDCx56kKaU4njbQ98iV9RBLGoegEMrHd4hIMjaykPaEqGsqauj2dNGmXvxCL
         hFE9+Lu8yJ2bh3FjgXBowu2tFVx7p3hiXVjKC9QSHq1nUiLMzuNFfG/k/jqVsB6W0Zjf
         se1haDsjxo440+UOevZHFOr8YtFHsUyMbsNLnkYyeN4jsw1sgW3wvR/yQjL0lkZYYsPe
         e01cwqdF9lnFmI0JbqPXX00CSPoy/T0rMXJbvUy6D8WI/rt29AW6NSft7CHElABocFdS
         oSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717485273; x=1718090073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1O0SMHNCQdNY7eE1ZfPsRKnx5uzxN0Q7ClqTL82kBfE=;
        b=lc52OJQhCsNPYtbQzVQQtOYrZ+6niO53AEpGpptUELSkgwrDkHV7L+QgB32heeQLYx
         S9/HJF/AfC09n3E5euk1i6ZyVhQun21Z8KgeL3uooNkHvs8wxaC+K4kwp/G1xPD7OLZt
         B15I3uLxPrAsu3tsb22rMByGjRWJUlQjXSZdvHtMItfjZOtR9kSouPUw4ZzpXpT4/fgu
         yDSxBAYBfrNN5y/iTNv/GC/yIP0wJDnnhiPm8X2iRKzHXNpx9xht2y2L9qMpF1WYywk4
         VWQepLPFiLxHbS0mRhSm1m+HhXeCAHhoDwU/D2+xiwLGscPYd535ZE/MlVmShSzbA5rI
         pK2w==
X-Forwarded-Encrypted: i=1; AJvYcCWjpYfXOXY8OSX1ym7CPc65bghcUwaoQ1fcYQ888aGa9/oURPn0CId1CG+dVtulSEQwVgy8B3tSR0I6UeF7W1BWYT4dvcB6apfbgF/bxNCn489ZZZdOKkhTX+yLS0B5URm7hnik77owGnm2JkAZFmdrCxR6+xdaoWk=
X-Gm-Message-State: AOJu0Yw6bJVAbFty0QDMTfvEqbzsaUiO4yMWY6BzzPoNyDo0dkmfxaBQ
	o91VKIWlGwxtFKyBG8zvHYvvBQk3OPv/4grBLU1kzFoXnKXlWIq3DFnlMw==
X-Google-Smtp-Source: AGHT+IH/HoOTvOP1YSrMHxJv9HF+dks0c4NXtd8r+IyQkn7/51/OXLwRI8a2BGTAekCG+qQ77XdGHg==
X-Received: by 2002:a17:906:5655:b0:a68:b839:485a with SMTP id a640c23a62f3a-a68b839626cmr594199966b.77.1717485272415;
        Tue, 04 Jun 2024 00:14:32 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a68ccf77cd3sm402597366b.13.2024.06.04.00.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 00:14:32 -0700 (PDT)
Message-ID: <a8845e9a-839c-4741-a868-1f415b926d40@gmail.com>
Date: Tue, 4 Jun 2024 09:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add OpenWrt
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240527115933.7396-1-zajec5@gmail.com>
 <20240527115933.7396-2-zajec5@gmail.com>
 <CACRpkda-egxVtP8Tan9T_EfQX6ekqQDf3LaVUu0by7aWY1Qmag@mail.gmail.com>
 <ed191114-0259-4de9-8e32-6718fd5e6747@collabora.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <ed191114-0259-4de9-8e32-6718fd5e6747@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_001435_586630_26ED7810 
X-CRM114-Status: GOOD (  11.67  )
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

On 3.06.2024 09:37, AngeloGioacchino Del Regno wrote:
> Il 29/05/24 09:42, Linus Walleij ha scritto:
>> On Mon, May 27, 2024 at 2:00 PM Rafał Miłecki <zajec5@gmail.com> wrote:
>>
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> OpenWrt project (with the help of MediaTek and Banana Pi) has produced
>>> its very first own hardware. It needs its own prefix.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
> 
> Hello,
> 
> I'm not sure about who should pick this particular patch - should I pick it into
> the MediaTek tree, or...?

We have ack from DT maintainer. Similar PATCH was picked by you during
the previous merge windows in the commit d67c211261d1 ("dt-bindings:
vendor-prefixes: add Cudy"). I don't see why this one couldn't go
through your / mediatek tree :)

