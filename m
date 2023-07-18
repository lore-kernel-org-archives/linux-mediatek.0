Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE5AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpZsq4D8uq/3uYMY1vMcJf1V4nXRD5UgB0BDtYTU+WU=; b=IjPfVqnsvx15NoJnfqmFZzxhK+
	2GgiA2XcG/HGdTSlZnLZI7VKv8SQi01Vg9C7rqTARi6qhOsYjCg1spF623/gfRPnpQLKvAGqfGpFt
	ljtdgb6WS2/G6nLBi7s/7gg92T3Rdbr/n95jfc2/CW/8eC20j2PFuCRLmJ/YB95zXN5WVU8aSOXxO
	w1oIoMbhrf+z4peG3MxDmYqSNLkf1/ol3MrjaSow7mcSNK0HKdvErqguxKIOaCiy/iFSH30G+hjLD
	67pGGXr+1OZV5ssJ889fwfRKWO8xj9Jd7ny7l4sFtycY66F/72eGLnXq/42ZPeq1RWeuXhNtWSUhb
	wX7uGROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14l-005xWS-2t;
	Wed, 19 Jul 2023 06:54:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14Z-005xOx-1m;
	Wed, 19 Jul 2023 06:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qpZsq4D8uq/3uYMY1vMcJf1V4nXRD5UgB0BDtYTU+WU=; b=mxm0cBTsmwxd4owXxkbCaDFb+R
	m13tFO9ghyHafHV4gDhg42tNyjIvY3WQvUrDuBdA97ShuKfjg8KBbIkMR5VO83NoSaZ+O7v9+d5z7
	8VxcbslknfMqMxqnQ1bf3sH7Ezqrh0nJCOvbk83ayQSnRHUVv65P5fs+M/Hd+GrYZy5dmKjD/D3Y9
	IvYYxM1T5Yi5maFlqXJZN49nrXzv8puQBi/UbfpuxMKASepx+BQ+MxgapN3DKE0G9AvEYL77URIFr
	G97tirGfhNdozHm7x9FaqGcRpWQUD35jFZZDwwTX4y8L6wL8IHdrpOcEStDIzEvdiGnd6zfH+Io7A
	IRPKE8qw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLZOe-009VqU-2k;
	Tue, 18 Jul 2023 01:21:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4EF2A612A1;
	Tue, 18 Jul 2023 01:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C194C433C7;
	Tue, 18 Jul 2023 01:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689643197;
	bh=sYoyjrCdqnfVe37hT1J702BYuzzCTd2Ci/rrKV27qAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyHhuCAmVfOTgZNTYuPvST8Bws6XubJbHhqIq5hpG7rbrMQmiyRNF7eAkP5+adYpq
	 Q3Ds5pXDtGuqwAb1Dt4MOgkvAFA5zFdvP9C+mfTSUxupFIcQdjqftN+gpLHeLqPz8D
	 9XiBua8nNfLbfEDTljM19v3s9fF7OEfurK5xMArximWKqmER/uUH2ksGVzTzCepQt7
	 3KnIWEXRE2Q23OrFJEyaljhgIuZSHn+gFMwFArfSqnWUAj0nTuXoS5W5LAnIkut2pa
	 PgncX5CSMg9/fuqpH8SDX/bmsLgI+y0OdpvVYQaLhYsLW1R2tbOqFFJzg5IP0whzZ7
	 u8pR9qdF6P2xw==
Date: Tue, 18 Jul 2023 09:19:42 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Message-ID: <20230718011942.GQ9559@dragon>
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
 <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_022130_655622_86D36394 
X-CRM114-Status: GOOD (  11.46  )
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

On Thu, Jun 15, 2023 at 04:58:38PM +0200, Alexander Stein wrote:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> ---
> Changes in v2:
> * Added Heiko's A-b for rockchip
> * Added Matthias' R-b for mediatek
> 
>  arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi            | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts       | 2 +-

Acked-by: Shawn Guo <shawnguo@kernel.org>

