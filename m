Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302ABC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 13:34:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFFB664F5E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 13:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFFB664F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bzPYfVPkJshb3YL3Ai3W8OCSm+jtO9ODZj5TayZ7ZkA=; b=ArcMm240mGHBgFiAZADTbCp1y
	cXbwLWUWH4WmMf3JmZ4R9msEZ8/CNdeqqI6KvJIHQlh7cobT90u4NpRTmgzyJOEM2SgJlecDJLUqZ
	P5s19Ek3I19+78DzfQh6m8RI3nDRJvAD7eS7M3PeSLfJo8ohWdGytBnfxSQVBS9IBqvQBF85hmUeZ
	JVs32u1b5VcrI8eJ1IFe4qFQRXam17qrhi1slGojsoht3f7UmpQFJvHFxIci3/+4rxcHT+4/PBwA/
	DsQkvzgeqEdnIheDroe9PHKk4nZ0ym4fpb2I7wy1PezxhYle7Rrk8Hj0yS6Qop3C1jO8shIsHELt8
	o5lLQK7RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6voo-0001rK-MY; Tue, 02 Feb 2021 13:34:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6voj-0001pX-Ru; Tue, 02 Feb 2021 13:34:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 521FC64F51;
 Tue,  2 Feb 2021 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612272845;
 bh=Qc82Rs1BO/kqAuHM5fqbYivehM9Zpe/q/Rk+nnanzSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rq0QnvC6dVMTqTSjlBcM3j0Fae/zpps7YBL8rDHFtXiYCHsNkpgUTppGN6K4hqIrb
 edDS1gAiPwbetu6tWSl9Vta07jbjBtsbXymdYJVMz0BAFERuwrWqOoE8JEWlITWUym
 kSBu1Hvj7++Q3KhFAOn7GYFAJRobhWTnQzDhPpgPkDJBb2+vmwtgNEI1rTZfcDLk34
 uH8V0g7QGutVlEEhLHM96YbjM0IeXlx42/IDhP1pbBV96U0TPX8TeQz8BzqVldtr7O
 8bOnNEZUbb1tqrf/yES4UgRiBbNfflqqdQt3ypOMeBlaUFdtPWOuacG/CjCSQXYwjZ
 s0ZTqM/4rso+w==
Date: Tue, 2 Feb 2021 13:33:58 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 00/33] MT8192 IOMMU support
Message-ID: <20210202133358.GA17070@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210201145422.GA15263@willie-the-truck>
 <1612231425.2524.12.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612231425.2524.12.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_083406_042801_3273891E 
X-CRM114-Status: GOOD (  23.15  )
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
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 02, 2021 at 10:03:45AM +0800, Yong Wu wrote:
> On Mon, 2021-02-01 at 14:54 +0000, Will Deacon wrote:
> > On Mon, Jan 11, 2021 at 07:18:41PM +0800, Yong Wu wrote:
> > > This patch mainly adds support for mt8192 Multimedia IOMMU and SMI.
> > > 
> > > mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> > > table format. The M4U-SMI HW diagram is as below:
> > > 
> > >                           EMI
> > >                            |
> > >                           M4U
> > >                            |
> > >                       ------------
> > >                        SMI Common
> > >                       ------------
> > >                            |
> > >   +-------+------+------+----------------------+-------+
> > >   |       |      |      |       ......         |       |
> > >   |       |      |      |                      |       |
> > > larb0   larb1  larb2  larb4     ......      larb19   larb20
> > > disp0   disp1   mdp    vdec                   IPE      IPE
> > > 
> > > All the connections are HW fixed, SW can NOT adjust it.
> > > 
> > > Comparing with the preview SoC, this patchset mainly adds two new functions:
> > > a) add iova 34 bits support.
> > > b) add multi domains support since several HW has the special iova
> > > region requirement.
> > > 
> > > change note:
> > > v6:a) base on v5.11-rc1. and tlb v4:
> > >       https://lore.kernel.org/linux-mediatek/20210107122909.16317-1-yong.wu@mediatek.com/T/#t 
> > 
> > I've queued this up apart from patches 6 and 7.
> 
> Thanks very much for the applying. I'd like to show there is a little
> conflict with a smi change[1] in /include/soc/mediatek/smi.h.
> 
> This is the detailed conflict:
> 
> --- a/include/soc/mediatek/smi.h
> +++ b/include/soc/mediatek/smi.h
> @@ -9,7 +9,7 @@
>  #include <linux/bitops.h>
>  #include <linux/device.h>
>  
> -#ifdef CONFIG_MTK_SMI
> +#if IS_ENABLED(CONFIG_MTK_SMI)   <---The smi patch change here.
>  
>  #define MTK_LARB_NR_MAX   16  <---This iommu patchset delete this line.
> 
> 
> This code is simple. Please feel free to tell me how to do this if this
> is not convenient to merge.

Thanks, but this should be trivial to resolve, so I don't think we need to
worry about it.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
