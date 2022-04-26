Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179E2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuKo19XPSQidOQXi5TX3+SZW5bMs1NIV7KudXQn5C3c=; b=KFUc2Ez3vDPxso
	j6tYWqO/W5cCw4sZjUn4mQ2oqlQZocwm5qB4FuSUuxECitZTmXycSlCe40gliXZ36F2kXMTy1BHXm
	YnrTIiH17idlaJuuGSeMgpam5DA2jmIphVY98R1LNmGJ7wO/uZFaBXY7VdvxM+JEceZDUnINDRfK3
	8sABUyxat+xigmlT+m9PHL+lXl8r/WjLhB7euuFnSIqRw6Xs3R9WknomY3XeSIymGMqN0786pk3gE
	GPVqtpooQgGK2TBPkWffDRwAlZDL16UzjDjgNjqpi1PUZ06AU04LrUOhbeVTUyj7C6eqmBElko5VS
	B/aYWta0GZSkIxjOAA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njMeH-00F4H5-LD; Tue, 26 Apr 2022 14:58:41 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njMe2-00F4AQ-ST; Tue, 26 Apr 2022 14:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650985071;
 bh=KLCjLhfQTgA0oKxUS8a8HV/nxwOxtsyC4o79WkTfje8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IIcY48H9YK8/QDBNpiRiNIjM5ijvX9dPgdmCPggiTIq7XwNedhwHy18OxeYmKHEoF
 aTWxmr4FQ9c9f1+BSP3KA3mTvOPXFvrXnR56rwSg8opVpkVDmlW5t7ss7YGXvUhPii
 MK5BlLt3w1SEQLCrqBWvI62kQpytjOvDD7ZZPMaA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.77.37] ([80.245.77.37]) by web-mail.gmx.net
 (3c-app-gmx-bs69.server.lan [172.19.170.214]) (via HTTP); Tue, 26 Apr 2022
 16:57:50 +0200
MIME-Version: 1.0
Message-ID: <trinity-8ceec42c-8705-4808-b37b-9e9849ba774e-1650985070928@3c-app-gmx-bs69>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Sean
 Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Peter Geis
 <pgwipeout@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Aw: [RFC v1 3/3] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
Date: Tue, 26 Apr 2022 16:57:50 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220426134924.30372-4-linux@fw-web.de>
References: <20220426134924.30372-1-linux@fw-web.de>
 <20220426134924.30372-4-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:wBW5QJYpMHdq3PrMhGinR1AdioQG5dT+v1AUhYrsDygj5o2ETBmB7lzitdogghO9fUJ34
 7C+S+3eGXblSF48OoeX01rSKkoLZx+5zlIPitqd/reCb/PRwuR3znVtcbV6WiXGQw9fKCED9pXjl
 Yqa7X5QsU8EBNE1dsh3kVNkMGRtDKOoHGLkrRf7GTn8z0SY+JQ6juNUXpn1GZl+laWiX/FtsqqgA
 Ye27fCi0B2ZSew4gY/X1gzmzAfDOgUNCH3qY9mTUMWRxlDCIDxa1Wg084wN8Bg56b4e0IO/LVl4D
 Qc=
X-UI-Out-Filterresults: notjunk:1;V03:K0:41kc6tKK5sg=:EDOaU6bOsIT1ZaYJ+7rZT4
 ul8RUcVdFNTJTPhR0EmciMDWP/g6o5NGLfUZmDgSUNOU8LhvXxvfMQVPT8xvM5No8QyQIbn8p
 WMKpXo9jDASBQp5oAj0e+GrzTnpb5vgLTshGaXlYY3HoKQ8wAfMaejoi/1ZxTv84/iGtHUGSY
 /G6B35z0oyXoPDsU1l56EIMFgjGcCm183owIWmaTlTRBwLA0GVTzC4JsHMyxRP1gfzIxj22B8
 O/D50GXl1IFfPc01KMVhe04uv3tzA6QtQQVgtRFqxnXtllj2fRbmUos/0Fm/ann/0wlOpOAtZ
 EqUzTxAlRXhQdKgIpYjjYkzfiMcAbUs+oIVACxTJcUBBzzCygQQPs5nhdvhf0E7TZaOjV7oTG
 RXa/eCwTZCoXO/XYcyAZC86TrMQ2sfzX2WRS0uiiEMEUzJt8xYokLe4p79IjT8zZa87WinMsl
 QyFLU1u8cGd1nm5XZ/St9Ujq5DnuhwN67mNGTj+ieasHZSPWubsLPAHfmFtAwIG37FKgvckQn
 KkRLuySR8bhQ99HM8D1hiPo3RvV3NsbQxWxb311FPu0Eh6OSNrZbUE3bxgTHx+HKnDxcV3f35
 tVlt1abs3yLoH4Z3CbvTXV8g8mzJCPirOCEwhH0yv/EtSa+8tmhEsUTZ6TyZaKWp7E8j4+dFv
 CABs6rKSUkmCf6VeZozZk0q83zD29Nep3MjfI1n60J2xSBoq0WVp0ATaLKsXCgso9g5LsjY0a
 z251OrYA/UMD62CBfDskbdcjm/W52tCy/N+3PGEqj/65yPZIeG6Xj8rVvf9/LFDVKHFIN0y5l
 wmiNiYq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_075827_410416_C8BAC239 
X-CRM114-Status: UNSURE (   9.14  )
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

> Gesendet: Dienstag, 26. April 2022 um 15:49 Uhr
> Von: "Frank Wunderlich" <linux@fw-web.de>

> +&mdio0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	switch@0 {
> +		compatible = "mediatek,mt7531";
> +		reg = <0>;
> +		status = "disabled";

seems i had missed to delete this, but it looks like it was ignored as switch was probed

> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
