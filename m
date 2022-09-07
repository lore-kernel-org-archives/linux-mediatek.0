Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF13C38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 03:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t97iS4YcYk2aQLZEbYiw0ExZyEUa2KjpAGNCB69JMoA=; b=rXZ1jkDpjWeb+hVmQMp6jOPLvT
	If9SZl6z1qxrxi2eQsILzcBanPP6ZUaIPT+X5SxwskvnU9fiP1NPOiKHytlGPpliLVHoWjmptmaW5
	BA0UKrFjNIRKFKfDo6tyPwJNjb7jiQMCdKQI6hcQO73kbbdpdmA6YoqVquc6MsJ9yLZzIoJk5TdSA
	vbGB+w4GKTaMtRwnO5AKf00Tg46q4WBuyVYwgp57ChQUp2eY82vmIybWwJ2pNhyaBxCmgef2F7sxC
	va7U/HC2nyaA+/+MdPx/DYgdJDYtWjZv5Q6KhCFzt3Du8ZF1kRgQFUDl7aMmLOyiSDw9B+uN17wq7
	qARX6Oig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVlcc-001xwA-90; Wed, 07 Sep 2022 03:21:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVlc2-001xgs-I7; Wed, 07 Sep 2022 03:20:33 +0000
X-UUID: a3414b63f8484033a887de90a91b8fac-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=t97iS4YcYk2aQLZEbYiw0ExZyEUa2KjpAGNCB69JMoA=;
	b=dipnh0LarnZGzf7pqBEQurTAU4UsDGQ8/jRfJ+aLlVf2y+uUnfbWFmJYBGeN069KgayE9aeudRmM/vQNPyJ3MQTnoQp0WRJydocQGVK/SFYcea5UH3OPFPcw/sjYTBPOlQnFI41OBHe3MTyJ2Kfti6U/ksMDEYIONn7EgFD/MbQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3f986764-4de0-4974-bff5-2d4faed2a314,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:5e0d6f21-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a3414b63f8484033a887de90a91b8fac-20220906
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 692475890; Tue, 06 Sep 2022 20:11:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 7 Sep 2022 11:10:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 7 Sep 2022 11:10:11 +0800
Message-ID: <bfd6d40474d4d5f589a825b0cc193ae229c42d52.camel@mediatek.com>
Subject: Re: [PATCH v4 3/6] iommu/mediatek: Add error path for loop of
 mm_dts_parse
From: Yong Wu <yong.wu@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	<iommu@lists.linux.dev>, <iommu@lists.linux-foundation.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
	<xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>
Date: Wed, 7 Sep 2022 11:10:11 +0800
In-Reply-To: <20220830083206.GT2030@kadam>
References: <20220824064306.21495-1-yong.wu@mediatek.com>
	 <20220824064306.21495-4-yong.wu@mediatek.com> <20220830083206.GT2030@kadam>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_202026_636437_2D25CF00 
X-CRM114-Status: GOOD (  23.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dan,

Thanks very much for your review:)

On Tue, 2022-08-30 at 11:32 +0300, Dan Carpenter wrote:
> On Wed, Aug 24, 2022 at 02:43:03PM +0800, Yong Wu wrote:
> > The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the
> > i+1
> > larb is parsed fail, we should put_device for the 0..i larbs.
> > 
> > There are two places need to comment:
> > 1) The larbid may be not linear mapping, we should loop whole
> >    the array in the error path.
> > 2) I move this line position: "data->larb_imu[id].dev = &plarbdev-
> > >dev;"
> >    That means set data->larb_imu[id].dev before the error path.
> >    then we don't need "platform_device_put(plarbdev)" again while
> >    probe_defer case. All depend on "put_device" in the error path
> > in error
> >    cases.
> 
> I don't understand what you're saying here.  There is still a
> platform_device_put(plarbdev) on the success path after
> component_match_add().
> 
> So if we fail when i == 2 then we do:
> 
> 	put_device(data->larb_imu[2].dev);
> 
> But for the previous iterations has both platform_device_put()
> and put_device() called for them.

Sorry for this. Right! For the goto outside the loop, it did put twice.
I will fix this.

> 
> regards,
> dan carpenter
> 


