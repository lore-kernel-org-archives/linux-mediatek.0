Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F445C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 02:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 200686052B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 02:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 200686052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7mNhNuDZZGs0Domuh5ZLJhy2sZ750nCaD2MCQGOtv8=; b=0ENdwhIrdEcP46
	6HlPCzAVYr8euEd41ou0kbvaznmG1VdRS5tvpNighzhCowW38pemkZlXgymIelQMPNGQh09NLkH0m
	hykmjuNNB5TTayJK1yRzloPk8RN4W56HAQTTggDrNnUMR7wwEeY5FGRwJi8PRoYPODFJkh6arqcF6
	uePjjHJ2aA3fqer7OR4VKXF/MWYMLIK2FLQWSIY9fF7N1IplQ4xlIGjvWcqqScgFDq19Iq72BKJ+c
	7ljkwDbV1p4z7UWTG8VruIsHyUX8t/cWG2EI3GId3KCWaCWUHEZQ9P0nNoDjMbeY2y8DPCjUaKeXM
	SK1DepC67hJhs6E87Unw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAk6m-000oTz-H8; Tue, 03 Aug 2021 02:24:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAk6Q-000oBH-45; Tue, 03 Aug 2021 02:24:27 +0000
X-UUID: 7970acd666ce418081e6b061df399952-20210802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YibCADqH2XOJCVXj1Bt0Vvd8PdtC3chR2Y7d+3Ske7s=; 
 b=ao/z+c8ADMmVD1/u6nW/uP2GiIuK9yM/V+1yekLxKyvhPZE3oLGr3USMuJpcx4cDSKaWjlb/CMfF5s4uWw73Y0vz7BrhVbVq1CL0K3pHkBAeE71nS/caBR7/6JterZ2rgWVdM4xNL/Drbk8Tc6LpsqgQ+3JOAzv2tsxnlUjhOXg=;
X-UUID: 7970acd666ce418081e6b061df399952-20210802
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 527937900; Mon, 02 Aug 2021 19:24:16 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 19:24:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 10:24:13 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 10:24:13 +0800
Message-ID: <a18c9073b5dec59a4bdb3253dbc75dd56763da47.camel@mediatek.com>
Subject: Re: [PATCH v5 0/6] Add Mediatek Soc DRM (vdosys0) support for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Date: Tue, 3 Aug 2021 10:24:13 +0800
In-Reply-To: <a8ce9da7-21c2-f9ef-161a-647d3f8748f3@collabora.com>
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
 <a8ce9da7-21c2-f9ef-161a-647d3f8748f3@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_192423_663908_B6881830 
X-CRM114-Status: GOOD (  29.87  )
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

Hi Enric,

On Fri, 2021-07-30 at 13:45 +0200, Enric Balletbo i Serra wrote:
> Hi Jason,
> 
> Thank you for your patch.
> 
> On 29/7/21 19:07, jason-jh.lin wrote:
> > The hardware path of vdosys0 with eDP panel output need to go
> > through
> > by several modules, such as, OVL, RDMA, COLOR, CCORR, AAL, GAMMA,
> > DITHER, DSC and MERGE.
> > 
> 
> 
> You said in other discussions that vdosys0 has eDP panel output and
> vdosys1 has
> DP output. Is it possible to switch the outputs? What I am wondering
> is if this
> configuration is hardware specific or board specific, i.e it'll be
> possible to
> have another board that has DP output on vdosys0 and eDP output for
> vdosys1?
> 
> Thanks,
>   Enric
> 

Because the configuration is hardware specific in mt8195 SoC, it is
possible to switch the output to DP or HDMI for vdosys1 and to switch
the output to DSI or eDP for vdosys0.
Due to the hot plug reqirement for HDMI and DP, vdosys1 will support
runtime sitching output. vdosys0 can do that too, but there is no hot
plug requirement for DSI panel or eDP panel.
So we configure the output to eDP for vdosys0 in build time currently.

In another board, such as mt8173 SoC, it doesn't have vdosys1 but it is
able to set the output to DSI and HDMI for vdosys0 at the same time.

Regards,
Jason-JH.Lin

> 
> > Change in v5:
> > - add power-domain property into vdosys0 and vdosys1 dts node.
> > - add MT8195 prifix and remove unused VDO1 define in mt8195-mmsys.h
> > 
> > Change in v4:
> > - extract dt-binding patches to another patch series
> >   
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597__;!!CTRNKA9wMg0ARbw!3juKPT3EahvXs9aSRTDPxQfapIiXFGGx996Kss9b8DITyA19pd5F4K0AWsEp1U3C3FSl$
> >  
> > - squash DSC module into mtk_drm_ddp_comp.c
> > - add coment and simplify MERGE config function
> > 
> > Change in v3:
> > - change mmsys and display dt-bindings document from txt to yaml
> > - add MERGE additional description in display dt-bindings document
> > - fix mboxes-cells number of vdosys0 node in dts
> > - drop mutex eof convert define
> > - remove pm_runtime apis in DSC and MERGE
> > - change DSC and MERGE enum to alphabetic order
> > 
> > Change in v2:
> > - add DSC yaml file
> > - add mt8195 drm driver porting parts in to one patch
> > - remove useless define, variable, structure member and function
> > - simplify DSC and MERGE file and switch threre order
> > 
> > jason-jh.lin (6):
> >   arm64: dts: mt8195: add display node for vdosys0
> >   soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
> >   soc: mediatek: add mtk-mutex support for mt8195 vdosys0
> >   drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
> >   drm/mediatek: add DSC support for mt8195
> >   drm/mediatek: add MERGE support for mt8195
> > 
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 112 ++++++++
> >  drivers/gpu/drm/mediatek/Makefile           |   1 +
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
> >  drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 277
> > ++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  62 +++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   2 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  32 ++-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
> >  drivers/soc/mediatek/mt8195-mmsys.h         |  96 +++++++
> >  drivers/soc/mediatek/mtk-mmsys.c            |  11 +
> >  drivers/soc/mediatek/mtk-mutex.c            |  93 ++++++-
> >  include/linux/soc/mediatek/mtk-mmsys.h      |   9 +
> >  13 files changed, 706 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
> >  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
