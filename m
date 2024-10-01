Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA199CEACD5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmSBxXa9QYDpwB4he7PwNp59Phk/JEbXfKDu74Ur31Y=; b=K/VmGUJA1hL5QDu34SHxzPBLiz
	8gYs13/uocR9eRFJTdgmRQ6O153/LjARpmQ6A/CoVgyfgBARd4fqxiU7GXCAfYiSYuZrecmHIezJK
	mKuFh8QiU8wYgCaWV1TrA+EbOCy7kCM0A6ATdvDGMLjWw2Y732bNPBSGYe/aKFEXbBv+3ehfbVTQh
	wGzzx0oWNMRFcq3i9KbRLunrVGewcGmf9K3HZByg7ybPrFPeXG/C4ZYUfGHw1rDNqDdbPxoUAvEds
	uSp6Y9+pcsY6UKf2d5odA36LDSfrpxZIeSwdJPIp0JfBtQm36QSplVRuOtjzPkHQg8JvAuJ55K/g+
	I9rvv2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svenK-00000003KJa-3G3t;
	Tue, 01 Oct 2024 15:28:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svelL-00000003K10-0t20;
	Tue, 01 Oct 2024 15:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727796364;
	bh=+YZZSxfbdyiIr93tIMUZDxqaYcghUxhFXzEBtAfe9Sw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IsRCdtlkZPMbwZhF685OXK4Jrwj57OtfDIQHj1ZDuS1AA3K5BX0ZP7O0HY8uDgHna
	 Ej9yVcpiofM61HL21cd/KWYTTG2XmHoQIbJw7PznJ8mJQbT2GCInkt4SLh65yLIgyv
	 vD+5Sf3esOwjR3PIhtzxULPXDsWeHX2eyLV10QW1jsAqU5tQqLu8lQPTPBjFcp7j5m
	 8UvMF9Z1ApUljwa9IkHvwwYMrbP+eaKpqnMiDV4++YPNdyqvuwhp4adlvQkxPvIQpn
	 ShnMZmveHuhDrVOB1oV5YCJHVEmEqyhf+jw1fB1Pd5B9trw/EdBfFOdrAeLh50tW50
	 phIwzx9zBxqhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B21417E0FDC;
	Tue,  1 Oct 2024 17:26:03 +0200 (CEST)
Message-ID: <a3089f16-bc43-4ee0-b313-94e5a37cb449@collabora.com>
Date: Tue, 1 Oct 2024 17:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] regulator: dt-bindings: mt6323: Convert to DT
 schema
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-sound@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20241001104145.24054-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241001104145.24054-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_082607_463591_872F57BF 
X-CRM114-Status: GOOD (  11.12  )
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

Il 01/10/24 12:41, Macpaul Lin ha scritto:
> Convert the MT6323 regulator binding from the old text-based format to
> the new DT schema style. The property "regulator-name" has been added
> as required property to reflect current usage in mt6323.dtsi.
> 
> Examples have been streamlined and relocated to the parent schema file:
>    mfd/mediatek,mt6397.yaml.
> 
> Update maintainer and submitter information with new entries from MediaTek.
> 
> The reference document cited in "mediatek,mt7530.yaml" has been updated
> to point to this new DT schema file
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



