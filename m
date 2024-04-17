Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF228C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exGHodre5qEaQq/4RPIq2VYMu8WZj8CrdyGZRErUquo=; b=yaO5LJ0C+CM4Va5Xq7yPCdGdgS
	qth5AQTnaY67nX627DVjeUVn7IsejR+tVGQEU0FWPFYFIA6qBNGoweksyHD42Bdm00NxG5VOtwSSN
	pUqAJK34BPf5mQkXKaPZUyFxiusDXIV960lk+bPnq5N1ujYkRA72GVl9QZYMeRgbD8sXp06ocRRlG
	2Mbfrp/PcikkwurSB4oVKTtpfhcoK/lLuqXsAaNwU1vg/mjLBtg7FzyNriISmPf60WrUbvz8+28uV
	58MJtG/kyCWd6TXyWT4RDG+y3WOfu+KBzswEv97tfW+Y9Q0biLwWhRBXIb/7ZPDgnVKrVQSC1s1vz
	NrX/t65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAK3-0000000HFWs-3Gvc;
	Wed, 17 Apr 2024 18:47:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAJy-0000000HFTB-2X8S;
	Wed, 17 Apr 2024 18:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C74B86168B;
	Wed, 17 Apr 2024 18:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC3FC4AF09;
	Wed, 17 Apr 2024 18:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379669;
	bh=c9Av6o+YhLzxWvGJbvdnDzM0A1WFzVOKqpppzIkYBew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZPhq6wedeLHOrrwuCBotkgaK2YQvNJkASflMHQybFwz3oRVCTQ2VNF87Xk0H3mVgR
	 ZAEyYaP51ItqOxFXP22SY2c+JHzneUkXlpeeG5Aq7pSrmwVG5pkjEd0L3qhfwfsTQT
	 R/s1KIS7YafuNt7vFR9HvdvJYjjrbzpVw4tc6QVMpYesYDJ4SNZMK0J/UghzaiaXKD
	 yxQI7ZqC1Ot+26HRMyJeyd0aWKKNW7xS4reJTEaFDzezQYIjMiw9Tk/tH0+m2IfoEk
	 vFGQGoyzyFzyKyQUISfXQQNAGfPL4m0Y0CgxRaOPmi6PBsTlYaGMoodE9Odx5PuKtJ
	 4AhlKSpugNDYg==
Date: Wed, 17 Apr 2024 13:47:47 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, Will Deacon <will@kernel.org>,
	CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-mediatek@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 09/18] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
Message-ID: <171337954796.3077788.17153176697074002741.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-9-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-9-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114750_852593_79090C0B 
X-CRM114-Status: UNSURE (   9.86  )
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


On Tue, 16 Apr 2024 17:53:10 +0200, Alexandre Mergnat wrote:
> Document the display Overlay on MT8365, which is compatible
> with that of the MT8192.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


