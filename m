Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A4BC432BE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 09:40:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81CB460F35
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 09:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81CB460F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxaYTrRycd9BUTEHoNLFXysQlnV/lz9vIGCieFn4BHY=; b=0+AYb589dn+us3
	kuqdBB3eplbhnAmw/+ottH4h1usfSiVlZfAopKpkGEjjyCmKgrCpxlL9Yf86mGWyLhteToS9rk10S
	YZmvpQ9yaBW2kmK0nSA6uH0XLZRdTODmeaG2CctXdkpUL7+dyRKMcp7b3DDVc0K3hABWpASOXQIu2
	fypsrnPA0P6xqRL7Gm5TJqq0Ax5Z6ta9qi25DQNFAFZLph+Uqx82FBmH6dKfzFN4n7Rcn4g+n7aod
	S+AuLn00A+Zyu5708aSvL/96Tj0uCByAAwuVH8l6mgVeVQMQoFEFx7HPDFIEw3NWjHL5pXxWjUAUJ
	tMJlIKrkHwwiDLdmHnUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBwL0-00C0al-Fn; Fri, 06 Aug 2021 09:40:22 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBwKn-00C0YA-Eh; Fri, 06 Aug 2021 09:40:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B91A31B;
 Fri,  6 Aug 2021 02:40:04 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.39.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCF143F719;
 Fri,  6 Aug 2021 02:40:00 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>, matthias.bgg@gmail.com,
 bhelgaas@google.com, robh+dt@kernel.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 yong.wu@mediatek.com, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>,
 linux-arm-kernel@lists.infradead.org, jianjun.wang@mediatek.com
Subject: Re: [PATCH v11 0/4] PCI: mediatek: Spilt PCIe node to comply with
 hardware design
Date: Fri,  6 Aug 2021 10:39:54 +0100
Message-Id: <162824274659.11010.3812952145024175369.b4-ty@arm.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
References: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_024009_587368_FC9A50D1 
X-CRM114-Status: UNSURE (   7.90  )
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

On Mon, 19 Jul 2021 15:34:52 +0800, Chuanjia Liu wrote:
> There are two independent PCIe controllers in MT2712 and MT7622 platform.
> Each of them should contain an independent MSI domain.
> 
> In old dts architecture, MSI domain will be inherited from the root bridge,
> and all of the devices will share the same MSI domain.Hence that,
> the PCIe devices will not work properly if the irq number
> which required is more than 32.
> 
> [...]

Applied patches 1-2 to pci/mediatek (we don't merge dts changes), thanks!

[1/2] dt-bindings: PCI: mediatek: Update the Device tree bindings
      https://git.kernel.org/lpieralisi/pci/c/9c23251640
[2/2] PCI: mediatek: Add new method to get shared pcie-cfg base address and parse node
      https://git.kernel.org/lpieralisi/pci/c/302e503e08

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
