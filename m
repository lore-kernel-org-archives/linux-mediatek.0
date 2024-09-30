Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA7ECF6497
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8e+9oagP1WrtTyrYv9qZPriCC1T+YdC1lBQHjlY7UI=; b=HUxAoz0n0N6vdJxji+E4dwIbVc
	PueJu5BPTFcKg4pm6xrIQXzN4Aa/nkbm8LYFRzvVSW6DkHX//W0ijGIK7ggfw0dNMHmqN+a5GSyYe
	hxTjsm9uC9Fz3AK3DQtQXwhYxdFTar5d519eA63aIVULz0HVL2gM41NI04FNreUDdY1YJezMEz6e8
	yTTILWffhjT3jBf+fUDtsrLhYUuCauU11ZuTBEUnbGE7e7edFCoqrWMSMXgZYJLnC7w2G4Nc1cMua
	9yXc9Dl4Q2Zx0EvvGAA9MuI92/KDKj5Pk/qJLuprWCw9FOoh7BkmWtEt9HmqTf3NUQA1dR2K7L8Vh
	mlPiBPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDFs-0000000GchH-2Zdn;
	Mon, 30 Sep 2024 10:03:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCjJ-0000000GWxf-0K1e;
	Mon, 30 Sep 2024 09:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727688607;
	bh=chXonVIjKbTmAdAOSYxXNG0+38/QRF5hIq6lh/WbP+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EbDMjcHZNHIfl4ef62zGh/PnFFWf9km6MWrEdedLicstQj3EB1mefogTMHLh20hEO
	 ny41w61Ktf7Q+JBvBbPqEiAGhkidOWm+Sl0eZV8RNrNrj0qTX4LN+DzsioXtxLF3oT
	 QRbFiG9FDAryUCW720ch4+G6dTHX4lZiyv8wA2uve0lb8FYZcFEXnHhHuose3UFibN
	 EZCdwHSeD21bysxVskgMsZoYH1heiwVPOKOe4SlZNAR1H2lxQb1GniNFPdnOpjOccp
	 whXFTEpwH3BDej9rQgPFBj442rv1mJnQxv3e4KO0vAKI2B6KVxDc9HbHmjvItvGTsL
	 cUAgbCv+e+rGw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1AB2C17E10AC;
	Mon, 30 Sep 2024 11:30:07 +0200 (CEST)
Message-ID: <fc9d8eee-8d6d-4f1c-82bc-873765dfb458@collabora.com>
Date: Mon, 30 Sep 2024 11:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 Mali GPU
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240927103005.17605-1-pablo.sun@mediatek.com>
 <20240927103005.17605-7-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240927103005.17605-7-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_023009_411954_8931F409 
X-CRM114-Status: GOOD (  11.89  )
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

Il 27/09/24 12:30, Pablo Sun ha scritto:
> Configure GPU regulator supplies and enable GPU for GENIO 700 EVK.
> 
> The GPU in MT8390 & MT8188 has two power inputs: "DVDD_GPU" and
> "DVDD_SRAM_GPU". In Genio 700 EVK, DVDD_GPU is supplied by
> mt6359_vproc2_buck_reg, and DVDD_SRAM_GPU is supplied by
> mt6359_vsram_others_ldo_reg.
> 
> According to section 5.2 "Recommended Operating Conditions" in
> MT8390 IoT Application Processor Datasheet v1.9, The recommended
> operating voltage ranges are:
> 
> - DVDD_GPU: min 0.55V, max 0.86V, typical 0.75V
> - DVDD_SRAM_GPU: min 0.71V, max 0.92V, typical 0.85V
> 
> To further optimize power saving, we couple DVDD_SRAM_GPU to
> DVDD_GPU according to the following relation:
> 
> - For opp-880000000 or lower frequency, keep 0.75V
> - For opp-915000000 and higher, DVDD_SRAM_GPU should follow
>    DVDD_GPU. The exact voltage for DVDD_GPU should be decided by
>    speed binning.
> 
> This rule is derived from the OPP table in the link.
> 
> In addition, set the voltage spread to 6250 uV, the step size of
> 'ldo_vsram_others' regulator of mt6359, otherwise the regulator
> set_voltage operation fails.
> 
> Link: https://gitlab.com/mediatek/aiot/rity/meta-mediatek-bsp/-/blob/eedd6aedd4b0cfc0ee79b9c9b9650dfa73cf87f6/recipes-kernel/dtbo/mt8390/gpu-mali.dts
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


