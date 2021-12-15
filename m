Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF769C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 05:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkJbv6IMDkky58udtMwUCNKdIP2cXi+2W0FFpRFzahU=; b=3Vqskm/AMnMVN8
	jdjE3FA9Vb5SnEJfz6APjx94orhg1kj+PF+olJJKi+ZELL7+9MRpj7thkhGpKfkJ6kKYy+p8RJ47z
	yVJbS1m/Meqnz6Db89IPXI0cjFF/YXRcCm7gh4bQEp/FPzi7swSHUpN0Sxl5FKYqEUiCymxcduH8x
	IRVI1MhhKk1WiTxNMZdg8fUoPv2d9qqo895IaC6gJR+6RDMt9EbzK2c/K0BcIwerPPVvsTrTSGydo
	ZFWT57etSz0S6jsqHExz8cjV+k6igyCsaQHB7qPgMH8iLMOd+k9ksez7Ms6nfaNW6/qpDFOtINYZQ
	otFy1NBxPclWWvRXqA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxN22-00GjJo-TE; Wed, 15 Dec 2021 05:40:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxN1z-00GjJ2-UN; Wed, 15 Dec 2021 05:40:49 +0000
X-UUID: 0f6cb61a1bbb4158a91d011912c7c502-20211214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fQyB/k5+959W86o62lxhCCHtYj/30tNKE54N0uGTZm0=; 
 b=PgNs44NgI8OopNKxI9B4x+q2ftTqiI/Ixj8lyl65kc+FP0GHtS2FAak1Re7d2Nk37cwS+HbWlRTNVtxMzR8l5aOZqeqQrPwKKJRM5J3Z2ikQE3qZmtIA9Qa5xqt+vOap/4cckdbAR523DGkGCp2i2l52ImEEdEYYLoQG0udMAeE=;
X-UUID: 0f6cb61a1bbb4158a91d011912c7c502-20211214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1296204395; Tue, 14 Dec 2021 22:40:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 21:30:45 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 15 Dec 2021 13:30:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Dec 2021 13:30:43 +0800
Message-ID: <dee32e154493788f8860f8495f2ed8ccd2ebc2ba.camel@mediatek.com>
Subject: Re: [SPAM][PATCH] iommu/mediatek: Validate number of phandles
 associated with "mediatek,larbs"
From: Yong Wu <yong.wu@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <iommu@lists.linux-foundation.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>, "kernel
 test robot" <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Dec 2021 13:30:45 +0800
In-Reply-To: <ade9292c-38ee-14b3-a8c4-49cfc7a350e6@roeck-us.net>
References: <20211210205704.1664928-1-linux@roeck-us.net>
 <ebf58066a131f92c68e83a1ef56b88f435fa0d08.camel@mediatek.com>
 <ade9292c-38ee-14b3-a8c4-49cfc7a350e6@roeck-us.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_214048_023483_0060E592 
X-CRM114-Status: GOOD (  68.19  )
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

