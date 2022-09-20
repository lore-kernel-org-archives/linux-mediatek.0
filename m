Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6C4C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 06:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJ8dgq4cGWjjWFO85mLNZ1DxFlDsm6QpBs3SB3SRS1Y=; b=F6oTN5STSLN3BVivf6FviioSI6
	1HHBZf48ahMZFuGQRA0eQ7GrbH0j4WU2xffCQOFB9P1HLbvcxptANXN3j3okHNvPrAIPKkPwDcC7w
	LMB8drRE+JwIxJ9AkiuawPiWGD6PMJC+iX3da3CcmcL+SnRsuvTXX4T0Gq6SXnWvrOXDhpol7RaId
	SBTIgyCzCMAv+auI9aLgtyPAcYNpbjxAgJ0RTqbw1HhRqHuBox14PTwH/1LKnBkaZ0dRyoNjaeKxI
	GJ5aLpkf2ntbU8vh+DfV5eNZvBSptJ2dd4kcq2UdWzUkdi9iJ2gv7ofyWp5VC8/KPih087MPqEuKM
	yqZtU5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWlP-000zMI-AB; Tue, 20 Sep 2022 06:29:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWl3-000zCx-2k; Tue, 20 Sep 2022 06:29:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96E0B623E6;
	Tue, 20 Sep 2022 06:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417D0C433D7;
	Tue, 20 Sep 2022 06:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663655363;
	bh=M2rh+TZcI3pHu7rb0WluCI+L/HBvP1YH3JrnG+uT+Ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0NNS4gqb9ikKNBk02KO0BPJ3SNR1Mlrt+RrwO1GP49y5+l5Gu/fE+kKv4sUMF/t/
	 BCck4RZ2YoK1QsJZJGe/YJGpMY8x4SdhAsvQH8x3aFcZA76Hk26l779WRYE5L3XLtk
	 xmiUuKUq224x1OTwwkkQhNeyod+tF0QY1H4tuS4DS7ZqIUrtU6zhg8nBI3kZMDIN4/
	 RbeVwoeAa2dOfBAAqVdPrZQNe+HLr4m69XsRtDzflaytzRum4m7im0nioWlVViAw0Z
	 tB7rMVV5OhFLVxd8AybTv5djoZ677d6Zbl5kqaDfZLBNRvgN3OLHDpX/727nu/pko8
	 mo0yzPYW8Dcmw==
Date: Tue, 20 Sep 2022 11:59:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eddie Hung <eddie.hung@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: phy: mediatek,tphy: add support type
 of SGMII
Message-ID: <Yyldv9J8CEA7odiM@matsya>
References: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_232925_181811_1D7644A6 
X-CRM114-Status: UNSURE (   7.73  )
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

On 14-09-22, 14:07, Chunfeng Yun wrote:
> Add support ethernet SGMII, forgot to update type supported.

Applied all, thanks

-- 
~Vinod

