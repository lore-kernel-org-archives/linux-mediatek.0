Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD941C2BC11
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 10:20:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B49F20771
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 10:20:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eI/37GAq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FScmXuDb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B49F20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tujBeRul7y0Fbahhk2DL0RU+1NrDtDQVC8BgOj8oyjE=; b=eI/37GAqJOaUnbXnJO0TeQs+Y
	odhvj2Iymkz/1fgIn6OaahqiS0xPm37f7jNM3Z4FEchyvcg7dk8ZnevXj5KTRlnKGoL4TW8zLi7m+
	MeRtNnJXzozLLFJ0sjJKIXS14591E0A98XpZkS/BhVK0bb7FhtYSim368o2JouNl3pL6NvzCjL9dP
	13ce3ZmfK305Q/P4bKve0/1srCiVMRb15Rw2V3DguTBRgZS0sYUL+XPYiZNTqb8RHV1RnpJMCKKey
	hjxg0PKfoIBMg8d30XNuLdy48b0cOrSd4GShYG0HACWpKZC/UQ7PKRPIsK13fU+Ref6Nq0rEWZEAe
	ZFVaA8PJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHlaT-0005hT-Lb; Mon, 14 Sep 2020 10:19:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHlaR-0005gR-9q; Mon, 14 Sep 2020 10:19:52 +0000
X-UUID: 1daae04307f14b948d65709033bbe828-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UFFhIqTpIhOC8ywBiZxNU/Fzmn0uEHIkBJSLINsLE0Q=; 
 b=FScmXuDbVALdHyYP9WfqZFQx8KVyk5Iu8aIKVexmokooEG+ltCHNeKASUGS04jCjFUuopg4fHds1JO0VKfZ9CS5ROpyIirl99n+9uDLeZhXOVI3WxbiYJ5zNuhiR51+Tv9OUjd/A5T2k97OfSdmoai99UzTovgJCOCZ0SPY40Ac=;
X-UUID: 1daae04307f14b948d65709033bbe828-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 156049586; Mon, 14 Sep 2020 02:19:39 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 03:19:37 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Sep 2020 18:19:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 18:19:24 +0800
Message-ID: <1600078643.2521.25.camel@mhfsdcap03>
Subject: Re: [v2,2/3] PCI: mediatek: Add new generation controller support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 14 Sep 2020 18:17:23 +0800
In-Reply-To: <1ac4ba40a031169b968e3084c132579db921033c.camel@pengutronix.de>
References: <20200910034536.30860-1-jianjun.wang@mediatek.com>
 <20200910034536.30860-3-jianjun.wang@mediatek.com>
 <1ac4ba40a031169b968e3084c132579db921033c.camel@pengutronix.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 89BC645EE2B99813BCD4031077703FE9AC259110623EE3A7D12DBB813A2C08D72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_061951_492065_13A70B02 
X-CRM114-Status: GOOD (  24.79  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-11 at 16:33 +0200, Philipp Zabel wrote:
> Hi Jianjun,
> 
> On Thu, 2020-09-10 at 11:45 +0800, Jianjun Wang wrote:
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
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 1076 +++++++++++++++++++
> >  3 files changed, 1091 insertions(+)
> >  create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c
> > 
> [...]
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > new file mode 100644
> > index 000000000000..f8c8bdf88d33
> > --- /dev/null
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> [...]
> > +static int mtk_pcie_power_up(struct mtk_pcie_port *port)
> > +{
> > +	struct device *dev = port->dev;
> > +	int err;
> > +
> > +	port->phy_reset = devm_reset_control_get_optional(dev, "phy-rst");
> 
> Please use devm_reset_control_get_optional_exclusive() instead.
> 
> > +	if (PTR_ERR(port->phy_reset) == -EPROBE_DEFER)
> > +		return PTR_ERR(port->phy_reset);
> 
> This should be
> 
> 	if (IS_ERR(port->phy_reset))
> 		return PTR_ERR(port->phy_reset);
> 
> there is no reason to continue if this throws -ENOMEM, for example.
> 
> regards
> Philipp

Thanks for your review, I will fix it in the next version.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
