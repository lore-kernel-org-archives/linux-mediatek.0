Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DADCD3427
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myyP/h7YJHzBCyHZcnY9GFOxX17BX8+dP2EzQjjAJlM=; b=nieUh8ANE2ivKcU+Y4oF48iLK/
	RDFsGGgU+9CnM/3+fRSnQ7MoYz/PDETHH6PnRbtWOJpBPc+42snro4i7hRcjlgs0a/iAWvxo+LVtR
	UshsD2WepbjDEPXgQWbAm0bBnu0wZJOdSQ9cD7NZcP2TIHSoEwvx2Sz2S5HfsYNNFgvtub3WGu3aj
	5ozbFJUIInQVxd/M+8byFpzqHSqj2it2A3dHkZqeqOZydjsxszvnwou8+RBt6uqsoh0Bney3duh7N
	X/L+Rx3o+gA3uc+TjTlwSsdyTE+nUH8CwbXLQ5XQDWR1pTZo2gXHsGtnXIOugC3v12zA0kCnpHXrU
	f0htslkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLeQ-0000000HKAr-0m8V;
	Tue, 05 May 2026 19:41:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLeO-0000000HKAF-3RRd;
	Tue, 05 May 2026 19:41:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A407560181;
	Tue,  5 May 2026 19:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4BCC2BCB4;
	Tue,  5 May 2026 19:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778010107;
	bh=f+zthwuppfpFTa8b8uyHJmInP9s5La5GZHSH/CQEOa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUROvmTjlsPg6l30xYj3CqxY+c99n1i7qfItZZvbymBEeQr2WwOY4HVw6KGNUhXmm
	 8pDlHR+A6EOAZcTEsVmjf+1MKasze01GDQSdeieKoxSyiGO+f1b7vN9LdhJEghaxYv
	 Fw5pbBkw6/tnsG7Z0HzR/Kg0RhjQJHHniCNFY81vIXm+E/dkLtEMY8OeVTHByaBWSo
	 PclJN70pGhz8Jqqgu2KF1DUJKy47haFlJKfRxXkmF2D3NUrPBVn4Edw7sQaM6u1sNm
	 /xcljRt7QpHTRVa0meiOobjQZEIC0i5ma2Q9jUMFn3N+swNB3Eedvyj6Rc483sPx1o
	 ownyMgcLaNoTw==
Date: Tue, 5 May 2026 14:41:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Sen Chu <sen.chu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Val Packett <val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>, linux-pm@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v5 4/9] dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392
 pinctrl
Message-ID: <177801010490.3801319.4232280510868698517.robh@kernel.org>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
 <20260420213529.1645560-5-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420213529.1645560-5-l.scorcia@gmail.com>
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


On Mon, 20 Apr 2026 22:30:03 +0100, Luca Leonardo Scorcia wrote:
> Add a compatible for the pinctrl device of the MT6392 PMIC, a variant of
> the already supported MT6397.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |  1 +
>  .../pinctrl/mediatek,mt6392-pinfunc.h         | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


