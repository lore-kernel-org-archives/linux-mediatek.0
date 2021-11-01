Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C9AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 10:41:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B78060F56
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 10:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B78060F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANVkl7+zZ8CNsLZKb/PSczJ/U5T+In5D6dfl7mGEBGk=; b=ggbFR022TNtMu2
	awDGAtNdaQtV123boGAlYE01uMErcHSwnnBaihP+i2A0A5TQQWoFw88pEQkBNbHVLopVe7+NCRLqK
	Av52BOdP6dY08581aqhPO3lwFD96sMnkyWCJH7XoVpkTGzCjrVD65JHGz/udh0mvnN5zyrKPZ5hmX
	fLVWZnzIoaEXNNJD3qy+xMC7ita7Ayhk7SegQ0xqlPEdoWQEFfZjfdoqIXZvOPC1obSWcfp09Zi9W
	XldnT7oL806m1j1xCljqgGQZingBvMRYJzGvo9g00y58sQEqcBQ/gI9Br/exxnbHdeSCk/QkA7Pwk
	qLO8jEf9cumD9YEc4QYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhUkV-00Fyz9-Jl; Mon, 01 Nov 2021 10:41:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhUkQ-00Fyy8-Ex; Mon, 01 Nov 2021 10:41:05 +0000
X-UUID: bff1aa55633b45cf91e14ce04fd6582b-20211101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0yNRMy91uWzpVLqngjuJ072kcSyVfPnPyUeqGNc4EY0=; 
 b=XmxLfBfMTgKVUbsXbSZ52y2ZhsMdHCrO5NS23ZQDEa8JI/mphaIc08rVKsaE/vmTlawY+C8zQltUz9zPR//ZABAZbq2uXvkF+I0ZXBd2LBnBcilDgAZTTIzsxl1lxXDudS7pv82NdmfAq6ic745mnDVh4ksXrAYzQHteZKnr564=;
X-UUID: bff1aa55633b45cf91e14ce04fd6582b-20211101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 868218066; Mon, 01 Nov 2021 03:40:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 03:40:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 1 Nov 2021 18:40:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 1 Nov 2021 18:40:55 +0800
Message-ID: <45cc8d0e25bdb73d8262f59166cac6ea3c80770b.camel@mediatek.com>
Subject: Re: [PATCH] memory: mtk-smi: Fix a null dereference for the ostd
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Mon, 1 Nov 2021 18:40:53 +0800
In-Reply-To: <82835e3d-11a3-32e4-0782-d827a5e3d78e@canonical.com>
References: <20211028055056.26378-1-yong.wu@mediatek.com>
 <23b036d1-bdc4-da55-a800-03fc3dabd48e@canonical.com>
 <9e4f327511fd85ba8613ec27644fbc29bc4ddb6b.camel@mediatek.com>
 <82835e3d-11a3-32e4-0782-d827a5e3d78e@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_034103_989693_A167E9FE 
X-CRM114-Status: GOOD (  45.71  )
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

