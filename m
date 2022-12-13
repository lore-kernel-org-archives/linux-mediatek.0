Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2295FC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXjMENtrPpplj1W/O7G1rbOi2u2f+rNVs5FOn4us4ko=; b=1FtO15bih9T+5/l7D2QiqQ7qk1
	QlS/0KZowUAS5br8o7G7NjJ4KfDpleXTdbbwawdE2u434sY0cXkxjISZOvq8mmTV+qlkfsqGmJDFF
	Er+YSlEKdPRRla9w3/+aLiyzngJjlvTo/2PlPua0s1BBjPl9GrwCodw9foevzn5HNvJFBZKUh07Hn
	rZXhutYylCNDSeRTKDbfmi5eO4K+Y3W/UfXxUwHXJKlAbQ/X92denTZRrRBstUYVptHh1tWCQ6D2h
	o7PKnVp+KMhJm2JTtjpp9syXqn5TgvzAvNe0plBxIiQLtRjQigRiR/ND0QKJimglUCVVYxvuKl6q0
	OX4iIVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p53Qh-00GMmM-Ut; Tue, 13 Dec 2022 11:26:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p53Pe-00GMDF-MT; Tue, 13 Dec 2022 11:25:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 06BA46600366;
	Tue, 13 Dec 2022 11:25:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670930729;
	bh=/fF3aSTd/uKco6tGfOrY3rrnGeliBFT+fM8adgkAw7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ULcG+iwgs3mVpfs3k+XH2L0zABkRMLWSKR9lHzBVRK6hwV8HFr4Ik68k3t0+CS81l
	 qL9KS8LrxB8Ve82+wEFRC6wbsmaKrHhvGl00vpq/4GvCSATLV4rsh4t/ENgu0atIvV
	 HvOb8dwLhba+2mfLrMhGT+UXxoHU6ql/m76DoD9ULuYduKBNvRjgqKZTSbyaw1ugjz
	 bWknP16VZ6MtQUAk0I1ipc+ubb177OEIA4nwpmpJLtvmrEOTZkxwSkwLtBtcUHjaKc
	 hAcTNWS3CzxTWrYxx/dlD69F9jHZDVay1YCqc9z3i3YlSH6twGOnXl0KkP+bU1nOOr
	 G++KjZ5LJ5qvQ==
Message-ID: <7d67cd32-50c7-e021-c9f8-b0aa331b6c3c@collabora.com>
Date: Tue, 13 Dec 2022 12:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8195: Fix systimer 13 MHz
 clock description
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
References: <20221201084229.3464449-1-wenst@chromium.org>
 <20221201084229.3464449-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221201084229.3464449-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_032530_928531_14365B0C 
X-CRM114-Status: GOOD (  11.26  )
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

Il 01/12/22 09:42, Chen-Yu Tsai ha scritto:
> The systimer block derives its 13 MHz clock by dividing the main 26 MHz
> oscillator clock by 2 internally, not through the TOPCKGEN clock
> controller.
> 
> On the MT8195 this divider is set either by power-on-reset or by the
> bootloader. The bootloader may then make the divider unconfigurable to,
> but can be read out by, the operating system.
> 
> Making the systimer block take the 26 MHz clock directly requires
> changing the implementations. As an ABI compatible fix, change the
> input clock of the systimer block a fixed factor divide-by-2 clock
> that takes the 26 MHz oscillator as its input.
> 
> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



