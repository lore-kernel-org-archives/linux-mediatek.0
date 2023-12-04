Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6906C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAvl5I7F/s5f0m6nN7mtXCDr51NGvewLWC0LtOQ1EJ0=; b=VUNnBWcb0Yt3lfyAUmi5zepQsN
	al6mfn8eGito6W5z37znjipdMIH4TaEn/i3wZiSysb9jwvTbOeEfLgMMuh8BKs9aIwQ26EYJ4Pvzx
	WMHKUpWmlU1jxkSOrak6QGNGabjnzQJApxlgvdvEl5qrWCLBXO4/qb0DJCfOpuKoMikzncImxEZLR
	jRpPG+7ByE9tTFbIe/QvdVwRBRhsdpQY85XXAIxvEIRMUF4OdVN5/zp0Ne1ZoOu/nEPdce0OoGpib
	31AY8ojNoeFIzOnVMXb/yl5OpAjv23QaVJnhGFSrFSu8PuW6+RHRWso89jGVpIny3BfU7Ley4nP7W
	Bh6Z5wLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vh-004liw-2J;
	Mon, 04 Dec 2023 14:28:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vW-004lYx-2x;
	Mon, 04 Dec 2023 14:28:05 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E1248660711D;
	Mon,  4 Dec 2023 14:28:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701700081;
	bh=KkXpkO4uzsj6xvA4i59k3CLFNko3savUBaYI22mJu7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bud/TafLBs8JK0WpIV58pJ5WSOFuQwt/4Q+mr4kx67fZ44XaTFSUe0+D/NUVld1cL
	 loHplfot8Av+Mn0ivUnosQ/CCvs4ysLKH63U5BG4xbGFRQgDTHBYfgihdUywdGWgFJ
	 Y9ZkigOU8F8HZJOAhWh7Kw4DXV1dyv3MQlJaOYaMqkMTEMFc3RjQgvrILJjvRFtxYQ
	 wS/whoNGLmXwKHHrbUMkOaV/0b4F7ZH4RmoPFC3HTT4a70Id+pBYMi2Pn/44MMVD+2
	 rqw/hv4qpESADs4S0dAHGdiAJjbN4gT16k06mwediR7grJiI/rF96BbkUraspWyAx+
	 i3As60fcz4vRw==
Message-ID: <b8623f65-45f5-4ce6-8b0c-eaf5e820fd26@collabora.com>
Date: Mon, 4 Dec 2023 15:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: arm: mediatek: Sort entries by SoC
 then board compatibles
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20231204084012.2281292-1-wenst@chromium.org>
 <20231204084012.2281292-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204084012.2281292-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_062803_297153_7DB20388 
X-CRM114-Status: UNSURE (   7.89  )
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
> Some of the new MediaTek board entries were inserted in a chronological
> order, or just randomly. This makes it harder to search for an entry.
> 
> Sort the entries by first grouping by SoC, then sorting by board
> compatible strings. Also add a comment at the top asking people to do
> the same.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


