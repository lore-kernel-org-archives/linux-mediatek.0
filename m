Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00186C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 07:47:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C79042070A
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 07:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3hD2eCR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JqFr5vP+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C79042070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=awDkYG7CP9TEDmDISx7du8iquuQCENUZ9l9V9kI1l8o=; b=X3hD2eCRic22NYpbUltrTMxcp
	SeTFXDE00dPkXptbpsQs54ExEWoBNGepK1XUbcJ0aipaFetAKOAJSuY5ecoHnhvfDVpr41Gw7SEA5
	KDOmPPPRfVO/dRhrvvXqU3s7ePVl7dXr8CZOQAl/9v2MuvTyC5E4zMcMWaxLlan/Z8qttnm8qhl4H
	RXrmjEP6p1yXVg+z7+nUnxCz8704F4N6E9nQiW8gmv1MdGNQHm+LaDNc1K8CJCaptxWA503b2Tcqy
	f44wuWzWyrcv8iLkfAUjsQB55oyRqa2wPZvxkUUGSfTtf2kyIfphvmKDNs41o0tul5gV1Cu8tHyRI
	zwYhQwcxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2VBU-0003NG-9Z; Mon, 03 Aug 2020 07:47:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2VBS-0003MT-9j; Mon, 03 Aug 2020 07:46:59 +0000
X-UUID: 6a96fe302e3c47bbb13691dfbdf860ca-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+eS6fkHPCzh1BpGY8IKPY4oZzmVKv5Jj0Oov80tMj8A=; 
 b=JqFr5vP+z8LsunxNDEGLdY4KezuMvR/RxJivwyS/ZoisaaAznmI7swwykZlj9ftf3a2YvyTRle4W0GXZtxxNbMVBwEdW0jXDYfFg79CNTvrcKj/YcF5RMPzGfQ3nqhhSjJxtNBfVVtuMdGHhMoqF2HHDhq79LW9h6JMUrJqmQ/Q=;
X-UUID: 6a96fe302e3c47bbb13691dfbdf860ca-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1269814663; Sun, 02 Aug 2020 23:46:47 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 00:46:49 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 3 Aug 2020 15:46:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 15:46:45 +0800
Message-ID: <1596440772.7361.35.camel@mhfsdcap03>
Subject: Re: [PATCH v4 0/4] Split PCIe node to comply with hardware design
From: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Mon, 3 Aug 2020 15:46:12 +0800
In-Reply-To: <20200721074915.14516-1-Chuanjia.Liu@mediatek.com>
References: <20200721074915.14516-1-Chuanjia.Liu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A4DEB32D28646CC8FDB1C8300E17EFCD6B509D8446129EEA2C19BE289C9AAB672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_034658_532163_3337D9D2 
X-CRM114-Status: GOOD (  19.47  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 jianjun.wang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-21 at 15:49 +0800, chuanjia.liu wrote:
> There are two independent PCIe controllers in MT2712 and MT7622
> platform, and each of them should contain an independent MSI
> domain.
> 
> In current architecture, MSI domain will be inherited from the
> root bridge, and all of the devices will share the same MSI domain.
> Hence that, the PCIe devices will not work properly if the irq
> number which required is more than 32.
> 
> Split the PCIe node for MT2712 and MT7622 platform to fix MSI
> issue and comply with the hardware design.


Hi Lorenzo,

       gentle ping for this patchset.


       BTW. I don't see it in [1],but is ok in [2], I don't know why.

[1]https://lore.kernel.org/linux-pci/
[2]https://lore.kernel.org/linux-arm-kernel/20200721074915.14516-1-Chuanjia.Liu@mediatek.com/

Best Regards,
Chuanjia

> 
> change note:
>   v4:change commit message due to bayes statistical bogofilter
>      considers this series patch SPAM.
>   v3:rebase for 5.8-rc1. Only collect ack of Ryder, No code change.
>   v2:change the allocation of MT2712 PCIe MMIO space due to the
>      allocation size is not right in v1.
> 
> chuanjia.liu (4):
>   dt-bindings: pci: mediatek: Modified the Device tree bindings
>   PCI: mediatek: Use regmap to get shared pcie-cfg base
>   arm64: dts: mediatek: Split PCIe node for MT2712 and MT7622
>   ARM: dts: mediatek: Modified MT7629 PCIe node
> 
>  .../bindings/pci/mediatek-pcie-cfg.yaml       |  38 +++++
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 144 +++++++++++-------
>  arch/arm/boot/dts/mt7629-rfb.dts              |   3 +-
>  arch/arm/boot/dts/mt7629.dtsi                 |  23 +--
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  75 +++++----
>  .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  16 +-
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   6 +-
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  68 ++++++---
>  drivers/pci/controller/pcie-mediatek.c        |  25 ++-
>  9 files changed, 258 insertions(+), 140 deletions(-)
>  create mode 100644 .../bindings/pci/mediatek-pcie-cfg.yaml
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
