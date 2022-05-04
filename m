Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEECC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 06:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjj++zXS6VZ+jf7PoC2wzSIWb5KwQWg4Kzs8a63RbTQ=; b=ZJkTtdX1E4/26F
	VApdRG3Wa8B4klJ3lK999nrzQSLb2KP4Ug+B2rIA2VQbMOJ/pU8o6/YkuXqTZm/0hObkzUGBUrNjT
	/dqb4INJ1bcaLOqqlR7YwOFf12To7yZ/xOHbqXTTPFs+QGHsDxTGtSKoIzjm0tVjBJ1pFu6rIBQ6W
	o67ftRfyA3xUvooM10AHxnettSHfyPBOdFYV2V0dIQDQQQHaFcocfFu3JZsy8XEiz+IBzQX/94U55
	u1Kh69LUtjjKhY+T0HPHxDXEbKH56Msi95MsUQ19zFmt4iq4oQ0JclLVc3WlEeQzf92RJO3HLzrJ7
	Y4oCr/RClxZSI3ltPKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm8AJ-008wD0-Hu; Wed, 04 May 2022 06:07:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm8AH-008wCG-9h; Wed, 04 May 2022 06:07:10 +0000
X-UUID: 2db3503e5ac8490092cdf4add0f5955b-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ea73a30e-a6a5-4dbf-ab0c-585050ec2557, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:93fca32f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2db3503e5ac8490092cdf4add0f5955b-20220503
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 909228779; Tue, 03 May 2022 23:07:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 23:07:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 14:06:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 14:06:59 +0800
Message-ID: <dbfd045b65c4acec1fe11e96ed64c9c041b769f3.camel@mediatek.com>
Subject: Re: [PATCH v19 02/25] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 4 May 2022 14:06:59 +0800
In-Reply-To: <ab2ca5755069df3e9efb467d028a4d10004d9420.camel@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-3-nancy.lin@mediatek.com>
 <ab2ca5755069df3e9efb467d028a4d10004d9420.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_230709_389425_A60EF358 
X-CRM114-Status: GOOD (  20.09  )
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

Hi Rex,

Thanks for the review.

On Wed, 2022-05-04 at 11:50 +0800, Rex-BC Chen wrote:
> On Tue, 2022-05-03 at 18:23 +0800, Nancy.Lin wrote:
> > Add vdosys1 reset control bit for MT8195 platform.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  include/dt-bindings/reset/mt8195-resets.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/include/dt-bindings/reset/mt8195-resets.h
> > b/include/dt-
> > bindings/reset/mt8195-resets.h
> > index a26bccc8b957..aab8d74496a6 100644
> > --- a/include/dt-bindings/reset/mt8195-resets.h
> > +++ b/include/dt-bindings/reset/mt8195-resets.h
> > @@ -26,4 +26,16 @@
> >  
> >  #define MT8195_TOPRGU_SW_RST_NUM               16
> >  
> > +/* VDOSYS1 */
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC          25
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC          26
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC          27
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC          28
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC          29
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC     51
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC     52
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC     53
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC     54
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC      55
> > +
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
> 
> Hello Nancy,
> 
> From my previous experience, this should be "index".
> I think you can list all of them from 0 to 55.
> 
> BRs,
> Rex

Thanks for your advice. I will list all vdosys1 reset bits.
> 

Regards,
Nancy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
