Return-Path: <SRS0=l1Zb=H2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C17C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 14:31:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7801064EDD
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 14:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7801064EDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/KDIDT7zPFsn6M/Yrm2REh9hfqhbWQ+4AJpiBWwznCs=; b=jRmlNs1Fx9obChMJvpq3XeCU+
	KLgp1g/rWyYuxJaYXJeRIpiDDG+2vNSD0cqOiRGsJvvLf21gsJ4iImVlrpNsKH1oeM7GrGObKbyEr
	ZrPXxHseT0ash/n/NhBF2fASXAcGSGH73d07hFkPkplJk/XZCeUGuZgw90M4IQOG+OScAB1UKHn8h
	bwA8QFavCw9Jx2Lz7w1HZrDPpmE+f1yObO8ENvN3yqHDwq2dHawsDOE50cKjtP1qU+/u9Xi32u/bI
	wXGHGSj13SjkiH8eKXNODRd9tkiHbvFWKo2HVZXjUrk5h6zFGk11xk/2pwauW6rZhc8bv7QnDiGy8
	6tGDKzZ9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEvCI-0003fw-DZ; Wed, 24 Feb 2021 14:31:26 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEvCG-0003fU-69; Wed, 24 Feb 2021 14:31:25 +0000
Received: by mail-wr1-f42.google.com with SMTP id n4so2108383wrx.1;
 Wed, 24 Feb 2021 06:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/YBrPEr1lwJ23lddEC25NzuV+KrdNuFPq/A3hHw3CPA=;
 b=BeUeRgvlyyjiJhQYPdof6/GmBH1oT8ybU0vAA8dyAu5NZMt69yUDAHxlPBOuRLrWWb
 nJj6+PTvazJIV7xNGci/afsM/VtKyIuxwYdHpamU2ByWAcea+pHGmWavopdZGIHLNmLm
 MlJm2CrbOmMmPB+d5W+Op1qE1g4xUQ0H3kcZ9tFjogO+HcMERnHG1jwuuz2LRpcV8ALE
 W6XcqD+E9szql0vbJ55/UH1xecsfCH23rWM4JnX6aKZCWi1O99+CNDtrE/K0U5iwDuPb
 mVaIOsw1nZ9uL+uAR4l42ZZL6dwKOwLhzUHwmAGGU/nECXKRVl0Y4WSTB+p8++wCFq2N
 qHKA==
X-Gm-Message-State: AOAM533EeH4ikRJhc7R4E94R3QKIjAeZ3XkLA69MMOlah5/3J93SCfuU
 b8vK/U17OOAp19sdSH0dMpk=
X-Google-Smtp-Source: ABdhPJyzlsFi0TiJ96xPkqKJZCTCILLB53zE4mEccCvTsH8l1EMpfBxoyYXPQQOyfwXHU3MmYnxVGQ==
X-Received: by 2002:adf:b355:: with SMTP id k21mr288693wrd.156.1614177082777; 
 Wed, 24 Feb 2021 06:31:22 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id c2sm3973759wrx.70.2021.02.24.06.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 06:31:22 -0800 (PST)
Date: Wed, 24 Feb 2021 15:31:20 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v8,5/7] PCI: mediatek-gen3: Add MSI support
Message-ID: <YDZjOHKmks9ChFQI@rocinante>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-6-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224061132.26526-6-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_093124_243425_4E258154 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com, maz@kernel.org,
 drinkcat@chromium.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, anson.chuang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jianjun,

[...]
> +static struct irq_chip mtk_msi_irq_chip = {
> +	.name = "MSI",
> +	.irq_enable = mtk_pcie_irq_unmask,
> +	.irq_disable = mtk_pcie_irq_mask,
> +	.irq_ack = irq_chip_ack_parent,
> +	.irq_mask = mtk_pcie_irq_mask,
> +	.irq_unmask = mtk_pcie_irq_unmask,
> +};

For consistency sake, what about aligning this like the
struct mtk_msi_bottom_irq_chip has been?  See immediately below.

[...]
> +static struct irq_chip mtk_msi_bottom_irq_chip = {
> +	.irq_ack		= mtk_msi_bottom_irq_ack,
> +	.irq_mask		= mtk_msi_bottom_irq_mask,
> +	.irq_unmask		= mtk_msi_bottom_irq_unmask,
> +	.irq_compose_msi_msg	= mtk_compose_msi_msg,
> +	.irq_set_affinity	= mtk_pcie_set_affinity,
> +	.name			= "MSI",
> +};

Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
