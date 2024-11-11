Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B268D3ABCF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2024 23:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1tJIqCgWeq9KnSLGyhg/d7DuKyd1LAar9bWTYe6j9Y=; b=E6mwdpV+FYI1AWAtzs6/JRwl2/
	G4c5GuK9FQfIEdFmoK0KVCr0A18U/PeIzn51/L4JkYeqTYY5GkzloiwKwLs3AowB6mrj40VfecCLJ
	Wt10CA2Xy9RdnOFij59+kccpsOgzeYIq75BgdqoWXSu9/xHpzTySl89YsOZLRVU4Lv09vsMBS4WFO
	WM99PILYsmQHbjl9siFSl/KWW7T2vc7uOk6UpYmLca+9QKB65Ky3XWbAPhb87RhiVbRQzxJF0eyYi
	XQCjIdB2b+pZ6AOggTchzJJj7levyRpNeIZXd6XiAeccFdBEKbWVB01qdkE7LQq0kUpRgJ8nZmFDC
	mtmjtdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdOv-00000001ZvR-3mIu;
	Mon, 11 Nov 2024 23:00:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcNl-00000001QT7-2PFm;
	Mon, 11 Nov 2024 21:55:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50D4CA40A22;
	Mon, 11 Nov 2024 21:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0FFC4CECF;
	Mon, 11 Nov 2024 21:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731362136;
	bh=Ulbt4wtJrj0rI8CCkCKH2MYB/lSP1izaiuAWB+R5AAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PG1YbClYCgPJFMl42r3GRpF8dyrEDfjWHxsCTW4uWM/fk5P9+Erj8yhmYkZxHu/QG
	 9HFsD4yg9KkRPSsnkdUY01psgxfcB/RV3snn15Pw0dmj+5T3vAVeafD/AhctT9lmLS
	 MVXBWEF3Kyuj3jGQhPr3+Q7G59OuZYnrebBvIW8cIQjgz0C1PetFpqBk5Hch/xYSDY
	 /5288fShDBpc1vTup8g8MIrz1T1Yo522ixrq4oHD4QKLOjPWHheNEp/6hZvfrAOgIV
	 FNTKjvSsp4hLiA4Nk2AFF3cl6kLcAflBn59RCkOMiyXw6kOEflubamwnhf5TjDb3EI
	 6jz6o8uTGAVjg==
Date: Mon, 11 Nov 2024 15:55:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Andy Teng <andy.teng@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 6/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add bindings for MT6735 pin controller
Message-ID: <173136213324.2011108.6481544003216572759.robh@kernel.org>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
 <20241106100741.173825-7-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106100741.173825-7-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_135537_698093_5AFEB032 
X-CRM114-Status: UNSURE (   9.18  )
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


On Wed, 06 Nov 2024 10:09:20 +0000, Yassine Oudjana wrote:
> Add DT bindings for the MT6735 pin controller.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      |   39 +
>  MAINTAINERS                                   |    6 +
>  .../pinctrl/mediatek,mt6735-pinfunc.h         | 1148 +++++++++++++++++
>  3 files changed, 1193 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


