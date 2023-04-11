Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC45C77B6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCCxvPr3HqPSyYGjJcp2R1z4m4tVDAlLowCJGENlFks=; b=OlOFyjN75trIe88P7Yw6+I26iY
	McMANrhvnJH56rYiH0kTNHsLaWUXXuGLWPk6KL5puRSGMf8KO7Q5zANjADvHLbl5mfRkAVpdQXp4T
	31R3hR10McMGB/FH7H9GjF59/CSh+kv6MP1XD21jwbuCZM84N21xG+cRrEAYYOdJu+Bc+8YbltzuT
	SuH60WhzDq16BcK5EQLhgRbri4xmpyvtum64LZs2XENYiyV1excbQ4VwxrN++eaWdCI8gZWSUhgIY
	nFednqKQqGwBMnR7cpHOTNJDI3uL/FJDCYcEGy4qLVPkanemnCP7KX0jZE9AMrEQVsK1PW/bSxAtP
	RHYE1wVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9IQ-00Gr6q-28;
	Tue, 11 Apr 2023 08:24:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9IN-00Gr4v-2W;
	Tue, 11 Apr 2023 08:24:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6896266031E7;
	Tue, 11 Apr 2023 09:24:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201446;
	bh=Pw0IrMdaMdA9oWbbOHevvqTZ/sbUrBeKNCA7BRFp8EE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P7t1MlhdDHaW/8S0o7/grLftPNGlVZr/zlEIuEX/EOgBvh3+HnpPm4DmhXsD3XWlm
	 iFYqm8E8tMogrwQjkqKQmBNEDwpQ9wntEM2j1sSWpmJVIVMLZrofXupVmHFukmR30t
	 VLLCrqcgtgWpkRSbIgOuoOfSIuncBW/82SCXWKbbtjTSFs3uLR5PfWD/IdeWYfEMhp
	 Fw+nJ8SV9A7LIDwvD+wsvE4LpLS7AFBfGlLZQhnCMyQKV7wruXgOB2ZRxfltem+CB/
	 RWllW5OLoUJqyaVLo5bulpJEWgeeZtwX5r2iw/RxTc1ysrhDCSInDXSSyL9+Hx9NEJ
	 rArHT9zCwh6vQ==
Message-ID: <812f8cec-4e11-304e-be85-216bd07736a9@collabora.com>
Date: Tue, 11 Apr 2023 10:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 08/12] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-8-1883c1b405ad@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v5-8-1883c1b405ad@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012407_953109_4B9AFCC1 
X-CRM114-Status: UNSURE (   9.61  )
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

Il 07/04/23 14:59, Alexandre Mergnat ha scritto:
> This patch add support for SuperSpeed USB, in OTG mode, on micro connector.
> It also add support for the Extensible Host Controller Interface USB.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



