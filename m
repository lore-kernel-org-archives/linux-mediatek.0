Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE96C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 12:53:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B49060184
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 12:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B49060184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BxP3MeOzxVryi/ZWNB+66Smc09N6ShCc32SrjE2Vbs=; b=Cuh+6GPnGiPNkT
	dr6TeTnoTptBSMODePcNsAcgn6T39AWuAkX7ubrSzTdNtNVRLOjn2BVtfyfdxNwYZqkWgHZrFxx0y
	BwenDU3/u9KyaQGAVhfWAQE4qECJb02zrthptHW4yLIcNOUTcv5ab0UJFLcVIxRweHx9SGf/9/9YO
	PwuRJpeHVy/5+5tlWsi0XsMS60TlvFWICeL/AnFI3tH5LG7jpPki+Hb2UKyySH2akAEKeHfQ+B3p4
	NHvFVL/SV0oir8MbqfSYzogOhW/E4sWHl7Ff0J1tV40akBr8EhXSuNr3z2hmxAc3IFy9kBgMfKVc5
	9QknGsHP+MOztjtAJ4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJEt5-00AAe3-FF; Thu, 26 Aug 2021 12:53:43 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJEss-00AAcd-9L; Thu, 26 Aug 2021 12:53:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B998106F;
 Thu, 26 Aug 2021 05:53:27 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.41.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA5143F766;
 Thu, 26 Aug 2021 05:53:23 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: robh+dt@kernel.org, bhelgaas@google.com,
 Chuanjia Liu <chuanjia.liu@mediatek.com>, matthias.bgg@gmail.com
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com,
 devicetree@vger.kernel.org, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 0/6] PCI: mediatek: Spilt PCIe node to comply with
 hardware design
Date: Thu, 26 Aug 2021 13:53:12 +0100
Message-Id: <162998235864.26306.15150607621994016843.b4-ty@arm.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210823032800.1660-1-chuanjia.liu@mediatek.com>
References: <20210823032800.1660-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_055330_416360_9B4AA85C 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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

On Mon, 23 Aug 2021 11:27:54 +0800, Chuanjia Liu wrote:
> There are two independent PCIe controllers in MT2712 and MT7622 platform.
> Each of them should contain an independent MSI domain.
> 
> In old dts architecture, MSI domain will be inherited from the root
> bridge, and all of the devices will share the same MSI domain.Hence that,
> the PCIe devices will not work properly if the irq number which required
> is more than 32.
> 
> [...]

Applied to pci/mediatek, thanks!

[1/4] dt-bindings: PCI: mediatek: Update the Device tree bindings
      https://git.kernel.org/lpieralisi/pci/c/aa6eca5b81
[2/4] PCI: mediatek: Add new method to get shared pcie-cfg base address
      https://git.kernel.org/lpieralisi/pci/c/87e8657ba9
[3/4] PCI: mediatek: Add new method to get irq number
      https://git.kernel.org/lpieralisi/pci/c/436960bb00
[4/4] PCI: mediatek: Use PCI domain to handle ports detection
      https://git.kernel.org/lpieralisi/pci/c/77216702c8

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
