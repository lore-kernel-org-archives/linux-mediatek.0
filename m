Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53098C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 07:03:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C1E207BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 07:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHbVLsBS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mqAXxRcV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C1E207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C322e0/mwy8J/wnHi47etZMlKn40dyBd+RzSM1xgrG0=; b=fHbVLsBSbsAh+kJ34koy2njZ9
	QDFdeahuE02OBD3d4SAbw2z+1pdH/VjoArk/MFY7WSuzlKy5TAhrX31VgCgyZphSqjXlaff6/1kwH
	/cN7TTXamX6gy8xD+9TewXVUt9XEHNS2DgMuvFaXclDXd41z8vxeDo7jf9fUOehXGzY5C46VxYoZE
	3mwk/aI/+iJLuHOzAIgytZTg3miAkvoj5HBpVom6sxx/vSbZOtLKmohzk5S6rrgiJRPRhVts0RXoK
	28qiQjH4ysb6m5YdaE4Lknb2ywwaxVbmlOdX4UnVgSBdvs/HX5n1yjviZVKd5vHJ0b+Y3OOVZZvS3
	/psHm7H9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jusUX-0001B8-NB; Mon, 13 Jul 2020 07:03:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jusUU-00019i-ON; Mon, 13 Jul 2020 07:03:07 +0000
X-UUID: 8f688e7054634324ad086e968b06cdc1-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3fTv0ya9+6e1JsaEzRkR7OFnJZ1h0+BVwHRIgcNxfp8=; 
 b=mqAXxRcVG+Ew54YpvKEDrpMdBq5G+zhcZG3VKHAKnFOBvLx+UUZdmeeLO5NN5CZrxyVRTYqqnOe5VIUcsRcTSB8l/lGe95SnojMYdkLGkC51a5Wm65eFRmtgwrMKP28o7shjENsJAoG9F1ZjXhVkf51I2iGITqagsQQlOdGgRQs=;
X-UUID: 8f688e7054634324ad086e968b06cdc1-20200712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 82279301; Sun, 12 Jul 2020 23:03:00 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 23:55:48 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Jul 2020 14:55:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 14:55:44 +0800
Message-ID: <1594623299.16172.29.camel@mhfsdcap03>
Subject: Re: [PATCH 04/21] dt-binding: mediatek: Add binding for mt8192
 IOMMU and SMI
From: Yong Wu <yong.wu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 13 Jul 2020 14:54:59 +0800
In-Reply-To: <CANdKZ0cGNy7ckzD_NAOV613o62WHdYazRRM-J8jY2-4mx_sNDA@mail.gmail.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-5-yong.wu@mediatek.com>
 <CANdKZ0cGNy7ckzD_NAOV613o62WHdYazRRM-J8jY2-4mx_sNDA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 533535A6522B7AB06F6A5C489515BEA97381B42424A0490A05D20470D84F27B32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_030307_080744_28039319 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: Youlin Pei =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?=
 <youlin.pei@mediatek.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-13 at 13:36 +0800, Pi-Hsun Shih wrote:
