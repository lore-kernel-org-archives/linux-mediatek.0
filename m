Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFF9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 01:17:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3728E60F11
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 01:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3728E60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QpzRC9k3/1ANM/DzRIx6TPNs/1YGMA50eOvX/Ua4t4=; b=0m8jpRDEjyOwky
	ScPwSPIKt4enb4PvyJ5+DSI7tH3/DOmdIcRHzBywr1AJRj5mUoq9afD4dicnlOOBwKgmtwUuE/1/r
	p2zwHKUtYX6E84H2vixXJYb3WaTnT6Pl20BAY/BzeppKiCw1ozvWLLHBa5i3oowJlG9Mcir+88Zoc
	r4RlWCCkd0hvTDf0Ma0byNnPEzkn2dgu/DYczsGeFyiOpo5Ouljl+qoMvIlfNMcY/ykWxcunDNH3x
	gY7AeQ+PX1la/dLD3/3LvkYqqwxElzMRqQeUtLuEaFt7fefzfyVmbO6v/yhoPifQOXSQhI+i6UGg0
	XHbhZWOm2PBW5cOKy0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maStW-00EY5k-Dx; Wed, 13 Oct 2021 01:17:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maStS-00EY2Q-4E; Wed, 13 Oct 2021 01:17:20 +0000
X-UUID: 91ab6888cfca439793e9e3792c4233db-20211012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t7k1wvNec9YBr9g8AUC0Ax/3BfSKfgXeVcp0+CHknXw=; 
 b=gSOSFIYR15LI3h2XykYFJbMAFA/8uSLSYAH7h1HmaTrx0h7TEpp+GI6pIFqlQ86p6Xa0Uem7ynBZ/hWAK+9BA/FxZ2Sw4p0bw3key4huIN1MZ2KvAirdIJMfVimcr6ogGC+DzbCH9PKR6OPAXy0AXpvUlNG4cWF6MXHATcocpaI=;
X-UUID: 91ab6888cfca439793e9e3792c4233db-20211012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 502663811; Tue, 12 Oct 2021 18:17:15 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 18:17:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Oct 2021 09:17:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Oct 2021 09:17:09 +0800
Message-ID: <b3fa00e8b66658e120279e37261cbdb5db7edf52.camel@mediatek.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 13 Oct 2021 09:17:13 +0800
In-Reply-To: <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
 <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_181718_277642_2821620B 
X-CRM114-Status: GOOD (  17.32  )
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

Hi Ezequiel,

Thanks for your feedback,

The driver can work well now according to your advice with
of_platform_populate interface.

In order to separate parent node with children node, parent node is
master device, children node is component device.

The master and component are registered platform device.


Could you please help to review the patch again when you are free:

https://patchwork.linuxtv.org/project/linux-media/cover/20211011070247.792-1-yunfei.dong@mediatek.com/

Best Regards,
Yunfei Dong

On Sun, 2021-09-26 at 11:51 -0300, Ezequiel Garcia wrote:
> On Sun, 26 Sept 2021 at 05:27, yunfei.dong@mediatek.com
> <yunfei.dong@mediatek.com> wrote:
> > 
> > Hi Ezequiel,
> > 
> > Could you please help to give some feedback when you are free for
> > iommu
> > limitation?
> > 
> 
> How about you work on the architecture I originally suggested?
> 
> As the saying goes, talk is cheap, show us the code.
> So let's see the code and let's discuss the limitations
> with the code.
> 
> > According to google's suggestion, it's better not to use v4l2 async
> > also.
> 
> Hum? I haven't seen such objection on the mailing list.
> 
> Thanks,
> Ezequiel
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
