Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC40FC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 08:41:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B19E224F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 08:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B19E224F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1lOC2XX397I6SKmXtsSrefOfoi0i/yIF8jp5nUokZlo=; b=1Qj16Zzatt7r4/PNyela5SlkT
	NtD6sbzdohufZOXAvYU92UuhFqqgWMffwj40qETluJ1xAqeAN53pn6SBg32XXbX/lgV83Qr5Q85L9
	3swXBJhAZVLz3P9di1UfjUMqxhHdfFvj4tvwO4H5iilIlCam8P7ckTuMn/Yr9upGYl5Sp4BM13O0w
	LpH5YUSZ1dUe8Ipv4FGcaLjpC5SB7tVCNGkdeRYnXkDpt78iO4R1SZMb0rf4FV/mcbgBakEBGP+EV
	0GrssziWvijDVXc5aXcWAd68A/TSq1kWASBMVro7G3I2Nl4kqKjou49Z+h7A4We9TkkcTYnEI6Sr9
	tUJU1dciQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3xQg-0002vl-Ml; Mon, 25 Jan 2021 08:40:58 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3xQe-0002um-M7; Mon, 25 Jan 2021 08:40:57 +0000
Received: by mail-wm1-f54.google.com with SMTP id c128so9936174wme.2;
 Mon, 25 Jan 2021 00:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mZo7aKwXK5deoAcrsXLP1GP5WkzKfPSS28ocvilrOE8=;
 b=jB/lJM1YvCf7MQdGeA7+tlASzDllEgvjicyMUvXsJdPfpXCHUsjztZ1DQDl1tknxTE
 Rs7TKcHmdfhN6aULmFE4mzPW8AHANSA99pCAokWvj0C1pTAWVeL5zRlpVj5dBClRbmYZ
 vYWSsVc1vW1tW7u5o3YI44a1oByJDDvxi0qefWNLdSKlkSfsYkAQvNzbqzD5ZCA9Xzpu
 vB6Ex4RUw5G49OkmsNIB4YoGyIVpEXnEhli+lxov5PU7T8Rax9vFgmB+n+KacruAI7eP
 3fBtRP1bdxpUDxyUH61gu1F8qX3viSqG6ptcaCFBCwBGrub9BqWBn7NwUQj5tM2ZmE/s
 tb5g==
X-Gm-Message-State: AOAM532Ltv17UnzfAx+7n5sxEk/OLAkUXPNFV+BhdxCnlleZktW5TMxc
 nbHCg4z+GGbnUMofhYHvWhc=
X-Google-Smtp-Source: ABdhPJzqtyNCKS2sng7AvV/KuXwIGCg36ChTNZfCr5oRaLPx4r2cb6HVrQPNF1aJsw7Pq4EawQNxdA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr14774541wmm.79.1611564053570; 
 Mon, 25 Jan 2021 00:40:53 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id n193sm20346055wmb.0.2021.01.25.00.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 00:40:52 -0800 (PST)
Date: Mon, 25 Jan 2021 09:40:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add module_exit and module_license
Message-ID: <20210125084051.ipgeu2ksucdag2u4@kozik-lap>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
 <20210121062429.26504-3-yong.wu@mediatek.com>
 <20210122213427.mwjyjn2wsgnko7mk@kozik-lap>
 <1611557381.3184.21.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611557381.3184.21.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_034056_734012_4DDD7962 
X-CRM114-Status: GOOD (  27.86  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 02:49:41PM +0800, Yong Wu wrote:
> On Fri, 2021-01-22 at 22:34 +0100, Krzysztof Kozlowski wrote:
> > On Thu, Jan 21, 2021 at 02:24:28PM +0800, Yong Wu wrote:
> > > The config MTK_SMI always depends on MTK_IOMMU which is built-in
> > > currently. Thus we don't have module_exit before. This patch adds
> > > module_exit and module_license. It is a preparing patch for supporting
> > > MTK_SMI could been built as a module.
> > > 
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >  drivers/memory/mtk-smi.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > > index e2aebd2bfa8e..aa2a25abf04f 100644
> > > --- a/drivers/memory/mtk-smi.c
> > > +++ b/drivers/memory/mtk-smi.c
> > > @@ -597,3 +597,13 @@ static int __init mtk_smi_init(void)
> > >  	return platform_register_drivers(smidrivers, ARRAY_SIZE(smidrivers));
> > >  }
> > >  module_init(mtk_smi_init);
> > > +
> > > +static void __exit mtk_smi_exit(void)
> > > +{
> > > +	platform_unregister_drivers(smidrivers, ARRAY_SIZE(smidrivers));
> > > +}
> > > +module_exit(mtk_smi_exit);
> > > +
> > > +MODULE_DESCRIPTION("MediaTek SMI driver");
> > > +MODULE_ALIAS("platform:MediaTek-SMI");
> > 
> > Drivers do not use capital letters, so I have doubts whether this alias
> > is correct.
> 
> I didn't care the upper/lower-case. I will change to lower case in next
> time.

Then why do you need the alias? The name does not match driver name, so
what's the purpose of this alias/

> 
> MODULE_ALIAS("platform:MediaTek-smi")
> 
> > 
> > Adding all these should be squashed with changing Kconfig into tristate.
> > It does not have sense on its own.
> 
> Thanks  very much for review.
> 
> Only confirm: Squash whole this patch or only squash the MODULE_x into
> the next patch?

This entire patch 2/3 should be with 3/3.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
