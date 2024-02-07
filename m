Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6634AC4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 11:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TqkX5i+GoqKIAfOvWUEPGZT0pI3zlxvRMRGSg0gML8=; b=1CcDz7yN8LHrj5FUdZcK8g7uBe
	DJlBvzHO3ubjiFHFmgLziUadi0Z7ezo+AWTO1iaRHjIE1dgeNMyqaAtUzlri6t7PWuFB9EaqlmprZ
	4eeCXFKk8flIjHA9cCmm6c4rDLqZeEGSYDeEBDzz0npspKOjHtDsuos4nuEu/QnH6tashrhnBAQ9j
	mcEcIcv47uTF2KU2Kselah4JxGVp4efOD/1ruOdDj4+/EhXlPHbT0rsyfai1KPYeQTojWEaOpnPr5
	UxpVS10bg2J5cBfkl5hrL0QPlAmoZjN7lX6RTYVoDdbCbKTAZwrGolWxUXELDNqLSpDXfRgr3eh2x
	1aE86D/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXfnj-0000000ARI9-3l9g;
	Wed, 07 Feb 2024 11:09:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXfng-0000000ARGa-3E4d;
	Wed, 07 Feb 2024 11:09:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B24E6182E;
	Wed,  7 Feb 2024 11:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACC1C433C7;
	Wed,  7 Feb 2024 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707304147;
	bh=91DCFeQ7d3VJjnWv7geoiac+u+Qyv8mwJMlI/ARZNSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofNieulp1lv7S4WEoCoFFOejsfQCM/0UFI4LnmKrztj2CzYKy54049p3ECwmmLtzg
	 6BybZv6ROFqk3ejU0udD8uy0/peDzW+S8QdpKyiPYGE06/zu2xb9hSfRjaVvcJjP/Z
	 hlCazkBchNnA9ZRu5AFr8KyI4QItkouKcSImzUq+T4QNl9PBp/evBpM553rKPk20eu
	 S02Z1qtzt0eIcUdqagCdaR9RhXEUCigJ2OydxW9sSHXuQjCdpsCENcnSl/ZnDrw8rX
	 nGjFtjcQSECzWYySlTaZAFXUrUsLVriI26BAIKhTqO33DX8iiDRgbSnN42OpOjROhr
	 FiH50pSostpDA==
Date: Wed, 7 Feb 2024 12:09:05 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 0/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-ID: <ZcNk0VylU2mBsewy@matsya>
References: <20240111101504.468169-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111101504.468169-1-jstephan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_030908_877821_DEC2A9FF 
X-CRM114-Status: UNSURE (   6.63  )
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

On 11-01-24, 11:14, Julien Stephan wrote:
> Adding a new driver for the MIPI CSI CD-PHY module v 0.5 embedded in
> some Mediatek soc, such as the MT8365

You would want to fix the way you send patches, the series is disjoint.
I had to apply them manually, but please fix your process

-- 
~Vinod

