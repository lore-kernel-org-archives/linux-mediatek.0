Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0808C87FD2
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Aug 2025 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmI1hYqjksR+DRa8JSQk6MVH64W5+sLipA6UwCtocJY=; b=q6yMrTFYzgoBduDgUrVySoODFQ
	jZU8/ALXvHU+Uh1Bk130aODdWNzhEsbC1tmLt5jsKFLQlR7yrgp8tdc9AXW3QmEzyt4kMcpq/vDTu
	IJj6wdUGTErelvt5x+1BrudaZ/CbiFnxupqR8uDL+B8Yj68Wwhzh2iBlOTl2/mAsOBb2bAoDhHrTh
	kmJvQBJNbnFN7xDJJAM2CTrFL3BHt68ib7SYL1Wc+627bQMovYKUMwgFis528Go551bI7U/Jr3iTe
	19jIddp/4FScytzhu4SKkxysIXHm6yTyEv1ECtksQb/PFO7EvP++yHj3+V1medVASToFOiQhRyrww
	nAS/rfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiCGJ-00000007e2k-250V;
	Sat, 02 Aug 2025 13:26:59 +0000
Received: from flow-a5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiCGG-00000007e1R-21Yr;
	Sat, 02 Aug 2025 13:26:58 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id A87BC1380608;
	Sat,  2 Aug 2025 09:26:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 02 Aug 2025 09:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1754141212;
	 x=1754148412; bh=bmI1hYqjksR+DRa8JSQk6MVH64W5+sLipA6UwCtocJY=; b=
	qqNUWLHW5NkgMWC7l9Ppuzcw0TRZVKBalVrpuNL2tWkSX16V+CaL/WD3GPRevH/3
	cOaqYuZWVehBMlqwkuJTQ3+7ee7mvoCmm57l/9y3kSLOhYi/j9UZL0baYRp5JOQM
	j4yp2XwkBPHkkHrQr9G2kPmFqob1bo+ge9yICVt/dsRrLU+xuJA6h9g8SW4qJPa0
	AHQH8Vz64gEdgI7kQ+1DTmePAvNbJQJxnWkGkDSZF/paCkDAzfIwxTUg+JfaHIca
	2uCTiijQTVgzLiuE6qwTC/es2iaY0ak3Q1yInsTplxnRcKjgCrvxpj+WvGFL/Gkm
	HIx11r/lg4cei6lIenYP+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754141212; x=
	1754148412; bh=bmI1hYqjksR+DRa8JSQk6MVH64W5+sLipA6UwCtocJY=; b=C
	LzPCjtSlWjEpgC9nck7IIN+a6VWM2T9KzMBiWo4CFmbf/c8EsbwRuyBR6zo43jFD
	hvyIbMP0zgOcLL+h4kub0bXZEqehHtgFY6sV9cwlFjffv+lGsEsKcJttU2+8fn3b
	kRALXojkwbX6H2IOxV2soFJHVIcKk6LuRbHAbjPhMXvWGeT7KA2Mau0LJLy4HAji
	lfgiUMmK9spCDs/oe1YGLozfqCHtXvx0XyirO7dloL77Fyd05IG6lp0ZwH1pUgeh
	FNabC3mgBC+9qZ25Drxy58dz8xR3lKKGectSGWS0hTtARs2FRFJmAX2nfNB3fKxO
	c360wFl1nKo7iNibIdOnQ==
X-ME-Sender: <xms:FhKOaIqzIVCCzZqyPT8S-Kuyp75Ghz90bD-sNWC1Ynb1xWuDhB2fgA>
    <xme:FhKOaAAM51hB_nYlCo1hgXLgPrXfAQsJTzEzSK29ONCez_BVzRWEnZ7YYfmVPVSd4
    mYWvtLYdmS8g_-J1io>
X-ME-Received: <xmr:FhKOaKNy3dovqvqjcZlMlmNulu_odOhDUh_OuI4TialffSqjpk1dXSXjcgxfsuv77hx6_icSG8wxq9Qphv3aDtPfT18v805RrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdeiieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopedutdehpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgt
    ohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epuggvvhgrrhhshhhtsehtihdrtghomhdprhgtphhtthhopegsphgrrhhrohhtsehtihdr
    tghomhdprhgtphhtthhopehhvhgvrhhkuhhilheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepihhsvghlhiesphhosghogidrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhp
    ihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohephhgrnh
    hsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrrhhthhhisggrnhdrvhgvvghr
    rghsohhorhgrnhesmhhitghrohgthhhiphdrtghomh
X-ME-Proxy: <xmx:FhKOaHAoXiF7NV692VGvUlBtEKV8Ppc7HpktTEwZStXxvUIyFnrhjw>
    <xmx:FhKOaIXbJEGFB6MyMI6SEvkY_tAqtZmQdwpF1CyYAg0cU-whIhajXA>
    <xmx:FhKOaOXdPk75wbqe7BRIpcNiWjQWCtbKZe7Hw0Dw9yRuHK1wn0wJ9A>
    <xmx:FhKOaA4w1OKh4y5m73fZ4TocrIIXqTtdAsWzkrmS8EjZZidpBDEFUw>
    <xmx:HBKOaGfprgDP-C4pCZ_BqeXWMGw4oENfGJWvHSy-BbRaGSp473jMOr6M>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Aug 2025 09:26:45 -0400 (EDT)
Date: Sat, 2 Aug 2025 15:26:43 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Christian Gromm <christian.gromm@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>, Michael Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Daniel Almeida <daniel.almeida@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Jacob Chen <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, Hugues Fruchet <hugues.fruchet@foss.st.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>,	Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,	linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org,	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 17/65] media: rcar-vin: Do not set file->private_data
Message-ID: <20250802132643.GA1848717@ragnatech.se>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-17-eb140ddd6a9d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250802-media-private-data-v1-17-eb140ddd6a9d@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_062657_016115_9F272AFA 
X-CRM114-Status: GOOD (  18.09  )
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

Hi Jacopo,

Thanks for your effort tidying things up!

On 2025-08-02 11:22:39 +0200, Jacopo Mondi wrote:
> The R-Car VIN driver sets file->private_data to the driver-specific
> structure, but the following call to v4l2_fh_open() overwrites it
> with a pointer to the just allocated v4l2_fh.
> 
> Remove the mis-leading assignment in the driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index 62eddf3a35fc91434cb2e584a01819380a7a6dd8..079dbaf016c25139e2ac82be63d8fce0d11fd208 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -588,8 +588,6 @@ static int rvin_open(struct file *file)
>  	if (ret)
>  		goto err_pm;
>  
> -	file->private_data = vin;
> -
>  	ret = v4l2_fh_open(file);
>  	if (ret)
>  		goto err_unlock;
> 
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

