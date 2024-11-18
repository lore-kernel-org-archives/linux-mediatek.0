Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8A4D49211
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2024 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORLaTk/Iw0OWu+e+EQLIfgJLoVvhbQWZgb4aWyLKxz8=; b=ZQUgxEOnJgd1xqQQarbSNLyjz9
	D9RMKqjTtsqg/P+H8+QOIdfD0u/sy6QHt+uKYyslShnJbvMVYXLpk0M/6Dzq7xHZgi48+Xv8bzI1E
	Hk1ppf9YmviAp40ddc0Wzf3yNRfk8EEmb54A32SqfjKSKPhuRS9Gi10VrggRy20qFnC4p1SMsjOj9
	/Yyi95oRLmpbgeBxm7rFrrH8iXz8a55hZ/Vq9qI1dbwMtvqmc2MuonxMxEhPvguxybtKOEs+Zzs7D
	Ra2H/2+DYR5esi1sKJ4EPek42RqgrNvmOptekxLfEiUmJDQQQuRwU9G6aw6StqiUJLzOozfBbxAwH
	fjYd4mwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Xy-00000009MMk-3tbk;
	Mon, 18 Nov 2024 12:08:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Xv-00000009MJA-2zbn
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Nov 2024 12:08:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tD0Xf-00009K-9Z; Mon, 18 Nov 2024 13:07:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tD0Xb-001OQe-2s;
	Mon, 18 Nov 2024 13:07:39 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tD0Xb-0007J9-2a;
	Mon, 18 Nov 2024 13:07:39 +0100
Message-ID: <12ee035ae0ac88976a6521ee765c35c626494440.camel@pengutronix.de>
Subject: Re: [PATCH v4 3/6] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>,  Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org
Date: Mon, 18 Nov 2024 13:07:39 +0100
In-Reply-To: <ZzspgzXCyds04gTY@lore-desk>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
	 <20241118-pcie-en7581-fixes-v4-3-24bb61703ad7@kernel.org>
	 <2d7e1e5e09babb468199ac44520683fcb87d697c.camel@pengutronix.de>
	 <ZzsC_hW-w6WSMYSO@lore-desk>
	 <1fb3166c1f520a57c19bd3103b4585eee1e57fec.camel@pengutronix.de>
	 <ZzspgzXCyds04gTY@lore-desk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_040759_754739_B21F312D 
X-CRM114-Status: GOOD (  31.09  )
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

On Mo, 2024-11-18 at 12:48 +0100, Lorenzo Bianconi wrote:
> > On Mo, 2024-11-18 at 10:03 +0100, Lorenzo Bianconi wrote:
> > > On Nov 18, Philipp Zabel wrote:
> > > > On Mo, 2024-11-18 at 09:04 +0100, Lorenzo Bianconi wrote:
> > > > > In order to make the code more readable, the
> > > > > reset_control_bulk_assert()
> > > > > for PHY reset lines is moved to make it pair with
> > > > > reset_control_bulk_deassert() in mtk_pcie_power_up() and
> > > > > mtk_pcie_en7581_power_up(). The same change is done for
> > > > > reset_control_assert() used to assert MAC reset line.
> > > > >=20
> > > > > Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> > > > > complete PCIe reset on MediaTek controller.
> > > > >=20
> > > > > Reviewed-by: AngeloGioacchino Del Regno
> > > > > <angelogioacchino.delregno@collabora.com>
> > > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > > ---
> > > > > =C2=A0drivers/pci/controller/pcie-mediatek-gen3.c | 27
> > > > > +++++++++++++++++++--------
> > > > > =C2=A01 file changed, 19 insertions(+), 8 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > > index
> > > > > 3cfcb45d31508142d28d338ff213f70de9b4e608..2b80edd4462ad4e9f2a
> > > > > 5d192db7f99307113eb8a 100644
> > > > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > > @@ -125,6 +125,8 @@
> > > > > =C2=A0
> > > > > =C2=A0#define MAX_NUM_PHY_RESETS		3
> > > > > =C2=A0
> > > > > +#define PCIE_MTK_RESET_TIME_US		10
> > > > > +
> > > > > =C2=A0/* Time in ms needed to complete PCIe reset on EN7581 SoC *=
/
> > > > > =C2=A0#define PCIE_EN7581_RESET_TIME_MS	100
> > > > > =C2=A0
> > > > > @@ -912,6 +914,14 @@ static int
> > > > > mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> > > > > =C2=A0	int err;
> > > > > =C2=A0	u32 val;
> > > > > =C2=A0
> > > > > +	/*
> > > > > +	 * The controller may have been left out of reset by
> > > > > the bootloader
> > > > > +	 * so make sure that we get a clean start by
> > > > > asserting resets here.
> > > > > +	 */
> > > > > +	reset_control_bulk_assert(pcie->soc-
> > > > > >phy_resets.num_resets,
> > > > > +				  pcie->phy_resets);
> > > > > +	reset_control_assert(pcie->mac_reset);
> > > > > +
> > > > > =C2=A0	/*
> > > > > =C2=A0	 * Wait for the time needed to complete the bulk
> > > > > assert in
> > > > > =C2=A0	 * mtk_pcie_setup for EN7581 SoC.
> > > >=20
> > > > This comment is not correct anymore.
> > >=20
> > > I agree naming is hard, but I guess we can assume with 'bulk' we
> > > refer to both
> > > phy and mac reset (similar to what we have in
> > > mtk_pcie_power_up()),
> > > what do you think?
> >=20
> > My point is that the referenced (bulk) assert isn't in
> > mtk_pcie_setup()
> > anymore - it was just moved right above this comment.
>=20
> ok, thx. I got what you mean now, I will fix it.
>=20
> >=20
> > I wonder why that delay is required at all, though. Does the reset
> > controller driver return from reset_control_ops::assert before the
> > reset line to the PCI controller is asserted?
>=20
> We discussed it in a previous revision and Bjorn requested to have
> the required delaies=20
> in the PCIe driver.
>=20
> https://patchwork.kernel.org/project/linux-pci/patch/aca00bd672ee576ad96d=
279414fc0835ff31f637.1720022580.git.lorenzo@kernel.org/#26110282

Ok, thank you.

regards
Philipp

