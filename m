Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25974C388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 19:56:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D6192224D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 19:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BUUtBI+o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEfH60p0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D6192224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mBcl4pGopl/KJgRgDFXIBiq0oTn0UbN5GaPvDqeyXuQ=; b=BUUtBI+onbWQ8xQ2KrVNmUz38
	k0WSicOlQHVsfZw+yB1toGA3ukT31j/D4bN3YEPD2wZIrW0pDRgRmLmFyXCJu9Fdq4S29nbsl45SF
	EQy8efcQlqmmMY6VeAF4Hd3ymzdbXTKqaDSz1Pa1HbuSRddhLmMnGjtST77VFIn6kKjrA+je1KkhD
	jTR/PDTAG7Hq5pmYL1Se5K7f4YzZ7W1azgT0hh1c7FACFgZP0RDfginYt50KxFqDNVgICxiGnw+AJ
	kg25Q95dPAf3lWoRTdfWf1d/yy1FOxBGl+Dxqqd/T9veCGIniW+HaKzPF8Iwh0ARBqdgYMJ/7aOT3
	/q3B3O52w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfq2n-0000ct-8A; Thu, 19 Nov 2020 19:56:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfq2j-0000bV-D8; Thu, 19 Nov 2020 19:56:34 +0000
Received: from localhost (129.sub-72-107-112.myvzw.com [72.107.112.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9769A2224D;
 Thu, 19 Nov 2020 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605815791;
 bh=dErbzcv3kR/xdYe7GVFdgHBkg9LK5dXcA6T+ijj9rpc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=TEfH60p0Hoyo86weK5rZ40gatR1l75RDcEo4vHtLLB3HMBxlfkKgPZwEzOksVgO46
 7NEmA0LUJcJXHiW0lkkze/LC0T6pjP4AZhHqEMXkVSla1iWQGqjLjkk3drwcDJjd+5
 fxJLxsr8yFh1REeVzfQCLX4y9OLBVFVDzF27ekKg=
Date: Thu, 19 Nov 2020 13:56:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v4,3/3] MAINTAINERS: update entry for MediaTek PCIe controller
Message-ID: <20201119195630.GA197187@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082935.26828-4-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_145633_610627_4E77716A 
X-CRM114-Status: GOOD (  16.45  )
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
 chuanjia.liu@mediatek.com, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-pci@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, sin_jieyang@mediatek.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Follow the convention and include more information in the subject,
e.g.,

  MAINTAINERS: Add Jianjun Wang as MediaTek PCI co-maintainer

On Wed, Nov 18, 2020 at 04:29:35PM +0800, Jianjun Wang wrote:
> Add maintainer for MediaTek PCIe controller driver.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index deaafb617361..5c6110468526 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13459,6 +13459,7 @@ F:	drivers/pci/controller/dwc/pcie-histb.c
>  
>  PCIE DRIVER FOR MEDIATEK
>  M:	Ryder Lee <ryder.lee@mediatek.com>
> +M:	Jianjun Wang <jianjun.wang@mediatek.com>
>  L:	linux-pci@vger.kernel.org
>  L:	linux-mediatek@lists.infradead.org
>  S:	Supported
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
