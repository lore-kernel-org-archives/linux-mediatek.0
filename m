Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A9606A332
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lfbhEINW;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=okI7KpRd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dQe8cmA4nsyOb9bGE5lcRIBNwi+AFNzjopJUX/lBJMU=; b=lfbhEINWr7tArD
	f5STn4zMng5YwyF6x8jtpeF/hY5+O6X62evnB2WKedrrLvljBeJDNxWfSyCAdf3OOqgyNCZNGs7uh
	qR1j6tXIZTE64l4H7BZCoIy5AellgHSq2hV98tRw3ZyzRcc9dGVOmGcQ5D30PJs0+XKrdYjLbKjrx
	8++HRqjX3zGOVEAOSkayhgdcr/KjAN7DWvkltSt2kppDQhjNYyl7LUcPvICvT+aMEXoSE+8cISXnx
	WdjBDTGPBx8jwdAFI7WzsA1Pgc8oyPlxhvABq/NF1lwtyAUGhi78GHvJEz1id5Y7GZRh7fqVOEfVp
	ef7/BLgFtR3KsGyOrgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGmC-00000005KuL-39St;
	Tue, 17 Nov 2026 10:51:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGmA-00000005Kta-0Kt2;
	Tue, 17 Nov 2026 10:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794912655;
	bh=BJ7G2PRuc7uvUsxw8X+YUPtt6Tmdw+QHSmLN8I9bpK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=okI7KpRd2hnHUCZ6KFPvVdk06X3NDoOg1vcpLGIV5POlhc3Hl63myTKOGqEmNZLQF
	 bAr6z5nKfVxLK68MDnrUL7CH16nB7WCCXFLmIWYYomRM1WRSMm7QS29DQhn7cedeBm
	 HnE7b+NTsL6FKWJRYKLjKbVMOyiNDSq+LowgjrVHIAbukJmNA38UYs97MPAvrXbVf/
	 AsXFX79K499lmar9Pox5XQSaH6rAM28oFhWTodehVuFSIlP9IZ6/DHPKuIEPH/h8Ec
	 cdDofK6xQmLtdYbmyVF8QMWJ4jThGtQ/yqHVqt2K0QPkgSNmtBe7lXNcqWuapbs/9G
	 rHac4mVK5ljPA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E565A17E04B4;
	Tue, 17 Nov 2026 11:50:54 +0100 (CET)
Message-ID: <b1b4c984-14d5-41b3-84af-10df541790dd@collabora.com>
Date: Tue, 17 Nov 2026 11:50:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: Ryan Brue <ryanbrue.dev@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
 <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-2-5c3c7a5a1851@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-2-5c3c7a5a1851@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_025058_303237_FBB11D78 
X-CRM114-Status: GOOD (  14.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/25/26 06:18, Ryan Brue wrote:
> The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
> built around this PMIC it is the only way to read the battery: the SoC's
> AUXADC is wired to board thermistors and the charger ICs these boards use
> have no ADC of their own.
> 
> Add a driver exposing the battery voltage and battery temperature
> channels. Only those two are described, so a channel ID in the device tree
> indexes the driver's channel array rather than the PMIC's channel number,
> as mt6323-auxadc does. The ready bit lives in a channel's raw result
> register, but the value comes from the chip's factory-calibrated copy.
> 
> The battery voltage is measured through ISENSE, because a board with a
> switching charger in the power path leaves BATSNS on the charger's system
> rail instead of on the pack. The thermistor only reads correctly with the
> PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
> settle. Both are switched back off afterwards.
> 
> Reads average sixteen conversions in software; the chip's sample
> accumulator makes no measurable difference at any setting, so it is left
> at one sample per conversion.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

