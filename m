Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E061EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iAZ2uKafLh7vncr8neGoEbZEaYHmA4lUx1CEYvDHGQQ=; b=OAjxhaf0irnJla
	fobUoYasw6m5TbIoH/Sks+i2iewacviosT1JmACV1A8lANlM+QRTQULvVHZYrCnG/CHgYxVS6GtzO
	C30wn2acUE9x8L6IiXMPxEJLpWbWAQomUKroHV6KvtyhRQfmFOITJ9fXdFhnwxIwk/PzxkYz9NTV2
	dhmvQPqwq++QNIjUfmS0R3h2p+3o0wB8eS8WK0kXdu8XBznRzPXkF9DIhSQqjuJhsfo91mUG50PZQ
	MJG15w8nimXRWlJ73dSv+RDFX6GYYYZYkvfXZV/Cj5krmDwgrWSyoua9piuHZtyOkCFVvp5d6IyFX
	gUXctDxUbZ3Ri6uB9HwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no705-00FY7c-07; Mon, 09 May 2022 17:16:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no6zt-00FY4d-P8; Mon, 09 May 2022 17:16:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5847DB8115E;
 Mon,  9 May 2022 17:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E4DC385B1;
 Mon,  9 May 2022 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652116594;
 bh=VSzgCF1Rw8sMVNfysp7EwT6li5M6fLIKaI2QYnijb/0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=FSTsxsO1k3B5Qc/U+PoXFX+u19YKgFPoHZ0L6LSA5MOtkoPk3Xz548eE1KSBwA/Z+
 MHmjBMYSfqEvDlhzasgnCqpvFxHmd9G+HtPxg/5G+XjW0RF7Cl/GeHZDYmaIZ3Nnmw
 9hO0u7YtUlQFC+8kzyYKRmZUpZF62W4BgIfTlJgJnpbZo825OLTQUfKrBVIfOtmYP+
 me741ygsBkakT00RU6qw02wJTcm6RA6QQelt5YUgt+2NSdWwmkqkwCV1tO/PvtqRqD
 duKQVM/LRdAuRCSsnRlm2IyRUP2rfUb+OJYmSB4OHGnjY1qj0zxDPTnkSWFruEf85t
 2NxGAzNjfwQgg==
Date: Mon, 9 May 2022 12:16:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
Subject: Re: [PATCH] PCI: mediatek-gen3: Assert resets to ensure expected
 init state
Message-ID: <20220509171631.GA605998@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9839acf-e334-d73d-a0b3-57d951fb8796@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_101638_000654_A4722E42 
X-CRM114-Status: GOOD (  24.45  )
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

On Mon, May 09, 2022 at 02:18:34PM +0200, AngeloGioacchino Del Regno wrote:
> Il 04/04/22 16:48, AngeloGioacchino Del Regno ha scritto:
> > The controller may have been left out of reset by the bootloader,
> > in which case, before the powerup sequence, the controller will be
> > found preconfigured with values that were set before booting the
> > kernel: this produces a controller failure, with the result of
> > a failure during the mtk_pcie_startup_port() sequence as the PCIe
> > link never gets up.
> > 
> > To ensure that we get a clean start in an expected state, assert
> > both the PHY and MAC resets before executing the controller
> > power-up sequence.
> > 
> > Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Friendly ping for an important fix :-)

d3bf75b579b9 appeared in v5.13-rc1 (May 2021, a year ago), so I assume
this is important for v5.19, but not urgent enough to require being in
v5.18.  Right?

> > ---
> >   drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index f7048ea4c020..dccdfce12b1c 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -838,6 +838,14 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
> >   	if (err)
> >   		return err;
> > +	/*
> > +	 * The controller may have been left out of reset by the bootloader
> > +	 * so make sure that we get a clean start by asserting resets here.
> > +	 */
> > +	reset_control_assert(pcie->phy_reset);
> > +	reset_control_assert(pcie->mac_reset);
> > +	usleep_range(10, 20);
> > +
> >   	/* Don't touch the hardware registers before power up */
> >   	err = mtk_pcie_power_up(pcie);
> >   	if (err)
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
