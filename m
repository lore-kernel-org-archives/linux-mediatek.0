Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91900C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 08:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D20860F5A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 08:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D20860F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unJMmkjCu5Q2UMOa7+avkrRj/jVZj5bDf+OTX4VE8oM=; b=veSw1114DgyYLJ
	0F/NSD0sjDyCIcMiHIHTQYK8w1vy78thR+l+reUv21woQFcVB6+9TLogXL/o3EsKZOWpkYWOWQMm+
	Sna0Aq4BFkt3yg3fgjyPbuNvpaM+/g+Kows/hIsjvKQ5zagFl5/TBYUokiO/DG/VDsEwpV5yhjQ9h
	HFeeSnvKtxTJ7R6DwsNZubP0rpjSJ0E1SaCFdzB8qDONwUac+bzRpHdE9ELU6IRXJINsZSwJ2iPpf
	uccbfQK4ywZNTstrG2ZYwmTRwJPdMu8j5hqQwQTS06rqaovtOyU5I8jducQwGjR2o+Ix1P+BrRBQd
	WLEG7br+VjbrFR/RFPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYlXM-0025aB-JH; Fri, 08 Oct 2021 08:47:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYlX9-0025XE-8a; Fri, 08 Oct 2021 08:47:16 +0000
X-UUID: 12e00d9f7e184aa08ea87cb16d0d247d-20211008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pUWaCMKNXz356vlGNAhNLBmgPI/6yLDLRRv6SApHeKk=; 
 b=SSvR4da6L97hLsH633+rp84rPoV2cy9M97Oqe7lZeVhGoie9GRXamONxE/XVyryGAx68CITjjqYRvk5qykJQZqMFthfGGQhNPTBlYvaUh2XZoqK2kax/n0yswdfNgMRp5o6L9iIleR0OFyj80DJOdHHkjDTihG/PVcUncu9x67E=;
X-UUID: 12e00d9f7e184aa08ea87cb16d0d247d-20211008
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 879317550; Fri, 08 Oct 2021 01:47:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Oct 2021 01:47:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 8 Oct 2021 16:47:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 16:47:08 +0800
Message-ID: <1891acec7f5c417f62081a8b10249b265df7ea62.camel@mediatek.com>
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
From: Kewei Xu <kewei.xu@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>
Date: Fri, 8 Oct 2021 16:47:11 +0800
In-Reply-To: <YVf+83LdUEPjoLdI@kunai>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-7-kewei.xu@mediatek.com> <YVf+83LdUEPjoLdI@kunai>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_014715_328171_7207AF65 
X-CRM114-Status: GOOD (  13.68  )
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

On Sat, 2021-10-02 at 08:40 +0200, Wolfram Sang wrote:
> On Fri, Sep 17, 2021 at 06:14:15PM +0800, Kewei Xu wrote:
> > In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing
> > adjust
> > support"), the I2C timing calculation has been revised to support
> > ac-timing adjustment, however that will break on some I2C
> > components.
> > As a result we want to introduce a new setting "default-adjust-
> > timing"
> > so those components can choose to use the old (default) timing
> > algorithm.
> 
> Why can't the new calculation be updated in a way that it works for
> all
> I2C components?
> 
Hi, In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing
adjust support"), the I2C timing calculation has been revised to
support ac-timing adjustment.But in our design, it will make
tSU,STA/tHD,STA/tSU,STO shorter when the slave device have clock-
stretching feature. Then we upload the commit a80f24945fcf ("i2c:
mediatek: Use scl_int_delay_ns to compensate clock-stretching") to
support adjusting tSU,STA/tHD,STA/tSU,STO when the slave device clock-
stretching. But if the slave device stretch the SCL line for too long
time, our design still cannot make tSU,STA/tHD,STA/tSU,STO meet spec.
However in the old (default) timing algorithm before the commit
be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support"),
tSU,STA/tHD,STA/tSU,STO can meet spec. So we want to define a new
setting "default-adjust-timing" for using the old (default) timing
algorithm. Thanks~
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