On Mon, 2021-11-01 at 09:45 +0100, Krzysztof Kozlowski wrote:
> On 01/11/2021 07:09, Yong Wu wrote:
> > On Fri, 2021-10-29 at 19:35 +0200, Krzysztof Kozlowski wrote:
> > > On 28/10/2021 07:50, Yong Wu wrote:
> > > > We add the ostd setting for mt8195. It introduces a abort for
> > > > the
> > > > previous SoC which doesn't have ostd setting. This is the log:
> > > > 
> > > > Unable to handle kernel NULL pointer dereference at virtual
> > > > address
> > > > 0000000000000080
> > > > ...
> > > > pc : mtk_smi_larb_config_port_gen2_general+0x64/0x130
> > > > lr : mtk_smi_larb_resume+0x54/0x98
> > > > ...
> > > > Call trace:
> > > >  mtk_smi_larb_config_port_gen2_general+0x64/0x130
> > > >  pm_generic_runtime_resume+0x2c/0x48
> > > >  __genpd_runtime_resume+0x30/0xa8
> > > >  genpd_runtime_resume+0x94/0x2c8
> > > >  __rpm_callback+0x44/0x150
> > > >  rpm_callback+0x6c/0x78
> > > >  rpm_resume+0x310/0x558
> > > >  __pm_runtime_resume+0x3c/0x88
> > > > 
> > > > In the code: larbostd = larb->larb_gen->ostd[larb->larbid],
> > > > if "larb->larb_gen->ostd" is null, the "larbostd" is the
> > > > offset, it
> > > > is
> > > > also a valid value, thus, use the larb->larb_gen->ostd as the
> > > > condition
> > > > inside the "for" loop.
> > > 
> > > You need to write more clearly, what you are fixing here.
> > > 
> > > > 
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > > Hi Krzysztof,
> > > > Could you help review and conside this as a fix for the mt8195
> > > > patchset?
> > > > The mt8195 patchset are not in mainline, thus, I don't know its
> > > > sha-id,
> > > > and don't add Fixes tag.
> > > > Thanks
> > > > ---
> > > >  drivers/memory/mtk-smi.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-
> > > > smi.c
> > > > index b883dcc0bbfa..0262a59a2d6e 100644
> > > > --- a/drivers/memory/mtk-smi.c
> > > > +++ b/drivers/memory/mtk-smi.c
> > > > @@ -257,7 +257,7 @@ static void
> > > > mtk_smi_larb_config_port_gen2_general(struct device *dev)
> > > >  	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_SW_FLAG))
> > > >  		writel_relaxed(SMI_LARB_SW_FLAG_1, larb->base +
> > > > SMI_LARB_SW_FLAG);
> > > >  
> > > > -	for (i = 0; i < SMI_LARB_PORT_NR_MAX && larbostd &&
> > > > !!larbostd[i]; i++)
> > > > +	for (i = 0; i < SMI_LARB_PORT_NR_MAX && larb->larb_gen-
> > > > >ostd &&
> > > > !!larbostd[i]; i++)
> > > >  		writel_relaxed(larbostd[i], larb->base +
> > > > SMI_LARB_OSTDL_PORTx(i));
> > > 
> > > The code does not look good. You have already a dereference at
> > > line
> > > 244:
> > > 
> > > 	const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];
> > 
> > if larb->larb_gen->ostd is null, larbostd is the offset, e.g. 0x80
> > in
> > the log above. thus, we can not use "larbostd[i]" in the "for"
> > loop.
> > 
> > sorry for the unreadable. In this case, is the change ok?
> 
> No, it's ok, I did not check the type of ostd and it's confusing a
> bit
> that it is defined as a pointer to an array but you actually use it
> as
> array of pointers to 32-elemenet arrays... Anyway I was mistaken and
> there will be indeed no dereference at the assignment, but for code
> clarity I would still prefer to do the check earlier, so:
> 
> > 
> > or like this:
> > 
> > -const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];
> > +const u8 *larbostd = larb->larb_gen->ostd ? larb->larb_gen-
> > ostd[larb-
> > > larbid] : NULL;
> 
> Although I think now the proper type should be explicit.
> mtk_smi_larb_mt8195_ostd is an 28-element array of
> SMI_LARB_PORT_NR_MAX-element u8 arrays, therefore struct
> mtk_smi_larb_gen should be:
> 	const u8 (*ostd)[][SMI_LARB_PORT_NR_MAX];

mt8195_ostd only is a 2 dimensional array,
static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX];

If using this, it will cause build fail:

.../drivers/memory/mtk-smi.c:359:23: error: initialization from
incompatible pointer type [-Werror=incompatible-pointer-types]
  .ostd              = mtk_smi_larb_mt8195_ostd,
                       ^~~~~~~~~~~~~~~~~~~~~~~~

More background about this 2 dimensional array:
The platform have many larbs(up to MTK_LARB_NR_MAX), each a larb have
many ports(up to SMI_LARB_PORT_NR_MAX). In the
function(*_config_port_gen2_general), we will update the value for each
a port inside a larb, thus we need a pointer point to the line of that
larb.

If I miss something, please tell me. or how to manage this will be
better.

Thanks.

> 
> Right?
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
