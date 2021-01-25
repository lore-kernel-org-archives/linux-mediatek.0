Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7537EC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 10:41:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD11921D79
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 10:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD11921D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ed1E59L3M7MxioTOr6Yj1S6j818pnEXEyqVooqW+ew0=; b=iSZ3lzTpLoY7vIIHYj84bG5J1
	rFQF7C1QkTgg1KTgLv395dCzKgNo24IUH+pptH2F6M6xW1ddOS/tn8mvCaTg9oIO3n7eM5+YC8Ptn
	nVEW1v8TjkRChkQtea78HXZqzAuBr4E6iLrlP3kzPMyj1v8PEE/Twdt2yJ61NpH/feMSknHLc2nJR
	uatl+Sf8Z/ZeTVSdbK/WUEZzbEAfT4qKL6pTCVl/6vNYW+N4XAfhFDWyKR/ngsPYEZ1KhGeYK2uzA
	UF8NufV+0OTMHYXPM2CFSGNRxxVUxl+YQEe2nHuoesumClTWlxIo503tNfEo905fKhOAh3vC1Ie2F
	/nG15uylg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3zIW-00082B-EY; Mon, 25 Jan 2021 10:40:40 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3zIU-00081n-Im; Mon, 25 Jan 2021 10:40:39 +0000
Received: by mail-wr1-f54.google.com with SMTP id q7so11727074wre.13;
 Mon, 25 Jan 2021 02:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DsJE2zPkprb7gh+GS+eIFG0M1vuNomWHZqhGRuLhtzQ=;
 b=VDxr3qGmCYb/nE6I4VIOEvGiTWvojSUz2tUH61b2mwLqp6HAvHnBeCuVSSZ/weSVZ7
 2eezvs4aiOBs8ofZwnGGJguEJPBmAZ8s6rBF2gYLef0RmAhaaTz3YwD2p+9z4yPh+o7b
 +BAN0qzQvfpmeKoU/W9o47qZxEm2SH6EI4RPc5il9hlWJs28GUG7Wa/1sUbMhkqMr61P
 LhQW9GWtgE6qr/PgEnnL4jrsvkTadL9/Ib8t/Utz2z7rUZcsCcJ0LCvkU3X8b7i+Z43A
 q9WaQnAGq9Xw46OHsyYMR1b+fVvWL2KQBIjDX1ijaYy9/i0UXmpyVp3sVZynRCP6IAXz
 KbEg==
X-Gm-Message-State: AOAM532DmU4dcXz/EdfXuD+REN8ILl2elZdgPVIqh6LmcWKtG70KrVxR
 wnyKA9P/mWpZrXr2mAKpanqRUTEt884=
X-Google-Smtp-Source: ABdhPJxFRyn+qu6XbZN8Kw3vcIaOk89MqJcinq7fckxNIcL/17AL7YibO7Tz3bhcgYseghNGX5zLzA==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr200432wru.152.1611571236869;
 Mon, 25 Jan 2021 02:40:36 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id g1sm21982339wrq.30.2021.01.25.02.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 02:40:35 -0800 (PST)
Date: Mon, 25 Jan 2021 11:40:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add module_exit and module_license
Message-ID: <20210125104033.2ewzumhmagmouvo5@kozik-lap>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
 <20210121062429.26504-3-yong.wu@mediatek.com>
 <20210122213427.mwjyjn2wsgnko7mk@kozik-lap>
 <1611557381.3184.21.camel@mhfsdcap03>
 <20210125084051.ipgeu2ksucdag2u4@kozik-lap>
 <1611566885.5302.4.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611566885.5302.4.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_054038_675900_A04D92B2 
X-CRM114-Status: GOOD (  29.78  )
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

On Mon, Jan 25, 2021 at 05:28:05PM +0800, Yong Wu wrote:
> On Mon, 2021-01-25 at 09:40 +0100, Krzysztof Kozlowski wrote:
> > On Mon, Jan 25, 2021 at 02:49:41PM +0800, Yong Wu wrote:
> > > On Fri, 2021-01-22 at 22:34 +0100, Krzysztof Kozlowski wrote:
> > > > On Thu, Jan 21, 2021 at 02:24:28PM +0800, Yong Wu wrote:
> > > > > The config MTK_SMI always depends on MTK_IOMMU which is built-in
> > > > > currently. Thus we don't have module_exit before. This patch adds
> > > > > module_exit and module_license. It is a preparing patch for supporting
> > > > > MTK_SMI could been built as a module.
> > > > > 
> > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > > ---
> > > > >  drivers/memory/mtk-smi.c | 10 ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > > > > index e2aebd2bfa8e..aa2a25abf04f 100644
> > > > > --- a/drivers/memory/mtk-smi.c
> > > > > +++ b/drivers/memory/mtk-smi.c
> > > > > @@ -597,3 +597,13 @@ static int __init mtk_smi_init(void)
> > > > >  	return platform_register_drivers(smidrivers, ARRAY_SIZE(smidrivers));
> > > > >  }
> > > > >  module_init(mtk_smi_init);
> > > > > +
> > > > > +static void __exit mtk_smi_exit(void)
> > > > > +{
> > > > > +	platform_unregister_drivers(smidrivers, ARRAY_SIZE(smidrivers));
> > > > > +}
> > > > > +module_exit(mtk_smi_exit);
> > > > > +
> > > > > +MODULE_DESCRIPTION("MediaTek SMI driver");
> > > > > +MODULE_ALIAS("platform:MediaTek-SMI");
> > > > 
> > > > Drivers do not use capital letters, so I have doubts whether this alias
> > > > is correct.
> > > 
> > > I didn't care the upper/lower-case. I will change to lower case in next
> > > time.
> > 
> > Then why do you need the alias? The name does not match driver name, so
> > what's the purpose of this alias/
> 
> I think it is not so necessary for us. I will delete this line in next
> version.
> 
> Only curious what's alias is fit in our case? normally it should be the
> file name: mtk-smi?

If autoloading of your module works, then remove it. The alias is
necessary for some cases when a device table is missing (e.g. platform
driver is matched via devicetree but not having the platform_device_id
table) or matching is done via different method (e.g. driver is matched
from MFD via devicetree compatible even though there is a
platform_device_id table).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
