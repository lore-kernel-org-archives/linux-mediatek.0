Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A372C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 08:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Qxwz4K8MruRiinUvqoi1kkH1c7VXRWjWDqGKHEHMcE=; b=dWL6JtLgziaotd
	CNvJ6rwD9F9PyXPUyd9D0CIpRGBnLmhE1M2BVYgh+FdGvI7LFrSGjbj9U9oEN1vpGOU/gmuGklg8o
	kd5UqEq8kr+NCyKn+zW4pfC0ldpeWVcH4mJlt8BsoynRgDhEtE3PN1ufzXtMYZf+tK3hYwyKv/T8d
	hegxsrsXhzL/P2t8jTVc51VxdA1bSf/bJReNB7WtvLTMF1j1XFUYML7JUz5LUUWTy55YF7eywprIp
	6lNdvKKFNoBoUBpOTZlDT5ZLfE8kDuwjRUd9xGg1nJ1gfzyGgtur1aMWvM/tyAnPMOhTuGnJUaLRT
	xNMijpQMbzqWcZR03frw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfH5D-009GOT-R7; Fri, 15 Apr 2022 08:13:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfH5A-009GMO-Hy; Fri, 15 Apr 2022 08:13:35 +0000
X-UUID: 073202e36c264aa7918df0ea403db1e5-20220415
X-UUID: 073202e36c264aa7918df0ea403db1e5-20220415
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1110989018; Fri, 15 Apr 2022 01:13:23 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Apr 2022 01:13:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Apr 2022 16:13:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 16:13:20 +0800
Message-ID: <9b6a3c4b403d15c08f5c4693549fadde50f5bca3.camel@mediatek.com>
Subject: Re: [PATCH v18 08/10] soc: mediatek: add DDP_DOMPONENT_DITHER0 enum
 for mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 15 Apr 2022 16:13:20 +0800
In-Reply-To: <542a3946c33b4a2e7cbb160f0e3bd4479a863ddb.camel@mediatek.com>
References: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
 <20220412103114.19922-9-jason-jh.lin@mediatek.com>
 <542a3946c33b4a2e7cbb160f0e3bd4479a863ddb.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_011332_645923_5FF9EAA4 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Singo Chang
 =?UTF-8?Q?=28=E5=BC=B5=E8=88=88=E5=9C=8B=29?= <Singo.Chang@mediatek.com>,
 Roy-CW Yeh =?UTF-8?Q?=28=E8=91=89=E4=B8=AD=E7=91=8B=29?=
 <Roy-CW.Yeh@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?=
 <yongqiang.niu@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Moudy Ho =?UTF-8?Q?=28=E4=BD=95=E5=AE=97=E5=8E=9F=29?= <Moudy.Ho@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
 CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rex,

Thank for the reviews.

On Fri, 2022-04-15 at 14:24 +0800, Rex-BC Chen wrote:
> On Tue, 2022-04-12 at 18:31 +0800, jason-jh.lin wrote:
> > The mmsys routing table of mt8195 vdosys0 has 2 DITHER components,
> > so mmsys need to add DDP_COMPONENT_DITHER1 and change all usages of
> > DITHER enum form DDP_COMPONENT_DITHER to DDP_COMPONENT_DITHER0.
> > 
> > But its header need to keep DDP_COMPONENT_DITHER enum
> > until drm/mediatek also changed it.
> 
> Hello Jason,
> 
> IMO, it's strange.
> In this case , I think you sholud squash [v18,08/10] and [v18,09/10].
> Therefore, you don't need to describe this here.
> 

As the CK reply before:

https://patchwork.kernel.org/project/linux-mediatek/patch/20220407030409.9664-4-jason-jh.lin@mediatek.com/#24806029

[v18,08/10] and [v18,09/10] belong to 2 different trees, so I add the
description here.

Regards,
Jason-JH.Lin


> BRs,
> Rex
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