On Tue, 2021-12-14 at 07:02 -0800, Guenter Roeck wrote:
> On 12/13/21 11:31 PM, Yong Wu wrote:
> > On Fri, 2021-12-10 at 12:57 -0800, Guenter Roeck wrote:
> > > Since commit baf94e6ebff9 ("iommu/mediatek: Add device link for
> > > smi-
> > > common
> > > and m4u"), the driver assumes that at least one phandle
> > > associated
> > > with
> > > "mediatek,larbs" exists. If that is not the case, for example if
> > > reason
> > > "mediatek,larbs" is provided as boolean property, the code will
> > > use
> > > an
> > > uninitialized pointer and may crash. To fix the problem, ensure
> > > that
> > > the
> > > number of phandles associated with "mediatek,larbs" is at least 1
> > > and
> > > bail out immediately if that is not the case.
> > 
> >  From the dt-binding, "mediatek,larbs" always is a phandle-array. I
> > assumed the dts should conform to the dt-binding before. Then the
> > problem is that if we should cover the case that someone
> > abuses/attacks
> > the dts. Could you help add more comment in the commit message?
> > something like: this is for avoid abuse the dt-binding.
> > 
> 
> This doesn't have to be an abuse or attack. It can simply be an error
> by the person who wrote the devicetree file. Sure, bugs or lack of

A minor question: If someone wrote error data that don't conform to the
dtbinding, the error result is expected. He should fix that problem,
right? If we could avoid abort and show error message at the beginning,
it's better of course.

> error checking can often be used for attacks, but that doesn't mean
> that all bad data is an exploit or attack.
> 
> > > 
> > > Cc: Yong Wu <yong.wu@mediatek.com>
> > > Cc: Tomasz Figa <tfiga@chromium.org>
> > > Fixes: baf94e6ebff9 ("iommu/mediatek: Add device link for smi-
> > > common
> > > and m4u")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > ---
> > >   drivers/iommu/mtk_iommu.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/iommu/mtk_iommu.c
> > > b/drivers/iommu/mtk_iommu.c
> > > index 25b834104790..0bbe32d0a2a6 100644
> > > --- a/drivers/iommu/mtk_iommu.c
> > > +++ b/drivers/iommu/mtk_iommu.c
> > > @@ -828,6 +828,8 @@ static int mtk_iommu_probe(struct
> > > platform_device
> > > *pdev)
> > >   					     "mediatek,larbs",
> > > NULL);
> > >   	if (larb_nr < 0)
> > >   		return larb_nr;
> > > +	if (larb_nr == 0)
> > > +		return -EINVAL;
> > 
> > Just assigning the larbnode to NULL may be simpler. In this case,
> > it
> > won't enter the loop below, and return 0 in the
> > of_parse_phandle(larbnode, "mediatek,smi", 0).
> > 
> > -       struct device_node      *larbnode, *smicomm_node;
> > +       struct device_node      *larbnode = NULL, *smicomm_node;
> > 
> 
> It is an option, but it would need to be explained and would not be
> as simple as it looks. And, yes, it would result in unnecessary code
> execution.
> 
> Why does it need to be explained ? I spent quite some additional
> time with the code trying to understand _why_ it works, and we should
> make sure that others don't have to spend that time.
> 
> Anyway, that additional time made me find additional problems with
> the code.
> 
> The for loop below assigns larbnode to the last node it finds.
> However, that node can be disabled.
> 
> 		if (!of_device_is_available(larbnode)) {
>                          of_node_put(larbnode);
>                          continue;
>                  }
> 
> Is such a disabled larbnode, if it is the last one, the node to use
> when looking for "mediatek,smi" ?
> 
> Also, there is
> 
> 	ret = of_property_read_u32(larbnode, "mediatek,larb-id", &id);
>          if (ret)/* The id is consecutive if there is no this
> property */
>                  id = i;
> 
> There are two problems with this code. First, neither i nor id are
> range
> checked, but used later in
> 
> 	data->larb_imu[id].dev = &plarbdev->dev;
> 
> That means a devicetree with a bad value for "mediatek,larb-id"
> or more than MTK_LARB_NR_MAX larb nodes will result in writes after
> the end of struct mtk_iommu_data.
> 
> On top of that, the comment states that the nodes are consecutive if
> there
> is no "mediatek,larb-id". However, that isn't really the case if
> there
> are disabled nodes. If there are disabled nodes, there will be a gap
> in
> larb_imu[]. I don't know if that matters; if it doesn't, there should
> be
> a comment about it in the code.
> 
> Last but not least, it would probably make sense to explain what the
> "last"
> larb node is expected to be in more detail. It is the last larb node
> in
> the devicetree file, but not the one with the highest id, and not
> (necessarily) an enabled one. For example, in
> arch/arm64/boot/dts/mediatek/mt2712e.dtsi, the code would pick
> <&smi_common0> even though <&smi_common1> is associated with a higher
> larb id.
> 
> One could of course argue that this all doesn't matter because it
> would
> suggest that the devicetree data is bad, but it is common practice to
> validate
> devicetree data and not just blindly accept it. One could also argue
> that such bad data would be an "attack", but, again, we don't know
> that.
> 
> In summary,

Thanks very much for your time to check here. All the issues are
introduced by the values from dts are untrusted. The detail platform
informations are replied below.

> 
> - The check I introduced should probably be something like
> 
> 	if (larb_nr == 0 || larb_nr > MTK_LARB_NR_MAX)
> 		return -EINVAL;

OK. Add a "else" to show it is a block with the "if" above?

        if (larb_nr < 0)
             return larb_nr;
        else if (larb_nr == 0 || larb_nr > MTK_LARB_NR_MAX)
             return -EINVAL;

> 
> - It needs to be clarified if larbnode to use for finding
> "mediatek,smi"
>    is indeed always the last one, even if it is disabled. If so, we 

We could find the "mediatek,smi" with any available larb. Of course it
should not be a disabled one. The code using the last larb is for
reusing the variable "larbnode".

> should
>    probably also handle the situation that of_node_put(larbnode); was
> called
>    on that larbnode. Alternatively, if the last larb node to use is
> the last
>    _active_ larb node, we'll probably need a separate variable to
> save that
>    larb node pointer for later use.

A new variable is ok.

> 
> - It needs to be clarified if larb_imu[] may have gaps if there are
> disabled
>    larb nodes and "mediatek,larb-id" is not specified. If so, there 

Yes. It may have gaps. the commit message of this patch may be helpful.

50fa3cd33f9d ("dt-bindings: mediatek: Add binding for mt2712 IOMMU and
SMI")

> is still the
>    problem that 'i' and a previous value of "mediatek,larb-id" may be
> identical
>    [ eg the first node provides mediatek,larb-id = <1> and the second
> node
>      doesn't provide "mediatek,larb-id" ]

This case did don't meet my expectation. OK, then we add a checking?
like:

   if (data->larb_imu[i].dev) {
         dev_err(dev, "the larb %d exist.", i);
         return -EEXIST;
   }         

> 
> - "id" should be range checked.

It should be [0, MTK_LARB_NR_MAX).

> 
> - The meaning of "last" larb node to use when looking for
> mediatek,smi should
>    be explained in more detail.

We could use any available larb node to find mediatek,smi.

Their "mediatek,smi" node must be the same. OK, In this case, they are
possible different. We should add a checking: return -EINVAL if they
are not same.

> 
> Once we have determined the correct handling of all those situations,
> I'll
> be happy to send another revision of this patch (or possibly multiple
> patches).

Appreciate for help enhance the safe here. I will test it.

> 
> Thanks,
> Guenter
> 
> > >   
> > >   	for (i = 0; i < larb_nr; i++) {
> > >   		u32 id;
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
