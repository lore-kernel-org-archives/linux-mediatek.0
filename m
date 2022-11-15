Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0880BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEbSHKHGRpbb9PgZ/zPz2mmQi5ODZU5r5BMBef00TwA=; b=lpFeAmapJQXAqw/HyVBcPfdalY
	mnTHcl27rbZOK1SxoHIXyy/BqXlKbrlim1C4pBltRN8WlVAAKubrBfyRU3uL+rxnTQrzMGdisGN6N
	Kz+JxRA3pPwRrNUEIJaovfV8oGdjpt0hvrwhC6UvalrcpN4BBNVQ1v+jAlydJpY21APMurxoPgneK
	6Y9/Vu4SLrqR2lVjE3b2ZlRub0QRmEGHwezu3IP7anV/okmFmNWxmITQ7b8uNz/fKLNoHGaOG9qcs
	Sam7ItM++oBb+5f+D14cqtYH3UnNOePzeJByAR8hBMkWSDjHwHuiC0hZiM/wE6exrjpBLwEHyrrcU
	yPjtUiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouqwz-008ruX-SC; Tue, 15 Nov 2022 08:05:45 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouqwm-008rm9-0p; Tue, 15 Nov 2022 08:05:34 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2E076FF806;
	Tue, 15 Nov 2022 08:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668499528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEbSHKHGRpbb9PgZ/zPz2mmQi5ODZU5r5BMBef00TwA=;
	b=pfBhwswO4mTb4ORezuGnVBW6MsdaRQQTND2iQzNEIYu47J5OLZJsz4OHV3j/FjxNBuMYef
	iJjRCOWK/PyfCQGtnGR0CuKFbskranGo0cuchaIxNkEeSbbdkKfojCVcthAKVeDOwdhU/L
	gWud8NSqWFagejFW3AO3F2D8U4SL/Ww/X6f+4BCzcRCZUzXUtCk7C8ET5CQTo2vpW914Ic
	QcA4ZrxVTTcWncMysRsk1wtnYCnAONud/7rUdjeU3ZLSoiYvjaDP0CVAqYAnAJv8zg0hZC
	kMDafJXoF9EPqIzvvB6V9t9O4NUTNnp9WeBZr7NPzqBJdh2f1x7oKmn1rP/2zg==
Date: Tue, 15 Nov 2022 09:05:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Message-ID: <Y3NIRbyirJjT7xay@mail.local>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <20221109222916.GA2985917-robh@kernel.org>
 <Y2wwUOJ0KZdt1tZ6@mail.local>
 <adf8bc44-4cbc-af2a-4ec8-1859a98146d7@linaro.org>
 <Y3LHxDIzfZWhnQJN@mail.local>
 <37dc4e39-8033-a40f-edd7-4bd30f841e23@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37dc4e39-8033-a40f-edd7-4bd30f841e23@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_000532_384120_F85C2F8A 
X-CRM114-Status: GOOD (  19.85  )
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

On 15/11/2022 08:56:40+0100, Krzysztof Kozlowski wrote:
> On 14/11/2022 23:57, Alexandre Belloni wrote:
> 
> >>>> As this is only a compatible string, just fold this into the MFD schema 
> >>>> doc.
> >>>
> >>> Actually, it probably also supports the start-year property
> >>
> > 
> > I checked and it doesn't support it but this needs to be fixed.
> > 
> >> What about rest of rtc.yaml schema?
> >>
> > 
> > wakeup-source would make sense but the driver doesn't support it yet.
> 
> The question is about hardware - does hardware support waking up the
> system via interrupt? This is usually a domain of PMICs which still are
> powered on when system sleeps.
> 

I'd say that it is possible that a PMIC is able to wake up the system
with or without having an interrupt wired to the SoC so wakeup-source
makes sense. We don't need it if it is interrupt only.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

