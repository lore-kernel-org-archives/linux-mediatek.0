Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF6CC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 10:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXeS4KiL1GsZqKt6WGTKpX3gE33/FCx98tbW/aiIaJ4=; b=LTGY91vu0umJ73m8jvGCBCqmNq
	Eglj3asp9uAjX6+6VeBaqAAfLFDp1YfrNMErQZlKvhUpt8ByjjaLNNM78UuV5aMZsmJCrWvbUMaYi
	DiqjLE89ooGjUYFJGVhQQ0lQ5iRux4snSHalkJozp0ziAFfF7TnEklxWRxT72D1Cwg1awc1/MwthA
	NB8mnEkq9I7O9FRq+fUR7KOZeaoYluDrLf64eL1dztERikkp4GWNZjWtDbdGJdUpBMOwRSIapYJNd
	TuPs8X3XW6Owh04q8w8LogmM/z23khGn1yqlEeASvut1GrjdwzbOc6M8Ae8K8uQmYq2nJ83OhrDpi
	fhCrWMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBKU-00C5K8-OL; Sat, 22 Oct 2022 10:02:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBKJ-00C5G0-Q7; Sat, 22 Oct 2022 10:02:01 +0000
X-UUID: 4bd8eed709ca419babdcc1f4ec9c9037-20221022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=BXeS4KiL1GsZqKt6WGTKpX3gE33/FCx98tbW/aiIaJ4=;
	b=Jf8qPeJ5ZiaYZ1tZwiyNDbaiK7LdTCqu5OJIwkkW5ZlZbbo6Wxt4JX+Tr2ABsp9Txacd9VRWtvG9gz/vA3ePkOGyQlofaD+JqlQitJrbmOdITPIlG7KteD3atchho7P1adaIo6riEfoIOXa7JP7DzJ2JKVU5Bw7lmFcuyOntz0A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:41f91805-2bf4-4110-ad32-61b5d680da0a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:6b2954e4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4bd8eed709ca419babdcc1f4ec9c9037-20221022
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1021239363; Sat, 22 Oct 2022 03:01:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 22 Oct 2022 18:01:49 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 22 Oct 2022 18:01:49 +0800
Message-ID: <055cc7b19d19a57654e00e9173bada31fc251a10.camel@mediatek.com>
Subject: Re: [PATCH v12,2/3] drm: mediatek: Set dpi format in mmsys
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
	<jitao.shi@mediatek.com>
Date: Sat, 22 Oct 2022 18:01:56 +0800
In-Reply-To: <20221021153912.bddr5g4tm4kch7dn@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
	 <1666147936-27368-3-git-send-email-xinlei.lee@mediatek.com>
	 <20221020164022.vtnumo3fob2sh54w@notapiano>
	 <2e1899236144774d4a1c0224532b11ef7e1f9862.camel@mediatek.com>
	 <20221021153912.bddr5g4tm4kch7dn@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_030159_872961_47601675 
X-CRM114-Status: GOOD (  31.70  )
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

On Fri, 2022-10-21 at 11:39 -0400, Nícolas F. R. A. Prado wrote:
> On Fri, Oct 21, 2022 at 08:18:25PM +0800, xinlei.lee wrote:
> > On Thu, 2022-10-20 at 12:40 -0400, Nícolas F. R. A. Prado wrote:
> > > On Wed, Oct 19, 2022 at 10:52:15AM +0800, xinlei.lee@mediatek.com
> > > wrote:
> 
> [..]
> > > > @@ -448,8 +453,12 @@ static void mtk_dpi_dual_edge(struct
> > > > mtk_dpi
> > > > *dpi)
> > > >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> > > >  			     dpi->output_fmt ==
> > > > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> > > >  			     EDGE_SEL : 0, EDGE_SEL);
> > > > +		if (dpi->conf->edge_cfg_in_mmsys)
> > > > +			mtk_mmsys_ddp_dpi_fmt_config(dpi-
> > > > >mmsys_dev,
> > > > MTK_DPI_RGB888_DDR_CON);
> > > >  	} else {
> > > >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN |
> > > > DDR_4PHASE,
> > > > 0);
> > > > +		if (dpi->conf->edge_cfg_in_mmsys)
> > > > +			mtk_mmsys_ddp_dpi_fmt_config(dpi-
> > > > >mmsys_dev,
> > > > MTK_DPI_RGB888_SDR_CON);
> > > 
> > > I know this isn't one of the formats supported by MT8186, but
> > > since
> > > we're using
> > > platform-agnostic formats now... This else branch in theory could
> > > also run for a
> > > format like MEDIA_BUS_FMT_YUYV8_1X16. Would it make sense to set
> > > MTK_DPI_RGB888_SDR_CON in that case?
> > > 
> > > Thanks,
> > > Nícolas
> > > 
> > > >  	}
> > > 
> > > [..]
> > 
> > Hi Nícolas:
> > 
> > Thanks for your review!
> >  
> > You are right, I understand you think this MTK_DPI_RGB888_SDR_CON 
> > format seems useless as it will not be set, I confirmed with the 
> > designer how the setting in mmsys affects the output format of the 
> > MT8186, this mmsys setting will not be used by other ICs.
> > 
> > As mentioned earlier, the mmsys setting will make the MT8186dpi
> > have 
> > four output formats, even though the MT8186 dpi may not use them
> > all.
> > 
> > So what needs to change here?
> 
> We could check that the format in the else path is a single edge
> RGB888 format
> like MEDIA_BUS_FMT_RGB888_1X24 before setting the mmsys config, but
> there are
> also other formats possible, and I actually don't think it's worth it
> to
> complicate the logic further to protect from an edge-case that can't
> be hit
> yet...
> 
> So just leave it as it is. We can worry about it when/if a non-RGB888 
> single
> edge format needs to be setup on mmsys.
> 
> So,
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Thanks,
> Nícolas


Hi Nícolas:

Thanks for your review!

Best Regards!
xinlei


