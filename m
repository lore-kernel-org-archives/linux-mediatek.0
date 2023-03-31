Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FBEC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N04sz8qMZBeob6Wxx0elTfeAP/WuOJZpzQbXTul6Fhk=; b=q4GrPGguxNABQ5KG2XL9Ng176j
	hjq2tD0iAasEeiecd4I874dZqz1FOTT4GVEGcfq219ELmCN6PYp04ICj0qCOgPLlp8Srj8k5ge68z
	QCs3+06vSgesPhO5GAeP/PfB5pCJISwg3dg61YcTZdaXUYPRbqVjkuaAdRaZkPubSa6HdeCdAhzNs
	qRvew/IgNuQIOZx1pZFxrb74gSnmTg4ugh9omrb0NHlXaPU0RgBuj5PU3L4NsENRYQ9F3Kl+pv3Gc
	rf/7zoAjY0qI6HIm72QjrxvHzRP2Ji75oXUkmWFVUAgu87VSwA/4UK5gNhOUujhPGtOD07mKT2wUL
	Vx83/f+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piF6F-007Zj0-1t;
	Fri, 31 Mar 2023 13:47:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piF69-007Zeu-0D;
	Fri, 31 Mar 2023 13:47:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7F97F62952;
	Fri, 31 Mar 2023 13:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BE9C4339B;
	Fri, 31 Mar 2023 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680270439;
	bh=orPaOgx6J/LUi114f9kSqd4A7XlXiiksN/BvFn+cS3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYHAqMf3Z9huvpJapTAR+uF4zpKFsOVOqB7p8GER0qI2ESstHl5N5glcyPZhHRf0S
	 47MaoxN3r7v8jQN7CRY5zf2YkHGchK2S6qkXgmxn5jJLwaxm7swEweFwgvJMcgLGLz
	 4iUSnuOLpwV+QPmNR7TCTJBqDjyXW/fnjVGfi3/xr6v4mLxCgVSQrhHulyySzlbPxC
	 dI4gx+dSvi+zF3IEljngIukwhS5dz9OhZ8QonfmJteoKoXjyYw1cwGqsdpD5AU0rWN
	 4mx2vBSal6nd8k1WmEeN90I6rYVvjnYr7/48oeBD/6gYI8q4FTF9uf65aJpvmlGpcH
	 6d4OgZjU0etTQ==
Date: Fri, 31 Mar 2023 19:17:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Yu Chen <chenyu56@huawei.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Vincent Shih <vincent.sunplus@gmail.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-can@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Drop unneeded quotes
Message-ID: <ZCbkY3z9Lquad41t@matsya>
References: <20230320233955.2921179-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320233955.2921179-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_064721_140680_C5037F07 
X-CRM114-Status: UNSURE (   8.04  )
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

On 20-03-23, 18:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.

Applied, thanks

-- 
~Vinod

