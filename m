Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C45BC982DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pk62u2SlCQA2g8YhkGB0TZ25FcIUqQFtwR4ALeVSLg=; b=y70xpaevBNG01c2JoDaogRtr90
	9lDQVUgKg0LGswaeEC4hQjj6ZYXwFrKVEmnlMoSaZe2AtjHiF/RYKLtm7yG4J9/yEhESCRZQ0kXvJ
	hQPNmsW3w8CUsAkRlfr4/mgWllYbPrxVZjl3D2PZzw1SMyHJxlM9MUtM+06OiyuIbYPK4tDwCEjbc
	hp1xjLszpVW+KyNcgJFvAtqa07eX5nV1aLQpvnvTkEtH3Q2VcWgbuYC4SQ4wZAb6xjFnDE1RkjzAj
	ylwBoyYhI3DmjXVvdrfMmsSDUqSTL9Uwa12kQ9CTIGRidgiFraYinFjeR9EsZX3d3m7VDlCcn7VkV
	i4/50XdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b4B-00000001eAv-14TV;
	Mon, 21 Sep 2026 10:16:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b48-00000001e9P-409j;
	Mon, 21 Sep 2026 10:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789985762;
	bh=Lo6e24+OYras1PE/uj4vcsvTH4ido1eqB1uEmKdu8AA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VfHMWqm8b9SnxR37a2o+QHFo05DzegEUwaCfzQU/6eS3IyI2Ccii7SQVwhZD8qGlJ
	 wFEbG89uI/HGYx5imCLuXEdiU9+L51gbcm8BU3pEpJ0hA0cgVT4bNZzIbzGTpPwlRG
	 YzFkkrkcnccFD1fWXVgTKdHXa64v6rjvfqhzF2ziIHSXEp/5UDKFlQE5XpYgeU0eGW
	 my+doEkkJcDrMkXOZ3uUcOF7frqTwW5L0vECs/MuIvE5fj1l81G9wjvx6K7Tn9B1DA
	 YKjWxODMOeeM4wIiDJwW3WYOrj2fNfYIqx46Zw6SjmIZLH94fREHdI2GKWZXX5BYso
	 kpBNDYvQEqfsg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0641417E020C;
	Mon, 21 Sep 2026 12:16:01 +0200 (CEST)
Message-ID: <817d5599-a2ad-4f47-ab07-a74b0325950d@collabora.com>
Date: Mon, 21 Sep 2026 12:16:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
To: Ryan Brue <ryanbrue.dev@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev,
 Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_031605_151511_141BBD24 
X-CRM114-Status: GOOD (  11.09  )
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

On 9/20/26 07:31, Ryan Brue wrote:
> The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
> and battery temperature measurements. It is not register compatible with
> mt6359: a conversion is requested by writing a channel number to a select
> field and pulsing an edge triggered start bit rather than by setting the
> channel's bit in a request register, and the results live elsewhere.
> It therefore gets its own compatible rather than a fallback.
> 
> Add the binding and the header naming the channels a consumer puts in
> io-channels. The battery channel is named for the input it measures,
> ISENSE, which is what mt6323-auxadc calls the same input.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

