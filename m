Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BF0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+W0nl+WE2kX6E6z71gBdYkk9nwkj8ezHrT3PuG8UFwg=; b=WLLUWZ3TeoaWqp
	I0qpMHIDnj6aZtO4GtfQeV+owWIY+ottrjXubv08e+ZXHXcFFRCT3+nl7xwY7yWgVqbAH381dvInt
	itJyD2K8Ha213LFZQoQ7NNOGp4tFEjaVO0d5evfXTjNuYEjOVSE4lpxxlyV8+Gxuc+jxJCRz25fuR
	1sCGRNas8r6r59+mFvt/UG7tglrJD9CuGzr9mnM0pyvHJ+ZC1nHHmeS0uN2lzzC5+a2j6Kb9Iq/wP
	2CqIPpdtdPYi3+2G5XsmnDL6CvksSi/hWCUHs6YBy7tiPlSxN44BDd03vSn14zwQdIFqb1owRCmwg
	ItK3icj9r771zH7irJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqbZ3-008Hzr-Uu; Mon, 16 May 2022 14:19:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqbYc-008HoD-L8; Mon, 16 May 2022 14:18:51 +0000
X-UUID: 0cdcf442d04546189a57626e626493ea-20220516
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:d33d85cd-1d8b-4b1f-adeb-5f967d2abe86, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:642fc4b9-9f46-4d76-a271-164488ed79f1,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 0cdcf442d04546189a57626e626493ea-20220516
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yf.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 162229171; Mon, 16 May 2022 07:18:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 May 2022 07:18:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 16 May 2022 22:18:35 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 16 May 2022 22:18:35 +0800
From: <yf.wang@mediatek.com>
To: <yong.wu@mediatek.com>
CC: <Libo.Kang@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>
Subject: Re: [PATCH v3 0/2] MediaTek TTBR up to 35bit support
Date: Mon, 16 May 2022 22:12:02 +0800
Message-ID: <20220516141202.11650-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <65a0a606e5a53a4ca8dddbe59388c78280d60dd1.camel@mediatek.com>
References: <65a0a606e5a53a4ca8dddbe59388c78280d60dd1.camel@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_071846_760385_64360D64 
X-CRM114-Status: GOOD (  14.49  )
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

On Sat, 2022-05-14 at 10:09 +0800, Yong Wu wrote:
> On Thu, 2022-05-12 at 22:45 +0800, yf.wang@mediatek.com wrote:
> > This patchset adds MediaTek TTBR up to 35bit support.
> > 
> > 
> > Changes in v3:
> > - Add version changes description, there is No new code change in
> > V3.
> > 
> > Changes in v2:
> > - Update patch and commit message
> >   - Add Level 1 pgtable PA up to 35bit.
> 
> Why add this for lvl1 pgtable? Did you get real problem?
> 
> lvl2 pgtable is allocated/freed dynamically, it may be allocated
> failed
> in ZONE_DMA32 when burning test. But the lvl1 pgtable only is
> allocated
> once after bootup. I think this is no need for lvl1 pgtable.

Hi Yong,

There is no DMA32 zone in some mediatek smartphone chip.

Thanks,
Yunfei.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
