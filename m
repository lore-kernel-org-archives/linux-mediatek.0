Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80506C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 06:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhrY/dDcZZYVrnQnMkixkzNDQQRUIYFQ8j/GWAR5CCE=; b=pndQvstTZhP1q9
	xUHZGekMGat02mMrmGOjn1MVmsQbSMQO3Qlz77Py/W2B6rjNWkte7gTHibwntz5+wyF7/mjvwFzRX
	1bVEH12OrryrYnnRfeykxF6YsAH7v+svFjhsinHYW5D4Z696TFd3iP1jslLeEFi4Qzp6PGxXvXMnY
	svozf2DEsagiK/Xqkz6/VWVpvByLZO1+dVrPtzvY2GCk7hASKJBaVFAeYY28i3tDoUBUUC+WMQvAF
	OI0aEp3pZdFNComnyFH5AZEWWHeHc64RFqMlsEzv1QYOHni/ZTVbK45xb/Qn9LIz7AqpFFjyMWCPk
	peM0bJdpMpMrckjtq/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mplvU-0040JW-4l; Wed, 24 Nov 2021 06:38:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mplvF-0040IM-HD; Wed, 24 Nov 2021 06:38:28 +0000
X-UUID: 3fd42da25cfd4191ab08e4b54f213d19-20211123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o8yAD43f7Yz8PJZDUhlY+smBs0eLQyqXHTEwNYJfPik=; 
 b=HkkCjWwDSUMjeXQBupvQ+cjRExZxoI4T911DAURMyNtWhlXCi3QVvtDVKNQCJ0cbeEwWmREPmNsJ27k16PBmqiKe76usJ3ahZRpZZLaoajlodgwd+wfQn/muwbAOVeDrE0nIeNkQ72jR/FccoL4N0CPwfH22L65/BecSMX37bHs=;
X-UUID: 3fd42da25cfd4191ab08e4b54f213d19-20211123
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1704233352; Tue, 23 Nov 2021 23:38:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Nov 2021 22:38:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 24 Nov 2021 14:38:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Nov 2021 14:38:17 +0800
Message-ID: <26704c3979b1c8936ab14d9ea7704166aca66887.camel@mediatek.com>
Subject: Re: [RFC PATCH] soc: mediatek: Add support always on flag
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 24 Nov 2021 14:38:17 +0800
In-Reply-To: <e6ebf764-b94a-7b77-df17-1cb8e4b14635@collabora.com>
References: <20211102072058.4107-1-chunfeng.yun@mediatek.com>
 <e6ebf764-b94a-7b77-df17-1cb8e4b14635@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_223826_721593_E176ED72 
X-CRM114-Status: GOOD (  27.58  )
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

On Thu, 2021-11-11 at 14:56 +0100, AngeloGioacchino Del Regno wrote:
> Il 02/11/21 08:20, Chunfeng Yun ha scritto:
> > There is a t-phy shared by PCIe and USB3 on mt8195, if the t-phy is
> > used by PCIe, when power off its mtcmos, need software reset it
> > (workaround way, usually hardware do it, but has an issue on
> > mt8195),
> > but it has side effect to USB2 phy(works with USB3 phy to support
> > USB3.2 Gen1), so add support GENPD_FLAG_ALWAYS_ON flag, and make
> > its
> > power always on;
> > Another reason is that USB3.2 Gen1/2 need keep power always on when
> > support runtime-pm due to hardware limitation until now;
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mt8195-pm-domains.h | 2 +-
> >   drivers/soc/mediatek/mtk-pm-domains.c    | 2 ++
> >   drivers/soc/mediatek/mtk-pm-domains.h    | 1 +
> >   3 files changed, 4 insertions(+), 1 deletion(-)
> > 
> 
> Hello Chunfeng,
> what are are the side effects on the USB2 PHY? Can you please expand?
Sorry for later reply, I missed this message.

the side effect on u2 phy is that it will cause u2 phy power off and
cause other issues, e.g. if there is a device plugged in u2 port, it
will disconnect, more over it will not work until reboot platform.

> 
> Also, wouldn't it be possible to also reset the USB2 PHY when
> resetting the t-phy
> in order to get it back up and running?
No, the usb driver don't reset or reinit phy after probe;

> 
> Moreover, as for the USB3.2 hardware limitation... I would say that
> this is more
> like something that has to be accounted for in the USB driver,
> instead of the PM
> domains driver... unless there's some reason that stops you from
> doing that?
Usb driver itself can't handle this case. but power domain's driver can
handle it easily.

> 
> Thanks,
> - Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