> On Sat, Jul 11, 2020 at 2:50 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > This patch adds decriptions for mt8192 IOMMU and SMI.
> >
> > mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> > table format. The M4U-SMI HW diagram is as below:
> >
> >                           EMI
> >                            |
> >                           M4U
> >                            |
> >                       ------------
> >                        SMI Common
> >                       ------------
> >                            |
> >   +-------+------+------+----------------------+-------+
> >   |       |      |      |       ......         |       |
> >   |       |      |      |                      |       |
> > larb0   larb1  larb2  larb4     ......      larb19   larb20
> > disp0   disp1   mdp    vdec                   IPE      IPE
> >
> > All the connections are HW fixed, SW can NOT adjust it.
> >
> > mt8192 M4U support 0~16GB iova range. we preassign different engines
> > into different iova ranges:
> >
> > domain-id  module     iova-range                  larbs
> >    0       disp        0 ~ 4G                      larb0/1
> >    1       vcodec      4G ~ 8G                     larb4/5/7
> >    2       cam/mdp     8G ~ 12G             larb2/9/11/13/14/16/17/18/19/20
> >    3       CCU0    0x4000_0000 ~ 0x43ff_ffff     larb13: port 9/10
> >    4       CCU1    0x4400_0000 ~ 0x47ff_ffff     larb14: port 4/5
> >
> > The iova range for CCU0/1(camera control unit) is HW requirement.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  .../bindings/iommu/mediatek,iommu.txt         |   8 +-
> >  .../mediatek,smi-common.txt                   |   5 +-
> >  .../memory-controllers/mediatek,smi-larb.txt  |   3 +-
> >  include/dt-bindings/memory/mt8192-larb-port.h | 237 ++++++++++++++++++
> >  4 files changed, 247 insertions(+), 6 deletions(-)
> >  create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
> > ...
> > diff --git a/include/dt-bindings/memory/mt8192-larb-port.h b/include/dt-bindings/memory/mt8192-larb-port.h
> > new file mode 100644
> > index 000000000000..fbe0d5d50f1c
> > --- /dev/null
> > +++ b/include/dt-bindings/memory/mt8192-larb-port.h
> > ...
> > +/* larb7 */
> > +#define M4U_PORT_L7_VENC_RCPU                  MTK_M4U_DOM_ID(1, 7, 0)
> > +#define M4U_PORT_L7_VENC_REC                   MTK_M4U_DOM_ID(1, 7, 1)
> > +#define M4U_PORT_L7_VENC_BSDMA                 MTK_M4U_DOM_ID(1, 7, 2)
> > +#define M4U_PORT_L7_VENC_SV_COMV               MTK_M4U_DOM_ID(1, 7, 3)
> > +#define M4U_PORT_L7_VENC_RD_COMV               MTK_M4U_DOM_ID(1, 7, 4)
> > +#define M4U_PORT_L7_VENC_CUR_LUMA              MTK_M4U_DOM_ID(1, 7, 5)
> > +#define M4U_PORT_L7_VENC_CUR_CHROMA            MTK_M4U_DOM_ID(1, 7, 6)
> > +#define M4U_PORT_L7_VENC_REF_LUMA              MTK_M4U_DOM_ID(1, 7, 7)
> > +#define M4U_PORT_L7_VENC_REF_CHROMA            MTK_M4U_DOM_ID(1, 7, 8)
> > +#define M4U_PORT_L7_JPGENC_Y_RDMA              MTK_M4U_DOM_ID(1, 7, 9)
> > +#define M4U_PORT_L7_JPGENC_Q_RDMA              MTK_M4U_DOM_ID(1, 7, 10)
> > +#define M4U_PORT_L7_JPGENC_C_TABLE             MTK_M4U_DOM_ID(1, 7, 11)
> > +#define M4U_PORT_L7_JPGENC_BSDMA               MTK_M4U_DOM_ID(1, 7, 12)
> > +#define M4U_PORT_L7_VENC_SUB_R_LUMA            MTK_M4U_DOM_ID(1, 7, 13)
> > +#define M4U_PORT_L7_VENC_SUB_W_LUMA            MTK_M4U_DOM_ID(1, 7, 14)
> > +
> 
> Small nit, /* larb8: null */ is missing here.

oh. Yes. Thanks.
I will add it in next version.

> 
> > +/* larb9 */
> > +#define M4U_PORT_L9_IMG_IMGI_D1                        MTK_M4U_DOM_ID(2, 9, 0)
> > +#define M4U_PORT_L9_IMG_IMGBI_D1               MTK_M4U_DOM_ID(2, 9, 1)
> > +#define M4U_PORT_L9_IMG_DMGI_D1                        MTK_M4U_DOM_ID(2, 9, 2)
> > +#define M4U_PORT_L9_IMG_DEPI_D1                        MTK_M4U_DOM_ID(2, 9, 3)
> > +#define M4U_PORT_L9_IMG_ICE_D1                 MTK_M4U_DOM_ID(2, 9, 4)
> > +#define M4U_PORT_L9_IMG_SMTI_D1                        MTK_M4U_DOM_ID(2, 9, 5)
> > +#define M4U_PORT_L9_IMG_SMTO_D2                        MTK_M4U_DOM_ID(2, 9, 6)
> > +#define M4U_PORT_L9_IMG_SMTO_D1                        MTK_M4U_DOM_ID(2, 9, 7)
> > +#define M4U_PORT_L9_IMG_CRZO_D1                        MTK_M4U_DOM_ID(2, 9, 8)
> > +#define M4U_PORT_L9_IMG_IMG3O_D1               MTK_M4U_DOM_ID(2, 9, 9)
> > +#define M4U_PORT_L9_IMG_VIPI_D1                        MTK_M4U_DOM_ID(2, 9, 10)
> > +#define M4U_PORT_L9_IMG_SMTI_D5                        MTK_M4U_DOM_ID(2, 9, 11)
> > +#define M4U_PORT_L9_IMG_TIMGO_D1               MTK_M4U_DOM_ID(2, 9, 12)
> > +#define M4U_PORT_L9_IMG_UFBC_W0                        MTK_M4U_DOM_ID(2, 9, 13)
> > +#define M4U_PORT_L9_IMG_UFBC_R0                        MTK_M4U_DOM_ID(2, 9, 14)
> > +
> > ...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
