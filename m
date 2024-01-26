Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBF3C47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHic4AlFKO1LGmdKKVFcYWxEwVXnyFoVSHDTZw0OfKs=; b=lTGCtKRhnggEc6GV3auy3aJEyW
	KL2XUtCkBJLU+ZXEf1KRcbUKxMKugXDyGLkEKWBSVwD33jgFV7hjt2raBsbJmE9GxWvieiH8l3F0b
	EkoDuaRkCD9bFCBgNZsGjMq9wA5SPMZbEXPSj1dWtSTDmjgDThY+j/9jVakG8e2mpwScBLGhYh80e
	n+q0aJfUP3XhJZLHMk4QxMFcqpCJyV46cQubhmnbCoOyNHqiCiv4fBp3y0fGGVMd1k5L/HU/48/BG
	FJ530zxWEiyDDRnseQmfivLOku/U7QONz064Sa6rbR750jLCBceK0jE01Numm9SKnpt8kywx6Ayzg
	E01HKB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIE8-00000003a80-3yek;
	Fri, 26 Jan 2024 09:10:21 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIE3-00000003a4Y-43JS;
	Fri, 26 Jan 2024 09:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706260212;
	bh=SxA01WsGYaiPR9ygKYJLgo2WCbqnCyZLRDfMY+rV6Bs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CsidsPSIcR6/+pQuEXLQ9vCn7YW8F3/zKlwAHE0vJHrGn2i/BPbqxIOpepjB9sAm/
	 Jow9+j7iW3P3bA5Tl8zbNkF5YP3rrLUrJL7ROX2xOAlJrKbhtH9No00Bj1oMDQvBOo
	 GwaPUkP1zUmcgI+TbHCAOFbvninsgIVC6bswXBOfAy4eT6t2jZRFT1cjhzXN7n0CER
	 92GretTOS43sE6H5tsSw6iTZze9FKn4MA71i6pkqZpSqFPoSjbK8Iv+tBsec01x8jJ
	 7TlrqglJdNwUFOuvz0mIrZVs90w7NilbiqKR8aXfhdbAg23xfSbMRPxm6SGCXwN20r
	 VdPHNW1d7Dd8A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1DBBC3782080;
	Fri, 26 Jan 2024 09:10:12 +0000 (UTC)
Message-ID: <051a0b5b-068d-43ce-a73a-f70f94888f8c@collabora.com>
Date: Fri, 26 Jan 2024 10:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
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
 <20240126083802.2728610-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240126083802.2728610-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_011016_167171_DD410D3A 
X-CRM114-Status: GOOD (  12.07  )
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
> Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> Krabby design.
> 
> Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> convertible device with touchscreen and stylus.
> 
> Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> device. It does not have a touchscreen or stylus.
> 
> The two devices both have two variants. The difference is a second
> source trackpad controller that shares the same address as the original,
> but is incompatible.
> 
> The extra SKU IDs for the Tentacruel devices map to different sensor
> components attached to the Embedded Controller. These are not visible
> to the main processor.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



