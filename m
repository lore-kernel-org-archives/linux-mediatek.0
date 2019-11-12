Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B32C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 07:12:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 229642084F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 07:12:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+eAolXV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KNuo0RNe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 229642084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wl/t6n5fudC/C7SeZ0xbugOzNsaK1U+qvMeTgdL+GT4=; b=g+eAolXVKjzeZ+
	//42fZmVgkGghAMu2Z4lpTa3kPopDKfG5RTBo0pc9h/Ch/XtuV1QXhd6CQzrLSEL+DDqPW+OyfKF1
	kpWxSFs1IUgyT1RCo6oLn13+GDzXWyCDqw+2YWJGgi34D+W3C0YVzRSzsPC85wDuITVrpScTN8F38
	bt1RNVrs55a+38p1Tkp1fKM8anmmM5UUX3C8kw/29KMl53t6+hKS3LzPKuPGRF6VfREeETYXXnkW7
	HesaYQjLynRkPN97C7+vQltlDlflGbh2Tb26kAkk8jXU1li29MziWWBvsYMwt2e/PLVjNSF1G4crH
	xcNlZrstNfuyDjITtNGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUQLv-0007YT-1x; Tue, 12 Nov 2019 07:12:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUQLl-0007QA-NW; Tue, 12 Nov 2019 07:12:31 +0000
X-UUID: 6855864cb12a4ed18eabed881c083db8-20191111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Z8nkDd87nqB6TMe3KppZYI70npGkzQs4p3QaevqC/mg=; 
 b=KNuo0RNe5yA1qiUFxfuyiE79LWSXisMrO83y4l0JmYwAGsx00rVlI31C/vjPMWzqZ6WVu35Amq0I2NGl32a7dl5q+ze1QAki53Z8QKSSJMYFYin++ZeFM87gTkl8bkQi4o0e66fIp+HKL5vd3gNsLHvQ8vSRJFvADS5TPD2K1m4=;
X-UUID: 6855864cb12a4ed18eabed881c083db8-20191111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-mc.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2011575710; Mon, 11 Nov 2019 23:12:23 -0800
Received: from mtkmbs05dr.mediatek.inc (172.21.101.97) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 11 Nov 2019 23:12:21 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05dr.mediatek.inc (172.21.101.97) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 15:12:20 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 15:12:20 +0800
Message-ID: <1573542740.10348.12.camel@mtksdccf07>
Subject: Re: [PATCH net,v2 1/3] net: ethernet: mediatek: Integrate GDM/PSE
 setup operations
From: mtk15127 <Mark-MC.Lee@mediatek.com>
To: David Miller <davem@redhat.com>
Date: Tue, 12 Nov 2019 15:12:20 +0800
In-Reply-To: <20191111.215617.1625420574702786179.davem@redhat.com>
References: <20191111065129.30078-1-Mark-MC.Lee@mediatek.com>
 <20191111065129.30078-2-Mark-MC.Lee@mediatek.com>
 <20191111.215617.1625420574702786179.davem@redhat.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_231229_771400_B387F32C 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, andrew@lunn.ch, jakub.kicinski@netronome.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com,
 Mark-MC.Lee@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2019-11-11 at 21:56 -0800, David Miller wrote:
> From: MarkLee <Mark-MC.Lee@mediatek.com>
> Date: Mon, 11 Nov 2019 14:51:27 +0800
> 
> > +static void mtk_gdm_config(struct mtk_eth *eth, u32 config)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < MTK_MAC_COUNT; i++) {
> > +		u32 val = mtk_r32(eth, MTK_GDMA_FWD_CFG(i));
> > +
> > +		/* default setup the forward port to send frame to PDMA */
> > +		val &= ~0xffff;
> > +
> > +		/* Enable RX checksum */
> > +		val |= MTK_GDMA_ICS_EN | MTK_GDMA_TCS_EN | MTK_GDMA_UCS_EN;
> > +
> > +		val |= config;
> > +
> > +		mtk_w32(eth, val, MTK_GDMA_FWD_CFG(i));
> > +	}
> > +	/*Reset and enable PSE*/
> 
> Please put spaces before and after the comment sentence, like:
> 
> 	/* Reset and enable PSE */
> 
Thanks for the reminder, will correct it in the next patch.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
