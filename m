Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44F9D1CDC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv/jACUA3DPibjKlQ/J6Mr3zFtAZUvzCOxszMpTt+R4=; b=0skMFiuhdIuk8Ew1Y/pqY6NHyL
	mTdwh9vBmbawqIK59RDzUzgRisLWIzeXkIgrWEldM0uljfV6oTIba3JjLvk3HpPzaO5gEs7BABjwz
	JzlqNc8NbyqQYyVSqIWzRAPkJFvlZQJtakhT1uH4qbcEuV2XtplvpmU7fL8az66kvliB5iwzvp4Vi
	RKjd6xB+RAqJx4mR4bwA0CHV1nkHFcvlzhdBAKR0EyRelCKuaJj7kFLXgSKWesOOS8FY6cSw+cJ8u
	30OM++BUZStkvg79ojnxnTqhJPFbDM8ox4jzS8l6FiDyvc7+b4RErlp8k1+xUBWWLLMkQzCnj3ukY
	bI6BYPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B6m-0000000AL9H-3DBK;
	Tue, 22 Oct 2024 09:23:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B38-0000000AKQp-0634;
	Tue, 22 Oct 2024 09:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729588771;
	bh=1wQKnHb4F4y1RVrRIF7g0Pf31juqwfn3EgZdq2eOGc0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eN26kzNpdfc25Jy/UzCLs4/5XKOePbwCcKMDBpWh9ssklSqmMzilnM/XtikdDqIBg
	 SEaVq8tWlAoE62RkvytYS3/F6gdUpiWagTqGflu5F8mHqF35BD3wQsY9hjOFca9n2f
	 PMBssXq16jFiLKbo1lAo6e02xZ3QVU3S9LWtu+Wh+Ev2Ag0/nEousOVgWqLC2J2h/t
	 alSJHyP+zWb36KTeMRV9mJ6qbe58Ro4DXcNCL335L+87BgrBQffci86dM/nrpNIYNb
	 i7QT4Ohu60po5tcestdayCijLBfHmxSwRQvJE8yHhdzw7xM6Ti3O8DoiCCDQdbgyrr
	 A0716m8jATsKA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EB8217E120B;
	Tue, 22 Oct 2024 11:19:31 +0200 (CEST)
Message-ID: <99acb58d-a49a-4ad0-a4ec-f2b7c4f846fb@collabora.com>
Date: Tue, 22 Oct 2024 11:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable Ethernet on the Genio 700 EVK board
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Jianguo Zhang <jianguo.zhang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Hsuan-Yu Lin <shane.lin@canonical.com>, Pablo Sun <pablo.sun@mediatek.com>,
 fanyi zhang <fanyi.zhang@mediatek.com>
References: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_021934_261286_B5EC50DA 
X-CRM114-Status: GOOD (  10.43  )
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

Il 18/10/24 17:19, Nícolas F. R. A. Prado ha scritto:
> The patches in this series add the ethernet node on mt8188 and enable it
> on the Genio 700 EVK board.
> 
> The changes were picked up from the downstream branch at
> https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-mtk/+git/jammy,
> cleaned up and split into two commits.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Moved mdio bus to mt8188.dtsi
> - Changed phy-mode: rgmii-rxid -> rgmii-id
> - Removed mediatek,tx-delay-ps
> - style: Reordered vendor properties alphabetically
> - style: Used fewer lines for clock-names
> - Fixed typo in commit message: 1000 Gbps -> 1000 Mbps
> - Link to v1: https://lore.kernel.org/r/20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com
> 
> [...]
Applied to v6.12-next/dts64, thanks!

Cheers,
Angelo

