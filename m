Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BDEEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpAMFGb/Xybkrxzme8WKAtLm3ABmr0EJ6sAi//VY/IQ=; b=cYkHuh7dQb16xQXyTaSIK8uTgA
	w87Gzk3MPxndoZoiINTD4Pm12dr/KXwNFskGTiiEfmXz0WziGGuKWqnvsidjQXmPgCJ3HQhZRqgRF
	6BOcLqHX5Z5jg6euwP8q9LyY1zvei8nUgZbEkYO3VllNMU/LioAdaavOh3Ta1jvNJqVv+BGCEMH3M
	kjSkGRWVOfIIHnW7GmOpH3L19Ws5Cm+7opQyyf1l57mIY+PXu9T/gvdTc+P5m6eUGsNrWE5MRc5q7
	QHpsJZmMDM96KbBwXrThcWx5g8gqwURtt1pZOjECohJwZ6NmBmvYHL6oZ9UxTy5YwoCytnEUwc2pH
	9+ferV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUBD-00BJt3-0t;
	Thu, 20 Jul 2023 13:58:55 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUB9-00BJrQ-1t;
	Thu, 20 Jul 2023 13:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1689861531; x=1721397531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XpAMFGb/Xybkrxzme8WKAtLm3ABmr0EJ6sAi//VY/IQ=;
  b=De0Y2vE5Uwtst45PEjFBo5wgDa/yb/QOc6SQiJIqetfC5PqUL0iCbgeG
   Aj845KQBTnNvMbps/gDOcgbPRWrYMQZ8LaGqRwi/rTNGIq6Gq/ds9Bjzz
   kp+CMj0j7kDp5zKm0hLFCIzFt5QgXubSgo/jlvM0C7dyOTpNrdEtD9eFj
   G6jY5YUFZ8LCrZmqqABjiJWUcLdXf4RYVpDdiKwV4BqRr+LbeZ7E2dd7q
   G/kMiF2edI+tfAO50JG1uCt2vQpkzcfoN5AyfkAVq/reDewADIN+6LiFu
   uaUKb4kUuy+SdXf++ILpvoOnBTHGtPgwz+ltS/wAyeXJHr0FqMrpbAZ3D
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684792800"; 
   d="scan'208";a="32035611"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2023 15:58:43 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4DD88280078;
	Thu, 20 Jul 2023 15:58:43 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, =?ISO-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date: Thu, 20 Jul 2023 15:58:41 +0200
Message-ID: <2640608.BddDVKsqQX@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <8374cb80-749a-401d-2d88-48001ad614c2@linaro.org>
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com> <20230615145838.1526919-3-alexander.stein@ew.tq-group.com> <8374cb80-749a-401d-2d88-48001ad614c2@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_065851_954876_FDB98EC9 
X-CRM114-Status: GOOD (  12.04  )
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

Hi Krzysztof,

Am Donnerstag, 20. Juli 2023, 10:07:04 CEST schrieb Krzysztof Kozlowski:
> On 15/06/2023 16:58, Alexander Stein wrote:
> > Use id-gpios and vbus-gpios instead.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> > ---
> > Changes in v2:
> > * Added Heiko's A-b for rockchip
> > * Added Matthias' R-b for mediatek
>=20
> Please split patches per subsystem, so this could be applied. Or send it
> through soc tree, but you chosen the middle way - neither per subsystem
> nor via soc tree - so it went nowhere :(

How do you distinguish that? Almost all maintainers and mailing lists from=
=20
get_maintainer.pl output for patch 1 are also included in the list for patc=
h 2=20
& 3? Do you want me to send two series (1 binding patch and 2 DT patches),=
=20
which you will receive both of them?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



