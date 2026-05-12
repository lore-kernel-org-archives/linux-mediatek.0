Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F76CD4F24
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bjvlgt0Lgrc9OBikw5UYF113Dh9R7321VRJTyU1aRkA=; b=lzBPu/e1rjMXp5Rf2ttB5ySXnA
	VYrcgzPhCQ9UzwR3pbMfmvDGPpzQf2gTO/YDkrxUqXJF+rDcJ816Zdr0lj6li8DuVxRm6jqWEF1hq
	9DpayRPgoQjADFrHwi59gpPGSpBuV1WnGlsVBd5tDZeUXIXo/Afbw1+K/5ouiZdDKgL5y4eSKRZwK
	ZX6e++osPOLNoCXgnA2Kg/fcoKmWXdqttWS2Gm17neLtKgTtc4Qf4jad/f67p1TCynfqXOKnVjnnM
	qYsGBvjEDz/G5IkpSZe3R9aThKvdzHlR6BAhw3UcVQHAMjYuiVf4C8vWnVjClXoIIlpGuXos/+NYd
	Io9A+GTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoCQ-0000000H33g-1vBP;
	Tue, 12 May 2026 14:35:06 +0000
Received: from mail-43167.protonmail.ch ([185.70.43.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoCN-0000000H32c-02NK
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 14:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1778596500; x=1778855700;
	bh=Bjvlgt0Lgrc9OBikw5UYF113Dh9R7321VRJTyU1aRkA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=zPZD/p4SRQgqRukzsZL8bfeuoUSZlow8uaSZj8HdWMiT1ef1HN/ZIXaLy/0KCPInP
	 SASaTb2/Z2Uf/M+XrpexvbSgYgxVF/Mo8BmlCpluMJAqcvhtKAIFImoy2WbaFWLjjR
	 mAcTx4LqulUTmRWkPwhTE+WUSYzmuYsHUV2BtrdscD2iE9Tiv96KiUci86fVA3WieJ
	 a9LmYG3HqnRq5QRH23n2Q9BRY8Agl2SQuRYPYs7xYnw3h3ii3aRjv33L/Oy9WvEDSt
	 YV8KUgbSgbOfzSFuTvKXm7h4SYjEPN7IgvnCzrFq4yKc8S2ITo0KzlsG/AkD49NtuH
	 xs/29bVL96M2A==
Date: Tue, 12 May 2026 14:34:55 +0000
To: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 05/16] iio: adc: mediatek: add mt6323 PMIC AUXADC driver
Message-ID: <gWxamwTKyUeOF4QCsiIsrnh7DSWzIKFaY0h83qKq_0vg786xv1uFYhypix7BVO_ruG_vw3DrIsRhIKv5NAzl8hK72rjzPAjwAGU-rhkMgeA=@protonmail.com>
In-Reply-To: <20260512142932.5c6801d1@jic23-huawei>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-5-3efcba579e88@protonmail.com> <20260512142932.5c6801d1@jic23-huawei>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: f3a0f1c1dc4818e265ee79b323d08552aaf3f4e5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_073503_200532_4F6B6DF6 
X-CRM114-Status: UNSURE (   9.41  )
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

On Tuesday, May 12th, 2026 at 4:29 PM, Jonathan Cameron <jic23@kernel.org> =
wrote:

> On Tue, 12 May 2026 08:18:19 +0300
> Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wro=
te:

...

> > +#define VOLTAGE_FULL_RANGE=091800
> Probably better to have this inline - however if you do keep it
> prefix t he define  VOLTAGE_FULL_RANGE sounds too generic!
>=20
> > +#define AUXADC_PRECISE=09=0932768
> I'd put that inline.  Little benefit it in having it up here...

There was a mention about magic values in the v1 for the thermal patch [1].
Andy, would it be better to use an inline style or a #define here?
If the former, I'll rename the first constant to something like
AUXADC_VOLTAGE_FULL_RANGE.

[1]: https://lore.kernel.org/linux-mediatek/afmnUG8dG0N0HpV6@ashevche-desk.=
local/

Best regards,
Roman

