Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7218AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 01:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XbNHjEcZYI5hW89tCJE84R/8RU57IRHfVDinRSgSAM=; b=ZYO60nVaocyUB5
	/4/oiUFPv0rNaARCalQbG/1ByPBIF4ilKLl/nsydaauvOqRZa5qLGj5j1Y4tRukyrNx0MhM9fPL+M
	qKw3H8kTuCT3gpG30U0eMV8nzCVjjSbuyDhSk6fqUFvF+52zZd+j2/m4KdERacCF6IfXM4rbuAO+l
	2/6ZxzCZhnz5JinxKtLe9aFpmXZBFQ30on39JBfRgnZqNk9HXsUy5CZhGpeOo4t4Y5lW7ea+A+MZ9
	oROdtRW76J4fen1ZWbPO+h2JJr5W6LHBKUkqA/JR7hkvuju074Q5SwmuoI4T+e7vVQF0dId2Ipae5
	D+iVcoO7PMaayGsmJSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nROLE-002Hdb-J2; Tue, 08 Mar 2022 01:08:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nROKf-002HO5-9b; Tue, 08 Mar 2022 01:08:10 +0000
X-UUID: 335551804e7d48a191dbc8dc4344ec39-20220307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ISAKrXa94zYB5gxK1zZVID4g3XXhBC/J7FY0oFo6dMg=; 
 b=PcsG2LX9HoT3k+KJ4hS3MvcIXwXJsYUqhJprvsSr0vRCyojB6qWZlQ8jG+E9aup/L4WG9/12tIjwN4l9OF1HquRLNljbCF7M9pZgfCgeoT2UVruCbduKijk+k20hSsF9kZx6qr6t+YwpgVjBPU0UUSXz+8pbLfElHKSQI2Wldfo=;
X-UUID: 335551804e7d48a191dbc8dc4344ec39-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1084373466; Mon, 07 Mar 2022 18:08:05 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 16:58:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 8 Mar 2022 08:58:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 08:58:00 +0800
Message-ID: <7cd27b814c67b32ca2d3eebfd81688612c93d886.camel@mediatek.com>
Subject: Re: [PATCH v1 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8168
From: Qii Wang <qii.wang@mediatek.com>
To: Kewei Xu <kewei.xu@mediatek.com>, <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <liguo.zhang@mediatek.com>,
 <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
 <yuhan.wei@mediatek.com>
Date: Tue, 8 Mar 2022 08:58:00 +0800
In-Reply-To: <20220307033649.11564-3-kewei.xu@mediatek.com>
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-3-kewei.xu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_170809_374329_C28438A0 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

On Mon, 2022-03-07 at 11:36 +0800, Kewei Xu wrote:
> Add i2c compatible for MT8168. Compare to MT2712 i2c controller,
> MT8168 need to synchronize signal with dma.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
