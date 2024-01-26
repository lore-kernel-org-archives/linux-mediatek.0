Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADACDC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULpPz68Ob97sY5qpEmqhEJy6cdjfpQ67Q2m81/PklI0=; b=pqii8hyi++EgkO2thDLBOH78Rd
	9iF/TpEO1YeHfCrzPSKdZfoLMiMpxHVFjF3jzClYCHa0l+X9DvgeNuNZt5BsFJyexcBiXKbQuNCqt
	Awh/KhiGSZ+NYRE6clNfv2e+blnFyN992ZB69gEV5lfKtowb3UqDNSKjne9cZeXnosSsQbjluSMcS
	KBH6L9FTcu5GNha5w5Wk5VFBiN6jB6Qs/UbalFoKDV7vtwe3FrJSLg2ypI3+Novu9EXvXIIhTWUD0
	/orG+lLfSDWqoX/LcWz3a/l+3y0/X1TBZj5CX+9qPsd/AW0GynuUZfqMC0rifcr0vKrfqt85jBp2e
	FtQUw68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIE7-00000003a6g-16Lv;
	Fri, 26 Jan 2024 09:10:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIE3-00000003a4F-31MI;
	Fri, 26 Jan 2024 09:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706260211;
	bh=azLgXU4B5hvZ3lRSpkqmX1dSsInT4VOSlsC6BUhZkaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iUr1imQ9vVCgJdhGgthjtbxIGCi8O3zxDr4mW488Ieq3qJZL8gtRQTb/lF2TiDz6z
	 yGN3/eLl7GccqUcnUop5pPG8zLeLf3R8DwczDjBvhrAqIyyTq1WHs7/ByOWZ00v/1v
	 E5Z4x/Hy61hIXSlG3NBVe2Q4ohWL7rGL8PfbtF4IgyBlc+UpzHbjxdgfHe+CGNkm4t
	 sVBBUTIPshedtsJlTDedyALB+ZNM8MRq39Bi0XrR00jvqwJKp5g9qHirZAOsJaLMae
	 IywGRIZujw88biavP2Q6+fhTnAy5bc1CfbB5a+Jvv6IxR0aqEkah/XWv90VZy2ffS/
	 mVd3jgNEq3wOQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2B4E03782072;
	Fri, 26 Jan 2024 09:10:11 +0000 (UTC)
Message-ID: <735f1b96-0470-440a-a72a-090c6f98b619@collabora.com>
Date: Fri, 26 Jan 2024 10:10:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] arm64: dts: mediatek: Introduce MT8186 Steelix
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20240126083802.2728610-1-wenst@chromium.org>
 <20240126083802.2728610-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240126083802.2728610-8-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_011015_926881_218C84B2 
X-CRM114-Status: GOOD (  10.16  )
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

Il 26/01/24 09:37, Chen-Yu Tsai ha scritto:
> The MT8186 Steelix, also known as the Lenovo 300e Yoga Chromebook Gen 4,
> is a convertible device based on a common design of the same name. The
> device comes in different variants. Of them, whether a world facing
> camera is integrated is the only differentiating factor between the
> two device trees added. The different SKU IDs describe this alone.
> 
> The other device difference is the trackpad component used. This is
> simply handled by having both possible components described in the
> device tree, and letting the implementation figure out which one is
> actually available. The system bootloader / firmware does not
> differentiate this in that they share the same SKU IDs.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



