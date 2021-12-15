Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A37C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 05:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fb2NrVtRKFz0u2Z2UaMBu2f6IhFTgZ9MH6uYs/u0UrI=; b=LJ+NxN+Z+ZbU5S
	U3eyrig249gUqsZzf2PBmryZ4eGE7bulAH02PcJTlTN6PrnFbVWEfZp3PQO1seBwC2WvTto4PCvHe
	5oUgl1p0rqqDj3RGC4jLtMse6hOEFgrMbDLl69VZV/Uzz8DY30jXGFFBCiec06WqNhJgn/sLcLrYI
	7iUbqA9LDgenEsdKynbkO0rVxr/U6+znl3TaHR4jXnlEHHcj1i/dV2rXTcFEMI7Z++AK27pRwPD9r
	1SQBqaeVk1oi3QfMXVZl102aWKD+xIdaJ6fA3BNcXyN/Dhs8QiQMasi7/zdrzFlBwWs05cjlXeZlG
	hbmluqhVaadxZDtEt7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxMst-00GiTy-1N; Wed, 15 Dec 2021 05:31:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxMsp-00GiSh-5e; Wed, 15 Dec 2021 05:31:20 +0000
X-UUID: c544a9f175d841f8b5899d9755aed852-20211214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=i9I5Pq76XGu923LV95G8PHzGBpoVXt0t8Crp714UgVY=; 
 b=F4c+c9YhOzogtCX22SXrhBME+BYF92iL9d8hxXAmAWQZGgSgw5nsR4ZHkHS5PGNfhedQdcUSkZctNPskYE3vF07ESCWBnz9IwU3HXGVXvDBqJDXpBB3971r0dNwFRLkWYwJAn3ztbbzBm6vISasWoj8fKHUldmBi8LQapl115Ic=;
X-UUID: c544a9f175d841f8b5899d9755aed852-20211214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 555023986; Tue, 14 Dec 2021 22:31:15 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 21:31:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 15 Dec 2021 13:31:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Dec 2021 13:31:11 +0800
Message-ID: <2d66660f3507a50af618e109b7f41f411398b2ef.camel@mediatek.com>
Subject: Re: [SPAM][PATCH] iommu/mediatek: Validate number of phandles
 associated with "mediatek,larbs"
From: Yong Wu <yong.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Guenter Roeck <linux@roeck-us.net>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, kernel test robot <lkp@intel.com>, "Dan
 Carpenter" <dan.carpenter@oracle.com>
Date: Wed, 15 Dec 2021 13:31:13 +0800
In-Reply-To: <YbheCEbOS48Owcht@google.com>
References: <20211210205704.1664928-1-linux@roeck-us.net>
 <ebf58066a131f92c68e83a1ef56b88f435fa0d08.camel@mediatek.com>
 <YbheCEbOS48Owcht@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_213119_241029_CDD1C1B6 
X-CRM114-Status: GOOD (  37.10  )
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

On Tue, 2021-12-14 at 17:04 +0800, Tzung-Bi Shih wrote:
> On Tue, Dec 14, 2021 at 03:31:25PM +0800, Yong Wu wrote:
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
> > From the dt-binding, "mediatek,larbs" always is a phandle-array. I 
> > assumed the dts should conform to the dt-binding before. Then the
> > problem is that if we should cover the case that someone
> > abuses/attacks
> > the dts. Could you help add more comment in the commit message?
> > something like: this is for avoid abuse the dt-binding.
> 
> How could you make sure dts conform to dt-bindings in runtime?  Code
> shouldn't rely on the assumptions but try the best to prevent any
> abuse/misconfigured/malicious cases especially if the assumptions are
> controllable by other parties.
> 
> Taking this case as an example, of_count_phandle_with_args() could
> return 3 types of values.
> 1. Negative: an error, it is already handled in the original code.
> 2. Positive: normal case, it falls down to the rest of code.
> 3. Zero: it still falls down to the rest of code, however, some
> variables won't be filled.
> 
> The code should handle all of the above types.
> 
> > > diff --git a/drivers/iommu/mtk_iommu.c
> > > b/drivers/iommu/mtk_iommu.c
> > > index 25b834104790..0bbe32d0a2a6 100644
> > > --- a/drivers/iommu/mtk_iommu.c
> > > +++ b/drivers/iommu/mtk_iommu.c
> > > @@ -828,6 +828,8 @@ static int mtk_iommu_probe(struct
> > > platform_device
> > > *pdev)
> > >  					     "mediatek,larbs", NULL);
> > >  	if (larb_nr < 0)
> > >  		return larb_nr;
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
> 
> Setting larbnode to NULL doesn't make sense to me.  It wastes some
> more instructions.  If the code can exit earlier, why does it need to
> call another of_parse_phandle()?

Yes. it wastes more instrustions. But this function is only called in
the probe. it isn't called so often. Guenter has other suggestions.
Let's discuss in that thread.

Thanks very much for your comment.

> 
> Also, it adds another dependency between the code blocks.  What if
> someone move the code blocks without awareness of the dependency?
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
