Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D259AC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emnI5JFzMVo2L0XLSL5k7+cYMnGdzGTtbUhsViY+Kzk=; b=3AzwSlYmnuLQza
	yyuqqizfmaIoIY0c2gpMw+r1BuNqAnIkcLy1RFKvZsWfqKVu2n2GH8xoLzMmzLmhE1bIT/kAqRqw8
	3iIkt1PHgY3+H9tQ2bQt0pYD7RvWQ+EBQLjyqAtkISMdTYmJCTLYlxstTfNvSZiC/jygFrxYhAYTn
	xlo49AJLFLvfPr4jPBIdwyeNNLBZU0c2Sy99iWgTSuo2D7WqO3rQ+YhLDuSlzd1e05d1TDCR/LRJR
	/Nh5RMTs+noLYF8D4Pq/bC2dD0nUS5ilK94CiOsoiVPbScpklTHlIBAHAHJl6JyHtwFSZllDdU2PV
	TUgNX2yM6em28aeJNWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIkQG-00GJ0r-3C;
	Thu, 28 Dec 2023 07:03:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIkQD-00GJ0K-27;
	Thu, 28 Dec 2023 07:03:15 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-555144cd330so2496894a12.2;
        Wed, 27 Dec 2023 23:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703746991; x=1704351791; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emnI5JFzMVo2L0XLSL5k7+cYMnGdzGTtbUhsViY+Kzk=;
        b=FWpEKJSA/LmRrz4nYA90pqp40zHUUvQOXQwDzY8KuA++9MONpWMXcQ/2vDaM8FI17y
         cCwv7QFs0zFgBHkjWlvl0FDOSKen6cbXAt4OB5omN/ASoRuPyPpXQsBzVaw1x3kt+M9A
         cAvBO1kctaBwPOG1wthEcsipIRclfxRstiNgHXqt2rf7F3W7hKhmCRFinWufM+k4rWgN
         +19YIEIFifFcWBG/lSUd3WA+4G/4QildvyfWR/fFsImZuNgVjJ7v4IVlwahmL9tNQ/OU
         gAiQhcwLHncjPKZWCSoqdd086t7D+NdrUKonUyPWV+k1t4HEbBBL5ivb5ZlwXaANmLHo
         dteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703746991; x=1704351791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emnI5JFzMVo2L0XLSL5k7+cYMnGdzGTtbUhsViY+Kzk=;
        b=EkWvR7zPXijYbjEn+1DmjpBYItlO+9JQtuAyHnYzQVVSIrXGeYdzL73aXtUQ4ZuaG8
         J5yEquVVT11863iYv8o9iuxl/AW8H5JcWqtsmoXsymqmrg7f//NUeTYPMdiYxQRhW7Lm
         FAUCPZCfQMQl+Yf5J2jnxXk2DAPz3ERlqvk8cAJE1UNerUuKu68e0/j5hv9gHJd5boLN
         j0gQPCG4UOsu6lwiu+NM+iSwibQAzeoctGhkhQ0/EI9qMlYuyUqhDVHNvA8pU5aqRA+P
         /sDHlI3wlSLnsXsjl8fTuJwB188C5O8kr0FJ7yk8Rl5MEgblijsLMKy62TMWUtvPCBLZ
         T59Q==
X-Gm-Message-State: AOJu0YzApxXLnyo9K26J3jaFEtKbw+H+45MOG34rGk2b5MdTbaO5+mgm
	ju4lsaTbHub7tJtniKRbJUc=
X-Google-Smtp-Source: AGHT+IGu/LdYzra6PZaeLXcy3WYpqM/pG52QEPB+wgFt+1nbXl6yloSex6mlLqH4Q778VHNPMG5gGg==
X-Received: by 2002:a50:f610:0:b0:555:937f:1c08 with SMTP id c16-20020a50f610000000b00555937f1c08mr154997edn.36.1703746991187;
        Wed, 27 Dec 2023 23:03:11 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm6053058edc.63.2023.12.27.23.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 23:03:10 -0800 (PST)
Message-ID: <d0734a8f-0b72-4609-a941-da4bdc3e323e@gmail.com>
Date: Thu, 28 Dec 2023 08:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan
 node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20231116130816.4932-1-zajec5@gmail.com>
 <a5113b85-e29c-454f-b776-ac7abbca771f@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <a5113b85-e29c-454f-b776-ac7abbca771f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_230313_719028_DBC56669 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 14.12.2023 07:43, Rafał Miłecki wrote:
> On 16.11.2023 14:08, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This fixes typo and resolves following validation error:
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pwm-fan: pwms: [[54, 0, 10000], [0]] is too long
>>          from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
>>
>> Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
>> Cc: Daniel Golle <daniel@makrotopia.org>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> I sent those few trivial fixes weeks ago:
> [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan node
> [PATCH 1/2] arm64: dts: mediatek: mt7986: fix SPI bus width properties
> [PATCH 2/2] arm64: dts: mediatek: mt7986: fix SPI nodename
> [PATCH] arm64: dts: mediatek: mt7986: drop crypto's unneeded/invalid clock name
> 
> Could someone pick them up, please?

Anyone, please?

I did quick research and it seems Linus pulls mediatek DTS changes from:
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (from Arnd)


Arnd seems to pull mediatek changes from either:

1. https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux
(Most pulls so far from Matthias)

2. git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux
(The most recent pull from AngeloGioacchino)


AngeloGioacchino, Matthias: can you pick up my patches, please?

-- 
Rafał Miłecki

