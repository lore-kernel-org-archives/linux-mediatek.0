Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05896C001CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyK30pRMq3o6V/96a40q/qckmBs7Cn6J6fir0CYuspM=; b=4rSadh3k1pRN3mJcw/4ZUqEs0f
	Rfp3uIDthEFkS83bq1FJ+VTsD9rAefKzACXFPB1UvzXj5WruNau6rqYIU915IvDBxLI3QzUuU8pjx
	TSASdS/GP7b9BvZ5/bLqC65W4xZ+vDsWozTAl97PpgGsTIjHhTVvULWEZFkBgccs8BBgG/I5vDf34
	KPJ73FzF9Kl462/70NpJkGAczsd3l/eViv3fgIIAsYgO4kcdfC/gm9ipknrXyBuqP7d2YAzi/tIt3
	RAQohm6ORZyTc3TaQK7hfdGqttnZUBFqCxREr1MoLFfEm7A6Q7kEPKESMGm1qiIJra1CDgufuA6H6
	ZbwdZVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAJu-0000000HFQc-2Css;
	Wed, 17 Apr 2024 18:47:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAJr-0000000HFOk-07XS;
	Wed, 17 Apr 2024 18:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09587CE1669;
	Wed, 17 Apr 2024 18:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D785C072AA;
	Wed, 17 Apr 2024 18:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379660;
	bh=ObeGcJLBE+oOTwuDf0gmIllSwIgs3VjK5sPj+MWo/6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUBYNmDOHVR9aG0bfxb7PRFesARBFNmYyCFy6pzgSrZmAe8ueprUBCzTbebIkbgOn
	 mrlxOz7gxyv33lCKgKUily2GNr+ayCg9q1G2naEi7uUdMFGomXBybbbwrmlfTwTnfy
	 59ubGQwCR1H2T1jvDX5qLMz5WdHMJV+MvzkfvMvJ5iOqqZyBd6EYmmIrfQeHPzlEKt
	 8xe01Wx3LSBqBQTgwzPhBBcfz6gEmnIRBZ5+oHdxJHkFXN4nphc4uY//7qzCPRff1w
	 kLTGjA7AQgtwV7ZVGyk2nsL03LXEVYKRh1VsD6nx8FjvMWtgt28ah72li8BFZiECEO
	 eMmyLxrwAXrmw==
Date: Wed, 17 Apr 2024 13:47:38 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Will Deacon <will@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-pwm@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	CK Hu <ck.hu@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 08/18] dt-bindings: display: mediatek: gamma: add
 compatible for MT8365 SoC
Message-ID: <171337953454.3077398.11466593614240146510.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-8-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-8-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114743_274296_171156BC 
X-CRM114-Status: GOOD (  10.28  )
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


On Tue, 16 Apr 2024 17:53:09 +0200, Alexandre Mergnat wrote:
> Document the display Gamma on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


