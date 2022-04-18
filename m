Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00696C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 04:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIS2ABbCczqOJpNPH5I0YTnQKZ7Kg405uKAO5ujXm/I=; b=ZkopAB7kE4F0Km
	8M2kMIctqC59k/DrerG+nILw9T8sTJw+espJBLehT6saoezxnlaobd6gRMKm9cndWRQkmqtv+ETgp
	Zo41G6Zdt1kTzQJ/8iPNbwLHMOmj2D10Was0HMeL2cuH21dEzgCMwmz0g3HVUYJ1Fd5mTKmITxIQQ
	KbQgNLDNI/tScLO2JIfhPr/9uNYt3djyHfe9oxfqQX+GBGljug6hetn+VrUlhFEg9wPRqiGG0MYT3
	yl0GlE65yliV1sWVVjlMABvRN9v+4gWOeIzVCc81hd8RwpA4loqQnMpF6zXNc9SBlXgGTLZ+PvIl9
	+tAteOetS9uTV17IbczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngIcm-00FUnV-C6; Mon, 18 Apr 2022 04:04:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngIca-00FUkJ-Er; Mon, 18 Apr 2022 04:04:18 +0000
X-UUID: eb27e543f0564a5bba3c62d2d1b476bf-20220417
X-UUID: eb27e543f0564a5bba3c62d2d1b476bf-20220417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 836200072; Sun, 17 Apr 2022 21:04:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Apr 2022 20:54:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 18 Apr 2022 11:54:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 11:54:09 +0800
Message-ID: <7fd1afd02a488e1973fbe4c19ebf7a5c28a482e9.camel@mediatek.com>
Subject: Re: [PATCH v19 09/10] drm/mediatek: add postfix 0 to
 DDP_COMPONENT_DITHER for mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 18 Apr 2022 11:54:09 +0800
In-Reply-To: <7f5a4307-b28d-1072-ee1d-752b3761bc30@collabora.com>
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-10-jason-jh.lin@mediatek.com>
 <7f5a4307-b28d-1072-ee1d-752b3761bc30@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_210416_530025_34CD2A87 
X-CRM114-Status: GOOD (  12.77  )
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

Hi Angelo,

Thanks for the reviews.

On Fri, 2022-04-15 at 12:32 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/04/22 10:39, jason-jh.lin ha scritto:
> > Because mt8195 vdosys0 has 2 DITHER components,
> > so the postfix 0 need to be added to DDP_COMPONENT_DITHER.
> > 
> > Then DITHER enum will become:
> > DDP_COMPONENT_DITHER0 and DDP_COMPONENT_DITHER1.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> 
> I think that "postfix" should be "suffix" instead :)))
> 
OK, I'll fix it.
Thanks.

Regards,
Jason-JH.Lin

> In any case:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!0VHqcu_Bx0oyxup8Fj2rgqHuGYhj6UYv4YNNbEr3K8CBkZNPEQxjbrjcw6OccXWGif6P$
>  
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
