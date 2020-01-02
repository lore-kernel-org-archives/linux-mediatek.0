Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF2CC2D0DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 07:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE6D20672
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 07:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KGeHyUqS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ng4aCPd6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AE6D20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGoz3Bl4KhNTHHi5MqRckqXqs103Juwhk5t+9hRIfWU=; b=KGeHyUqSYSFzXW
	QqRG28mxLAIxXpoAe5miyH86yRG2j0JFwynGUhgKsngOhtGwYcnZfHTRkX+OX9f9N43Rtyo1oIzrl
	AJ7mL2gSPWIoeV1V2TfsI9Ko+MsRlR7cbBTcC7m7UlqKQbwX8E2hNfxZK/z+v6r0ZTbwGrrgJolHE
	xJPmnJkUP2ruFGK4L1M7066DkWKr0zeB7nTO3pVj5rD/avn3ThKVXpYjpOsYaM5mR/FgG9r+N1txH
	EO/EsbZYqEVf5Qs6lL6N5SRus/QFGH8FbRFKRJhyfysLbqU4EzJdH9wvMLlg24ghtH60rq/RCCjpo
	TfVzein7ziDVyGg00E/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imuds-0004VF-IF; Thu, 02 Jan 2020 07:11:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imudh-0004Ls-AZ; Thu, 02 Jan 2020 07:11:26 +0000
X-UUID: 928c2037745542a98efcf0c0850f3413-20200101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=In6OwDT/YxJiEkeYl7SpJiR0aYr+OGSpKakTOdvs2lk=; 
 b=Ng4aCPd6r6anBWqRlSeYsycj6KGTjQIGp9NUz9AXnuDECTp8S4hO0NxatQbhqzEtfuDLjDS3cq75vf53S5lS//k8LvRyAGajku7x7ameCsWhaiz3u8KPIp9BWlzvBWpZcYiP+ZwOCGQ7RX0Kh8ahBxErgItiUFUxMqvquWhwg1k=;
X-UUID: 928c2037745542a98efcf0c0850f3413-20200101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1702616137; Wed, 01 Jan 2020 23:11:22 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 23:01:59 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 2 Jan 2020 15:01:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 15:01:59 +0800
Message-ID: <1577948404.15116.18.camel@mhfsdcap03>
Subject: Re: [PATCH v6, 02/14] drm/mediatek: move dsi/dpi select input into
 mtk_ddp_sel_in
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 2 Jan 2020 15:00:04 +0800
In-Reply-To: <1577947234.4925.2.camel@mtksdaap41>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-3-git-send-email-yongqiang.niu@mediatek.com>
 <1577941388.24650.2.camel@mtksdaap41> <1577943579.15116.1.camel@mhfsdcap03>
 <1577944949.32066.1.camel@mtksdaap41> <1577946073.15116.8.camel@mhfsdcap03>
 <1577947234.4925.2.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_231125_373051_BF0D2568 
X-CRM114-Status: GOOD (  22.40  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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

On Thu, 2020-01-02 at 14:40 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Thu, 2020-01-02 at 14:21 +0800, Yongqiang Niu wrote:
> > On Thu, 2020-01-02 at 14:02 +0800, CK Hu wrote:
> > > Hi, Yongqiang:
> > > 
> > > On Thu, 2020-01-02 at 13:39 +0800, Yongqiang Niu wrote:
> > > > On Thu, 2020-01-02 at 13:03 +0800, CK Hu wrote:
> > > > > Hi, Yongqiang:
> > > > > 
> > > > > On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> > > > > > move dsi/dpi select input into mtk_ddp_sel_in
> > > > > > 
> > > > > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 10 ++++++----
> > > > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > > > > > index 39700b9..91c9b19 100644
> > > > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > > > > > @@ -376,6 +376,12 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
> > > > > >  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > > > > >  		*addr = DISP_REG_CONFIG_DSI_SEL;
> > > > > >  		value = DSI_SEL_IN_BLS;
> > > > > > +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> > > > > > +		*addr = DISP_REG_CONFIG_DSI_SEL;
> > > > > > +		value = DSI_SEL_IN_RDMA;
> > > > > 
> > > > > In original code, this is set when cur == DDP_COMPONENT_BLS and next ==
> > > > > DDP_COMPONENT_DPI0. Why do you change the condition?
> > > > > 
> > > > > Regards,
> > > > > CK
> > > > 
> > > > if bls connect with dpi0, rdma1 should connect with dsi0, the condition
> > > > is same with before.
> > > 
> > > You suggest that two crtcs are both enabled. If only one crtc is
> > > enabled, just one of these two would be set.
> > > 
> > > Regards,
> > > CK
> > 
> > OK, i will modify like this
> > else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > 		*addr = DISP_REG_CONFIG_DSI_SEL;
> > 		value = DPI_SEL_IN_RDMA;
> > 	}
> > in mtk_ddp_sel_in.
> > 
> > don't set DISP_REG_CONFIG_DPI_SEL to DPI_SEL_IN_BLS anymore, because
> > DPI_SEL_IN_BLS is zero, it is same with hardware default setting.
> 
> In Bibby's case, there is only the path from BLS to DPI0 and has no path
> from RDMA1 to DSI0, but it need to set these two register. Maybe its
> setting is just for some SoC, so you may use the compatible name to
> judge how to set this two register.
> 
> Regards,
> CK
> 

it the original use case, if bls->dpi0, it set 3 register,
DISP_REG_CONFIG_DPI_SEL set to DPI_SEL_IN_BLS ,and this is 
0, so this is useless setting.

then are only 2 useful setting.
in this patch i have upload, i keep DISP_REG_CONFIG_OUT_SEL
still in mtk_ddp_sout_sel.
and only move DISP_REG_CONFIG_DSI_SEL into mtk_ddp_sel_in.
i suppose this is enough for this use case.
and no need compatible name to control this.
please double confirm.

and there will more and more SOC upstream in the future.
these function will be more complex.
there should be coding one more suitable function to 
handle these connection

> > > 
> > > > > 
> > > > > > +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > > > > > +		*addr = DISP_REG_CONFIG_DPI_SEL;
> > > > > > +		value = DPI_SEL_IN_BLS;
> > > > > >  	} else {
> > > > > >  		value = 0;
> > > > > >  	}
> > > > > > @@ -393,10 +399,6 @@ static void mtk_ddp_sout_sel(struct regmap *config_regs,
> > > > > >  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > > > > >  		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
> > > > > >  				BLS_TO_DPI_RDMA1_TO_DSI);
> > > > > > -		regmap_write(config_regs, DISP_REG_CONFIG_DSI_SEL,
> > > > > > -				DSI_SEL_IN_RDMA);
> > > > > > -		regmap_write(config_regs, DISP_REG_CONFIG_DPI_SEL,
> > > > > > -				DPI_SEL_IN_BLS);
> > > > > >  	}
> > > > > >  }
> > > > > >  
> > > > > 
> > > > > 
> > > > 
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
