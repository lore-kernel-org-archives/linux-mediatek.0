Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF54CCD1A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQfQFKnJOZYqViguvNb811kxMpCiH6bxUGREwPcUnZs=; b=fgidMpL516w0Zo67qVBFilcmb2
	xks4FueAQxyRxnhHLNbwhK0y3wH156WRUGM5/Z4D2gxAh/RMgYaMnUHUlckx4ats2Hf2Gxm75E1fE
	mpf0Dewlr38fdTf1HtSFxOTSMk9U2cOLSq/I+ZSHKPQN3E6pti8q3iZ5efw5wRF9oDwPPeo6zNlPV
	6xpYVDW4XcjSSYU8TzLg6aKoxhrYpDocWW+sN6ZL0p8ZOFNszi3aY23GeAvLDVsx4qwDkGoZ9apgU
	NIZHV7XYXcsLtSC0/lZFXznKCpIeIp8aQoL8ycy3Pl/2VNp0IwVdxqIgPraXq4zw4DtlEm1ol8Bmc
	H1yOqHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqth6-00000008E9W-43X0;
	Wed, 18 Sep 2024 12:22:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqtfy-00000008DwR-1JQE;
	Wed, 18 Sep 2024 12:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726662052;
	bh=uaxBNQZ24wHxZDGsXGGXNTCgB5EtT70uYStd4gW0wOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j3dIOswL54bm/9LAze3PRBWNFol9hYTAT134274Q3r30vSryX1KOYWO3iVZ1JUIOG
	 7VoW4DcAgaLnF1DxFmXQhHWjVzlbGhPpPOjEGIyqUCTk+xhNNJTzkpbguxEYzX4qT+
	 +gjGxQLLSUMqzVj7DbMYZ3NxkmVSSkiE0ABQwCDaHjKYHjtT/xi9d39PfmhNNDyXIX
	 D5zz/21TwPkt6WBbH/QlMqGeExQN9Qrb9M4F1cbp76LU2qFFAMTIGqDd3WvkLzsGwl
	 F0xWYXFWHO+tB/pnZpsDjgvNpB2wyzjSdXS8wNBSxqbaxPsRcRWNf5IlfzSl6Qd50X
	 ZEp2/etwzf6VQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBE7917E12D6;
	Wed, 18 Sep 2024 14:20:50 +0200 (CEST)
Message-ID: <bb82f7df-daf3-4162-a85d-0255b0f1cd0d@collabora.com>
Date: Wed, 18 Sep 2024 14:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] regulator: dt-bindings: mt6323: Convert to DT
 schema
To: Macpaul Lin <macpaul.lin@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240918064955.6518-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240918064955.6518-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_052054_542180_BC42A55A 
X-CRM114-Status: GOOD (  11.68  )
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

Il 18/09/24 08:49, Macpaul Lin ha scritto:
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



