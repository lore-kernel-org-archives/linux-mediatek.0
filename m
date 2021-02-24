Return-Path: <SRS0=l1Zb=H2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B16C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 13:36:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DB564E6C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 13:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9DB564E6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CYBppsN2ARG9FXl1DsErogvladCVqq3B8wGZD9t0TiA=; b=2gH+/VN3yWVnolHwLk30+5q0m
	KUeEMU6WAQo0j67WwQyjjkYqeYQ/mlLPnEh6n/Gvjyb1Lh+XYl+Z86IM4p7E9nh7CKHwU4q6WRlFY
	/cT3MGT/2cMwhA3HXKqc+G1E4JYpUVQSSpTwOCadKRnvABAKflPIHjKsuwaAj620r0vOsaDxGYIX9
	Q4dDmv7Psgurcf6RK4Y1F8QYesNvzEbI3mhu+KWAOMmbAAc/c9ikIf/YIFRrM9rmOTie0Gqn9B6DB
	Btmzrqhkkw9AlEvhPjyynDniNmfGMYSMaAVBBAXx+d1H1o+gmsuC5SWxZpR6mf2gEjoutx5+Ez/LA
	uLKPQSHzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEuL4-0008KD-IZ; Wed, 24 Feb 2021 13:36:26 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEuL1-0008JU-HE; Wed, 24 Feb 2021 13:36:24 +0000
Received: by mail-wr1-f49.google.com with SMTP id l12so1924712wry.2;
 Wed, 24 Feb 2021 05:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dq4qL90OCu8ib/iGkBDTsJu+uvHjzn/c/ym0u/ajUA0=;
 b=Qb2jGMWGQjRqeJ00sOmocFFZFBupccZ0igWByVB/joV/efegLpPtVrUHJwTiUkeX2K
 KCRV0iCzLi5xSDQCw1iUpZxMFtX5Bts/UlXrw8YF8bnVEWZhLkPc3Iwo98Gjr3o7QaYT
 eD5DRgtOQnpr8cQbIUorHQhW2mRK8k35odrup176D2mmmelfzPvi4PoAIw2eseMlota6
 hz2RSfTebiGEgTxkuXi7YkX2eprZDhUeeYHK2ipa0emOK65JzfiqTH0RKRklMb/HQ7b+
 i5WdfXFYK6KYpTU0LPiXvhA5e2EmnQWhqNBNxPfjR1JQLdih6j5jiYldzX4xOJc85pYc
 YMBg==
X-Gm-Message-State: AOAM530MZt6NJBsjg7FB4olieTIQZheUGdeG7fYagBDK2wldiXsbNv3K
 5hfEu4rvP8aqbenpOFSqZcU=
X-Google-Smtp-Source: ABdhPJxhksCAGOk3JAcFq15JrepLPez2XrzSDA7b9WxJVd1Jzq2verZqIaVftogrwqD0KjajojtEsw==
X-Received: by 2002:a5d:4a09:: with SMTP id m9mr26874209wrq.310.1614173779234; 
 Wed, 24 Feb 2021 05:36:19 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id j125sm3000640wmb.44.2021.02.24.05.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 05:36:18 -0800 (PST)
Date: Wed, 24 Feb 2021 14:36:16 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v8,3/7] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
Message-ID: <YDZWUGcKet/lNWlF@rocinante>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-4-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224061132.26526-4-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_083623_625349_1AC24EAA 
X-CRM114-Status: GOOD (  16.64  )
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

Thank you for all the work here!

[...]
> + * struct mtk_pcie_port - PCIe port information
> + * @dev: pointer to PCIe device
> + * @base: IO mapped register base
> + * @reg_base: Physical register base
> + * @mac_reset: mac reset control
> + * @phy_reset: phy reset control
> + * @phy: PHY controller block
> + * @clks: PCIe clocks
> + * @num_clks: PCIe clocks count for this port

It would be "MAC" and "PHY" in the above.

[...]
> + * mtk_pcie_config_tlp_header
> + * @bus: PCI bus to query
> + * @devfn: device/function number
> + * @where: offset in config space
> + * @size: data size in TLP header
> + *
> + * Set byte enable field and device information in configuration TLP header.

The kernel-doc above might be missing brief function description.  See
the following for more concrete example:

  https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation

[...]
> +static int mtk_pcie_set_trans_table(struct mtk_pcie_port *port,
> +				    resource_size_t cpu_addr,
> +				    resource_size_t pci_addr,
> +				    resource_size_t size,
> +				    unsigned long type, int num)
> +{
> +	void __iomem *table;
> +	u32 val;
> +
> +	if (num >= PCIE_MAX_TRANS_TABLES) {
> +		dev_err(port->dev, "not enough translate table[%d] for addr: %#llx, limited to [%d]\n",

The wording of this error message is a little confusing.

> +			num, (unsigned long long) cpu_addr,

No space between the bracket and the variable name.

[...]
> +	err = phy_init(port->phy);
> +	if (err) {
> +		dev_err(dev, "failed to initialize PCIe phy\n");
> +		goto err_phy_init;
> +	}
> +
> +	err = phy_power_on(port->phy);
> +	if (err) {
> +		dev_err(dev, "failed to power on PCIe phy\n");
> +		goto err_phy_on;
> +	}
[...]

It would be "PHY" in the error messages above.

[...]
> +	if (err) {
> +		dev_err(dev, "clock init failed\n");
> +		goto err_clk_init;
> +	}
[...]

A nitpick, so feel free to ignore it, of course.  What about "failed to
initialize clock" to keep the style consistent.

[...]
> +	err = mtk_pcie_startup_port(port);
> +	if (err) {
> +		dev_err(dev, "PCIe startup failed\n");
[...]

Also a nitpick.  What about "failed to bring PCIe link up"?

Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
