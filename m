Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26B3C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EtYXiFCKG5U/OJiZE1Ji4W1wxa332OAU3SvaeaqirA=; b=T0jAM8J9np96vvPaiVqmwQ8LXM
	tPEqbpstK+ROg/vlT/ICB4YhROUXagHrSPbTV+eqYaYtd/NcEuD0KNNBb6u4g4IlNzst0ncAljM8W
	KhffURydqPDf91jehm9KEGBwIVEhd+VztlEfi+cBvehMb9+lKI0Tb4KVlQMQorVdvWxNiXiFPVFe0
	blMkdE2Cr2j6yuaSSDeotuphbCTRuNnyLyNDQyZLvC1LpOBe5LS6Jk+Vrk1ew/rzC1xKS1ftq3Fni
	r6AniCywLJ7y36tZfff9y6SSJIrDvF6nRzXDMSeNdYUi/0LxnKW7VWLgKOWIwE07gtMF+RLsBbKpY
	Dp6DVMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4pJ-00000002dM4-15lu;
	Tue, 25 Jun 2024 11:59:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4pD-00000002dJV-0A8Z;
	Tue, 25 Jun 2024 11:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719316739;
	bh=v0YC4IeTECyIp/iC9IzRXR1jeJv45OgY1qqRU0qP1lU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c2REllb//m9B0CzKO4teapGYlRuuC5wdlwTQVUxOVNywTkT+Rol6OF9qXOfWt7r7X
	 rK4PSMunCHcnd6aZX+6NV6NG7CZzyJ+oKi3RzRfnGrKCcNGbozfyvopYqfcFZUI2Ds
	 GvhWkJ6XnIOx3wkQGKvTpNZVJOpyqKLRnPuhJlt2VZ97Rrf1eR3wRvWNqs1uqGxaCV
	 srDtzAGvRYORyX4IhYtxICKfBtlU9WG55L24LV0QwAaiycFMr/eiaDDHfwP0zfUkOe
	 4iVX01DULKVcsHp5gJBhMg9bLF3k+l3SAh+GJKjv4cd2MAZW0PRTVoU0jiz/vnSjwL
	 9iI0oH9RLrqhw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5B790378216A;
	Tue, 25 Jun 2024 11:58:58 +0000 (UTC)
Message-ID: <39ed7b8c-b19a-40de-9b30-a731ac83ad20@collabora.com>
Date: Tue, 25 Jun 2024 13:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, keescook@chromium.org,
 gustavoars@kernel.org, henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com,
 djakov@kernel.org
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
 <f7b4cd98-1acf-4f6b-a7e0-57419abadba1@collabora.com>
 <57cf8f9f-4320-4c55-a9f8-a4c1facabfe8@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <57cf8f9f-4320-4c55-a9f8-a4c1facabfe8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_045903_263036_F616CC69 
X-CRM114-Status: GOOD (  11.39  )
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

Il 25/06/24 12:25, Mark Brown ha scritto:
> On Tue, Jun 25, 2024 at 10:32:30AM +0200, AngeloGioacchino Del Regno wrote:
> 
>> Mark, I assume that this series is ok from your perspective, since this has got
>> your acks and r-b -- but in order to pick the soc/mediatek stuff I need all of
>> the dependent bindings to be in as well .. and this includes the regulator one!
>>
>> The main issue here is that the main soc/mediatek dvfsrc binding
>> dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
>> does use the others, so I can't pick this one without the others being present
>> or the validation obviously fails.
>>
>> So... gentle ping :-)
> 
> I can't tell what you want from me here.

I'm asking you to pick the regulator patches :-)

    dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
    regulator: Remove mtk-dvfsrc-regulator.c
    regulator: Add refactored mtk-dvfsrc-regulator driver

^^^ These ones.

