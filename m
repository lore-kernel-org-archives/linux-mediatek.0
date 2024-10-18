Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE77D3000A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVsU0vc/EFBCnnyg/Yc5+kVzCvqSnWzJ4CeQTzVDhR0=; b=z/NDI1Xz4+WYHM1I2W/ZrkR5sp
	ibk/nL/URR1td+NRS8XqNhh2Jm7ygS6gAWrsXSbu3NpcVGje4pAdVKB/jVMc+zpjLanZg2Psv2MfT
	sI/DxbcmBV56JI3x/qcBWOsowWUA7tCN0lMNQbiTlS0ynclmHWXwktpQSzCzS3sxx8pLwpA3zLBbh
	fZBReGEOwP6Vb3pLhrxoACzjGsmjNtIZqTq39Vd+MPxk35CX81f1HVQc8Js9lHDoqU5oZkFT/+JO9
	cf/4XXKNk61TduVCtzNaEtGW7DY2rkWo/gxk2QUl0d9w9ZgPbW5Flz0T9crgQ3WYjJtc7VZoYWkw4
	vv4z/KIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1nM1-00000000xDi-0ZUj;
	Fri, 18 Oct 2024 13:49:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1nBd-00000000uWM-4Bmf;
	Fri, 18 Oct 2024 13:38:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBE8E5C579D;
	Fri, 18 Oct 2024 13:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A32C4CEC3;
	Fri, 18 Oct 2024 13:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729258716;
	bh=6l9kKrhdvz3VaSLcW+CZ5TUXv+XqnLeITpfX2mDcn2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LXzqBHfv9tQu2fm4EyHRKKT3xI85RNMiokMpxLagUeOheHDeNM/+od6mdhW06kwi5
	 GM3XNh1M1mCqXDSBjjMKPwKxrCLlft3fJ0Ifd1jzh71bcQ3AL30d7u3OZSnf/wGYmx
	 WGaf1wc95qw5uuM0qI2JozvTOIXY+vlrxqMJUfHwlMA0a7baRbMyrnEOGC1ehtlnef
	 Y5FSbG51kFNfpTpXWefaVohFZFeEQPSkU38lrge3r9xagy3IjaQNaDuPiXL1s6YmVj
	 aXys2r+MoUynj74TOcsIP4BFHvnc39xDbEaD7NrXNUynWnsp68ZL5Z41Y4DS8SP957
	 YjJl3AMJGDnTw==
Date: Fri, 18 Oct 2024 08:38:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Chen Zhong <chen.zhong@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-pm@vger.kernel.org, Sen Chu <sen.chu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: mfd: mediatek: mt6397: Add bindings for
 MT6328
Message-ID: <172925871518.81782.18196829681223078589.robh@kernel.org>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018081050.23592-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_063838_101372_6321B247 
X-CRM114-Status: UNSURE (   9.89  )
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


On Fri, 18 Oct 2024 11:10:44 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add compatible strings for the MT6328 PMIC.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml      | 2 ++
>  2 files changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


