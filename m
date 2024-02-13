Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ACDC48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOt8+bcmDSYQ3g9plGhzRK8jFRpez9YF24zMgIx2iIU=; b=R2SHtYQcbDJ8AC
	ENWo1kw1XDPjb/cj9NvXxO2mVcr9QbHvi8FYim/GbGi8SiJJ7/73nGX+xcDVu9r6w25sWVptOqQAb
	lh+KCYdZv1LyOYfnqnrzG/ASZ/ws628X5ugwadDzjWZkFdCUIyJ3SGlpjBDft0LvUGWeN/5cfI35c
	zhcbgIiHRwg/J2QubqbX+JKHEtBDlxTPQH+T4UNqjMgq10xZ7KC7zTq/oI24YUzbiuXXc8r7LP3ys
	6qwWSKDYfCr1LntD8vfT23JIHvHGvbisATYDkrPADNVFTaaQgelp1dijNqbNMUr7LFNQUZp1lxRkj
	iyj3MZzJ54zmjaIeeg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZopF-00000008YmD-0tpg;
	Tue, 13 Feb 2024 09:11:37 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZopB-00000008YlO-2b80;
	Tue, 13 Feb 2024 09:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707815492;
	bh=9knv+ODPdDJCuZiyTJw6oxKEkgd2kVoris7GQl7tfmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=y3/SvmFTdf2l5qEhn9PHwYdshIWEor+YHOecyE4Dl1L60lJC3BmxG1wgZqYOB/C46
	 FeTF8rFnpwEhTIFWyd2g+xZPI/VQYB+EYLUWw5Yv3ILrsQtSGT5+v8oOV18X8S7kyd
	 C/K+rugmFEX2HkkNDUZUsbTKGPIekpUBl2hjCYlZdMVp1v4wLSKsJn6h44rgIMPIzT
	 Krh/x0zxozFpfbufTtxxI8Uqt1BsWQUo5PHROhlx8SgabK4MURIzMfqI5uKEGkVoS0
	 7XRxqCVrP4nNpnVcl23YJOR80Eds3xR1cEsyO8i1XSI9Jn47fbmg7V10QGIZKVn2//
	 0Y+0bC8YPcoKQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5627B3781FEF;
	Tue, 13 Feb 2024 09:11:31 +0000 (UTC)
Message-ID: <a99af719-4b2c-4c38-830e-b49a89971cb1@collabora.com>
Date: Tue, 13 Feb 2024 10:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt7986: drop invalid thermal
 block clock
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240213053739.14387-1-zajec5@gmail.com>
 <20240213053739.14387-3-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240213053739.14387-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_011133_807692_0E12D9A5 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/02/24 06:37, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Thermal block uses only two clocks. Its binding doesn't document or
> allow "adc_32k". Also Linux driver doesn't support it.
> 
> It has been additionally verified by Angelo by his detailed research on
> MT7981 / MT7986 clocks (thanks!).
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: thermal@1100c800: clocks: [[4, 27], [4, 44], [4, 45]] is too long
>          from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: thermal@1100c800: clock-names: ['therm', 'auxadc', 'adc_32k'] is too long
>          from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
> 
> Fixes: 0a9615d58d04 ("arm64: dts: mt7986: add thermal and efuse")
> Cc: Daniel Golle <daniel@makrotopia.org>
> Link: https://lore.kernel.org/linux-devicetree/17d143aa-576e-4d67-a0ea-b79f3518b81c@collabora.com/
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



