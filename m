Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386F7C35FF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8d9gbhM/ig83qSZCT6FK9Kmn6RXtXUqbVMNl3HB5/E=; b=Gwd5VBte2WMI+J7/meLQCX5mr7
	dSQZfRDX8KdMa7ngzILlQ0J/QpmkQ8iO6i9b53FwIULLz8xjdmavgFQGsbiKTLG1mwaJZUl3rx9ig
	BowxVByO14gD9PXtU2fY7/861sbRcbc21/mWZh7flTOXFucOj/DsiwTxjxcGaOnadmwU7bHZ1tMoO
	KZyAruZj6wPuezPvByVqO59cKR1ghsdnAtK4Qte7hb7sM9cZL91GbjFrQHVQYlIK3pcmLNvY+qlE0
	mhWQYAcDrGQQy9BPRpKUuEYwuKU1tGO4HeCzIfuhYT/x+2FDH9YFNtIk0rzxuYKhDPpV9jS4olaMg
	PT0b6b8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqU9e-00000005mKW-33lA;
	Tue, 17 Sep 2024 09:05:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqU8X-00000005m9Z-1cMO;
	Tue, 17 Sep 2024 09:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726563878;
	bh=5NCGPiERJ+Jw5qTfwSzmHF6iCdF89H70h6XEILDhTIE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S5RMeAyLuLMXAZ2qIVHPpQd+yUU7hN6A9HmCHPyK3f/Qm4sqiXA2P5IDtgTO6x+CA
	 gY9CznaCeUisJIeO7nOfj9MvveNWSI96sSPNWHDMTf3HO1lOXXEQRXgs5Yqo/VIw5X
	 3EzWC/6RCGN4xCicPAKEqbaYzsy4XIpR/EkE432JijXfSsEhiXKuuC9+tPDNxLdUP9
	 P2OUxIR7t8sYk+AtNUm9IrY+oLh5bnYHNEyiwHQBNPsef5b7lGbZhtNkygfnOFy3FJ
	 TBSgxGOyL/YUvetV7okyLSdFBN4RSsA5Dt9gxfphjhOQY1Y6C7zN9zLm2AD/oWg5TP
	 R4jGK++Gne67w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADEF717E107A;
	Tue, 17 Sep 2024 11:04:34 +0200 (CEST)
Message-ID: <08bdcc19-023b-4c7d-9e01-2b04cac00a08@collabora.com>
Date: Tue, 17 Sep 2024 11:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] regulator: dt-bindings: mt6397: move examples to
 parent PMIC mt6397
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
References: <20240916151132.32321-1-macpaul.lin@mediatek.com>
 <20240916151132.32321-3-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240916151132.32321-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_020441_625148_4DE2C7B1 
X-CRM114-Status: UNSURE (   9.50  )
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

Il 16/09/24 17:11, Macpaul Lin ha scritto:
> Since the DT schema of multiple function PMIC mt6397 has been converted,
> move the examples in "mediatek,mt6397-regulator.yaml" to the parent schema
> "mediatek,mt6397.yaml".
> 

You can instead just keep a reference to mediatek,mt6397-regulator.yaml in the
"MFD" (pmic) schema instead.

It's true that for MT6397 you can possibly have only MT6397's regulator and not
others, but still, the logic is to:
  - Say that MT6397 supports regulator subnode(s) in mediatek,mt6397.yaml
    - Refer to the regulator schema (mediatek,mt6397-regulator.yaml)
  - Keep the regulator schema (providing only regulator HW specific info)
    in the regulator folder.

Besides that, this also makes the main mediatek,mt6397.yaml schema a bit more
human readable... :-)

Cheers,
Angelo



