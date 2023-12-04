Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D16EC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICmYHg+G2n19rjtqAn3iVeCYvHitHaY+QAN43/tzq/g=; b=iSR6WKU5ZLigLSw2+k47zntfTx
	R8c4+SJ3tRHEnxBTJY6QIQcL1WDgkloc7u5NUPTfe5okrkP+d3UU7Pfn1aAzFVYUytAZFcBUWx0rl
	KBYzqgA7hTM63cMB6kVlHGpIyj72Iz5eO6notAoBl+LISuuo0CzQ8xu0NGsveA+yUOdhsvrr9aPeM
	gfAL46Oz5amOH7GoU25K6NlTr1FY4m/9Ef4lFrTIUR3BMrdyClKktjRjgqp+wEq1K7MwMdemdtbM6
	0ROOfYbPrAbYjZQuH/nyr+UgbZtDA0YkJda74V5c4E8pkv8z4NuKD9ro51OU+BM1nPbJvu9ry3l9a
	VqaLV1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vW-004lZQ-2m;
	Mon, 04 Dec 2023 14:28:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vP-004lT6-0V;
	Mon, 04 Dec 2023 14:27:56 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F4196602F41;
	Mon,  4 Dec 2023 14:27:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701700074;
	bh=QSxpW+IBJsuxHY0HRVh4ksH35/aOjnups19/pSTeQHw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cUkU5srAiLj8fi3hHPR/57FxJIkfuah9JE/V/6opHDsNKGPZigvjcH/2f6SUUaI3+
	 nOr3DSYX6UyVFMVa4MxRRldu95K8hjcuzCVXq5CLihtvJd3YIo+F9UzzDnF4G9O/cQ
	 N3jaHtcK/lu0UW9FPvDNlzO2LLkncxhqIL/OeHXSpNw8TgwT3el/opohWAhoW7Opo8
	 Yrn8RwXoNZ0GBMzizo9ppj6lhwi9ttDXLcYMwvOr9OIVVEyOOrW4tZbAMqG+E0dVag
	 aLPXfUbyB3rTzWuxnopfCfE9dELy/U7y614b0fdY3twyxKZWdaxTU5pxFGukhNsgsN
	 Yj0QFNLNvpAew==
Message-ID: <6261c914-fc03-42d7-8237-75f3b59deb5d@collabora.com>
Date: Mon, 4 Dec 2023 15:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] dt-bindings: arm: mediatek: Add MT8186 Magneton
 Chromebooks
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20231204084012.2281292-1-wenst@chromium.org>
 <20231204084012.2281292-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204084012.2281292-6-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_062755_325172_189CDDEA 
X-CRM114-Status: UNSURE (   9.33  )
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

Il 04/12/23 09:40, Chen-Yu Tsai ha scritto:
> Add entries for the MT8186 based Chromebooks, also collectively known
> as the Lenovo IdeaPad Slim 3 Chromebook (14M868). It is also based on
> the "Steelix" design. Being a laptop instead of a convertible device,
> there is no touchscreen or stylus, which is similar to Rusty. However
> Magneton does not have ports on the right side of the device.
> 
> Three variants are listed separately. These use different touchscreen
> controllers, or lack a touchscreen altogether.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


