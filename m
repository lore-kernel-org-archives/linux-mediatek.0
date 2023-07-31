Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CF1C00528
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nJZCwRy/Xq1+6e+ehaY8LCMyK6sxC6BgnAqPc0CKoo=; b=s7lZ8a+GWshWHMFZNylm9Lqny3
	+MmWjLIVVun9ogaYBqYWGtJ/AZs9yzgPcp+kCeYhe1Qptzy1m3+BXzhI3242fCT2MfCqPSO/+Xz8f
	cHuvBxpluB/2JAQ4hcLUJH9ZHTRIWjt52xTh5v6DLlEESMyynDl8Xdn5dSj4G/CujVFOeaIQiXJEA
	QapY6xRuAmSK4PHOoP5Zg/dd51WKk/8TE1efh44M0UUqd4Ty5Fbe8+GD86mfAe/OOyVeT95tl8ZtC
	viJZjusQuPnujSg+MswsDsEVc1T0ZUWW8Apfa1l7yCoZi+S8TqeCroGWprvglnaR2ES/mIvt+5ENZ
	5OTV6nWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU7N-00GAK9-0y;
	Mon, 31 Jul 2023 14:43:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU7K-00GAJK-0C;
	Mon, 31 Jul 2023 14:43:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 830046117B;
	Mon, 31 Jul 2023 14:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D868C433CB;
	Mon, 31 Jul 2023 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690814605;
	bh=ZZP/+vM0qz6EaB+8dhpI2Dpi6RMKi1QnNhcTct6HcJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcf81MxHKfKQ6cb1/4LQVxpQJQBDyR9UMg13U+PabS/04OLLUefmHt1dU84ssOZZ9
	 c0d2AZj+FB2qTva5iWdNN2E2AnFwsvtEv2Ks3VIQVYigWOnFqi8McciDtMf9PLGZ6M
	 E7L790xhMnUuSiTkRqelk95M70e9aKxn9e36LUlS8rJrhYMm0ZfWUxDKfAz65ycs4a
	 Yh9WU014M9UDp6ZN2WSStBAcAdiA4qFE270JVmBfnzxtgCdX8k3+ni8PhdGty4vieM
	 iYEXJaLGPnQkoKYur2AJgZnuT44dfJ5BZ1fdXMvd/eCtycaMLqAzSXuqnMchXyUc2W
	 prELTN76RjOsw==
Received: (nullmailer pid 2936636 invoked by uid 1000);
	Mon, 31 Jul 2023 14:43:21 -0000
Date: Mon, 31 Jul 2023 08:43:21 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jerome Brunet <jbrunet@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>, Rohit kumar <quic_rohkumar@quicinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>, Jonathan Bakker <xc-racer2@live.ca>, Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Rao Mandadapu <srivasam@codeaurora.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 07/12] ASoC: dt-bindings: samsung,tm2: use common sound
 card
Message-ID: <169081460128.2936591.465135796589060685.robh@kernel.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731094303.185067-8-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_074326_139351_8D35F770 
X-CRM114-Status: GOOD (  13.14  )
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


On Mon, 31 Jul 2023 11:42:58 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/samsung,tm2.yaml   | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


