Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5F0C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 05:59:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCCD422277
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 05:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hTdHs6L5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cuzDLsLk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCCD422277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q/RBbe1e0APQ6Zc83MnY++GDnCK9iPbADPhyd9DxC00=; b=hTdHs6L5ZdiY9cBodab7aaUdf
	nTQYjR7uIjyQ0bKA6iLbp4lOFlBOXGaCu4TTdFdCmwBgZXzf4evuh5a/X2UXE6aJyDyo+Fe646wY2
	cit6l72YSBKYbfPwBOG0Rf/3zimqiSj8oszQNIu8kaGjUoUSBC5W8sy+z5tt+22RqLxCNM40VtOJR
	n549C/xzupX+csyM6cpp+AGXpF6ErdbQhHg8+0dgdwn4kDBgVQMFiLz9FULdwgf+/NLwS00JrWvUj
	knzAzI9rSo9iCln6vzNYGjcizDSlk3qq6cLUyb04cziwbrBzk0CTXCyHiYbjHWT2d59O1lHWwlggd
	3L8A94N+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZpLk-0002CB-7L; Tue, 03 Nov 2020 05:59:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZpLi-0002BF-2D; Tue, 03 Nov 2020 05:59:19 +0000
X-UUID: 340d801641ef4064a99f2d72e4980849-20201102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=z9k3swHPOBws0A9zWk40FtkS7hwYp0UsWwC4lqhKB/E=; 
 b=cuzDLsLkMj32LUTruhLS3GF+ZVsgKlsGn+iz4ZWmaut+0mEYCqnakFLTgOQ7ddHrU3E+29P0vASH2reWmOnZMfWEoz8IeQxYqOQWvix1bYbrjqcoc2u5GVYAkvJdFD9znr/Te/V+DiKaRIgC5XjaZ89kXZaDa+eFlTscL3RWCfY=;
X-UUID: 340d801641ef4064a99f2d72e4980849-20201102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2000574196; Mon, 02 Nov 2020 21:53:00 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 21:44:13 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 3 Nov 2020 13:44:03 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 13:44:02 +0800
Message-ID: <1604382242.2521.62.camel@mhfsdcap03>
Subject: Re: [v3,2/3] PCI: mediatek: Add new generation controller support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 3 Nov 2020 13:44:02 +0800
In-Reply-To: <aaccd827fa6de117d27319884f2d70a2ea91aa5e.camel@pengutronix.de>
References: <20200927074555.4155-1-jianjun.wang@mediatek.com>
 <20200927074555.4155-3-jianjun.wang@mediatek.com>
 <aaccd827fa6de117d27319884f2d70a2ea91aa5e.camel@pengutronix.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9C6198D0BAC2FA8D8B8BDDFFBAC2EDB7EF6F48FF231ECF7E375D29328861266A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_005918_454993_3F806804 
X-CRM114-Status: GOOD (  30.92  )
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
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, sin_jieyang@mediatek.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-28 at 10:32 +0200, Philipp Zabel wrote:
> Hi Jianjun,
> 
> On Sun, 2020-09-27 at 15:45 +0800, Jianjun Wang wrote:
> > MediaTek's PCIe host controller has three generation HWs, the new
> > generation HW is an individual bridge, it supoorts Gen3 speed and
> > up to 256 MSI interrupt numbers for multi-function devices.
> > 
> > Add support for new Gen3 controller which can be found on MT8192.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  drivers/pci/controller/Kconfig              |   14 +
> >  drivers/pci/controller/Makefile             |    1 +
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 1024 +++++++++++++++++++
> >  3 files changed, 1039 insertions(+)
> >  create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c
> > 
> [...]
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > new file mode 100644
> > index 000000000000..ad69c789b24d
> > --- /dev/null
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -0,0 +1,1024 @@
> [...]
> > +static int mtk_pcie_power_up(struct mtk_pcie_port *port)
> > +{
> > +	struct device *dev = port->dev;
> > +	int err;
> > +
> > +	port->phy_reset = devm_reset_control_get_optional_exclusive(dev,
> > +								    "phy-rst");
> > +	if (IS_ERR(port->phy_reset))
> > +		return PTR_ERR(port->phy_reset);
> > +
> > +	reset_control_deassert(port->phy_reset);
> 
> In general, it is better to request all required resources before
> starting to activate the hardware.
> 
> > +
> > +	/* PHY power on and enable pipe clock */
> > +	port->phy = devm_phy_optional_get(dev, "pcie-phy");
> > +	if (IS_ERR(port->phy))
> > +		return PTR_ERR(port->phy);
> 
> For example, if the PHY driver is not loaded yet and this returns
> -EPROBE_DEFER, it was not useful to take the PHY out of reset above.
> Also, phy-rst is kept deasserted if this fails.
> 
> > +
> > +	err = phy_init(port->phy);
> > +	if (err) {
> > +		dev_notice(dev, "failed to initialize pcie phy\n");
> > +		return err;
> 
> phy-rst is kept deasserted if this fails.
> 
> > +	}
> > +
> > +	err = phy_power_on(port->phy);
> > +	if (err) {
> > +		dev_notice(dev, "failed to power on pcie phy\n");
> > +		goto err_phy_on;
> > +	}
> > +
> > +	port->mac_reset = devm_reset_control_get_optional_exclusive(dev,
> > +								    "mac-rst");
> > +	if (IS_ERR(port->mac_reset))
> > +		return PTR_ERR(port->mac_reset);
> 
> The PHY is not powered down if this fails.
> 
> > +
> > +	reset_control_deassert(port->mac_reset);
> > +
> > +	/* MAC power on and enable transaction layer clocks */
> > +	pm_runtime_enable(dev);
> > +	pm_runtime_get_sync(dev);
> > +
> > +	err = mtk_pcie_clk_init(port);
> > +	if (err) {
> > +		dev_notice(dev, "clock init failed\n");
> > +		goto err_clk_init;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_clk_init:
> > +	pm_runtime_put_sync(dev);
> > +	pm_runtime_disable(dev);
> > +	reset_control_assert(port->mac_reset);
> > +	phy_power_off(port->phy);
> > +err_phy_on:
> > +	phy_exit(port->phy);
> > +	reset_control_assert(port->phy_reset);
> > +
> > +	return -EBUSY;
> > +}
> > +
> > +static void mtk_pcie_power_down(struct mtk_pcie_port *port)
> > +{
> > +	phy_power_off(port->phy);
> > +	phy_exit(port->phy);
> > +
> > +	clk_bulk_disable_unprepare(port->num_clks, port->clks);
> 
> In the power-up sequence clocks are enabled last, but here they are not
> disabled before the PHY is powered off. Is this on purpose?
> 
> > +
> > +	pm_runtime_put_sync(port->dev);
> > +	pm_runtime_disable(port->dev);
> 
> In the power-up error path, PHY and controller resets are asserted
> again, but here they are kept deasserted. Should they be asserted here
> as well?
> 
> regards
> Philipp

Hi Philipp,

Sorry for the late responding and thanks for your review, I will fix it
in the next version.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
