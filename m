Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D80C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA0oxwD27gd74f5RciQ0gAwJyLc3AOc6ENazGRzlsA8=; b=2hBgajwKUQGLOamkZqDFjw/PZY
	l+gw2Cayn+YBjxMt/El0y+81VdMEhPhDpL2OHu2RCsJEXEokZo+4zfJ53VVO+bfoDQTZxcE0S9dJf
	AAAPs9WGsXN6Z32X9W8ehHkOAQUZaKy87x+g0s0c5fQN5jqjTU6on0HsRdMJpplmuRNALOnSGL3NV
	3gQ7xN9KqZfSBOggZRqA9fkMjNePRAZq5OVgPWOT0N8CiNjuKBOGPbOOCdTTMXT7XL9RLmKkQG89M
	Qe7L3NBLn1jEZb54J1PXiiuhzhk2tPmoeC/431IErXVG6vHjayAKsaAxecjHIPmP2QDeD1jyzDK9V
	M4oRM0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg2IW-00000000Dkk-0GtK;
	Fri, 01 Mar 2024 12:47:32 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg2IR-00000000Div-1Y2o;
	Fri, 01 Mar 2024 12:47:29 +0000
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B32031C2C89;
	Fri,  1 Mar 2024 13:47:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1709297243;
	bh=hA0oxwD27gd74f5RciQ0gAwJyLc3AOc6ENazGRzlsA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=17zvLga4k0NTgX7vMeySb0BST/85bdOAY7Tbmc6qXLWdcX5iiVdGYAFNMGHwTHhaD
	 283fe6n+XYrQ/bHfCjsAfEvCK0QPphrx/G0/uJLueU+GPWo0u0fURkWHAClQ45C9uI
	 uIvO1RmSja0KtwTEwIzL5JJM9GJ/LcAvmkyaz6Qi9DbfkNzr9uSWNtRbOriy+5pRPV
	 2gQtzJ+O2Br8Ta3rRxwqFFTiug2NvFzLQFRpROnF95KN8tzg5yj5MpDAvgx2Dm/psw
	 sDfN2jQw/qIHXKrhff0JF5WdLh5syukwy7nwIhemdPGPS4RXoyorYt7ID45BQAFQpD
	 VrRA+CYGCvnTg==
Date: Fri, 1 Mar 2024 13:47:21 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 1/4] iommu: constify pointer to bus_type
Message-ID: <ZeHOWXuNLhQlSrxM@8bytes.org>
References: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_044727_800270_0841FFA3 
X-CRM114-Status: UNSURE (   6.87  )
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

On Fri, Feb 16, 2024 at 03:40:24PM +0100, Krzysztof Kozlowski wrote:

Applied all, thanks.

