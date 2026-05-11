Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5E9CD484E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 23:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zor1uXuM2RHH5IZ/K6knNVup/JzpZWEOwxndkqfwVuE=; b=PpehTAPsLsLPQ9OJwKSsdVct2i
	cMrzAh87zqhbU8/jDUzRZA5FWG4wN5s2GeBBUL9uRrrI+od3c9RT722QCj78nSsGNiVQ3SGIOAyZ4
	Zh2OYK7EXqF7m59M3VMqMmsPnE6+v5AlHtaED0d8DS+hnk7gv4gPojZcIH6TlcnwdjI1jMtqGXff6
	cibg6etlpCPTbT2oQwOVLQCGj/06l4XF/1lqVVXrLaZdOk+Em/J6wnWAeUMZwDx3mgdOCUQz69SDf
	24itxFw5hoq3g6bh6O2GJIVoNGWZOV+6GzM+IH1SFT9xquEGrA5wqDrBBPGpuWGcH4qRrShgffE+a
	wYu13PHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZks-0000000EzFu-2tDr;
	Mon, 11 May 2026 23:09:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZkp-0000000EzF2-2JdJ;
	Mon, 11 May 2026 23:09:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B39F243DA5;
	Mon, 11 May 2026 23:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A85C2BCB0;
	Mon, 11 May 2026 23:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778540977;
	bh=oNHvi4oxjrwBg8WrHDE3QBzWxrrrcye8fddyPM6VQbA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tD+ZfEvWY6zNN4Rotzj2Kp774to8Jqfnshu16QaCSxae/YvNmIW1jJarDiSqRocLW
	 tVWXp2unxM4GrbwI8ccU9NuxPbVmKtlXWfhqTwPqsWIzA3IXkI6Mw7gvJarAMhhnav
	 4w7IG99LKdnePjTd7/1hspEy91ix6y9dJ2WXOuUaT/ZHKcvtonxXqc5IM/OfHzcsXg
	 Y5XTqNcIhhX5X1Vkal6gpxp4Idmf/UG1Ay+iIvry5nvDAEfdcLGJOquwRABQvM0l/v
	 2AVlu3J20fhPTcD5ytxrwUBJ+Z/V4weIlqOdaX/2/EjzqbldOYkjqBKe+jZgv//gqd
	 70uwh/Pbbat8Q==
Date: Mon, 11 May 2026 16:09:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee
 <jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Hugues
 Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, MD Danish
 Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, Parvathi
 Pudi <parvathi@couthit.com>, Mohan Reddy Putluru <pmohan@couthit.com>,
 Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michal Simek
 <michal.simek@amd.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Linus Walleij
 <linusw@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau
 <nbd@nbd.name>, "Andrew F. Davis" <afd@ti.com>, Hussain Khaja
 <basharath@couthit.com>, Suman Anna <s-anna@ti.com>, Ben Levinsky
 <ben.levinsky@amd.com>, Tanmay Shah <tanmay.shah@amd.com>, Erwan Leray
 <erwan.leray@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Roger Quadros <rogerq@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Consolidate "sram" property definition
Message-ID: <20260511160932.0e2cf50a@kernel.org>
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
References: <20260511165942.2774868-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_160939_635805_8BC0600C 
X-CRM114-Status: UNSURE (   6.99  )
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

On Mon, 11 May 2026 11:59:36 -0500 Rob Herring (Arm) wrote:
>  .../bindings/net/ti,icssg-prueth.yaml         |  2 +-
>  .../bindings/net/ti,icssm-prueth.yaml         |  2 +-

Acked-by: Jakub Kicinski <kuba@kernel.org>

