Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C79C27C50
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoLYCcWGq4sRndE5t1V7C4dP8gSe+jtrseeO8y1MM1k=; b=P3gwDg+V1EMQ16qpEBDDdvwCte
	P/i/96nk5vIn9KTCem5D+gCIPmtBS9BVDVzmZMHVn2FThqp8avceHxoSeZzR+/QJOk5LMTsd1Xlrr
	wgUmF+iQmKidFl6vgJT3ONvOW41BoQpDYB3J9/kJ7nplCCJRPqOTy2SmPT/R1m6pM1AlsjbFL3yfu
	lbtrewkDD/0ZTCc7VlkYbO+rlPRfBAVZiox5k8+Ltxg9Ib+2dvQvYK8jFT7lycWQGPbDwUGcS7kE6
	YouxFZ1P05nw7ph7HynVfN6zA9XN5OroZ8EZxmPcyVrOqe7YzfDW0xNIenCuZVsMqi5lUUPyhjb3Z
	0RovS+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEU9Z-00000002V7H-0gXf;
	Tue, 04 Jun 2024 13:24:41 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEU9V-00000002V6P-2Vwz;
	Tue, 04 Jun 2024 13:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717507473;
	bh=6etJFa5Sva7AQexf4AoKIy5woS+LE9rtDwzdEoCFtz4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s2PbKEy/cyegC6j7YNWE+OP9hHBb6SwLPuKfEZTZjSgl03lyr4WXTa6F9XwjxSs6o
	 6G57MIlfusafrur0ikXYiXPiH6ClwiODBwtLXLPLfhYwDC8SaRNbaMvGKulSe5yspN
	 tgH305TZLAUqKlLiFhqJ8XSfxwJC2uS8XRLWT1ABUgQ86Lqx+dQzPR6q0Uf/0jZEDs
	 t5F6WKKVHl4g+Rzgxuw6XRXkCmMYatXsibr8694It+UHb5Xay/46M+kXJ0Vg3tne1I
	 NsY2VE6zP+I59iHUZdlbaQeu4eq1p/s8lF7cH3b9TJiA45SkmDhWNUF2iUz61ANb7c
	 AHwezedUr5Ubw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4717B37820A7;
	Tue,  4 Jun 2024 13:24:32 +0000 (UTC)
Message-ID: <575186dc-8a4a-4d93-98f0-d2271b0aa1fb@collabora.com>
Date: Tue, 4 Jun 2024 15:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] iio: adc: Add support for MediaTek MT6357/8/9
 Auxiliary ADC
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org,
 andy@kernel.org, nuno.sa@analog.com, bigunclemax@gmail.com,
 dlechner@baylibre.com, marius.cristea@microchip.com,
 marcelo.schmitt@analog.com, fr0st61te@gmail.com, mitrutzceclan@gmail.com,
 mike.looijmans@topic.nl, marcus.folkesson@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
 <20240604123008.327424-5-angelogioacchino.delregno@collabora.com>
 <CAHp75Ve8qPLu+gS8o5Q5A20j_+AP_UVkOzdKqcnhUawA_sW+VA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAHp75Ve8qPLu+gS8o5Q5A20j_+AP_UVkOzdKqcnhUawA_sW+VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_062437_862271_433B34C3 
X-CRM114-Status: UNSURE (   9.48  )
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

Il 04/06/24 15:22, Andy Shevchenko ha scritto:
> On Tue, Jun 4, 2024 at 3:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add a driver to support reading the Auxiliary ADC IP found in the
>> MediaTek MT6357, MT6358 and MT6359 Power Management ICs, featuring
>> a different register layout, configurationm reset and ADC reading
> 
> configuration
> 

Oh, oops! If there's no further comment to address, can this be fixed while
applying, please?

Otherwise I can send a v3 :-)

>> sequence from the other already supported MediaTek SoC or PMIC
>> (aux)ADC HW.
>>
>> This driver provides multiple ADC channels for system monitoring,
>> such as battery voltage, PMIC temperature, PMIC-internal voltage
>> regulators temperature, and others.
> 
> Seems all my concerns were addressed, so
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 

Thanks!
Angelo

