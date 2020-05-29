Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D781C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 03:06:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 109A5206C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 03:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZnSZ2GMR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tfLXq4IV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 109A5206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AXfWBzFzga/gZYfbiobc+tvn9sckY4+dlE3xtNKXCY=; b=ZnSZ2GMRSAnqCV
	VOBDrEJZTf+rNJ0E/0DfIkdaKmxdbvOZqOacXxHX2OCXJz7q6gNK7n0WW2PtETquW162aRNxw3+5l
	V8ovuLTn3I3LpoBrWqQwdQoHleenZqF5Vfciit2lkyzbxeYYejsJHhKZl3eWfP6CeD8KXBX2rSFhH
	/u3p8lRC1xSovEq3RkDHki/N+ZNK0aKMN+0byF0JXLdvCo0R/UBBbCmCsqjRmcLCk0PHKop8cQEnZ
	IDqAhvmu61oMAltY7p01YqS6dXwB74df6av/ohQgfePHU6gD710I/CjqSvpNGevXiTksEIfUJIaRO
	AeJ+pjq+AJzT8L2eHYAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeVLa-0005zj-Lq; Fri, 29 May 2020 03:06:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeVLR-0005tD-LL; Fri, 29 May 2020 03:06:07 +0000
X-UUID: b83c381d01c943a187c3c8655e72d7d3-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2DSr7ykOqmhgi2+WieyVzdmY00Ec4k69EeBwPT4JtEE=; 
 b=tfLXq4IV/3yMKhXLcFLsUIHaTF17jMU6W6B+2m+z4rfmf4qzysh22b4OXgVvY+yRXIX/6mDPw6G7B2zgtT1wLzXhS1c8bNHtY/VJSSqp6V0rk7GjoY3sdS7AqThypoxdDVRuE2RS/JSG5myFwIT2b1VXk79AbouEQLf/5DD19No=;
X-UUID: b83c381d01c943a187c3c8655e72d7d3-20200528
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 606231795; Thu, 28 May 2020 19:06:08 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 20:05:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 11:05:54 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 May 2020 11:05:58 +0800
Message-ID: <1590721559.23866.0.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/4] Spilt PCIe node to comply with hardware design
From: Ryder Lee <ryder.lee@mediatek.com>
To: <chuanjia.liu@mediatek.com>
Date: Fri, 29 May 2020 11:05:59 +0800
In-Reply-To: <20200528061648.32078-1-chuanjia.liu@mediatek.com>
References: <20200528061648.32078-1-chuanjia.liu@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_200605_707689_5C83419F 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com,
 srv_heupstream@mediatek.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com, bhelgaas@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 amurray@thegoodpenguin.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-05-28 at 14:16 +0800, chuanjia.liu@mediatek.com wrote:
> There are two independent PCIe controllers in MT2712/MT7622 platform,
> and each of them should contain an independent MSI domain.
> 
> In current architecture, MSI domain will be inherited from the root
> bridge, and all of the devices will share the same MSI domain.
> Hence that, the PCIe devices will not work properly if the irq number
> which required is more than 32.
> 
> Split the PCIe node for MT2712/MT7622 platform to fix MSI issue and
> comply with the hardware design.
> 
> change note:
> v2: change the allocation of mt2712 PCIe MMIO space due to the allcation
> size is not right in v1.
> 
> chuanjia.liu (4):
>   dt-bindings: PCI: Mediatek: Update PCIe binding
>   PCI: mediatek: Use regmap to get shared pcie-cfg base
>   arm64: dts: mediatek: Split PCIe node for MT2712/MT7622
>   ARM: dts: mediatek: Update mt7629 PCIe node
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
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> 
> --
> 2.18.0
> 
> 
For the series:
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
