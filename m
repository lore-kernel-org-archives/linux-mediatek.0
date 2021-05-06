Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250D8C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 06:29:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892AA613E3
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 06:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 892AA613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jpxOV0k9HrVfHy1VvocCGo+AY8+FXZJznKkfrWSn6SU=; b=gojh/vWn9sEtzwyAjtxc3Py98
	ccWdeInFyaKfDUq1ZLaHQ8aUrylM5ZmOKHXI9ZoooYdO8613r/VjNSfo+B4JG5BTD/QLSF5zP59DS
	HX+R2/kNgXEtjsplfNbx9JZ8yTqd0X5XvkSn9P+xph2WU2rNham5ITWEuYN/3C3W/2mQUu8KzMLg3
	U9Y0cz316re3Bnk3ZQ9AXC2L9jPRYzYeo4uoTQeQVFaDZ2uzmWf7DqO95995yxmN7YDo7L27LLDld
	kG1rrx8o+4uiNaMNTsl8T4np/10q68KRUTTs+vBhppykT29By+yUXzMgm6Fr08dBC1vRITrYzH5hP
	u4XGa5kzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leXVN-003LcJ-4V; Thu, 06 May 2021 06:29:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXVI-003Lbu-NI; Thu, 06 May 2021 06:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=8LYM9vWTj1GDWM/BgYXdn3ciSia7faNxzkY8cLpYr48=; b=TgJEZdaY5diJ7f+OBJ5uwqEFq9
 ydDypYU3jvrMqeATyyTFZakbu0rprpMydiW+cVOtL/BnhwEweIaQ71+Ef/0zoETIseSo7/RHf4HFC
 fmTRAgtjUG5iWN2FkOafhTq8ilkCwku1xhENPFVey9zfIUfcmgiDA27HDGXkShH3xvQ2NwdOZSHJZ
 jrNJWWRGCmc0Zpe7qSEKLG2CwHoUHe4FkbwPbCmAYnASMW3nCsan+Zzpwect2h0jIDyAIvXu5LPLk
 XVxeCnp/jzZPc5rAzEFTV9Z1MgVwy21MQYW9nYZl3AtRYmCZm/ps1a66ERUuXa7oI5Y8qbILjamCT
 NdbvJm9g==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXVE-005dOL-Fo; Thu, 06 May 2021 06:28:53 +0000
X-UUID: f66317b1e1444f148bf8a68bc4e23af7-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8LYM9vWTj1GDWM/BgYXdn3ciSia7faNxzkY8cLpYr48=; 
 b=hZT2/mJR2uj36bgeB/0YHlodag14uCkweJRJw4vU/BXdgEWA7NB6EOS817eIr2PAj3/nFngf9qJi+PPbYUeGpgz7Xn03Qy/OBAf5o1w05hjTNUnvkM/IV03edm8SpaS8cjbpSI8wKXlb41nDYkXCK41LVRPEakx26IQjRVAATog=;
X-UUID: f66317b1e1444f148bf8a68bc4e23af7-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1297630933; Wed, 05 May 2021 23:28:46 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 23:28:44 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs06n2.mediatek.inc
 (172.21.101.130) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 6 May 2021 14:28:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 May 2021 14:28:40 +0800
Message-ID: <1620282520.10796.2.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] usb: xhci-mtk: use bitfield instead of bool
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ikjoon Jang <ikjn@chromium.org>, Eddie Hung
 <eddie.hung@mediatek.com>
Date: Thu, 6 May 2021 14:28:40 +0800
In-Reply-To: <YIuxy9OtlNzq7zwM@kroah.com>
References: <20210430071532.51794-1-chunfeng.yun@mediatek.com>
 <YIuxy9OtlNzq7zwM@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 288AA8889CB735784A0D9ABA8A6F83DE47BCAE8646196241C5A92F49A7D2FC5E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_232852_547810_7A7A19F4 
X-CRM114-Status: GOOD (  19.43  )
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

On Fri, 2021-04-30 at 09:29 +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 30, 2021 at 03:15:30PM +0800, Chunfeng Yun wrote:
> > Use bitfield instead of bool in struct
> 
> That says what you did, but not why you did it.
> 
> Why?
It's suggested by "Using bool" in coding-style.rst, I'll add it
> 
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/host/xhci-mtk.c | 2 --
> >  drivers/usb/host/xhci-mtk.h | 8 ++++----
> >  2 files changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index b2058b3bc834..2548976bcf05 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -495,8 +495,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> >  			goto put_usb2_hcd;
> >  		}
> >  		mtk->has_ippc = true;
> > -	} else {
> > -		mtk->has_ippc = false;
> 
> Why did you remove this chunk?  That is not described in the changelog
> at all.
Will add it, thank you

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
