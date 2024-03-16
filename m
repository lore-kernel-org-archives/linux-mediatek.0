Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F158DC54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/L/trZ1rIq6HALl4PkUwc0f8DkBKoOI9oc6gkVP10A=; b=juKIIbRLIBq8npjsmoLJZ8jeh8
	NQT2cycLAUG/P4ZTr4kh5+CYRLH+fbPivJfIcnDgnGDv5DT+WqBTNQBCUIIUiOtRBPi8pywyk4Swr
	v5emU+NQCsJC72+TkTeMs7CGCM5428ueujUrZ6J/pvpSqX76nIBbkwKUY+ngQ9ZijHxIj9rZjOl7r
	2p7NZRREelFUxUTd1c7kP0CHSQG1WY5ufIvb2kVDSDC0+z1jp6jRKLHAQG7LXB0WYAB3a7qTO+0hN
	0HKjqUG2eup4etBG5cNkpOTsyK06+eRqKpC+mE90sX81x/b82YUvHFI44piYR9NGnv4wSsNCcCxhX
	M303xUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQFF-00000002qX4-0pZn;
	Sat, 16 Mar 2024 09:22:25 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQFB-00000002qUk-06BB;
	Sat, 16 Mar 2024 09:22:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C1C720008;
	Sat, 16 Mar 2024 09:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/L/trZ1rIq6HALl4PkUwc0f8DkBKoOI9oc6gkVP10A=;
	b=eqqKdJCtrYlo3sVATDw1hXbAIBwIXZfwznpwNi8aCph53wMTY6NUxdbcaxzCBCN25Wecgk
	5Akd2iJYCAEuRfy5LDXQS8pJ1fdo1v9gsIyQXYkJYigBcJH62D5W4xiL+7CZggmDT64iMh
	16y6H/ESSO+nyvBbXgnwEK/xPJNDt+gp0uiUCTL6P5YB9XKa/quB1csraE8CoeRHq0Yu65
	FhctLGFphfH77svldpZvQ85CAlqbE1/3m26FJWM9JAeVj+pUjpipnCvSYTDFGjMvmMGfrg
	pjwvXpVKJ3JOG8fMqly1UAs8wth7njs+NNmNyDuWyJPOLmhOwxP8hBE4Wh1hTQ==
Message-ID: <44ac9459-e19e-4a2a-87a8-f0ac5209e1b9@arinc9.com>
Date: Sat, 16 Mar 2024 12:22:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] mips: dts: ralink: mt7621: reorder spi0 node
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-8-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-8-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022221_214644_5758B2BE 
X-CRM114-Status: UNSURE (   4.91  )
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

On 16.03.2024 07:54, Justin Swartz wrote:
> Reorder the attributes of the SPI controller node so that
> they're aligned with the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

