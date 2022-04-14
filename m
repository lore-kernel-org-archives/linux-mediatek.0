Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFA0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 06:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3seWeYZHuhG+AYU1MmZ98vUUqRkXwnwuKEoG2ZTa88=; b=0rkmin0UUGjWOi
	48bxDbhd+6RWS8OwT4FR9jiJ5NJ778adi6RlHtSu9H74ob/A2/rJ/HSWdNKOD/GWrqaVaiXdcL+x2
	fw4bTMmCaBo0JiDWKa7083/Whb85s1irRZ/24yrryyLz/9735J5q3LB5ZKzB9uF3nVM15+G3dtwcJ
	Rhc/XfK1g8gEEabsR2jmujnZfUYx8jt8XD6NVI/4uypEmPM0jEH32eJKsup4QzNe/YHePageR/enE
	5/JqIY/dvkVARCtsTbCru7/bT1PY+XVmIAx0BSZH3Oa9pOJIWwA1ZxWtmNQ53RmSAT5F4m+b7e0P3
	sLRTdK0L/+HxZ6rAqKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neszD-0046K4-NL; Thu, 14 Apr 2022 06:29:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neszA-0046Ir-Go; Thu, 14 Apr 2022 06:29:46 +0000
X-UUID: 5a903ec18b4b43bbb02dcf6bce3aa85a-20220413
X-UUID: 5a903ec18b4b43bbb02dcf6bce3aa85a-20220413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1122127486; Wed, 13 Apr 2022 23:29:34 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 23:25:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Apr 2022 14:25:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 14:25:35 +0800
Message-ID: <5fa51ff6aab0d54e4edd8fc6fed00d4718ceb9dc.camel@mediatek.com>
Subject: Re: [PATCH 2/2] soc: mediatek: svs: add support for mt8186
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
 <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Date: Thu, 14 Apr 2022 14:25:35 +0800
In-Reply-To: <138aad1c-63d7-371a-ff41-4fd7022d365d@collabora.com>
References: <20220412112127.21570-1-jia-wei.chang@mediatek.com>
 <20220412112127.21570-3-jia-wei.chang@mediatek.com>
 <138aad1c-63d7-371a-ff41-4fd7022d365d@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_232944_586525_52413E00 
X-CRM114-Status: GOOD (  11.91  )
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

On Tue, 2022-04-12 at 17:30 +0200, AngeloGioacchino Del Regno wrote:
> Il 12/04/22 13:21, Tim Chang ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > MT8186 svs has a number of banks which used as optimization of opp
> > voltage table for corresponding dvfs drivers.
> > MT8186 svs big core uses 2-line high bank and low bank to optimize
> > the
> > voltage of opp table for higher and lower frequency respectively.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> For the code only, as I am unable to test:
> 

Hi AngeloGioacchino,

I provided the svs content in mt8186.dtsi on chromebook prototype as an
example in previous response.  You can refer to it for urgent usage.
I will update it in my series in the future version.

Thanks.

> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
