Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71486C001CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YfbM4uRGcrto1nm7bLwSKDw09q1BdWTYuda9KDxyrA=; b=qh9kMuJtqfTXKapIyvEkj4Zraq
	Du2SIIwl/6yykl/WsaUtr8VxO0wm+oKgoluAak2DwN9XRw35gDhkYO53akpCrAxBfekuccsfVpTht
	PeONOf6B/Tpkapu6lJI/KM2e5jlh3ADkWFfjnEOKGWtepBOmIoqdIbrVVjXv+ULGEZwZZeRUbUPnp
	ZVvcIaWIS0oIMW0fJKFMN/xzoTLMWyTQgsO3FVv+8CxVGtfDo48wFF38AvBsN8NgWlSnQG03+aTjA
	B+31CAY7xAT78D8T2GA4szNOP3SFFMBh3KMFJ1T43Ps6tTUrTjNPcF100qFZfmeWdWrYXNqTtWM3N
	ZLzPQ4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAGR-0000000HEdz-0J8q;
	Wed, 17 Apr 2024 18:44:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAGN-0000000HEae-1BAU;
	Wed, 17 Apr 2024 18:44:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 654EDCE14A1;
	Wed, 17 Apr 2024 18:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BC8C072AA;
	Wed, 17 Apr 2024 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379444;
	bh=cQST7HPvWoOjxq2pzYUfgRSGfNDWwl0ha9HmVsKgmTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=diCizyuni9BFuQ5Mtl4gw8SQkycTRzAcDrxgwfRisn4x2wf2DanzFiA+NMQpIwt9k
	 lmpEyQr6sm1m0sK8Vj9cFlUbvDhJGG5yOezsD5RKfvNzz9hZRhpwM8dR4HyqQ60jIt
	 PVusK1hYBEo513llnWPS/atnNtyUEKBY9I+/4mGmdRDhgn30jOwEYfCDSrHWxsl+mh
	 X49X+eTU0KHwT4HF/UPiO54LpnPR6nzUNsRzqpkYnAkentfXgPl4UNMMvrHII8rDb7
	 fYm5yRHlAzQBjaVIqpjEsr/oAJBr8CF478TqIJ8ulMrr2+nS9u3U8mJS6fJfwT/gz3
	 aIB/hETSz048A==
Date: Wed, 17 Apr 2024 13:44:02 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-pwm@vger.kernel.org, CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/18] dt-bindings: display: mediatek: dsi: add
 compatible for MT8365 SoC
Message-ID: <171337931828.3072886.17211632669109957166.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-5-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-5-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114407_535184_5BB87EFF 
X-CRM114-Status: GOOD (  10.16  )
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


On Tue, 16 Apr 2024 17:53:06 +0200, Alexandre Mergnat wrote:
> Document the Display Serial Interface on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


