Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D98C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyh9vU2Hdins3ylxphqunKA0yTTrpkwGvZLvAwkacAQ=; b=MZv4gJ6/h5hYDl
	wZEzDojzStgAXMieqAFyGNtqOKzhQw7n1FItqFaBOv2JjSc7wbved7ihptYLRjsiLd6iIIKRcR9Tm
	wt4enUCBrSqgcpXuMojT7SYmRaac7KC4VAI9zCxa+CHnNQzAxF8bqr+s8JFFznptXoqr6jUgM7Qrp
	bQ+q+fhDT/ibnJGw1VvDzqpEXD7R3wnv8r9t+0ADCNC1GVcfh/+L86PcH6FqUsuL4WTLQplRbrTWh
	McZ/1RQzIB0X2Ik838Er1GLe5ZvbcpHsslPGCBLSkpFJItt+qFOQXSvMKVwNhR3NG69cGnyDCiQDs
	4hB2k7JIQXg5EhvsTySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9R5t-00EtkR-Ls; Mon, 17 Jan 2022 12:26:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9R5q-00Etjq-VY; Mon, 17 Jan 2022 12:26:40 +0000
X-UUID: 0b8d4b8557894d31a29244606665f73b-20220117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+cAmc+5yfc7QlMt9z6VZDA02wVRoO2e+aiUVRih2Ea4=; 
 b=qmiFf3ZxOINcftgMzug04R/TKqo4n0DLwli2ry1yZKzLCiJF/9D+SrYsus/IvzYGy8tFYq25Ihf0y5t73z6UToQBTe0RLg6NohzmavjWvQWtFk/nMpM5FdYd6uMUw9AWm1Anw4QFO0V2wimzKyWZOj87ii/Zhb/+szZ0B7ZLY58=;
X-UUID: 0b8d4b8557894d31a29244606665f73b-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1122820198; Mon, 17 Jan 2022 05:25:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 04:25:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 17 Jan 2022 20:25:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 20:25:29 +0800
Message-ID: <792f1119b9c848a01e8b8ddd196a1db7acc1f0ae.camel@mediatek.com>
Subject: Re: [PATCH v3 5/7] memory: mtk-smi: Fix the return value for
 clk_bulk_prepare_enable
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Joerg Roedel <jroedel@suse.de>
Date: Mon, 17 Jan 2022 20:25:28 +0800
In-Reply-To: <7370f18b-e273-69f2-1cc9-a42495e04874@canonical.com>
References: <20220113111057.29918-1-yong.wu@mediatek.com>
 <20220113111057.29918-6-yong.wu@mediatek.com>
 <7370f18b-e273-69f2-1cc9-a42495e04874@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_042639_043862_A76C20F4 
X-CRM114-Status: GOOD (  23.45  )
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

On Mon, 2022-01-17 at 13:01 +0100, Krzysztof Kozlowski wrote:
> On 13/01/2022 12:10, Yong Wu wrote:
> > Function clk_bulk_prepare_enable() returns 0 for success or a
> > negative
> > number for error. Fix this code style issue.
> 
> The message does not really make sense. If negative is returned, then
> the check (ret < 0) was correct.
> 
> I guess you wanted to say that common code style is to check for any
> non-zero return value, just like it's implementation in clk.h does.
> 
> I'll adjust the commit msg when applying.

Thanks for the help.

> 
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/memory/mtk-smi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index b883dcc0bbfa..e7b1a22b12ea 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -480,7 +480,7 @@ static int __maybe_unused
> > mtk_smi_larb_resume(struct device *dev)
> >  	int ret;
> >  
> >  	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb-
> > >smi.clks);
> > -	if (ret < 0)
> > +	if (ret)
> >  		return ret;
> >  
> >  	/* Configure the basic setting for this larb */
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
