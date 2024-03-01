Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D906C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 09:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDfr0yp6C7xDyyNdToZD3gwq3T9ELQ+xwGdPREZ00cI=; b=oXAW49QY37gCGxrG7zt7BJVRbF
	x2Tesdn1zgAS26N9QA7FTEzwKL8B3xgWtX0GXuyB39wTsHxfF3YkUfD+CNIlsTXOmfaXYK760afNB
	UDs8ISi3H/YmSs1CJTseOw/OaP3kNr2oibTh3P5csbq7RPA9Nu9ImjwAeTthXqyF0r3ei/L/ydTKP
	GdrRSDRCa9gxuXoJqoczCkqpNEmjPHcxzxeZ64YDS08u2l09I0lPiZs+/x6fb7s64nt+q66lliMdm
	2owz0yF/p28VHyjXNtaED+HXRpqNG1L7fCwD5adZVixfUxZBvpp6zseJwk1HHjxM9uftfgJPhnd9y
	gl+SnUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzcO-0000000HGHp-073o;
	Fri, 01 Mar 2024 09:55:52 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzcL-0000000HGGw-01EA;
	Fri, 01 Mar 2024 09:55:50 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4219tPbo107280;
	Fri, 1 Mar 2024 03:55:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709286925;
	bh=vDfr0yp6C7xDyyNdToZD3gwq3T9ELQ+xwGdPREZ00cI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xrGghXaBtr4kZR8rMV6MgYmVuHmN8laIPpUPrIMjve/sWCx81rBH5N+YejowBj9jm
	 DKbiwOaExltjW7e/GsZb9g7IyAcZTlBGGCRekCYzmnr99kmNibTC0mEMaKbCP5f5to
	 BXd62pdCoIX0i4N8uUR0WAcNwR8cnBRG9KOjIkoM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4219tPHt027170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Mar 2024 03:55:25 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Mar 2024 03:55:25 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Mar 2024 03:55:25 -0600
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4219tOE6119278;
	Fri, 1 Mar 2024 03:55:25 -0600
Date: Fri, 1 Mar 2024 15:25:24 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <linux-pci@vger.kernel.org>,
        <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
        <lpieralisi@kernel.org>, <kw@linux.com>, <robh@kernel.org>,
        <bhelgaas@google.com>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@collabora.com>, <wenst@chromium.org>,
        <nfraprado@collabora.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Assert MAC reset only if PHY
 reset also present
Message-ID: <9920b298-4627-4323-b367-13ee94a83869@ti.com>
References: <20240229092449.580971-1-angelogioacchino.delregno@collabora.com>
 <a55428b8-27b3-42f7-8154-ccc7dde469df@ti.com>
 <2b2effdd-0b9d-40fd-a88d-ab364f2b0668@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2b2effdd-0b9d-40fd-a88d-ab364f2b0668@collabora.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_015549_278708_72FF75BD 
X-CRM114-Status: GOOD (  30.74  )
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

On Fri, Mar 01, 2024 at 10:06:33AM +0100, AngeloGioacchino Del Regno wrote:
> Il 01/03/24 07:42, Siddharth Vadapalli ha scritto:
> > On Thu, Feb 29, 2024 at 10:24:49AM +0100, AngeloGioacchino Del Regno wrote:
> > > Some SoCs have two PCI-Express controllers: in the case of MT8195,
> > > one of them is using a dedicated PHY, but the other uses a combo PHY
> > > that is shared with USB and in that case the PHY cannot be reset
> > > from the PCIe driver, or USB functionality will be unable to resume.
> > > 
> > > Resetting the PCIe MAC without also resetting the PHY will result in
> > > a full system lockup at PCIe resume time and the only option to
> > > resume operation is to hard reboot the system (with a PMIC cut-off).
> > > 
> > > To resolve this issue, check if we've got both a PHY and a MAC reset
> > > and, if not, never assert resets at PM suspend time: in that case,
> > > the link is still getting powered down as both the clocks and the
> > > power domains will go down anyway.
> > > 
> > > Fixes: d537dc125f07 ("PCI: mediatek-gen3: Add system PM support")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > > 
> > > Changes in v2:
> > >   - Rebased over next-20240229
> > > 
> > >   drivers/pci/controller/pcie-mediatek-gen3.c | 25 ++++++++++++++-------
> > >   1 file changed, 17 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > index 975b3024fb08..99b5d7a49be1 100644
> > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > @@ -874,17 +874,26 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
> > >   	return err;
> > >   }
> > > -static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
> > > +static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie, bool is_suspend)
> > >   {
> > > +	bool suspend_reset_supported = pcie->mac_reset && pcie->phy_reset;
> > > +
> > >   	clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
> > >   	pm_runtime_put_sync(pcie->dev);
> > >   	pm_runtime_disable(pcie->dev);
> > > -	reset_control_assert(pcie->mac_reset);
> > > +
> > > +	/*
> > > +	 * Assert MAC reset only if we also got a PHY reset, otherwise
> > > +	 * the system will lockup at PM resume time.
> > > +	 */
> > > +	if (is_suspend && suspend_reset_supported)
> > > +		reset_control_assert(pcie->mac_reset);
> > >   	phy_power_off(pcie->phy);
> > >   	phy_exit(pcie->phy);
> > 
> > Wouldn't this power off the shared PHY? Or will the PHY driver make this
> > NO-OP if the PHY is shared, in which case the above two statements could
> > be combined with the other statements in the:
> > if (is_suspend && suspend_reset_supported)
> > condition to get a single block of code that also combines the
> > reset_control_assert(pcie->phy_reset)
> > present below.
> > 
> 
> No, that'd be fine:
> 
> static int mtk_phy_power_off(struct phy *phy)
> {
> 	struct mtk_phy_instance *instance = phy_get_drvdata(phy);
> 	struct mtk_tphy *tphy = dev_get_drvdata(phy->dev.parent);
> 
> 	if (instance->type == PHY_TYPE_USB2)
> 		u2_phy_instance_power_off(tphy, instance);
> 	else if (instance->type == PHY_TYPE_PCIE)
> 		pcie_phy_instance_power_off(tphy, instance);
> 
> 	return 0;
> }
> 
> ...it's two different PHY instances that we're dealing with, here :-)

I didn't realize that it is handled separately. Thank you for clarifying!

Regards,
Siddharth.

