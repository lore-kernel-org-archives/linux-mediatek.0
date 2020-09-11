Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD7AC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 14:33:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3112222B9
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 14:33:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KMYejEB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3112222B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7rg8xGUw9LtB84tMqnpF4gXeKWTzBQXOwRX0Q0Hcs8c=; b=KMYejEB4ftaqku9Rlt1FYCBbR
	80aWRAfTs+K94Io6Gn0AusQnHIf1UlSktJHkzT3aSAvUalBBRKWOME60xuCjHCLhCegtWQRSUAfKB
	JY78MKiSg2B0pmoGjyvIk7N2uhf2WwXHseLDeVxLqzgwNIpDb60dEitmM6r6n6ANXNs/icBJsxWvt
	8UR4f47NwFbXPpqkRf7ibsh7aZXkFrLvRXktB5EQFez8jPI0DlDxhu8V1yWKId7V/QTnFzS8XDx48
	vQnRR/kJi6RDWxpYzKoAXAl6yQQZOb7uAHULn0zBYNCUgTm8QvI2HS7o/xu7cgqYtF2ojL2bjqmSK
	3F264vp5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGk7P-0002wE-Ab; Fri, 11 Sep 2020 14:33:39 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGk7N-0002un-Kp
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 14:33:38 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGk7E-0004h8-OX; Fri, 11 Sep 2020 16:33:28 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGk77-0003hr-RU; Fri, 11 Sep 2020 16:33:21 +0200
Message-ID: <1ac4ba40a031169b968e3084c132579db921033c.camel@pengutronix.de>
Subject: Re: [v2,2/3] PCI: mediatek: Add new generation controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Ryder Lee <ryder.lee@mediatek.com>
Date: Fri, 11 Sep 2020 16:33:21 +0200
In-Reply-To: <20200910034536.30860-3-jianjun.wang@mediatek.com>
References: <20200910034536.30860-1-jianjun.wang@mediatek.com>
 <20200910034536.30860-3-jianjun.wang@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_103337_685970_64DF6202 
X-CRM114-Status: GOOD (  16.97  )
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
Cc: devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sj Huang <sj.huang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jianjun,

On Thu, 2020-09-10 at 11:45 +0800, Jianjun Wang wrote:
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
>  drivers/pci/controller/pcie-mediatek-gen3.c | 1076 +++++++++++++++++++
>  3 files changed, 1091 insertions(+)
>  create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c
> 
[...]
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> new file mode 100644
> index 000000000000..f8c8bdf88d33
> --- /dev/null
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
[...]
> +static int mtk_pcie_power_up(struct mtk_pcie_port *port)
> +{
> +	struct device *dev = port->dev;
> +	int err;
> +
> +	port->phy_reset = devm_reset_control_get_optional(dev, "phy-rst");

Please use devm_reset_control_get_optional_exclusive() instead.

> +	if (PTR_ERR(port->phy_reset) == -EPROBE_DEFER)
> +		return PTR_ERR(port->phy_reset);

This should be

	if (IS_ERR(port->phy_reset))
		return PTR_ERR(port->phy_reset);

there is no reason to continue if this throws -ENOMEM, for example.

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
