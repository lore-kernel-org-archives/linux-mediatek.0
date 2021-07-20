Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEB1C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 02:18:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C3E61107
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 02:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C3E61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6eqyZq+1o2cz8GM3Uc6i6fbNQD2rUFFdHbdcdm+5CM=; b=NSQw1U8u70OuAy
	mseUp6NNJTPZocaYh4VB8i6yiKyJDZibO7XfrJ52CnKFfWBq0EMg0gaJU2LXSmvrn/GvMEUiOwIjq
	5BX4puS0kyJqoeV+vO630Wd/IW6/kcaEAgDB+PeVwYOfAfsO1nM799ohXUJxWqCaJSNM8kEircsMV
	PimGzHWI88LcfjtMsnlLBC+QlhDYplkX9UCwGT5ETASFl6zGUn7Kz+Vbb1ys/20XagpqzwKZVEC3Y
	AlWnUv+1RJTJABepvi7TVzW+vU7S/GVGmUqaC39K4YixShFUHpiH3JKxNsY7yVF2BkfgMeZ5fMVyD
	0SFs6/tPYqo1+ZWkYksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5fKM-00Bhad-Rx; Tue, 20 Jul 2021 02:17:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5fK8-00BhZS-VK; Tue, 20 Jul 2021 02:17:35 +0000
X-UUID: 1c3c69a0b5584c52838f58f04f49690a-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ttqP5SP7Nx2GRTcelHSglyFAHET3dzB0AdI8DouZgsc=; 
 b=azURQ8psTBxX5dAqnrmtcCh0YJGlpJ0PweS3R6SxkwoHH+G8GILROLOK+Wn1d9bFY8z59IDCvJBs3A1SUH9IAQl+BGOaURM7/5PbLLZketKy011L0on43Ghi8tmu3fKtCGXwgvLe85j0C3Qxy825Z4Ooyairm94ctNMzKhBKafE=;
X-UUID: 1c3c69a0b5584c52838f58f04f49690a-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 105122390; Mon, 19 Jul 2021 19:17:28 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 19:07:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 10:07:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Jul 2021 10:07:24 +0800
Message-ID: <1626746843.2466.10.camel@mhfsdcap03>
Subject: Re: [PATCH v11 1/4] dt-bindings: PCI: mediatek: Update the Device
 tree bindings
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas
 <bhelgaas@google.com>
CC: <linux-kernel@vger.kernel.org>, <jianjun.wang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <ryder.lee@mediatek.com>, <linux-pci@vger.kernel.org>, Frank Wunderlich
 <frank-w@public-files.de>, <devicetree@vger.kernel.org>,
 <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Jul 2021 10:07:23 +0800
In-Reply-To: <20210719224718.GA2766057@robh.at.kernel.org>
References: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
 <20210719073456.28666-2-chuanjia.liu@mediatek.com>
 <20210719224718.GA2766057@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_191733_341498_E6A30C86 
X-CRM114-Status: GOOD (  20.79  )
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

On Mon, 2021-07-19 at 16:47 -0600, Rob Herring wrote:
> On Mon, 19 Jul 2021 15:34:53 +0800, Chuanjia Liu wrote:
> > There are two independent PCIe controllers in MT2712 and MT7622
> > platform. Each of them should contain an independent MSI domain.
> > 
> > In old dts architecture, MSI domain will be inherited from the root
> > bridge, and all of the devices will share the same MSI domain.
> > Hence that, the PCIe devices will not work properly if the irq number
> > which required is more than 32.
> > 
> > Split the PCIe node for MT2712 and MT7622 platform to comply with
> > the hardware design and fix MSI issue.
> > 
> > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++
> >  .../devicetree/bindings/pci/mediatek-pcie.txt | 206 ++++++++++--------
> >  2 files changed, 150 insertions(+), 95 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 
Hi,Rob
I have described in the cover letter:
v11:Rebase for 5.14-rc1 and add "interrupt-names", "linux,pci-domain" 
    description in binding file. No code change.
if you still ok for this, I will add R-b in next version.

Best regards
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
