Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE05EC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 03:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D919206E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 03:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bU1F9aV9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cpTwCnUc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D919206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j2hHpO0nJF65gwQoEfovj/KMIfvhDj8R/GafD7Tec/g=; b=bU1F9aV9/np6+znEGCFWksQc0
	VI5D3PJN8GjguDSqqtcCxcv5kC4s+8/gly0BwW7aHoaiXgGhVQfWIp2GtnvKy7BvvQn1EFJrBwJT2
	PHRrX9c+YXanXfCmthezEruLkTalNrpRagsd+cXm5fldQyGnwpgUC8WmTpbx0eIuBonekfyduv5qG
	hMtMTkS+b7EVz/hfxUzG5oym0ma/OeW0oV+FGpnihsrcp2xjbxDhWADw7MWuxfcr032ZhGcAQoJjN
	4hwNCmUn7j+Ve/GJNFRGAU/1eEFzEAhJ3h7BSIprKRCAUthhakhp4yJlL0k8E0SFhZEdN+HKnnFUw
	/0Pblc11Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jseJj-0004rc-Ut; Tue, 07 Jul 2020 03:30:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jseJd-0004qJ-7Z; Tue, 07 Jul 2020 03:30:43 +0000
X-UUID: 4729176b9f8e45bb9336892abe9fa62e-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xXfL3TuAtjkYQYWJISRyQ46uxdKVzkwh663c3FEQbZc=; 
 b=cpTwCnUcSL4cDbKP4noOOdf9lFJN9QiOHYVhjoJgp0t14ShDnO9W7lXeDBBsN+nW0NibxuIlcDRn3Msflf98BKtuG+PgMbvqL08+F3H+o6I0OKsXjyfgBcaD06yWW1rGDxy+WFnnmGw8r95cElrz9TbHHaoyNupaEnNQp8zs2ik=;
X-UUID: 4729176b9f8e45bb9336892abe9fa62e-20200706
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 712412229; Mon, 06 Jul 2020 19:30:38 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 20:30:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 11:30:30 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 11:30:31 +0800
Message-ID: <1594092631.20820.4.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: add devapc-mt6779 driver
From: Neal Liu <neal.liu@mediatek.com>
To: Randy Dunlap <rdunlap@infradead.org>
Date: Tue, 7 Jul 2020 11:30:31 +0800
In-Reply-To: <dd03ec1e-e511-4c13-4e12-a9f8ec407326@infradead.org>
References: <1594027693-19530-1-git-send-email-neal.liu@mediatek.com>
 <1594027693-19530-3-git-send-email-neal.liu@mediatek.com>
 <dd03ec1e-e511-4c13-4e12-a9f8ec407326@infradead.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7C124BCAC688D580459B4BB001DA4F885A5228596ACC2F264F482A1C854A0E7C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_233041_404696_69D0BD50 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Randy,

Thanks for your review.

On Mon, 2020-07-06 at 09:13 -0700, Randy Dunlap wrote:
> On 7/6/20 2:28 AM, Neal Liu wrote:
> > diff --git a/drivers/soc/mediatek/devapc/Kconfig b/drivers/soc/mediatek/devapc/Kconfig
> > new file mode 100644
> > index 0000000..b0f7d0e
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/devapc/Kconfig
> > @@ -0,0 +1,17 @@
> > +config MTK_DEVAPC
> > +	tristate "Mediatek Device APC Support"
> > +	help
> > +	  Device APC is a HW IP controlling internal device security.
> 
> preferably:               s/HW/hardware/
> 
> > +	  MediaTek bus frabric provides TrustZone security support and data
> 
> 	               fabric
> 
> > +	  protection to prevent slaves from being accessed by unexpected
> > +	  bus masters.
> > +	  Device APC prevents malicious access to internal devices.
> > +
> > +config DEVAPC_MT6779
> > +	tristate "Mediatek MT6779 Device APC driver"
> > +	select MTK_DEVAPC
> > +	help
> > +	  Say yes here to enable support Mediatek MT6779 Device APC driver.
> 
> 	                         support for Mediatek
> 
> > +	  This driver mainly used to handle the violation with 1 DEVAPC AO/PDs.
> 
> 	  This driver is mainly used                           ^^^^^^^^^^^^^^^^
> 
> 	                      What is that meaningless string of chars? ^^^^^^^

I did not see any meaningless string of chars from my original patch.
Is there something wrong?

[1] https://lkml.org/lkml/2020/7/6/168

> 
> > +	  The violation information are logged for further analysis or
> 
> 	                            is
> 
> > +	  countermeasures.
> 
> thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
