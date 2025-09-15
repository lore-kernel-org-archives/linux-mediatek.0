Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BE5CAC592
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Sep 2025 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXc9VRSt6M1XQCG/ch4xJM0Ktux641z3IB7tN8nx4oU=; b=nkvCtb3WIKqxW+wxdP1f04COIl
	kNH0ZHs23UAs3/v0K0sc+a4lx0PxSYPLByG/iYNA5YoP2kFCEnCkuyJGhfQLF2bcVUrotkAU7wdmR
	qgcoSDcjAC/L459vPVUxtDlhTaI4Pvc8F0WR3EIkgLGpntvmT3h8A3fWPRrcXdJjNa4kFEUn3HL9g
	Fem7du0i1tI1pYGh9XiGlDbxODcwYlsivStPxAvpIHeGDnIGU0cesz+bvt2+4aKsEWzqQHyPV/77L
	hWfCSbSZz60SNk+Gt/cTadete0XsX6cYHOMt+CpclfmSciNhy2mKPX8kDRpao8AQfRWw3Exf5vUrJ
	Cry2n4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCsc-00000005Gms-2TsY;
	Mon, 15 Sep 2025 17:20:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCsa-00000005Gla-3jyI;
	Mon, 15 Sep 2025 17:20:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E26D601F3;
	Mon, 15 Sep 2025 17:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2725C4CEF1;
	Mon, 15 Sep 2025 17:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956840;
	bh=IpDEJIKERU1JCTNIEi7Bdle/d8rWWRqcg2dcv69TTj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kk/wIOVoJARgFTwbJ31RhqUlmthMISBT5ZrvLG3733qp63L6xV4JuDFUNRObL1T8I
	 OluLwHjftnqeqvt/LyM90jqvcD9szTona6pBQ0L8/vwUy9+b4ROeqj2tiBdjwh3qqr
	 goV072M3LdPHXlV43F8TQMpBr6addvBsJinTpi0a8IGGGyN33iufCItKg7jyzsM8QS
	 HEFAIUr9nl/46ZCc7gmMsvpycJMcnhpYOJnrbVKs93ITomcpQRzz3DJBbI8bNjXhk0
	 rRXEhpC5BpqKGcBmEHrMLghe7VjHciHqIsKNFtOUWimaPmm1VEu4lOQWLBjVJb0nOC
	 KRYZx0LCiLDaw==
Date: Mon, 15 Sep 2025 12:20:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: minghsiu.tsai@mediatek.com, krzk+dt@kernel.org, kernel@collabora.com,
	linux-bluetooth@vger.kernel.org, louisalexis.eyraud@collabora.com,
	chunkuang.hu@kernel.org, pabeni@redhat.com,
	yunfei.dong@mediatek.com, houlong.wei@mediatek.com,
	airlied@gmail.com, angelogioacchino.delregno@collabora.com,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org,
	maarten.lankhorst@linux.intel.com, devicetree@vger.kernel.org,
	simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
	edumazet@google.com, netdev@vger.kernel.org,
	support.opensource@diasemi.com, marcel@holtmann.org,
	broonie@kernel.org, lgirdwood@gmail.com, davem@davemloft.net,
	linux-sound@vger.kernel.org, amergnat@baylibre.com,
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
	dmitry.torokhov@gmail.com, p.zabel@pengutronix.de,
	andrew+netdev@lunn.ch, mchehab@kernel.org,
	linux-rockchip@lists.infradead.org, jeesw@melfas.com,
	tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org, mripard@kernel.org,
	linux-media@vger.kernel.org, flora.fu@mediatek.com, kuba@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, luiz.dentz@gmail.com,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 09/12] dt-bindings: regulator: Convert Dialog DA9211
 Regulators to DT schema
Message-ID: <175795683847.2967801.14952293094675548520.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-10-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-10-ariel.dalessandro@collabora.com>
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


On Thu, 11 Sep 2025 12:09:58 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Dialog Semiconductor DA9211
> Voltage Regulators family to a DT schema. Examples are simplified, as these
> are all equal.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
>  .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
>  2 files changed, 104 insertions(+), 205 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


