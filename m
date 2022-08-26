Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41ABECAAA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 06:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii+RWHgkkqG3zjNQb1+48ayRNIbfTrluHNBY8ADjOsM=; b=KS8TotzVYxGJKQka9G1M4eluT9
	HkKHANzRdHCat0NUKon2arCP7x3xJHekBaHLNKr5WEglG+NJlxMlyrbPtFeT4n6j64qDvo0Cw1UVz
	O+sWLbdkKqp9gDN1vFKHZ7OGQG8ETU4qCX+jgC8VKNbuMMyM+PEK1DfH4LNZmCSbNmT7Op19s61ZJ
	mrEZbYVQPb6pEkkzqxTB0Ho/DIyLUUzuwcrMqXi05crUpD+Inkfd1UU9PaOHhG3foCTdPaluH4B+7
	rfOV7sEfb5CsLW/KBVw1GX98DtAMzwuTpsQhIy/nstqMHMlzAy4IFX20wgttF2QYQfRwE2EZ/vrrH
	Avs611hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRSta-00Efyz-5L; Fri, 26 Aug 2022 06:32:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRStO-00EfoZ-2N; Fri, 26 Aug 2022 06:32:35 +0000
X-UUID: 2d41d4acfd894a418f6e3644f7f50bdf-20220825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Ii+RWHgkkqG3zjNQb1+48ayRNIbfTrluHNBY8ADjOsM=;
	b=TKb8JkWTT8RiIqEvj0tHO9tesYCJpwo68SVZ2xmH4q7AWSAVfriShkggq3H3ylCJ3IZVCV2euPrVOgf0YXlFKlH6ChOcfvL6pscQvmvp5gVnGlJoXzH5+GJ08eNA11kGMEUh4SGxSkhT4zL+R5rgooLPH4Dtdkmw3uEhILgr7tY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:d0c7e9d2-b247-4db6-84e1-cae3a186d834,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:90f8aecf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2d41d4acfd894a418f6e3644f7f50bdf-20220825
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 537153290; Thu, 25 Aug 2022 23:32:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 26 Aug 2022 14:11:50 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 26 Aug 2022 14:11:49 +0800
Message-ID: <30f536c754829011e78239a9a400945faa4580e4.camel@mediatek.com>
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, "=?ISO-8859-1?Q?N=EDcolas?= F.
 R. A. Prado" <nfraprado@collabora.com>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <rex-bc.chen@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
	<yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
	<jitao.shi@mediatek.com>
Date: Fri, 26 Aug 2022 14:12:00 +0800
In-Reply-To: <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
	 <20220823201758.ffbgb5t5odoicgir@notapiano>
	 <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_233234_257922_0995B309 
X-CRM114-Status: GOOD (  15.50  )
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

On Thu, 2022-08-25 at 17:04 +0200, Matthias Brugger wrote:
> 
> On 23/08/2022 22:17, Nícolas F. R. A. Prado wrote:
> > On Tue, Aug 23, 2022 at 02:38:22PM +0800, xinlei.lee@mediatek.com
> > wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Add mmsys function to manipulate dpi output format configuration
> > > for MT8186.
> > > 
> > > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> 
> Patch looks fine, I'll wait for v4 as there is still some discussion
> on the DRM 
> part. Please try to fix the threading problem you had in sending this
> series.
> 
> Thanks,
> Matthias

Hi Matthias:

Thanks for your review.

Before I send the next version, do you mean the treading problem you
are talking about is the problem I'm discussing in another patch in
this series, or something else?

Best Regards!
Xinlei


