Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B82CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 12:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIz5pI8aXeY99ocGgTrn5R6vOYm5KMtSOzGpC0AaX1g=; b=P0xDL5oF8uWBZG
	sUH0LPEAWVzxiXUb0GWfOf2EFTqt6oKvt4jDrfaiiNhf3rVPNh1I75tzPW26RHdos2iKaa2qq1hxN
	CKXQxvsIu42xKSvCPotY2sP551XmZNAowHOhdnZjg/v8h1FLfjOqjZRH+V+/Xf0vX6whjNSs/ndpS
	j3eLaVrkKYvdjzpDtkcxghKHLLRRaDjAv29Cj1X1glXgyoCkakFJvkQKnYN0G36cC0+eKts5YfQ3+
	G8K3ofkNF8n0Ek7sVnoTquLq9RzLBwjzLvkxppBtttjRnLZhPnHW2TOFL4RBvh/fK++JWklYW1hsB
	kG0iwSRwtsVnDpGnoFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKftx-00ARue-1w; Thu, 17 Feb 2022 12:28:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKftk-00ARqs-3o; Thu, 17 Feb 2022 12:28:37 +0000
X-UUID: 6fbafdba43f64b2b9f018cfb484bce5b-20220217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W8FJpTP1eL9b2bWvHi12EO8m47L4MBOxSD0YdAu1jQo=; 
 b=qGhQ4Peppoe0hsxdS4lM/3tWLjRPoRWNsegwooZYGoJGRdqCga3xdwYGAN7Oywg2NyqWFLXlF0kMiFfsMx28+uM8CbmAVkLvA38hPX668dWrh1w+BfBUVrdfZjNMklQeUQpMyv5lniec1uguQO/OLmOPA3P5f/SP8naOzkys3A4=;
X-UUID: 6fbafdba43f64b2b9f018cfb484bce5b-20220217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 333048579; Thu, 17 Feb 2022 05:28:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 04:28:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 20:28:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 20:28:27 +0800
Message-ID: <26a630dc3329f689dabe50361ffda8a0335b2653.camel@mediatek.com>
Subject: Re: [PATCH v9 1/1] i2c: mediatek: modify bus speed calculation formula
From: Kewei Xu <kewei.xu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <ryan-jh.yu@mediatek.com>, <david-yh.chiu@mediatek.com>
Date: Thu, 17 Feb 2022 20:28:26 +0800
In-Reply-To: <b22540e3-e8da-6878-64e3-04767c5327c2@collabora.com>
References: <1644400447-6215-1-git-send-email-kewei.xu@mediatek.com>
 <1644400447-6215-2-git-send-email-kewei.xu@mediatek.com>
 <b22540e3-e8da-6878-64e3-04767c5327c2@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_042836_190264_60383113 
X-CRM114-Status: GOOD (  12.20  )
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

On Mon, 2022-02-14 at 12:58 +0100, AngeloGioacchino Del Regno wrote:
> Il 09/02/22 10:54, Kewei Xu ha scritto:
> > When clock-div is 0 or greater than 1, the bus speed
> > calculated by the old speed calculation formula will be
> > larger than the target speed. So we update the formula.
> > 
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> > Change-Id: Ic0d9b8ab036bcf215d3a5066f2b91c7b8b128ba6
> 
> Please remove Change-Id tag, this is inappropriate and it's also
> irrelevant here.
> 
> After removing that tag:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
Hi,

Okay, I will remove the Change-Id tag in V10.
Thanks for your comment.

thanks
Kewei
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 51
> > +++++++++++++++++++++++++++++++++--------
> >   1 file changed, 41 insertions(+), 10 deletions(-)
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
