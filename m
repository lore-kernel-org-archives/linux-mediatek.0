Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1CEC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlihummSFSD58COirkbh8E1xQccIvolHp7EKHZym9mE=; b=0KHE+W0VGk2cUW2Es3FPtbpmtk
	f7C5aqjLawEtRrT2/bM+n2bvcOKUVnrbT8/CkXSdXOFBfnYffrRH/D0yJbkRIcvk2NEsH0NiPheMJ
	LdEt56/ucRU6FubMeWf+rttRtWhIzrjMtcF6wOgnx70FLddE8zdSGjCwNQFoxyMGKfIJJDNwToyzK
	vhzrNfuJyiyFXoh39HoijByt8ElIkaCMO0SPrDfkpXaS5hxYOwljkz8/9bOayb5jH9377ZNP7BMeO
	lco6OmLde7D0nyeD9UX1bTjqvTzBeLmSDwmB/7xhliI+aJbi8lu4spqleBNkvvBF1y7u2RmqjMXHj
	SJtxDV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAFt-0000000HEKf-3b7p;
	Wed, 17 Apr 2024 18:43:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAFp-0000000HEGT-2tYV;
	Wed, 17 Apr 2024 18:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8920E61655;
	Wed, 17 Apr 2024 18:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77C2C072AA;
	Wed, 17 Apr 2024 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379411;
	bh=dFYWzHQ5XhOLNcLBWopk7yt+oDCScDnJkVXbAbyCzQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rW1Ay7ccX1KEO4VVvbsYKxiFm5kp1rXQq6OTSarcxSyYeD5R6JxicGVX0yM9cGnEb
	 tmUCi7sq9lwhOcyLl4KuGDQmXYcvjNe+B0uYmDWCOweZwbhosal+utYl8ydaJ7i9AB
	 ZgJ/qXnsqAqHGD5L/+vkWBlLwW1owqK0i2+6xgErjZyxEWkhdv8MbZ5PcHsh8XkWJF
	 bBIPEiF4omhN+HCw6K3LwcLFRBU5Saj37GqGZ2yDInEpNuJcEv52XYqE/9/LRYDdBH
	 VuHGuZIUHT+jIDUW8jWZYBnY8Sb2YFiqjusN9R53+z+BL2ypemRsNnNFib8NCnQm4m
	 /UalqQQPIgfMQ==
Date: Wed, 17 Apr 2024 13:43:28 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-clk@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>, Will Deacon <will@kernel.org>,
	CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 03/18] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
Message-ID: <171337929795.3072251.7033355429164409851.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-3-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-3-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114333_831454_807EA2DB 
X-CRM114-Status: GOOD (  10.01  )
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


On Tue, 16 Apr 2024 17:53:04 +0200, Alexandre Mergnat wrote:
> Document the display Color on MT8365, which is compatible
> with that of the MT8173.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


