Return-Path: <SRS0=SHoq=2V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AC3C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 08:20:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BC02206DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 08:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GIWr0kW/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BC02206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfpK2e0cVItwu1o8XKTj/56oVJHuuUa0ZT6TW9Mo4GE=; b=GIWr0kW/YXwq2i
	hiG+89CpXEgK1CGZzL510HxydC1kOarNEtrani5sF/7NZx/yB+wO7rTF+XGorQ1lw5lt7LzZgKbmF
	Oh1hV9Wu/OgDHH+CvTKxul5Mbwwy+75EdShei9a/NI2qatPY4WgOomhWkH68WjROFPVrJnsgGzSIH
	5wvle53X4aSa5JsDJFAUaiBVp55n5WP7rPRYHWyzic+Zh/ju/UQRz/sOaX7i21v9BL72PqfPILHKW
	gGMLBVfejdbOLLaVD61/jjNumDV9Ku/RhroI8odiW9BJl7UFE7pcSjjJxo1oLPFjxk4U7PTghFcfo
	HxBiCQKiTYons6JaLaog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imClg-0000wc-Om; Tue, 31 Dec 2019 08:20:44 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imClV-0000mW-Rd; Tue, 31 Dec 2019 08:20:35 +0000
Received: by mail-ed1-f66.google.com with SMTP id i16so34733363edr.5;
 Tue, 31 Dec 2019 00:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OCioKZCCJQ7tT73SyyKzkO9RMHazBLb5Wt3QDWkITuY=;
 b=fGTFMV42H4tjnc39pDS24RA8PfTctQ035ZcCV2YZeCIYe1CrSOiTVSdYLj8WB06bZx
 kAAVVs8XaypGz+M0JQKFp2NNu63+HXtqMvesi9j6ovAkgm0rU8jYzfrgivEZGZrbvIAc
 qrlQaG3VwW1GEz+YsqMlvJu6nn1KcjLZTySddJJxPAy15R8+FPh9UcLiJ4+lBf2bVMFZ
 IS7wYsbc88/S3k1AEjvqgnUcTMGawx54/iVwW0mCjZHp63dSiptAmWWX1j25/QxFpfY7
 wZ15kRAmny/ZozpZ3PiVcdwBRf8N8PN2kulcwvXEmknnv8gZGZMSpjOPgxpIgHAmqooq
 rggQ==
X-Gm-Message-State: APjAAAULeiilSBEyQ508+/sPDSqOWJ8z8a9cSi2bhe8bmvfkyPZFO/CE
 rY3WrnaKKWL7yuw0CEL21So=
X-Google-Smtp-Source: APXvYqyY2gPXd0BiQQrtUFNJI/5iVX0C/CtQWvEacT6jWsjUbweBcqZjXhfz4qpJbuWs2pkwg5NIgQ==
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr75335663edx.234.1577780431167; 
 Tue, 31 Dec 2019 00:20:31 -0800 (PST)
Received: from pi3 ([194.230.155.138])
 by smtp.googlemail.com with ESMTPSA id r24sm5708609edp.15.2019.12.31.00.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 00:20:30 -0800 (PST)
Date: Tue, 31 Dec 2019 09:20:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/2] phy: Enable compile testing for some of drivers
Message-ID: <20191231082028.GC6804@pi3>
References: <20191230172449.17648-1-krzk@kernel.org>
 <20191230172449.17648-2-krzk@kernel.org>
 <791d83ef-faee-d6e6-445e-a8088c5ac654@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <791d83ef-faee-d6e6-445e-a8088c5ac654@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_002033_897122_1C5F6786 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 30, 2019 at 12:10:51PM -0800, Florian Fainelli wrote:
> Hi Krzysztof,
> 
> On 12/30/19 9:24 AM, Krzysztof Kozlowski wrote:
> > Some of the phy drivers can be compile tested to increase build
> > coverage.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> This looks fine, you could also consider adding a bunch of other
> Broadcom PHY drivers which are not currently under COMPILE_TEST, yet
> build fine:

I'll send a v2 with them as well. They seem to compile fine.

Best regards,
Krzysztof

> 
> diff --git a/drivers/phy/broadcom/Kconfig b/drivers/phy/broadcom/Kconfig
> index d3d983c128ea..d56db6d375e1 100644
> --- a/drivers/phy/broadcom/Kconfig
> +++ b/drivers/phy/broadcom/Kconfig
> @@ -50,7 +50,7 @@ config PHY_BCM_NS_USB3
> 
>  config PHY_NS2_PCIE
>         tristate "Broadcom Northstar2 PCIe PHY driver"
> -       depends on OF && MDIO_BUS_MUX_BCM_IPROC
> +       depends on (OF && MDIO_BUS_MUX_BCM_IPROC) || COMPILE_TEST
>         select GENERIC_PHY
>         default ARCH_BCM_IPROC
>         help
> @@ -83,7 +83,7 @@ config PHY_BRCM_SATA
> 
>  config PHY_BRCM_USB
>         tristate "Broadcom STB USB PHY driver"
> -       depends on ARCH_BRCMSTB
> +       depends on ARCH_BRCMSTB || COMPILE_TEST
>         depends on OF
>         select GENERIC_PHY
>         select SOC_BRCMSTB
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
