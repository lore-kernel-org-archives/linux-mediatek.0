Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E625EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEVhjpiOvZ+pEh8GGZKGcv5+QGesHyZqdQjiwLOYI+s=; b=0nuOSSVmteXhVTkMRmYn1SHsaO
	l6vvMfsX4YN+dpZtmvrIRTVAy0yxKgxmUNbJXWanZ1RHzPrMBk2m+kW4lr2V3rObeyp6bkTFv0NVJ
	JkNcWY/kfGRPBmL6y9ydAnUtyqyZED8WZylH4DE16J+kX8h0ng4leNgpNyr2DEC3BKJWkhYzj3TTX
	g6ma9a1CjAG7sKdZCBCSXlGwyoiadA+HwMqpC0UfFo93ISWpj0KEsb0SaBQxZZDVFOYxs424OR17y
	FUaOTMpHZnbi/efxzESaKbjIgHmhGPggFjGceG2v5zStE4yAwi2c1ca+CoSO0rktYEW/77Al10RBE
	KQStJhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3xWA-009ri8-RN; Wed, 22 Jun 2022 10:23:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3xRS-009pZ9-2h; Wed, 22 Jun 2022 10:18:35 +0000
X-UUID: 759e28edb04841fb9cb71b3f8ea05a9a-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:be9b981d-0333-4a80-8eae-bf5e2d3c8320,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:000f2c38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 759e28edb04841fb9cb71b3f8ea05a9a-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tiffany.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1036488352; Wed, 22 Jun 2022 03:18:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 03:08:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 18:08:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 18:08:21 +0800
Message-ID: <a509c9d1240c1c29f4ae416cf29298e0d2b04f09.camel@mediatek.com>
Subject: Re: [PATCH] MAINTAINERS: add Yunfei Dong as mediatek vcodec driver
 maintainer
From: tiffany.lin <tiffany.lin@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
	<dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 22 Jun 2022 18:08:21 +0800
In-Reply-To: <20220620071817.11685-1-yunfei.dong@mediatek.com>
References: <20220620071817.11685-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_031834_197583_0DD37B9F 
X-CRM114-Status: GOOD (  18.04  )
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

On Mon, 2022-06-20 at 15:18 +0800, Yunfei Dong wrote:
> I have been working on mediatek driver development for a very long
> time,
> and sent many patches to change the driver architecture. Add myself
> as
> co-maintainer for mediatek vcodec driver.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e22a79ffa4d0..1b3a30f33f0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12389,6 +12389,7 @@ F:	drivers/media/platform/mediatek/vpu/
>  MEDIATEK MEDIA DRIVER
>  M:	Tiffany Lin <tiffany.lin@mediatek.com>
>  M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
> +M:	Yunfei Dong <yunfei.dong@mediatek.com>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/media/mediatek,vcodec*.yaml
>  F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt


