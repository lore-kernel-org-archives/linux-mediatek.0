Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FD1CEE326
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ucqj9Hyv+K/8WxW2UbQujHwu98h2xhKdv8Wj44RkGk=; b=r3obqyLDmdRpu9vc+B7F06+wQJ
	gCfMS8f4Yr+XmzfaK2rdn9zXhOUzajkwYlD2mPEaY5NKfMpRI9uekYH7zO/aCN4wwP7iC/jUFuS/C
	nKk6qybvK5U0JKz/b0r9c8UxYiXi/UUK46JJWFGZC79Wn0AJ4SvgCWHV4g6iEk5zAioJ/oVjfSOEy
	ZBCM8HxcYxsSeKAjE5fsxjQVi9R2SqrrI1v2EScXZg1hWtvVi3qw0Gj0fiPcdMjLYS970bgZH9bUo
	SPnD6g1hoJZN53xKd/7l8SqCQwCgPR9UkmdvHmkW+49rfxUlf7Qwa4eIs9NMOfzMscJF+AQVsZZhr
	Emtai3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZKH-00000009tuz-3W3Z;
	Wed, 09 Oct 2024 16:14:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYzK-00000009obz-0Bxs;
	Wed, 09 Oct 2024 15:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54312A441F6;
	Wed,  9 Oct 2024 15:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858BCC4CEC3;
	Wed,  9 Oct 2024 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728489152;
	bh=3opAzplvKjVglSivCDPrg441vYhzAuPR3tmj9pIPgGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=azT6oxO9H+KxyL5DtHqGVzaw6VvkwhCRZgi1s6K6jyeWDPYKNq9NU8WNE4Y7aZ/SL
	 UG+VkA3yrXSNOTlFfHz4zK+Lm4pTxmHvfewkwPfhfg3fYwpSSE+83fbfkcd3HpK1vP
	 Xmjx8YBICRi9S1DP9dYVz5AN1Edh1ISqu4+QulIRl5vZCf4SWU4b+fTrh+KanQLlqb
	 Vmyx9hwwbV42F+c4A9yUYZFeFg6d05ibkOE6QMLn6bQ4ir7OERXL79h7LJYHSPZtd/
	 oFM6PIv8M335szmQLptKsy/a99iR75ThRECQ6gcjWw+/lOSTHh9ZjK+o75IJCDI4fn
	 nn3obwpSqL8Dw==
Date: Wed, 9 Oct 2024 16:52:22 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v8 3/3] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Message-ID: <20241009155222.GB637580@google.com>
References: <20241001104145.24054-1-macpaul.lin@mediatek.com>
 <20241001104145.24054-3-macpaul.lin@mediatek.com>
 <5nvshurbpmjkqysphfrfxhekq3c6od6a2uqai4rfxns64mdvf7@ftjvgjnivr3k>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5nvshurbpmjkqysphfrfxhekq3c6od6a2uqai4rfxns64mdvf7@ftjvgjnivr3k>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085234_592481_CDEB6551 
X-CRM114-Status: GOOD (  12.15  )
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

On Wed, 02 Oct 2024, Krzysztof Kozlowski wrote:

> On Tue, Oct 01, 2024 at 06:41:45PM +0800, Macpaul Lin wrote:
> > Convert the mfd: mediatek: mt6397 binding to DT schema format.
> > 
> > MT6323, MT6358, and MT6397 are PMIC devices with multiple function
> > subdevices. They share a common PMIC design but have variations in
> > subdevice combinations.
> > 
> > Key updates in this conversion:
> > 
> > 1. RTC:
> >    - Convert rtc-mt6397.txt and merge into parent MT6397 PMIC DT schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Everyone okay with me taking this without a pull-request?

-- 
Lee Jones [李琼斯]

