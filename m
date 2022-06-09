Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC5DC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 05:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxuL1EwHE7R6164EbfdXFLIQGvWm+rhjYW2FtfvkGBM=; b=hbb3ewapxfNZJX
	7IvMhLDYCp8BICn/KsYK81AOX95vw04ETXohRqzmaArgAe/xnc7VE3Oej54wWm7+hesTTqaENxoNK
	mKZKQ5oDf89CkXC6WPQpAWODOCf47nJx0wbdzq28yEq/1D2AohdhDJrlRkdPnqVzvNmw3Lb0j3ELX
	puc0xethbVRd6PF96Sq+E+Nrw5Pvzlbifwmt5tqS/FT/m3s059pkGmvz/v7bAMS7yIkFk8HbzYFkF
	wlUtzjivZeXbwbUMHOGnua5a09GHIISQMroQY+UMgZvI3dNNvV6FpARyk8Kat1I+3g25dHA8GHQxD
	Lrxz4zF5yojfgqoJPh0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzBBU-00Gucp-Tp; Thu, 09 Jun 2022 05:58:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzBBJ-00GuZV-MG; Thu, 09 Jun 2022 05:58:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3E9B61D68;
	Thu,  9 Jun 2022 05:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5841FC34114;
	Thu,  9 Jun 2022 05:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654754288;
	bh=wxhS37iA9AJMgWUEVwHHfukO1BCczUN2/ZYuUq9Ar/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hqJLw4phQClKtl4+2ZplQU8hPrYIg4FxKrhoRp97zppzIf8jgUJ8Ab2oI3kvhEaDj
	 4lx4mI0FDsGS7aEYWaS595raHsHgZreqsJfI14nU+K7n4Gcnu1X55SHhzi54jLdsYV
	 P+34lQepioNGFSu88IzI0hBgmwiRDSiS45RUZarBtX7C76UU1hQD8ssPwWqq0hiU6v
	 i8BX09LEoEbO6khb75x3zwB0SNhxQCgq1wsx1bpJT0fUa6EcndFKg1rU12dhrKAPEj
	 EMGHCVdVkfnM7jzllcUTWnfDzC3Q72+UKgGSN13AWoSI7bBYUplIf/rdjQbhAxbldn
	 RVtP5mThZFFBQ==
Date: Thu, 9 Jun 2022 11:28:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	qii.wang@mediatek.com, matthias.bgg@gmail.com, jic23@kernel.org,
	chaotian.jing@mediatek.com, ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org, chunfeng.yun@mediatek.com,
	broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 11/17] dt-bindings: phy: mediatek,dsi-phy: Add MT8365 SoC
 bindings
Message-ID: <YqGL6/JztR6J7w8y@matsya>
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-12-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220531135026.238475-12-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_225809_787582_0F351AB4 
X-CRM114-Status: UNSURE (   5.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31-05-22, 15:50, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.

Applied 11, 12 to phy-next, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
