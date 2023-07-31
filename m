Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54885C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6BkbRW/aqCp9/R15YIXt5ZBrWcqdFvHepA8T5Q1n8s=; b=AYTCbKey0SNsZCY033paaYXfHJ
	BNV74MVUtNAhF4em4wuYgN+tzJhp2KZitOKOckaDVasuaC3W40V/ArWHGAJNHor4yXTB2uiZcSJtU
	QE/KbQoVXTaEbgt2BzFczSPmcZGVOcGBODwqQ7VxYkJJbZZ1/HgF/V0FhlUrHEVkjzK1xKo4LKxHp
	ZhgoJhVaOJZE1+mucrw2t0Ecy6Mq16/iRx1G1mTYjbcaIMXbFygRi7m/5WN3PfzjUkxxYeD7nD4eV
	eSdvMi3ZNA06Iu2Ef1prc7Syfn/WPdevMEHDBsqhiMk2edzIc4B2e6HaeaRNDotRpR4oSoUcMT8UD
	ZaU45nhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU5r-00GA03-14;
	Mon, 31 Jul 2023 14:41:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU5e-00G9v8-1i;
	Mon, 31 Jul 2023 14:41:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED5556118C;
	Mon, 31 Jul 2023 14:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5064C433C7;
	Mon, 31 Jul 2023 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690814501;
	bh=6zs0p262FWZnT2q/CfUaDwyUeYXnBXhuseu1gVc38XQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/t+Ag8xPMkM4w/sN7awWdOpwxKL34AbhifM3ApfHy4wOszK/s4+Ee3pM1mlmxUHh
	 v3ZzKncG+rC5CxEti9EIBWxgYFXoBwcLkKlSMrY6e3Lhtmjqic8diE+lH2SNhaJ14k
	 PtrRzG2dTZ7uqXx/ovkZiPH/4TDr8HZgv06SC5w0LnHDMrw5vZb6+D3i/3YQHsZk2O
	 zKJCFoYvZIJgkEyenckCSLpBgCRynXYx39uIE/6LvGshuAOhb2uAUy5VM77KQYMPWi
	 ZU2HUveBRZOXlFXxUrQZsjwhUzAKIgFokee643ITPbAkWj227rcbvABFWI/mPu1Z+d
	 UTgXJLPm/UV7Q==
Received: (nullmailer pid 2934485 invoked by uid 1000);
	Mon, 31 Jul 2023 14:41:38 -0000
Date: Mon, 31 Jul 2023 08:41:38 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org, Jonathan Bakker <xc-racer2@live.ca>, Rao Mandadapu <srivasam@codeaurora.org>, Rohit kumar <quic_rohkumar@quicinc.com>, Judy Hsiao <judyhsiao@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Trevor Wu <trevor.wu@mediatek.com>, alsa-devel@alsa-project.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Gu
 o <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 05/12] ASoC: dt-bindings: samsung,midas-audio: use common
 sound card
Message-ID: <169081449785.2934415.14179927279002446763.robh@kernel.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731094303.185067-6-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_074142_611761_3496816D 
X-CRM114-Status: GOOD (  12.70  )
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


On Mon, 31 Jul 2023 11:42:56 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/samsung,midas-audio.yaml      | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


