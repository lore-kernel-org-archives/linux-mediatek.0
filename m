Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC080C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 08:40:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F066141C
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 08:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61F066141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GnF7hPnM2bIRESGSbVpJzQpp9NQT0o3tyMhaiwlRkVU=; b=ks8OLRk5Ht8g6e/bVAdkbb/XM
	j03wxe1EnoIvpP7zdSW301oGALZf0KBKF4swpZ+FfdKhgkIRrCtwwUSw7hs9au3u/d5hbRmxa9bh8
	xuoLRmEKYyuv/YF9+2WgYTfQCrw7QOlXi9c5WPV73DirRsJ7i1AF6B2zhc3b/H0ETiaDGTX7OIHE9
	sS7uN6Obc9jpXYEbkHlIayve8dvugLzVxxxSZED4bYLh5MoTL2aaRr95DMRzLwUHFzWcW76M/WuUF
	zGQ0kakM6XuizB/NsOxsV3sgwGhCLZLxO0RPWLH8R3Ypn5FfD+qbe3msBF5oD1V6N11tonmKe4idK
	LTL8iRpHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcOhF-007WHv-5o; Fri, 30 Apr 2021 08:40:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOh4-007WHO-B3; Fri, 30 Apr 2021 08:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Mh5/ptfLXjLNp1fl2U3KAW28k8rIe3lzHBrucSJ0KbM=; b=sUjuWgQL7levv9K7kCw3uyq+uH
 17QHyHdDtRcOTGQZhsP0qyTt7h/Yy2DRejPs2IV3bHhlxCnrX/UL0l3TBBJuKCctjzYf/2UCaCUDW
 1YGOERHdAi4d1XQdGJrIK7LWrciF/XhiF+vVDODLlpBpOTMU8B8wNDbHpkOapb0min9wLmEqoAb0G
 YIE/U1yZ/kTvDOVCJSB9YUQ6fqJpMVLwk3kmEXBbthwxivvLUATX0E5Qvr++IQ5bzIKE2p4RG/OX4
 unFAIKEzSZXlFrEzkVGfBpVr4Kr1pbd5zA00gXMdWpRb2mCJVSPV+qZKvREtpgzWHndZLX99xOWzr
 STA0nZIA==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOh1-001FXC-Jk; Fri, 30 Apr 2021 08:40:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3907AED1;
 Fri, 30 Apr 2021 01:40:08 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A61233F70D;
 Fri, 30 Apr 2021 01:40:06 -0700 (PDT)
Date: Fri, 30 Apr 2021 09:40:01 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Colin King <colin.king@canonical.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] PCI: mediatek-gen3: Add missing null pointer check
Message-ID: <20210430084001.GA12388@lpieralisi>
References: <20210429110040.63119-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429110040.63119-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_014011_721632_2FFCE45A 
X-CRM114-Status: GOOD (  15.89  )
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

On Thu, Apr 29, 2021 at 12:00:40PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to platform_get_resource_byname can potentially return null, so
> add a null pointer check to avoid a null pointer dereference issue.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: 441903d9e8f0 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 2 ++
>  1 file changed, 2 insertions(+)

Squashed into the commit it is fixing, in my pci/mediatek branch.

Thanks,
Lorenzo

> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 20165e4a75b2..3c5b97716d40 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -721,6 +721,8 @@ static int mtk_pcie_parse_port(struct mtk_pcie_port *port)
>  	int ret;
>  
>  	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
> +	if (!regs)
> +		return -EINVAL;
>  	port->base = devm_ioremap_resource(dev, regs);
>  	if (IS_ERR(port->base)) {
>  		dev_err(dev, "failed to map register base\n");
> -- 
> 2.30.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
