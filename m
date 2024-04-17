Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CAEC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3da4GdczHnRn5zEW0imyArCCVjJPPkL6008rgbt+6bs=; b=DLn6ehpKaawTwUuC8uYEgLDeZ7
	KXyDiAaIannGeTYVlTzebl5flfpANzeaYmVdLwqygIGjxmJ4QyCf8KtQ245CpJoXgKtGM8jLWV60/
	SBfUDrLGMyHnfouReIPeJ9T3zJXahTDW9XqeZKdrCw9YgCJ7VWMul8XGVT0ITjaHbZYVQ0bpeeezL
	wHjUysyLJZnkhWwEl4zUeL4vGM++CNIEk5yhKponm37pwbUZy6nvSQm14UVxMfPG1VI+kd4X0p02T
	WdweHxAxG7gBZ0Hnx40Rq9IZzfKHt5neHnF+dgLRVtnf8ztu9nXpGkR8WA2fBO6adm6NMy7fvaE4M
	efVbgr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAGd-0000000HEmx-1NCr;
	Wed, 17 Apr 2024 18:44:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAGW-0000000HEgv-3Nrn;
	Wed, 17 Apr 2024 18:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFA0F614B8;
	Wed, 17 Apr 2024 18:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED07C072AA;
	Wed, 17 Apr 2024 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379454;
	bh=2ijxgrIHFYlo+GOYxQUQaAYvtvwZmGTQ2OkkC70Xwc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7xHnyGbTsVvEE1N1oxm22yuvvaX5ZM3WZh1+mqGMAbi6rZ6z21Hq94xdKxHpojCB
	 kTbdwunZJUl9GiW0AmFpF5e1e/ZQVBNtX2zVBZQT9Z4iQ5loPwhgnKsD4IokktLiYf
	 1qaoJ86vGegu1OXvjV7DtU66KOCwvC1ypK8cQ7srHnCa9Kr8lMqvRsdOcBBi9P4cad
	 wSCb17RhmPC89oqDb727+mY4MrFr4KAODRKig841Mh+MamqQavjmIUGw5sbNXU7p5n
	 i56Kv4vpRBWYGZsfRv4Jyzq7UX3b/HXGt66ME7DhZG6vSj4fgNPXtHlEJrkVNtehqZ
	 P4yPrSzEuEOPA==
Date: Wed, 17 Apr 2024 13:44:12 -0500
From: Rob Herring <robh@kernel.org>
To: amergnat@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	David Airlie <airlied@gmail.com>, linux-pwm@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
	Fabien Parent <fparent@baylibre.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Vetter <daniel@ffwll.ch>, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v2 06/18] dt-bindings: display: mediatek: dpi: add
 power-domains property
Message-ID: <171337936237.3073760.2764344003363574998.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-6-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-6-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114416_972736_97FECDD1 
X-CRM114-Status: UNSURE (   9.96  )
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


On Tue, 16 Apr 2024 17:53:07 +0200, amergnat@baylibre.com wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding documentation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


