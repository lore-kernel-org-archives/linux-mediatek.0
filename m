Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3AAC77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zj+VDAqPSb25/DEXl04R56d41dEGPCQtyqOgNMpILjY=; b=o1HdjeAhD+Z7o6YR0IW39y7h+F
	VOoJw+6me1UbOW/5a19fZpsruL8TQpj1RRG0vtpY1vhSCuaXEH7dDkTEjIjWzlLgk5XLC71KCJxJa
	UaSUSiI4kFSR1bsu8tkDCXEpvjeWXwj9JGPIOPfiEEplhqib89mKA4aMawgchsILE090QwQjZy2wb
	AvKBTq8pzGrubsGqhoHBpoM28mN/6gz7H1HuFK1XlqbFo8isw2H1umkYoojNjYOgNj97v69hE/wTW
	9msxIw8OlDMUBJr4GiE0D9k4NMh01XK2zNdqEI3svmPBKVlFoYer7gXg9cO3PKiOIzZHPLz4Du+XC
	r0dcNl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3f0a-00Axq4-2Q;
	Mon, 29 May 2023 15:42:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3f0W-00Axnp-2z;
	Mon, 29 May 2023 15:42:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30ae69ef78aso1053783f8f.1;
        Mon, 29 May 2023 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685374919; x=1687966919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zj+VDAqPSb25/DEXl04R56d41dEGPCQtyqOgNMpILjY=;
        b=VsmwXUVg+FoHXj/nL+qq/3/Md3DiD6hWqsH/LJ+FyWokSlgesuJXyr6UkdmVvRjp0z
         6FmNAZsMS4gTubamr/kPK08H+M7Thdqil9TzAzOO727WyQulsERgEMRUP2mOFCc1f96J
         59dXBg0NSMeCamgo0kP+F6WLNZwBml1ugAEBSSAZ1JR++9sdGGAQnExwSEDhBWDO1SWg
         nCZFbo/14kJlKW6UAKAM5FR/GWhqVNPXGaebbLckTiy00xh7Eo7U6x4lu9WputUkvPrZ
         SwxogrersE/foLyZ/cGYiVF/X62FCpYHdlH/H0RDfBWRhAKYgfKM/3p0bprzQUXNJ4lp
         4Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685374919; x=1687966919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zj+VDAqPSb25/DEXl04R56d41dEGPCQtyqOgNMpILjY=;
        b=QAvqZoawjP/2G5+EGuwdOu7+teRVsLAnpEltkQVNgyVr/TTAKFzYLabs2uDSvIHsBc
         yq+psAcIBY/ZgEEpJP9P/SJHWSfJwPrqtVihnhvrFS6SlTqhqj/En1ttWUndQ2SdHp0z
         qV8/t6HpJ4gWoYl7BKpmAODJY7JBY+YANVN5VykdL8Evm9uHXSP8KYUo+L73/ht7UUAH
         w27BR5uw4gB+NQ6uPHmKO33PGVSdRdjgceVk8sjdOvW9ctcHE+AXG+9uGM+Oj0y12rfw
         KgEUNn+GyxqaaNB+WWkhpUSZSntuL4YLjB5Qbfle7Wu9ZJamoALd30438+MlimepyCLb
         nvmg==
X-Gm-Message-State: AC+VfDzoJeZf0pK6t5NbgCp02WhgOWDD6j/XXAIoej9RrQ+2GACz7pfc
	OjB3usfbG1u36+cjX01jORY=
X-Google-Smtp-Source: ACHHUZ6PZ31jEVJxxW/BVWIZxBiKX42sooJ61VxYWeoBtBaDqvQviu9rCxfVlTeS23L+cDrKF8HXkA==
X-Received: by 2002:adf:f08d:0:b0:30a:efcc:f89a with SMTP id n13-20020adff08d000000b0030aefccf89amr1722530wro.2.1685374919021;
        Mon, 29 May 2023 08:41:59 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b17-20020adff251000000b002c71b4d476asm288024wrp.106.2023.05.29.08.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 08:41:57 -0700 (PDT)
Message-ID: <cf7afb1f-ad1f-b077-6276-222c5ca918cd@gmail.com>
Date: Mon, 29 May 2023 17:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/5] irqchip/gic-v3: Disable pseudo NMIs on Mediatek
 Chromebooks w/ bad FW
Content-Language: en-US, ca-ES, es-ES
To: Marc Zyngier <maz@kernel.org>, Douglas Anderson <dianders@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 wenst@chromium.org, yidilin@chromium.org,
 Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20230515131353.v2.cover@dianders> <86edngmwcf.wl-maz@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <86edngmwcf.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_084204_965263_D34D79B1 
X-CRM114-Status: GOOD (  19.42  )
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



On 16/05/2023 11:58, Marc Zyngier wrote:
> On Mon, 15 May 2023 21:13:49 +0100,
> Douglas Anderson <dianders@chromium.org> wrote:
>>
>> As talked about in the bindings patch included in this series
>> ("dt-bindings: interrupt-controller: arm,gic-v3: Add quirk for
>> Mediatek SoCs w/ broken FW"), many Mediatek-based Chromebooks shipped
>> with firmware that doesn't properly save/restore some GICR
>> registers. This causes the system to crash if "pseudo NMIs" are turned
>> on.
>>
>> This series makes sure that we never allow turning on "pseudo NMIs" if
>> we are running with the problematic firmware.
>>
>> The patches in this series can land in any order and can go through
>> entirely different trees. None of the patches are harmful on their
>> own, but to get things fixed we need all of them.
>>
>> v2 fixes the quirk name and also moves the quirk out of the SoC.dtsi
>> file and into the Chromebook file. This, unfortunately, means that
>> mt8186-based Chromebooks are no longer handled since they don't appear
>> to be upstream yet. :(
>>
>> Changes in v2:
>> - "when CPUs are powered" => "when the GIC redistributors are..."
>> - Changed "Fixes" tag.
>> - Moved from mt8183.dtsi to mt8183-kukui.dtsi
>> - Moved from mt8192.dtsi to mt8192-asurada.dtsi
>> - Moved from mt8195.dtsi to mt8195-cherry.dtsi
>> - mediatek,gicr-save-quirk => mediatek,broken-save-restore-fw
>>
>> Douglas Anderson (5):
>>    dt-bindings: interrupt-controller: arm,gic-v3: Add quirk for Mediatek
>>      SoCs w/ broken FW
>>    irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware
>>      issues
>>    arm64: dts: mediatek: mt8183: Add mediatek,broken-save-restore-fw to
>>      kukui
>>    arm64: dts: mediatek: mt8192: Add mediatek,broken-save-restore-fw to
>>      asurada
>>    arm64: dts: mediatek: mt8195: Add mediatek,broken-save-restore-fw to
>>      cherry
>>
>>   .../interrupt-controller/arm,gic-v3.yaml      |  6 ++++++
>>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 ++++
>>   .../boot/dts/mediatek/mt8192-asurada.dtsi     |  4 ++++
>>   .../boot/dts/mediatek/mt8195-cherry.dtsi      |  4 ++++
>>   drivers/irqchip/irq-gic-common.c              |  8 ++++++--
>>   drivers/irqchip/irq-gic-common.h              |  1 +
>>   drivers/irqchip/irq-gic-v3.c                  | 20 +++++++++++++++++++
>>   7 files changed, 45 insertions(+), 2 deletions(-)
> 
> I'll take the first two patches as fixes. The rest can be merged via
> the soc tree as required.
> 
> 	M.
> 

Patches 3-5 applied now. Thanks!

