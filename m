Return-Path: <SRS0=ANTn=KR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2141C2B9F2
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 May 2021 09:51:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CBC96102A
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 May 2021 09:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CBC96102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFQM3wFRyNdvFBZAYwTLpPin8ZuK+nbeldVHM/f2Rig=; b=LrNEFzHR1R3WSv5pzVdYLa0AOa
	sUAsBQXhKtx1XCDhVgCkAuv9XgozGpeIBK1hbdH+e78T0hHk7R5661v00mUChrRjPnPpFe3JEeSIm
	Sg+icHjucBNwkNYBmYJKDCfDgAVNwwlrzcNStAMABcZhi8Vv/eJ+/TSkUmmfZf1opC/3bLifwiWyi
	QbxvtuKTr2PVymrQ0XztTfISTHGmNrTWJuZh9GYK+Pxm416tv1YlcFdXqXUq0ckLPBqQjPsIpSsOr
	/RZ8DDrltR/4i4xwgj5XUb4Up6GJVAyC17c2eZrI2h3E0gWt6/P/zeiyJR/yq6ZIwRbPf4Ns5rpTF
	1F3lmjaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkOID-002F1m-Fx; Sat, 22 May 2021 09:51:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkOI5-002F0W-4L; Sat, 22 May 2021 09:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=aaYsqkqjYTO4Peo/NYX1DMDat+z2Uuc/qMNttr4MZeA=; b=ITOqAw8nn/VYxbrgtTH6XxsQV8
 zuBl5HrMG4gIvRIUcmHj5foLCl49Qdt8fABiEGgaUvoB9SOEpRO6PsgNLzV7ghw6WPd304MfMEb55
 XB2ruowi4HoKoqCqyueBZqEuOE89Dbglf4+KMeQCVYh3BkhzOUpAhDo8Z22Rd/BUNwvjv1GUwzRtF
 A5G+e6Be0oU8g23OrBO4iv8Rncd1g+e8Oq6MkjMvtPw5T/AJRDEvs0Px/Mg2c8XtNLuyTcSE05J3J
 CJY/pRkRakssFOEape1M6m4M3YLY+1wz25D61CLxDt2eE66Ub9iDyKboPb2z4oJHkUMe3cqaDlheg
 tvipf8/g==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkOHu-0004Iv-DI; Sat, 22 May 2021 09:51:27 +0000
X-UUID: 2d5dd32ab7644bf7841dd5a4efd4784c-20210522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aaYsqkqjYTO4Peo/NYX1DMDat+z2Uuc/qMNttr4MZeA=; 
 b=A92OtWax3YtlXGlO7tVX6Q8xpWr3Ng4rLkSSc5Z03cxeqN9V4yZMpRvuRZkU0VSjYUe4Z3ZE+p3nJH0JSb7OGNWfruB00x3NEgqLaEx+6CXh2yTsld57ffud8mhje57Mhvdw+KMlEVtG015Dh2WWNTKZYYY5WzbXNFc3qMUef6w=;
X-UUID: 2d5dd32ab7644bf7841dd5a4efd4784c-20210522
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 677813731; Sat, 22 May 2021 02:51:14 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 May 2021 02:51:12 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 22 May 2021 17:51:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 May 2021 17:50:59 +0800
Message-ID: <1621677059.2894.14.camel@mhfsdcap03>
Subject: Re: [PATCH v4,3/6] media: mtk-vcodec: Support 4GB~8GB range iova
 space for venc
From: Yong Wu <yong.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Irui Wang <irui.wang@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Maoguang
 Meng" <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, "Fritz Koenig"
 <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 <linux-media@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sat, 22 May 2021 17:50:59 +0800
In-Reply-To: <CA+Px+wXkn2ih0JdgKBOoHZU1=QqO=vE1MAP5tauHvRe=rtjg7g@mail.gmail.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-4-irui.wang@mediatek.com>
 <CA+Px+wXkn2ih0JdgKBOoHZU1=QqO=vE1MAP5tauHvRe=rtjg7g@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D209C5D26ECC073ABCE984EEC7E77BD5AD0A4CF1B0D8E0187A280BECBD0F64C82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_025124_234204_0B6D8AF3 
X-CRM114-Status: GOOD (  14.07  )
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

On Fri, 2021-05-21 at 16:06 +0800, Tzung-Bi Shih wrote:
> On Fri, May 21, 2021 at 3:02 PM Irui Wang <irui.wang@mediatek.com> wrote:
> > +       if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> > +               dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> > +
> 
> From your previous dt-bindings patch[1], it has 4 banks.
> > 0~4G; 4G~8G; 8G~12G; 12G~16G.
> 
> But, the code treats it as a boolean.  I.e. 0~4GB if non-existent;
> otherwise, 4GB~8GB.

Here DMA_BIT_MASK(34) means dma address support 34bits(16GB).

The code is ok for me. Only the commit message should not say 4G-8G. it
could be something like:

Use the dma_set_mask_and_coherent helper to set venc DMA bit mask to
support 34bits iova space(16GB) that the mt8192 iommu HW support. Whole
the iova range separate to 0~4G/4G~8G/8G~12G/12G~16G, Regarding which
iova range VENC actually locate, it depend on the dma-ranges property of
the venc dtsi node.

> 
> [1]: https://patchwork.linuxtv.org/project/linux-media/patch/20210521070139.20644-3-irui.wang@mediatek.com/
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
