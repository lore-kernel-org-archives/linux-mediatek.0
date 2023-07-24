Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C45AC001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0LGi2QX3xgEV9GZ5vh6iIhI2gnfjhuPy7mD6FixJUY=; b=QyXp2plSo/KfBFHUx/Lri/Xx7N
	XRKEbMQul+gqYYlczuleQa+4ABFaFm+I7yflbKXK4oONE4wM8m6vBwdNCGzRWkswW+QyX7QaYyAZS
	YExaEWYANBUliNadjuEcV53aLkomNet2Wz31k46dnthN/oKQBKIcLP6tUiLB7RWto9z1L/+laA+jL
	y/birFlQRSLTWaisy7hfcIPhIvaN+rABQv+Wd6lKgQ3sbSzMpltOTJvVfsbVVKaQc7CaADzvkOgwl
	2PTqybaEvMq8GY5uDrDButjf3vtw5V4WayngiJG9P/wwyDk8HJS4e1WP6d1A7qXWk8WjLsZ4tgF4t
	2hj4sPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNrFr-003Ism-1x;
	Mon, 24 Jul 2023 08:49:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNrFn-003Iqy-2H;
	Mon, 24 Jul 2023 08:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690188559; x=1721724559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q0LGi2QX3xgEV9GZ5vh6iIhI2gnfjhuPy7mD6FixJUY=;
  b=M7DX+UuBtoqirgUoVlEFPZcmW1Oa8oH6j+dqQ9/9wzESR3A3H+QRGO0H
   qTBJG8dXtgY3kmr+hmwel8DpGXCzfaF4nhTCoTxjWEi3risT9JNvLabZ2
   9zLtc4Y8mmqZFnuEEDxhrMuQjhUMDdAPxOr54nU7LVXGWc0Oeczm5QGz2
   qQ3N7pdhJqWF6FSpNythL650ESOf7qhgSa4QPdB9yiGu+cR4osYuL/udo
   mmKcmvEwG+AXKaRrh/yy7EIbtQujdJ81lxqd+zXJbMecWxfbaNlO2J82x
   ZvZolA967g9yQk/NGFfFnfzAnHVYP5834kkH5fws0Oe7Ect3gzb4DMCq7
   w==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32075023"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 10:49:17 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0FD34280078;
	Mon, 24 Jul 2023 10:49:17 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, =?ISO-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 2/2] arm64: dts: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date: Mon, 24 Jul 2023 10:49:16 +0200
Message-ID: <3178020.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <e0897453-54b0-2a2c-2bf0-1f771c0c6565@linaro.org>
References: <20230721081948.1185360-1-alexander.stein@ew.tq-group.com> <3251040.44csPzL39Z@steina-w> <e0897453-54b0-2a2c-2bf0-1f771c0c6565@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_014920_128110_9E64624A 
X-CRM114-Status: GOOD (  21.57  )
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

Am Montag, 24. Juli 2023, 09:10:43 CEST schrieb Krzysztof Kozlowski:
> On 24/07/2023 08:05, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Freitag, 21. Juli 2023, 14:22:06 CEST schrieb Krzysztof Kozlowski:
> >> On 21/07/2023 10:19, Alexander Stein wrote:
> >>> Use id-gpios and vbus-gpios instead.
> >>>=20
> >>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> >>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> >>> Reviewed-by: AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> Acked-by: Shawn Guo
> >>> <shawnguo@kernel.org>
> >>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> ---
> >>> Changes in v3:
> >>> * Rebased to next-20230721
> >>> * Split from bindings patch
> >>=20
> >> I think you wanted to split it per subsystem, right? That's why you
> >> resent/v3? But the split did not happen.
> >=20
> > Yes, I split it into dt bindings and DT changes patches. Is this not
> > correct?
> We talked about DTS patch - this one. It was already split between
> bindings and DTS, so this would not have been a topic at all.

Ah, sorry. I misunderstood and thought you were referring to bindings and D=
T=20
changes in one series. My bad.

> >> If you decide not to split,
> >> then try to figure out: who should pick up this patchset?
> >=20
> > Well, intention was one patch for DT bindings maintainers and these two
> > patches for imx maintainer (Shawn AFAIK).
>=20
> You touch there much more than IMX, so if you intend that you need to be
> pretty clear. I see there around 5% of changes from IMX, so targeting
> IMX is a weird choice.

That's true. There are several SoC families.

> > I've send patches separated by arch/
> > arm and arch/arm64 in one series, so I'm slightly confused now.
>=20
> So telling you second time - don't. Split per subsystem.

Okay, I think I got it. I'll respin a new series, including patches for=20
bindings and for each SoC family separately.

Best regards.
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



