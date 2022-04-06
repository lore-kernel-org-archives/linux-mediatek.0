Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F76CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUGEuUdTRY4v+M9bqYUv5ORc5l7nTx08MJxlggMgCOM=; b=U1R9ZbgXzfEdp6
	BlT1zNbSzlLiKbARNHhKTqjm/LCd33f/fbHmEvdJ9w4KJev5rnZXIVaUwLOsyVDGItWN22hN9ioaI
	FtDzmyAJsAXgOJG1zpxAB+zVkPEaf57jVxH5+Uis7ZAPJEAfqq+TU7e6b1t09PvnQq7Id4pmjVyRK
	Oq6GV3Z5toVX6vGbS/RTw4gvrhhbW5/+/NUsKehSc/ujQ/lGSDa1Xhifrm4FtWuAKin0+ZgHnuEgh
	dXxIvFEF215wRFWhv8DlmXGaVXXhMXclwvvOzbxV3YSa1iRWyLM6+hHCPjUwHRHzngslk+5NMomSg
	bob2vaftx+T8m527ZhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc3EK-005Wxs-DV; Wed, 06 Apr 2022 10:49:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc3Df-005WZh-BG; Wed, 06 Apr 2022 10:49:01 +0000
X-UUID: 443dcb887a2347d1a39b862e29391f80-20220406
X-UUID: 443dcb887a2347d1a39b862e29391f80-20220406
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1067332888; Wed, 06 Apr 2022 03:48:54 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 03:48:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 18:48:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 18:48:45 +0800
Message-ID: <4ed2dc24d600fa73b91bb411391c98a5bf4f8d8b.camel@mediatek.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8192
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@linux.ie"
 <airlied@linux.ie>, Yongqiang Niu
 =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?= <yongqiang.niu@mediatek.com>,
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>, Nancy Lin
 =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?= <Nancy.Lin@mediatek.com>,
 Allen-KH Cheng =?UTF-8?Q?=28=E7=A8=8B=E5=86=A0=E5=8B=B3=29?=
 <Allen-KH.Cheng@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 6 Apr 2022 18:48:45 +0800
In-Reply-To: <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-4-rex-bc.chen@mediatek.com>
 <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_034859_427226_90FDA722 
X-CRM114-Status: GOOD (  10.69  )
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

On Wed, 2022-04-06 at 18:40 +0800, AngeloGioacchino Del Regno wrote:
> Il 06/04/22 11:46, Rex-BC Chen ha scritto:
> > The driver data for MT8192 is the same with MT8183. Therefore, we
> > correct it.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> ...though, from what I know, you should also move MT8195 down there!

Hello Angelo,

Thanks for your review.
But for MT8195, disp_aal is using the same compatible with MT8173.

From the MT8195 project DTS is using:

aal0: disp_aal@1c005000 {
	compatible = "mediatek,mt8195-disp-aal",
		     "mediatek,mt8173-disp-aal";
	reg = <0 0x1c005000 0 0x1000>;
	interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
	power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
	clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
	mediatek,gce-client-reg =
		 <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
};

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
