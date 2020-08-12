Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EFBC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33ECB206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YjOrozTh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kLmhXN4/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33ECB206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hB33lZBBwDjR8gnp/vkASLsmpfb64vT1fJJIN2WyiLs=; b=YjOrozThCH4RlH7YHvBULsxyc
	vnpP0jIS7Eh1lrIk1c8HDKjooFPDY8+R+5kVfX3Wr48vjDfgFPneB64zhaAdVx+kptn60pv7Hbub/
	bPX8w7qJeCB+vMVPGviNHbltZV0E+Lq7VH4eivcbdidPvuZp820lsiCqoEj96J/arX0ISh/CCEOAI
	RoCHgx3D6vbwjZ0uHt4mlCLbMIGqCFPbBMxd/MQIlbWP5lFFAmW8MIaG4yfvvakkz1Yp2WGtEAWtp
	kV+3vXV8zKfGBN0k5liZVaCJtYxlSHV7F5fcpmQ4MP/uC2YP7h9urdx5VqGC5p3UqqE03bD54QOwl
	Lz0+UZWLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5qYp-00018r-I1; Wed, 12 Aug 2020 13:12:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5qYe-00013h-Hi; Wed, 12 Aug 2020 13:12:45 +0000
X-UUID: ec5f7d5deaaa4aeb9f60ae7ff4175fce-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2D2otIxOT5Y9TE/5sGqjyAubG2N6RpU+rS+XIzBvd5M=; 
 b=kLmhXN4/Tan9ZglFsXOgX+kzqXZbJbh+v1/7gyKF7l/4j5kW4PQ27hkyvmpyMat2x+aU1pszBdKY9ibRWOFfsqlZu3SDG2H5W0FiK2F7J3AeVxFx11JgdSEUjoXzMKraquRVIs6C/mtf8pOgLsthAVHSIhJKkU9jcCHl+t4Qp18=;
X-UUID: ec5f7d5deaaa4aeb9f60ae7ff4175fce-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 353626163; Wed, 12 Aug 2020 05:12:34 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 06:04:29 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Aug 2020 21:04:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Aug 2020 21:04:25 +0800
Message-ID: <1597237413.10188.5.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] mmc: dt-bindings: Add resets/reset-names for
 Mediatek MMC bindings
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 12 Aug 2020 21:03:33 +0800
In-Reply-To: <6e667ff6f5a1aae51b89d00e9ec5bba29852f683.camel@pengutronix.de>
References: <20200812093726.10123-1-wenbin.mei@mediatek.com>
 <20200812093726.10123-2-wenbin.mei@mediatek.com>
 <6e667ff6f5a1aae51b89d00e9ec5bba29852f683.camel@pengutronix.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 88374733FA49679322C5DF06B0A77BFCA1834A5593A73B49D5804FC216869C7B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_091244_859145_A58241B7 
X-CRM114-Status: GOOD (  18.35  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks for your reply.
I have changed this in v2 patch.
On Wed, 2020-08-12 at 14:03 +0200, Philipp Zabel wrote:
> On Wed, 2020-08-12 at 17:37 +0800, Wenbin Mei wrote:
> > Add description for resets/reset-names.
> > 
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> > index 8a532f4453f2..35da72de7aac 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> > @@ -49,6 +49,8 @@ Optional properties:
> >  		     error caused by stop clock(fifo full)
> >  		     Valid range = [0:0x7]. if not present, default value is 0.
> >  		     applied to compatible "mediatek,mt2701-mmc".
> > +- resets: Phandle and reset specifier pair to softreset line of MSDC IP.
> > +- reset-names: Reset names for MSDC.
> 
> I think the reset-names documentation should mention the actual value
> the driver should look for, "hrst".
> 
> regards
> Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
