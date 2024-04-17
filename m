Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2B7C04FF9
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwJjLzT3qVr4GnTlZT4PeyV3odS+elq1HCUD0W58nmM=; b=fDHxuP851xKrsUpsC/G0n3pjCa
	T7A0scOlSB8bHk2Z1LwzfsEowfPOsiDPGFKz6jWpOA6kK093APWyDmZJvckuDY7Q/rU5AqzCXGo0V
	e7ptsqiRF2mly+7fx4BrTo33JqalgvTYeSQ+1z2jgbk/c7+JzRe2NonnX0Nprlutmbs+smaQml77M
	p2eboLG3Xf6VYQj1OWj36wWB+xQr4oclQnukDXedDm/6MIJtxXHgiJ9pPqQTy1poAfRIf4PmdXKH2
	bqtFOjH8Rv1P2Ban6HknWW9PUwUSSPOx9hOvJO98mkRnzjPc4IevwtlQ1B3lgyzAjVEDD2Q7QtUfo
	or5kUpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAKs-0000000HFoS-1oSy;
	Wed, 17 Apr 2024 18:48:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAKp-0000000HFmt-18Gm;
	Wed, 17 Apr 2024 18:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8144261681;
	Wed, 17 Apr 2024 18:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00ECDC32781;
	Wed, 17 Apr 2024 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379722;
	bh=vQJuYu8n6tKRsxdPMUC68Q9FqABjhqR4vGFq0S3iuzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSHNArYJs5xOZGB0K0u7Tpp3XYM0KQpcIr8ol9MM0hAKFrG6mp1bcx/JpDfvdqYoQ
	 l0yGgmbsUzw9xMZW2i61pR+pFfs8kpXWexlx6KReXrAwvAgJaPaemXxhrnNh34YWSY
	 QUQLvhkqEczRD3cP+tIGCjYm1JzozVAj2YN6oc9giSdYLTP16ocmbXVtzvKORjrrM4
	 KNYk/Re9IRy8RR0ygmPkxj2i1oOjFzmEwqfHZp8Lwe9CDUXVQZ0au0u3Kr92lVWDTk
	 XvXaiZZmEwtRlvDRx9kfv7DGnbHFXaJ20+EMv/Yt1hQA7dRO9z52evtibPPfc5wPxo
	 dZZqIjE0y+sDA==
Date: Wed, 17 Apr 2024 13:48:40 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-clk@vger.kernel.org, Will Deacon <will@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-pwm@vger.kernel.org,
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
	Jitao Shi <jitao.shi@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 10/18] dt-bindings: display: mediatek: rdma: add
 compatible for MT8365 SoC
Message-ID: <171337955722.3078087.17269259484648392876.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-10-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-10-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114843_458871_26C518BF 
X-CRM114-Status: GOOD (  10.33  )
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


On Tue, 16 Apr 2024 17:53:11 +0200, Alexandre Mergnat wrote:
> Document the display Data Path Read DMA on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


