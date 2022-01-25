Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A457C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 04:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0niFDzrpyLF2Rvf/15kMJo12I+APNZCKdpmQPf6dq0=; b=vv4XswvmNhDyOj
	PBzTESH1p7M+zvKTZhhAsH8TcEB+escFo+pBdOneeaw/t/zN/YeGg1nUZ5psAoBmh1FIhem9+3Xqa
	8ovGQC4ENpzy0jTpOmw8IbneOMOoGA6TUlVYFoA/85KdYK+6zDod+aCeJSbizi429wUzvx4B17mSx
	O3w43+KzrqtEfIvpcC8dOSuQ0J3M7SS62lgWODBNmgtgN4g4ZOQVciwcS6Tf0pn6iQMNnkDshDEW7
	Zc+KkWAeJTJ3MwfgbTtHOK84ElMMuC+DbTJGnVn+afu/b+NdAdM75jXcQZP8zdie2D5ztxZBBokpu
	mdx8vPcE5nr/AVXpyCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCDDo-006Ql8-Pi; Tue, 25 Jan 2022 04:14:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCDDb-006Qih-KW; Tue, 25 Jan 2022 04:14:10 +0000
X-UUID: b212e7d4d13f4eb8a92e9e80c376c578-20220124
X-UUID: b212e7d4d13f4eb8a92e9e80c376c578-20220124
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1171115758; Mon, 24 Jan 2022 21:14:00 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 20:13:59 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 12:13:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 12:13:57 +0800
Message-ID: <fa61312ca706a52caf2baca398f3674d80f4cd0d.camel@mediatek.com>
Subject: Re: [v10,1/3] drm/dsi: transfer DSI HS packets ending at the same time
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <narmstrong@baylibre.com>,
 <robert.foss@linaro.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <p.zabel@pengutronix.de>
CC: <xji@analogixsemi.com>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 25 Jan 2022 12:13:57 +0800
In-Reply-To: <dd84f8d4-097e-45b9-aa75-812b1fc524ff@intel.com>
References: <20220119022543.26093-1-rex-bc.chen@mediatek.com>
 <20220119022543.26093-2-rex-bc.chen@mediatek.com>
 <dd84f8d4-097e-45b9-aa75-812b1fc524ff@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_201407_710604_1AAA1331 
X-CRM114-Status: GOOD (  23.29  )
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

Hello David and Daniel,

This patch is including modification of include/drm/drm_mipi_dsi.h.
Could you give us some suggestions for this patch?

Thanks for your big support!

BRs,
Rex-BC Chen

On Wed, 2022-01-19 at 09:34 +0100, Andrzej Hajda wrote:
> On 19.01.2022 03:25, Rex-BC Chen wrote:
> > Since a HS transmission is composed of an arbitrary number
> > of bytes that may not be an integer multiple of lanes, some
> > lanes may run out of data before others.
> > (Defined in 6.1.3 of mipi_DSI_specification_v.01-02-00)
> > 
> > However, for some DSI RX devices (for example, anx7625),
> > there is a limitation that packet number should be the same
> > on all DSI lanes. In other words, they need to end a HS at
> > the same time.
> > 
> > Because this limitation is for some specific DSI RX devices,
> > it is more reasonable to put the enable control in these
> > DSI RX drivers. If DSI TX driver knows the information,
> > they can adjust the setting for this situation.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Regards
> 
> Andrzej
> 
> > ---
> >   include/drm/drm_mipi_dsi.h | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/drm/drm_mipi_dsi.h
> > b/include/drm/drm_mipi_dsi.h
> > index 147e51b6d241..51e09a1a106a 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -137,6 +137,8 @@ struct mipi_dsi_host
> > *of_find_mipi_dsi_host_by_node(struct device_node *node);
> >   #define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
> >   /* transmit data in low power */
> >   #define MIPI_DSI_MODE_LPM		BIT(11)
> > +/* transmit data ending at the same time for all lanes within one
> > hsync */
> > +#define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
> >   
> >   enum mipi_dsi_pixel_format {
> >   	MIPI_DSI_FMT_RGB888,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
