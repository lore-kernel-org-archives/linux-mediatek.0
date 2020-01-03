Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181E1C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 05:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDAD222314
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 05:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fY1ePVFF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Rvibf7ha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDAD222314
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eHoVScsiju1ECCqPOvK6A4yV7T1lmnKM2Mgo8KK2F4=; b=fY1ePVFFHm2eYN
	opslH7Pp+Lt0rgJkaFw8MXG/ayEMflQusdWgYJJQJlKPh3i8+rwB3uh6X1AQo67ecPvqCY1V/S2F5
	SyW2NBgKnbKS4FfaYU+jHeGGqQ0BstizhnYY8+Lgsr5Z7MxeeEolBVUpUJneaVUmJ1XR79o9TAzTd
	ezKuSr6dPkexzfHBoecqopxx7xl80Oyu+/bRK/L00/ofwWUEkAMuvyP2H2bFrdTK8KgMfpbZW661q
	+o43pnbEvz74FPagT12dDmwzQVbxmnxg+x0l+uFFqx1GrchrWOeb6hYWV6f1BjuGYGbEA9sicj12V
	90gste73/1iAca5g6qIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inFCW-0007wG-28; Fri, 03 Jan 2020 05:08:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inFCO-0007oz-Gz; Fri, 03 Jan 2020 05:08:38 +0000
X-UUID: aab268f0efbe42fa8e0a518e7d702a4b-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rdFrZ9Jcx8qzNQWZZwmRMxMHx3C9rWLkOXwKIpvFHjM=; 
 b=Rvibf7havVaKhnC4XTaV0QntwUxhp1Xt9eHtGaOqA/r+VsCGVELqYL1kchKyk9oy5SKTUV6SAE70ikGwYpCMLYDKlgFrU4Oi56LfL9APrMfk69tEX/8CVvq9FC8jhp0nHmwyoBbdNmfBiSdqdx5u+v6MSxh5/frsVf+s8QoDcu0=;
X-UUID: aab268f0efbe42fa8e0a518e7d702a4b-20200102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1358189296; Thu, 02 Jan 2020 21:08:29 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 20:58:30 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 12:57:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 12:58:48 +0800
Message-ID: <1578027500.30178.0.camel@mtksdaap41>
Subject: Re: [RESEND PATCH v6 00/17] add drm support for MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Fri, 3 Jan 2020 12:58:20 +0800
In-Reply-To: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB3FFA3455567347BB4B802EBF6FC3E22F76B49220CCA2C99D4FD73A8E25E2142000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_210836_576370_9D6A3795 
X-CRM114-Status: GOOD (  13.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Yongqiang:

This 'RESEND v6' is different with v6, so I think you should call this
v7.

Regards,
CK

On Fri, 2020-01-03 at 11:12 +0800, Yongqiang Niu wrote:
> This series are based on 5.5-rc1 and provid 17 patch
> to support mediatek SOC MT8183
> 
> Change since v5
> - fix reviewed issue in v5
> base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
> 
> Change since v4
> - fix reviewed issue in v4
> 
> Change since v3
> - fix reviewed issue in v3
> - fix type error in v3
> - fix conflict with iommu patch
> 
> Change since v2
> - fix reviewed issue in v2
> - add mutex node into dts file
> 
> Changes since v1:
> - fix reviewed issue in v1
> - add dts for mt8183 display nodes
> - adjust display clock control flow in patch 22
> - add vmap support for mediatek drm in patch 23
> - fix page offset issue for mmap function in patch 24
> - enable allow_fb_modifiers for mediatek drm in patch 25
> 
> Yongqiang Niu (17):
>   dt-bindings: mediatek: add rdma_fifo_size description for mt8183
>     display
>   arm64: dts: add display nodes for mt8183
>   drm/mediatek: move dsi/dpi select input into mtk_ddp_sel_in
>   drm/mediatek: make sout select function format same with select input
>   drm/mediatek: add mmsys private data for ddp path config
>   drm/mediatek: add private data for rdma1 to dpi0 connection
>   drm/mediatek: add private data for rdma1 to dsi0 connection
>   drm/mediatek: move rdma sout from mtk_ddp_mout_en into
>     mtk_ddp_sout_sel
>   drm/mediatek: add connection from OVL0 to OVL_2L0
>   drm/mediatek: add connection from RDMA0 to COLOR0
>   drm/mediatek: add connection from RDMA1 to DSI0
>   drm/mediatek: add connection from OVL_2L0 to RDMA0
>   drm/mediatek: add connection from OVL_2L1 to RDMA1
>   drm/mediatek: add connection from DITHER0 to DSI0
>   drm/mediatek: add connection from RDMA0 to DSI0
>   drm/mediatek: add fifo_size into rdma private data
>   drm/mediatek: add support for mediatek SOC MT8183
> 
>  .../bindings/display/mediatek/mediatek,disp.txt    |  13 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  98 +++++++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  18 ++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  25 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 288 ++++++++++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |   7 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  49 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   3 +
>  9 files changed, 435 insertions(+), 70 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
