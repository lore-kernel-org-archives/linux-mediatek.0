Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EEDC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHyfns2O9Gn6GobXDg4dpXa4V++fdwC+YM3e+aa/xjU=; b=ZyDqAKExJZs3Q39wkko3fDnPsN
	U1Vrpl0Q1Pjfkp9XuPQ5qvgaVjh8v5DpsqcFOOnO7S7P917XxQjQaThFONsvIU5Z6RKajbDuFrQem
	IlVnTeC53aWBh1s/51vrFNSe+5V9aLVCseTtX5y0y7bZwvs7cMECHztroao5sbiDI5D3jOSaH8Ani
	go+Dxfqe6+A0s6EenblVzja8NsCQ4kuq2NrLmHBwEFdh2pkuygwYBuTsuKFlDTs7yyrV0995kXDMU
	ECOpWURcotv9o5Aj9StY19fGk6E6SJmsg0jH1Icf2ZSJuDWgJKWyNSdqvt1KboYaOXX5b8mgCU9mg
	JsSeGS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bcW-002ZEy-0F;
	Mon, 27 Nov 2023 13:25:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bcT-002ZDO-33
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 13:25:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7bbw-0001DE-Lv; Mon, 27 Nov 2023 14:25:16 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7bbt-00BxGz-0Y; Mon, 27 Nov 2023 14:25:13 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7bbs-000D9T-2y;
	Mon, 27 Nov 2023 14:25:12 +0100
Message-ID: <117dc1503ecd07448cc2e0b036b34a49f5e8c38e.camel@pengutronix.de>
Subject: Re: [RFC PATCH 6/8] net: pcs: add driver for MediaTek USXGMII PCS
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Golle <daniel@makrotopia.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>,  Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,  Russell King
 <linux@armlinux.org.uk>, Alexander Couzens <lynxis@fe80.eu>,
 netdev@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  linux-phy@lists.infradead.org
Date: Mon, 27 Nov 2023 14:25:12 +0100
In-Reply-To: <b9f787f3e4aa36e148d7595495af60db53f74417.1699565880.git.daniel@makrotopia.org>
References: <cover.1699565880.git.daniel@makrotopia.org>
	 <b9f787f3e4aa36e148d7595495af60db53f74417.1699565880.git.daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_052549_978991_E10FF974 
X-CRM114-Status: GOOD (  15.24  )
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

On Do, 2023-11-09 at 21:51 +0000, Daniel Golle wrote:
> Add driver for USXGMII PCS found in the MediaTek MT7988 SoC and supportin=
g
> USXGMII, 10GBase-R and 5GBase-R interface modes. In order to support
> Cisco SGMII, 1000Base-X and 2500Base-X via the also present LynxI PCS
> create a wrapped PCS taking care of the components shared between the
> new USXGMII PCS and the legacy LynxI PCS.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
[...]
> diff --git a/drivers/net/pcs/pcs-mtk-usxgmii.c b/drivers/net/pcs/pcs-mtk-=
usxgmii.c
> new file mode 100644
> index 0000000000000..b3ca66c9df2a9
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-mtk-usxgmii.c
> @@ -0,0 +1,688 @@
[...]
> +static int mtk_sgmii_wrapper_init(struct mtk_usxgmii_pcs *mpcs)
> +{
> +	struct device_node *r =3D mpcs->dev->of_node, *np;
[...]
> +	rstc =3D of_reset_control_get_shared(r, "sgmii");
> +

Superfluous whitespace.

> +	if (IS_ERR(rstc))
> +		return PTR_ERR(rstc);

Here you correctly check rstc for errors ...

[...]
> +	wp->reset =3D rstc;
[...]
> +
> +	if (IS_ERR(wp->reset))
> +		return PTR_ERR(wp->reset);

And here you check it again. The second check can be dropped.


regards
Philipp

