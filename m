Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F1FC021BB
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysynRyRrTvTspEBCOXU5o7cHcILnSOG+Xn5m1EaVF3U=; b=eaQUgWBWcLZcFK7ARbvwMMY3RG
	dfOE+m1TlPjDze2Qxb3YxO/HeGydWj2bYZaWf2kNjy5TiLBORd/8dt4Tl+A/ZoWfKKrvv9jDoKyvf
	IXmZuL8wKpIQ4/zwoohMQ3QumEaxPd0t4usSEwElwvEzwZNPQCLJBHY+nwTdsXuKsEzxGpVKwg9Sv
	78yg/bPeCQfI1I9EZAPIWcM9univaYStkpd1HobYqF9TqZm/tSexsEdSStymOAiclF/GwKe88DDIF
	iuSj3k7j7s2+ijvTzkygTScZYhjovPGULn75visofq3eIiJxznFwpD2km12r+Xbl32HlX+6VyM7TZ
	RSkneaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHa-0000000DnPA-3Kqh;
	Mon, 24 Feb 2025 13:14:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXQI-0000000DfR5-0bwK;
	Mon, 24 Feb 2025 12:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740399536;
	bh=AmMH/WOkatDMrjYDYyZb0Wz8PpA1XFye5JqgtqJw11U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PmzbdfUAU9x/DQ03emUlwVx1qaGBT/El75fCAaqZ7j+vlNqcDh7vEOuWTfvHdzYje
	 SS80Ogz0dmD861vNImZrqXrjBIHmbFYfGOQgvA6q0ypC277PBbCMbC91YvYFCa9JHZ
	 24lB7HDVB0rlA8EWSJUeXnwBhV9rIaEMDLiQtsL7q1I6WR9DKNlPmdnHlES9YPcIKI
	 VXXwfBDaGfCu4Z7K3Ut6QP1MF8i5qngtNlvZk4VcrLCFeTjoV+gHsgJztcfz8lPuXD
	 jYWDf40tC+fTXArQzJSPQ9S87lZVxtFPTlBNYVQADAAEj2UVssXwlBKEhcGr0NCrq3
	 dSb5Huby5t+Rw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A59EC17E0071;
	Mon, 24 Feb 2025 13:18:55 +0100 (CET)
Message-ID: <a5604cac-b405-4e53-9fd3-92e9aea9a6bb@collabora.com>
Date: Mon, 24 Feb 2025 13:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: mediatek,mtk-xhci: Add port for
 SuperSpeed EP
To: Conor Dooley <conor@kernel.org>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com, pablo.sun@mediatek.com
References: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
 <20250220105514.43107-2-angelogioacchino.delregno@collabora.com>
 <20250220-travel-undercoat-339822407907@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250220-travel-undercoat-339822407907@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_041858_335174_395CBB9B 
X-CRM114-Status: GOOD (  10.54  )
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

Il 20/02/25 18:18, Conor Dooley ha scritto:
> On Thu, Feb 20, 2025 at 11:55:12AM +0100, AngeloGioacchino Del Regno wrote:
>> Add a port used to connect the SuperSpeed output endpoint to a
>> Type-C connector.
>>
>> Note that the MediaTek XHCI controllers are always in front of a
>> different controller handling the USB HS (usually, MTU3), so the
>> only port that this controller provides is SuperSpeed, while the
>> HighSpeed one comes from elsewhere.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Is everyone okay if I pick this (and the MTU3 one [1]) in the MediaTek trees?

This is so that I don't get devicetree warnings when picking the DT patches
that are adding USB MUX/TCPC to the MediaTek boards.

[1] 
https://lore.kernel.org/all/0e58bfb8f2f7b7e83e3da6075986ddbcc84531fc.camel@mediatek.com

Thanks,
Angelo

