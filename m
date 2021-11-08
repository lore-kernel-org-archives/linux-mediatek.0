Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 03:17:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDCAD60EDF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 03:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDCAD60EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwJbc9pUm7OM/mJob5dupuSoH9lV0ECl0wCUnVE9JEo=; b=0fsB+5DMUu4XlI
	sbuMGs7LhW5QrO3+4v6OWO+eDEc9TprBtzRh02yRaKmre500T+JoXbJdTGrVsIDzGaS18HDXIr/t9
	75GSPNB4JJWTmCxQnfgHWE7vFayChQryvXiRFPC9dRxA24lZe8AQCnUiv2nrYj84nea0p8W/XhUB1
	HcPj+x0m3jx1PjnQSoZPaAEizPZ+aaXZ8n7S0LME0uqLJFQ7lW1BgpY5pmp5mhYCduAgptB+o0HRU
	BhygZwA90RyVaOyHnHcfQUyh19iMRKJ8Ht3NDsRoogeGVdK5PWK/8VsTORuxyEH1y24Tc2qtrjA77
	uRe3XdVaAIs+gNyFdDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjv9s-00FMV6-I5; Mon, 08 Nov 2021 03:17:20 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjv9q-00FMTl-0u
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 03:17:19 +0000
X-UUID: 22fb5b1f6ffc48b0960ba8caf6dc00db-20211107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=84PdMly+vcryJAJZDzAQe575ojQCAqKQN4WPuKV+zz4=; 
 b=hvrfFZUbuyEu11x6aAPwv77vj01uqPEr+55P5ReHIpgTsLztYH4/6wYZxCP0sxH64E5psZ2KZPyHuhxMwmTuEW/KqcjyW57OmN3OLBEXAKQ0mNP+hsX4YV/mZE+v/c9PKv12XcewWVNLjqn5CBXnirnh+LvxKmwXIg6DLX1qbKI=;
X-UUID: 22fb5b1f6ffc48b0960ba8caf6dc00db-20211107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 466910734; Sun, 07 Nov 2021 20:17:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Nov 2021 19:17:06 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 8 Nov 2021 11:17:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Nov 2021 11:17:05 +0800
Message-ID: <98d237693bc618cba62e93495b7b3379c18ac6b5.camel@mediatek.com>
Subject: Re: Distinguish mediatek drivers
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, "Fan
 Fei" <ffclaire1224@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <linux-pci@vger.kernel.org>
Date: Mon, 8 Nov 2021 11:17:05 +0800
In-Reply-To: <20211105202913.GA944432@bhelgaas>
References: <20211105202913.GA944432@bhelgaas>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_191718_093273_D74544D3 
X-CRM114-Status: GOOD (  15.35  )
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

Hi Bjorn,

Thanks for the reminder, I will send patches to update these entries.

Thanks.

On Fri, 2021-11-05 at 15:29 -0500, Bjorn Helgaas wrote:
> We have two MediaTek drivers: pcie-mediatek.c, which claims:
> 
>   .compatible = "mediatek,mt2701-pcie"
>   .compatible = "mediatek,mt7623-pcie"
>   .compatible = "mediatek,mt2712-pcie"
>   .compatible = "mediatek,mt7622-pcie"
>   .compatible = "mediatek,mt7629-pcie"
> 
> and pcie-mediatek-gen3.c, which claims:
> 
>   .compatible = "mediatek,mt8192-pcie"
> 
> The Kconfig text does not distinguish them.  Can somebody update
> these
> entries so they do?  It's nice if we can mention model numbers or
> product names that a user would recognize.
> 
>   config PCIE_MEDIATEK
>         tristate "MediaTek PCIe controller"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
>         depends on OF
>         depends on PCI_MSI_IRQ_DOMAIN
>         help
>           Say Y here if you want to enable PCIe controller support on
>           MediaTek SoCs.
> 
>   config PCIE_MEDIATEK_GEN3
>         tristate "MediaTek Gen3 PCIe controller"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
>         depends on PCI_MSI_IRQ_DOMAIN
>         help
>           Adds support for PCIe Gen3 MAC controller for MediaTek
> SoCs.
>           This PCIe controller is compatible with Gen3, Gen2 and Gen1
> speed,
>           and support up to 256 MSI interrupt numbers for
>           multi-function devices.
> 
>           Say Y here if you want to enable Gen3 PCIe controller
> support on
>           MediaTek SoCs.
> 
> Both drivers are also named "mtk-pcie" and use the same internal
> "mtk_" prefix on structs and functions.  Not a *huge* problem, but
> not
> really ideal either.
> 
> Bjorn
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
