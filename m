Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F185C4BA21
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 22:23:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D342024653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 22:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m3K+vh9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D342024653
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzPZTiyaNY737i6x+n+zk49NaNqy5at14xoV/6tsgl4=; b=m3K+vh9+yEptZw
	5dAw3T863WT/PCoAuQA+p1BoGE/f+PU4TUvkbG1mShgGJz3nMYBAKyk/vIZxUWY3GdUiSKAaMf4fF
	0ZsOTB1YfVEVGdWvZHPdXQpOlVU0trrCVV2tKw5NQvzrS+/R2QriFZYLzZ0qCLV6LkHNBu/3t6A1P
	mz9hdKY65QmfijBQT7vG24BU9i2uZzlVShq8LI63UAqqCIAa9rdRp/+CEyBfnygBLoiXvCvAk6/5p
	KS3J1l6mMDdDWRmVZa+4+qrysHUxbOYlR2jL7xKM/2SMG5U2RgnOwjZVOKs2zEHYQlViD7HLSiGEy
	vVldIub5/zbYCvOfjMng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j755k-0003ln-3k; Wed, 26 Feb 2020 22:23:44 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j755Y-0003bj-1c; Wed, 26 Feb 2020 22:23:33 +0000
Received: by mail-ot1-f66.google.com with SMTP id j16so1059716otl.1;
 Wed, 26 Feb 2020 14:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9/KR8/ro7ANRurfSfz9QDDSqoIKmisafRnjItkiqO1U=;
 b=Hpz4c0YT1Lbh4amvdci43gGPXr6KAZrZXL00PeS0ssn6Z4zSkOxqbQNcQmyVRAcOlq
 qfIW/Ta0WalwWMc8HjwzM9mBD8gZh4o41PTtaVkPkzXxGEcEr2NJvNpfxJrE2zPsg60e
 N0zavOTEDj5fV3JYujdGl7IzltqVueFxz7VUUBGxZbB8WCWBB6U8uMsuYUHyhJe/DSMl
 PU/KjokHB4OBr7ql9V6u43ndlHXs819gcVc9aI8drjxBrXiGjBLQIFrB5Bj5gAB5SK58
 TqNjs86pnz1ycjJiESLWjinQnkhKqBMIOh1sanVCPVb807Sh3SCUy/H4MKgURaokdXAE
 F3Aw==
X-Gm-Message-State: APjAAAUUlv5Y/bSx6qjl0AR5q0SD31AwcRIk67X2C53MwQRguc5Q516i
 1KQCm1dd/rtoGhOthVSSOip84azsyg==
X-Google-Smtp-Source: APXvYqxQoc+Y2Yxgre6xns0v4FBKE/B92IK5PIDzgAyBU4JtbAuTWwoJBOY8QPJnsvQfCddn4rj14g==
X-Received: by 2002:a9d:2dea:: with SMTP id g97mr841706otb.33.1582755811422;
 Wed, 26 Feb 2020 14:23:31 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a30sm1226839otc.79.2020.02.26.14.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 14:23:30 -0800 (PST)
Received: (nullmailer pid 9442 invoked by uid 1000);
 Wed, 26 Feb 2020 22:23:30 -0000
Date: Wed, 26 Feb 2020 16:23:30 -0600
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: i2c: Document I2C controller binding
 for MT6797 SoC
Message-ID: <20200226222330.GA9392@bogus>
References: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
 <20200222162444.11590-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222162444.11590-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_142332_097061_E9CFD274 
X-CRM114-Status: UNSURE (   9.11  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 matthias.bgg@gmail.com, adamboardman@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 22 Feb 2020 21:54:41 +0530, Manivannan Sadhasivam wrote:
> I2C controller driver for MT6577 SoC is reused for MT6797 SoC. Hence,
> document that in DT binding.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
