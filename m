Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9291FC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 08:33:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7261206DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 08:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ScSwOxIl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7261206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qalf12frIVX362HgUQhDjKka0MFT8KyH86YlgiAe/3U=; b=ScSwOxIlqz+oTcsRai0HS8TzW
	6Ao597pxv6hpPiy0uFOd+AmbIMEkhwW7PbDivv+TrUaaD2O9XExA24qWP6iGLrssoc5W4+xx7KCx7
	e4w2gifb4smJUBGli0X1I2rasG60LZjPD5d42oo9VBUM/tIa7c5nQVtOuoeLiytEoxmY9EvHI82n4
	iwwETc8+X9cP40JiYZUwG+ykyngQnvcuKBDPuUPevEW9BrNzoNBovR34Hrqn1TfCY4P1fdosus7QF
	oKUlBXnup/BCkcQPKEhzJ7oGdWawcR7kiSQ4VxB+Oivpsz5NJCpx0CgGoq0FpHrI+xHczO0kMo/Zw
	9DNvfjgJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMoan-0004iy-KE; Mon, 28 Sep 2020 08:33:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMoai-0004bi-Fw
 for linux-mediatek@lists.infradead.org; Mon, 28 Sep 2020 08:33:01 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kMoaY-00083X-Mf; Mon, 28 Sep 2020 10:32:50 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kMoaQ-0004M0-Ts; Mon, 28 Sep 2020 10:32:42 +0200
Message-ID: <aaccd827fa6de117d27319884f2d70a2ea91aa5e.camel@pengutronix.de>
Subject: Re: [v3,2/3] PCI: mediatek: Add new generation controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Ryder Lee <ryder.lee@mediatek.com>
Date: Mon, 28 Sep 2020 10:32:42 +0200
In-Reply-To: <20200927074555.4155-3-jianjun.wang@mediatek.com>
References: <20200927074555.4155-1-jianjun.wang@mediatek.com>
 <20200927074555.4155-3-jianjun.wang@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_043300_619453_9839016B 
X-CRM114-Status: GOOD (  24.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com,
 Sj Huang <sj.huang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jianjun,

On Sun, 2020-09-27 at 15:45 +0800, Jianjun Wang wrote:
> MediaTek's PCIe host controller has three generation HWs, the new
> generation HW is an individual bridge, it supoorts Gen3 speed and
> up to 256 MSI interrupt numbers for multi-function devices.
> 
> Add support for new Gen3 controller which can be found on MT8192.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/pci/controller/Kconfig              |   14 +
>  drivers/pci/controller/Makefile             |    1 +
>  drivers/pci/controller/pcie-mediatek-gen3.c | 1024 +++++++++++++++++++
>  3 files changed, 1039 insertions(+)
>  create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c
> 
[...]
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> new file mode 100644
> index 000000000000..ad69c789b24d
> --- /dev/null
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -0,0 +1,1024 @@
[...]
> +static int mtk_pcie_power_up(struct mtk_pcie_port *port)
> +{
> +	struct device *dev = port->dev;
> +	int err;
> +
> +	port->phy_reset = devm_reset_control_get_optional_exclusive(dev,
> +								    "phy-rst");
> +	if (IS_ERR(port->phy_reset))
> +		return PTR_ERR(port->phy_reset);
> +
> +	reset_control_deassert(port->phy_reset);

In general, it is better to request all required resources before
starting to activate the hardware.

> +
> +	/* PHY power on and enable pipe clock */
> +	port->phy = devm_phy_optional_get(dev, "pcie-phy");
> +	if (IS_ERR(port->phy))
> +		return PTR_ERR(port->phy);

For example, if the PHY driver is not loaded yet and this returns
-EPROBE_DEFER, it was not useful to take the PHY out of reset above.
Also, phy-rst is kept deasserted if this fails.

> +
> +	err = phy_init(port->phy);
> +	if (err) {
> +		dev_notice(dev, "failed to initialize pcie phy\n");
> +		return err;

phy-rst is kept deasserted if this fails.

> +	}
> +
> +	err = phy_power_on(port->phy);
> +	if (err) {
> +		dev_notice(dev, "failed to power on pcie phy\n");
> +		goto err_phy_on;
> +	}
> +
> +	port->mac_reset = devm_reset_control_get_optional_exclusive(dev,
> +								    "mac-rst");
> +	if (IS_ERR(port->mac_reset))
> +		return PTR_ERR(port->mac_reset);

The PHY is not powered down if this fails.

> +
> +	reset_control_deassert(port->mac_reset);
> +
> +	/* MAC power on and enable transaction layer clocks */
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +
> +	err = mtk_pcie_clk_init(port);
> +	if (err) {
> +		dev_notice(dev, "clock init failed\n");
> +		goto err_clk_init;
> +	}
> +
> +	return 0;
> +
> +err_clk_init:
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +	reset_control_assert(port->mac_reset);
> +	phy_power_off(port->phy);
> +err_phy_on:
> +	phy_exit(port->phy);
> +	reset_control_assert(port->phy_reset);
> +
> +	return -EBUSY;
> +}
> +
> +static void mtk_pcie_power_down(struct mtk_pcie_port *port)
> +{
> +	phy_power_off(port->phy);
> +	phy_exit(port->phy);
> +
> +	clk_bulk_disable_unprepare(port->num_clks, port->clks);

In the power-up sequence clocks are enabled last, but here they are not
disabled before the PHY is powered off. Is this on purpose?

> +
> +	pm_runtime_put_sync(port->dev);
> +	pm_runtime_disable(port->dev);

In the power-up error path, PHY and controller resets are asserted
again, but here they are kept deasserted. Should they be asserted here
as well?

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
