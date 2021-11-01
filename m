Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC56CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 06:14:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3F2661077
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 06:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3F2661077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6DqL7wwfsCq/o+xdoPBBbXK6o+F05g+sAD/XbhRZ5M=; b=OvIPNRnjkXt71F
	YyDrc+HKPob7n7ZVTvpf1pRFC6BW0JtTIw+BVf2CPR/kW9fwNNhFtA2XjyB0C/OuvTc6EI7B7vkeT
	eJ+sVx+lVjoMRddaanYX4lp2wyyT2NjTTLjkrlYcjhU1soJP/7NIedUOhMBnA0ng3Js7Ki7Sci/8F
	4FnKbC7LGL9aj2hvW/xFRmQ8BQjhOxatZeb58CHp9HoaXJ6ss4Bgt3zVk7g+NMRQ2GAznAp5zpN4G
	tQbxC0qAB6Ud4tgVjeKzXsYhA9K+v5/X0Z1R+FHU+4wmqhIbZe5SFJDcgfMt6Deu9KshM0i1gljvb
	S//eyfFxM72pP8GOkgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhQZs-00FQTC-7v; Mon, 01 Nov 2021 06:13:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhQZn-00FQRg-Ol; Mon, 01 Nov 2021 06:13:50 +0000
X-UUID: e0f2c82914684ba5b70ed54fcae5cf80-20211031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xVKTQc7OPGqCgUqaW4iGQjm4T5FKiIv77uCXhzrHMa4=; 
 b=CRD3SrYzD9KnCvotD60fVLwRPs3gABLwpazhe5BwqAmJyFapMvlYpLvVOGELXnh6zrk+lwEdVzAjoyzad/Lh9QX5ulwJQj9r82SYlNWBeTTS1GfRXcodE2LuyXlqO/NI7Rexm1xpFprvhmMzohJuaFaDLDI1/SBfYa/zfPHdaJw=;
X-UUID: e0f2c82914684ba5b70ed54fcae5cf80-20211031
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 364850643; Sun, 31 Oct 2021 23:13:41 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Oct 2021 23:09:17 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 1 Nov 2021 14:09:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Nov 2021 14:09:14 +0800
Message-ID: <9e4f327511fd85ba8613ec27644fbc29bc4ddb6b.camel@mediatek.com>
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
Date: Mon, 1 Nov 2021 14:09:14 +0800
In-Reply-To: <23b036d1-bdc4-da55-a800-03fc3dabd48e@canonical.com>
References: <20211028055056.26378-1-yong.wu@mediatek.com>
 <23b036d1-bdc4-da55-a800-03fc3dabd48e@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_231347_833947_2C6F196C 
X-CRM114-Status: GOOD (  31.31  )
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

On Fri, 2021-10-29 at 19:35 +0200, Krzysztof Kozlowski wrote:
> On 28/10/2021 07:50, Yong Wu wrote:
> > We add the ostd setting for mt8195. It introduces a abort for the
> > previous SoC which doesn't have ostd setting. This is the log:
> > 
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 0000000000000080
> > ...
> > pc : mtk_smi_larb_config_port_gen2_general+0x64/0x130
> > lr : mtk_smi_larb_resume+0x54/0x98
> > ...
> > Call trace:
> >  mtk_smi_larb_config_port_gen2_general+0x64/0x130
> >  pm_generic_runtime_resume+0x2c/0x48
> >  __genpd_runtime_resume+0x30/0xa8
> >  genpd_runtime_resume+0x94/0x2c8
> >  __rpm_callback+0x44/0x150
> >  rpm_callback+0x6c/0x78
> >  rpm_resume+0x310/0x558
> >  __pm_runtime_resume+0x3c/0x88
> > 
> > In the code: larbostd = larb->larb_gen->ostd[larb->larbid],
> > if "larb->larb_gen->ostd" is null, the "larbostd" is the offset, it
> > is
> > also a valid value, thus, use the larb->larb_gen->ostd as the
> > condition
> > inside the "for" loop.
> 
> You need to write more clearly, what you are fixing here.
> 
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> > Hi Krzysztof,
> > Could you help review and conside this as a fix for the mt8195
> > patchset?
> > The mt8195 patchset are not in mainline, thus, I don't know its
> > sha-id,
> > and don't add Fixes tag.
> > Thanks
> > ---
> >  drivers/memory/mtk-smi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index b883dcc0bbfa..0262a59a2d6e 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -257,7 +257,7 @@ static void
> > mtk_smi_larb_config_port_gen2_general(struct device *dev)
> >  	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_SW_FLAG))
> >  		writel_relaxed(SMI_LARB_SW_FLAG_1, larb->base +
> > SMI_LARB_SW_FLAG);
> >  
> > -	for (i = 0; i < SMI_LARB_PORT_NR_MAX && larbostd &&
> > !!larbostd[i]; i++)
> > +	for (i = 0; i < SMI_LARB_PORT_NR_MAX && larb->larb_gen->ostd &&
> > !!larbostd[i]; i++)
> >  		writel_relaxed(larbostd[i], larb->base +
> > SMI_LARB_OSTDL_PORTx(i));
> 
> The code does not look good. You have already a dereference at line
> 244:
> 
> 	const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];

if larb->larb_gen->ostd is null, larbostd is the offset, e.g. 0x80 in
the log above. thus, we can not use "larbostd[i]" in the "for" loop.

sorry for the unreadable. In this case, is the change ok?

or like this:

-const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];
+const u8 *larbostd = larb->larb_gen->ostd ? larb->larb_gen-ostd[larb-
>larbid] : NULL;

or add a explicit "if":
 if (larb->larb_gen->ostd)
   larbostd = xxx.

Which one do you prefer?

Thanks.

> 
> You are not fixing the NULL pointer dereference.
> 
> >  
> >  	for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
> > 
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
