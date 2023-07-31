Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06117C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84yhgdHOi2HsvthQCX6SE3kT3Uen7wUgommj3Yz2HGI=; b=YX4vRKNNXIDA05/GYzh4ce6wRv
	hLEozBbFlGlDXpHul80mEmJHGfQ3h5zgrX+RMeNrNxEr7KoWEnKZvjOvASydP2A81dj9UhYZEoWL6
	QSZZDae03ZWLjcrXj5ko4Ov3ObEq3fTZcSsQEfwMxLdbCoMAS2uSOIS/2i23Fp4wyTIK7XuIGrZ0V
	yXzOQj8LxfE4JdQQeuDg5HPDM6ZV+xW4B/+b36DXjthjhp4tXMG8YyUQmvgyHA5hJnyYO+kWJLL9U
	mEdBNvjk7oIPR/wzfwfdlftiV+zkBk/cHpa83eQZAonmfL+O9UefB/cpSzNImO9atgiaQTIqxClbU
	n9QJal9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU5S-00G9pZ-0I;
	Mon, 31 Jul 2023 14:41:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU5O-00G9nx-2Y;
	Mon, 31 Jul 2023 14:41:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3EEE661182;
	Mon, 31 Jul 2023 14:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F82C433C8;
	Mon, 31 Jul 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690814485;
	bh=x6gwteO8wm+nEx6S7vKzpRLQHolXy2la/OsV7eQgzEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFg73a75Trc6lH/hs+o1+Ry1vWzVceNDfCSrck4T4k2Zycc5DcrUb1SObuv4R+WTk
	 wKrBBZ8qX61ki6uw+u0gUwd3z81ZBzP8pt6Zethmoy0GeqUq20lQpVK2jVxFA5Mgz7
	 iXkgDrwFGGc2UpALMZHoffcG11GqhvgvG+JRLtf6VWGgQhT2cdGeRj3SeXjJEt1bBQ
	 83Z+PZ8zG1LREBDbyu5VytllfsRgoAOWRiq4ghsIY6EslP1JaKoU2S5WqCG4Dg9D8s
	 vmVAV+uzkNllnwIMFLnTQ5HgSQ1V57actO28GEiPXqoN2HXYshs6lODA+fbKFn4zcD
	 LkP4LDDA1/g6Q==
Received: (nullmailer pid 2934074 invoked by uid 1000);
	Mon, 31 Jul 2023 14:41:22 -0000
Date: Mon, 31 Jul 2023 08:41:22 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Jonathan Bakker <xc-racer2@live.ca>, Jaroslav Kysela <perex@perex.cz>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rao Mandadapu <srivasam@codeaurora.org>, Trevor Wu <trevor.wu@mediatek.com>, NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Judy Hsiao <judyhsiao@chromium.org>, Shengj
 iu Wang <shengjiu.wang@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 04/12] ASoC: dt-bindings: samsung,aries-wm8994: use
 common sound card
Message-ID: <169081448188.2934017.10192674386465397658.robh@kernel.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731094303.185067-5-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_074126_893361_EF32416F 
X-CRM114-Status: GOOD (  13.02  )
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


On Mon, 31 Jul 2023 11:42:55 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/samsung,aries-wm8994.yaml     | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


