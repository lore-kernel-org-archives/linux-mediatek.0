Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EDBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZSW47e115PDe8kHfZJHqwQGchR0snSKpELt0zZlhQw=; b=g+pmllQPiqoYqQ
	Z0CQhS+M62AaAlkDa6y9CSJsRmkX4YmqUjTCHX5cjdRvqXjrZiDJRU99Du4WLtjNm2g70LZ59VM94
	yA8R03b7SMzttgrm+c4xJl/lY1fRRDbN6yeC/vqcI+IlBziCF60Y2KfHyVRtzdhLFOj3K3HMtyM0W
	vCrE+G+Z5jHV2UyoZ0i5uTeLAPt/2o99WGRAkjGz8c1xDfmzppix85G2Ax/YkZBSVeDNqWqMQusON
	Inm5r5FAmgAhavx0SSaxEgjj5ny9M2FZUtrhdhluFry8JhfbA9fvgm6rhIk2qFkaKJcKj1b3xjvE9
	Vs4ZT6fVNA+khiNWqmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntquk-00BDNE-BB; Wed, 25 May 2022 13:19:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntquf-00BDLa-Se; Wed, 25 May 2022 13:19:00 +0000
X-UUID: 5256a98a329b42d988a09d05cbda61d9-20220525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:c8316a36-3fed-4fb2-988f-b7a9dd9b2a4a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:8fad35b8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 5256a98a329b42d988a09d05cbda61d9-20220525
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 817874995; Wed, 25 May 2022 06:18:45 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 06:18:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 21:18:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 May 2022 21:18:42 +0800
Message-ID: <478ed2945cdf90f465a7828ab9b235254caab311.camel@mediatek.com>
Subject: Re: [PATCH v20 0/8] Add Mediatek Soc DRM (vdosys0) support for
 mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, jason-jhlin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Date: Wed, 25 May 2022 21:18:42 +0800
In-Reply-To: <43a102cf-6971-8083-d24f-629d6d39810f@collabora.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
	 <43a102cf-6971-8083-d24f-629d6d39810f@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_061857_955920_040F598F 
X-CRM114-Status: GOOD (  15.20  )
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

Hello Angelo,

OK, I'll rebase on next-20220525 and resend soon.

Regards,
Jason-JH.Lin

On Wed, 2022-05-25 at 11:50 +0200, AngeloGioacchino Del Regno wrote:
> Il 19/04/22 11:41, jason-jh.lin ha scritto:
> > From: jason-jhlin <jason-jh.lin@mediatek.corp-partner.google.com>
> > 
> 
> Hello Jason,
> 
> this series does not apply cleanly anymore on next-20220525, can you
> please
> rebase and resend?
> 
> I hope that with a bit of coordination, we can get the entire display
> stack
> finally upstreamed in v5.19... it's been quite a while... :-)
> 
> Cheers,
> Angelo
> 
> > Change in v20:
> > - split binding patch to another series 'MediaTek MT8195 display
> > binding':
> >    
> > https://patchwork.ozlabs.org/project/devicetree-bindings/list/?series=295669
> > - fix io_start type from u32 to resource_size_t
> > - fix some commit message for DITHER enum
snip...


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
