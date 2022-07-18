Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A1FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TD+RZaS3NdVPZoWvKG5wD6w6DrWr4koErdJnLr8B6c=; b=U5hQc1fN31jDUPN4k8aNgaOVhw
	d4z4E3WshiBTIso1cWSF9dlQMnxcPthUnWnJVuuG5jXMzMcqtIspEdq+H39/jaWKlqPU5LcobvVus
	TsLhiE9/nksJQnxV8dO1VzAql/JfX7aSDeQOA6pZwHyNEDS0mYUu5LIDVGzlxnq2+a7TlVUkX09B9
	qbyj86eCkmlbtoHcI5ANN6JpuYc9hW4LSoTaF19iZljQtVwqzcuvKRgrdjnE5Qqr5nj3EnwbcpD26
	7z81J2IPivll6JZ+slmc0flLUuYJNxxUHgjb6fRFN9B9XLgq/o/DuNN55ANNR+PiR3prVKfYuYYhW
	7P3J0zkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDKyq-00BQGW-JG; Mon, 18 Jul 2022 07:15:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDKyf-00BQBX-5F; Mon, 18 Jul 2022 07:15:38 +0000
X-UUID: 90daa5121dba4a79976140706689992e-20220718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:0c22b6cc-6ca8-4d4f-824c-d7eb34a53131,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:143cc4d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 90daa5121dba4a79976140706689992e-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 89881861; Mon, 18 Jul 2022 00:15:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 18 Jul 2022 14:54:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Jul 2022 14:54:51 +0800
Message-ID: <e93858057c451b6fa2ec04d63403fc3289a82416.camel@mediatek.com>
Subject: Re: [PATCH v22 4/4] media: platform: mtk-mdp3: add Mediatek MDP3
 driver
From: moudy.ho <moudy.ho@mediatek.com>
To: Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
	<roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Date: Mon, 18 Jul 2022 14:54:51 +0800
In-Reply-To: <f418dc88-96e8-99bb-dfc0-1da277b7f0ee@infradead.org>
References: <20220714092153.16686-1-moudy.ho@mediatek.com>
	 <20220714092153.16686-5-moudy.ho@mediatek.com>
	 <f418dc88-96e8-99bb-dfc0-1da277b7f0ee@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_001537_223463_EAD6F250 
X-CRM114-Status: GOOD (  18.78  )
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

On Thu, 2022-07-14 at 07:51 -0700, Randy Dunlap wrote:
> 	
> 
> On 7/14/22 02:21, Moudy Ho wrote:
> > diff --git a/drivers/media/platform/mediatek/mdp3/Kconfig
> > b/drivers/media/platform/mediatek/mdp3/Kconfig
> > new file mode 100644
> > index 000000000000..6640763c7c5e
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/mdp3/Kconfig
> > @@ -0,0 +1,20 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config VIDEO_MEDIATEK_MDP3
> > +	tristate "Mediatek MDP v3 driver"
> > +	depends on MTK_IOMMU || COMPLIE_TEST
> 
> 	                        COMPILE_TEST
> 
> > +	depends on VIDEO_DEV
> > +	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	depends on MTK_MMSYS
> > +	depends on HAS_DMA
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	select V4L2_MEM2MEM_DEV
> > +	select VIDEO_MEDIATEK_VPU
> > +	select MTK_CMDQ
> > +	select MTK_SCP
> > +	default n
> > +	help
> > +	    It is a v4l2 driver and present in Mediatek MT8183 SoC.
> > +	    The driver supports for scaling and color space conversion.
> 
> 	  The driver supports scaling and color space conversion.
> 

Hi Randy,

Thanks for pointing out these two. It's being worked on and a new
version will be pushed asap.

Regards,
Moudy
> > +
> > +	    To compile this driver as a module, choose M here: the
> > +	    module will be called mtk-mdp3.
> 
> 


