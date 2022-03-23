Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B04C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 12:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gR+bJnX0zRTvmiEr2QLymUlDJ//FSx5+zm16VJ/T5ic=; b=tH0PM+a9eetXgG
	hm6sdQgTL5HtiT7/Bg3xDv4kzgPGS6zAp9BbTCHGNpNmsRXHfpNmbblRl/46AWxQQ5cGQid6COb0T
	FzlJnEgERcXznoWKQlOhRweVEauS3ltC7ikDJcwa5I/sSdSShKbj2M1IxWE8/2Xz/RnYS5f0KZd6d
	jy6l7Z3VqvD9sxBbTHbkaScoxLQuIr+F9bt/TF/6XJihuFnLfDWhfjTBpccUvKLuF1AoJthv0+rKF
	8SSYOayEQkpoBNO9uX5mMad1vFsqm60YaENVvY2agOFF6uhzK51tu6813dNBkOxbWyBXyZN/XSwif
	fCKZZENgfoYkymBXWMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWzwO-00DbN2-GJ; Wed, 23 Mar 2022 12:18:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWzwD-00DbLm-H0; Wed, 23 Mar 2022 12:18:06 +0000
X-UUID: fbf3e6a16f5c4808b8932fb6371c229d-20220323
X-UUID: fbf3e6a16f5c4808b8932fb6371c229d-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 336592840; Wed, 23 Mar 2022 05:18:00 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 05:17:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 20:17:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 20:17:22 +0800
Message-ID: <be945651bcb531a14d6f264be346642d4438238b.camel@mediatek.com>
Subject: Re: [PATCH v3, 0/3] Add mt8186 dsi compatoble & Convert 
 dsi_dtbinding to .yaml
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>
Date: Wed, 23 Mar 2022 20:17:21 +0800
In-Reply-To: <1647408934-15775-1-git-send-email-xinlei.lee@mediatek.com>
References: <1647408934-15775-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_051805_578895_D7582D19 
X-CRM114-Status: GOOD (  13.10  )
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

On Wed, 2022-03-16 at 13:35 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Changes since v2:
> 1. Added #address-cells, #size-cells two properties.
> 2. Fix some formatting issues.
> 
> Changes since v1:
> 1. Delete the mediatek,dsi.txt & Add the mediatek,dsi.yaml.
> 2. Ignore the Move the getting bridge node function patch for V1.
> 
> Xinlei Lee (3):
>   dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml
>   dt-bindings: display: mediatek: dsi: Add compatible for MediaTek
>     MT8186
>   drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c
> 
>  .../display/mediatek/mediatek,dsi.txt         | 62 ------------
>  .../display/mediatek/mediatek,dsi.yaml        | 97
> +++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  8 ++
>  3 files changed, 105 insertions(+), 62 deletions(-)
>  delete mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml

Hello Xinlei,

I think you should cc devicetree@vger.kernel.org if you have binding
patches.
Please send next version with it.

Thanks.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
