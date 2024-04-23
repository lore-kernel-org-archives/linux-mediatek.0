Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95BBC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4Q4xR2Nv4jh/+S02neuNKp8cPAK0NcTf6tUOMBiMpY=; b=hC08yQSlESflIoAAdl9rpkot4X
	0dU1Od0/9G8SvAJ2PpAnFkL+KHV6sgq+pkCfypJ2M23mnTnTaHiB1FRD1NTIQo5m0+c8oFslyGdxW
	TTBhbnqX4wh3r2oJg5EIJT4uWSnyAdTgRryELmZLFndjcXtwWvWw3t1m5tbB5WCvdjjIlZdaPSfX2
	PIBZGxh3dOInq46fuqJGmEmL6edBKmlTto1GcGilLqgTfXmezA2t0YAbZLeRpJDk377kqJsN5etyW
	qFGgZ9wrvNIBshpJbqj7MIOypRI7jRCeO53fkDvG0bUq+YBUR9GW6FYT/N6oXppRTWRFGdbNSuTSs
	Yw8kz3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCLu-0000000GeY0-1mwD;
	Tue, 23 Apr 2024 09:22:14 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCLr-0000000GeWS-19bO
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 09:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713864129;
	bh=FjKigUCfND/yp/nDDgcfrG3dAnCXLuVl43TcITs3ywA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cmeFpD26AokQActMeUtYI378J8vQtgdQ/44EN20pPRIvLBef2hKpchW5av5QRs7/4
	 dMqfUD6PbzcIFpFuHLUjgSQrsIdPUCMnzXAs7/KLGybd2xWI3GGpTT3FI1Egc4OcLS
	 MW6V8IcTOhte8770C4qxsTYRxUjB4YvVNz/aai5vtiiUtVe5ikpxNU9d9/nR4bMsiT
	 BwWBUHiydI13yCNfsIAYjSAH7c5THIL5OrDNFPSBKHUr5friWlRUfyrhpvYG58i0an
	 +yAvKNKcMZxqgvWDU+d09nDdmvihR9BiHnJFGmcjD2oTYAG8RMXovPPDsiJqCXPafr
	 eXUvdbZNBTZIQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4B0633781453;
	Tue, 23 Apr 2024 09:22:09 +0000 (UTC)
Message-ID: <981a8748-16d0-4744-b097-aa9dd14c63a8@collabora.com>
Date: Tue, 23 Apr 2024 11:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] Mediatek thermal sensor driver support for
 MT8186 and MT8188
To: Nicolas Pitre <nico@fluxnic.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_022211_546626_EED669A9 
X-CRM114-Status: GOOD (  15.32  )
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

Il 02/04/24 05:25, Nicolas Pitre ha scritto:
> This is a bunch of patches to support the MT8186 and MT8188 thermal
> sensor configurations. Several changes are needed to cope with oddities
> these SOCs implement.
> 
> All values (calibration data offsets, etc.) were lifted and adapted from
> the vendor driver source code.
> 

I picked patches 7 and 12 (and also fixed them) introducing the nodes for the
LVTS controllers, but will not pick 9 and 15, as they're either missing thermal
zones and/or using the wrong names; let's wait for the next cycle for those, as
I will also be able to add the SVS on top (needs a bit of time for testing),
getting both SoCs complete on the LVTS side, without rushing.

Cheers,
Angelo

> Changes from v2:
> 
>   - use meaningful name for binding index definitions
>   - reuse LVTS_COEFF_*_MT7988 on MT8186 per reviewer request
>   - do similarly for MT8188 that now reuses LVTS_COEFF_*_MT8195
>   - use thermal zone names the svs driver wants
>   - adjust some DT node names and iospace length
>   - remove variable .hw_tshut_temp as it is constant across all SOCs
> 
> Version 2 can be found here:
> 
>   https://lore.kernel.org/all/20240318212428.3843952-1-nico@fluxnic.net/
> 
> Changes from v1:
> 
>   - renamed CPU cluster thermal zones in DT
>   - fixed logic to cope with empty controller slots at the beginning
>   - isolated bindings to their own patches
>   - added MT8188 default thermal zones
> 
> Version 1 can be found here:
> 
>   https://lore.kernel.org/all/20240111223020.3593558-1-nico@fluxnic.net/T/
> 
> diffstat:
> 
>   .../thermal/mediatek,lvts-thermal.yaml        |   6 +
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 256 +++++++++++
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 383 ++++++++++++++++
>   drivers/thermal/mediatek/lvts_thermal.c       | 434 +++++++++++++-----
>   .../thermal/mediatek,lvts-thermal.h           |  26 ++
>   5 files changed, 987 insertions(+), 118 deletions(-)


