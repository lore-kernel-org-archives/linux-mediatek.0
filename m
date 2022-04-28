Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A54C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aGDbWy8XsIU2T0BwkV3BtSckOLqu34JHhM26MYSaEw=; b=iZQ1oyxAzGnPht
	eY3IW7xFe0//TvIMnlo/d89ueTtDyOoOco70THmJ/4wcyxcg9ncc02kNp76lYkT0Hxl96bNywN4fn
	UcBH4Hw65wriisFLaRMva6foVYaU73ILao9GqzFA0g1je+Nwlv1Zd7dR6SbS4+W8F/dBgIYmkZxwp
	1SREdmQTA963xa3ARvCxv98HNUIPOM/jXD7C01ns4gyiUIbK9VNkZNEiP8VmXUzCgyVvlKnLDvcjP
	JZcfKMuVX5XDkswIL59CyB1mBfCgehD6yakc17ebQ2a+COGRWTy7zzOtunu21KdHCOyZcFFDNoNcf
	V9JPCyfe1CkYouXHGs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk2BN-006V1s-EM; Thu, 28 Apr 2022 11:19:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk2Ab-006Uf1-GN; Thu, 28 Apr 2022 11:18:51 +0000
X-UUID: 81398703e46f4ee5bb94f1805ea0ce25-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:5ddc638d-29eb-4ab8-a845-7a87a4062eb9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:7698d3c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 81398703e46f4ee5bb94f1805ea0ce25-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 233296941; Thu, 28 Apr 2022 04:18:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 04:18:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 28 Apr 2022 19:18:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 19:18:41 +0800
Message-ID: <b83049a9cc9714a28c90a167245c43afddbc1aab.camel@mediatek.com>
Subject: Re: [PATCH V4 12/15] dt-bindings: reset: mediatek: Add infra_ao
 reset bit for MT8192/MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, Runyang Chen
 =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 28 Apr 2022 19:18:41 +0800
In-Reply-To: <d96797dc-8fbd-fe1c-f970-2f6fc8ca5b69@linaro.org>
References: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
 <20220427030950.23395-13-rex-bc.chen@mediatek.com>
 <d96797dc-8fbd-fe1c-f970-2f6fc8ca5b69@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_041849_627945_17ADD3A7 
X-CRM114-Status: GOOD (  20.97  )
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

On Thu, 2022-04-28 at 15:18 +0800, Krzysztof Kozlowski wrote:
> On 27/04/2022 05:09, Rex-BC Chen wrote:
> > - To support reset of infra_ao, add the bit definition of
> >   thermal/PCIe/SVS for MT8192.
> > - To support reset of infra_ao, add the bit definition of
> >   thermal/SVS for MT8195.
> > - Add the driver comment to separate the reset index for
> >   TOPRGU and INFRA.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  include/dt-bindings/reset/mt8192-resets.h | 8 ++++++++
> >  include/dt-bindings/reset/mt8195-resets.h | 6 ++++++
> >  2 files changed, 14 insertions(+)
> > 
> > diff --git a/include/dt-bindings/reset/mt8192-resets.h
> > b/include/dt-bindings/reset/mt8192-resets.h
> > index be9a7ca245b9..ee0ca02a39bf 100644
> > --- a/include/dt-bindings/reset/mt8192-resets.h
> > +++ b/include/dt-bindings/reset/mt8192-resets.h
> > @@ -7,6 +7,7 @@
> >  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
> >  #define _DT_BINDINGS_RESET_CONTROLLER_MT8192
> >  
> > +/* TOPRGU resets */
> >  #define MT8192_TOPRGU_MM_SW_RST					
> > 1
> >  #define MT8192_TOPRGU_MFG_SW_RST				2
> >  #define MT8192_TOPRGU_VENC_SW_RST				3
> > @@ -27,4 +28,11 @@
> >  
> >  #define MT8192_TOPRGU_SW_RST_NUM				23
> >  
> > +/* INFRA resets */
> > +#define MT8192_INFRA_THERMAL_CTRL_RST			0
> > +#define MT8192_INFRA_PEXTP_PHY_RST				79
> > +#define MT8192_INFRA_PTP_RST					
> > 101
> > +#define MT8192_INFRA_RST4_PCIE_TOP				129
> > +#define MT8192_INFRA_THERMAL_CTRL_MCU_RST		140
> 
> This is still wrong. I gave you exactly what has to be used:
> 0
> 1
> 2
> ...
> 
> It's a decimal number incremented by one.
> 
> 
> > +
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> > diff --git a/include/dt-bindings/reset/mt8195-resets.h
> > b/include/dt-bindings/reset/mt8195-resets.h
> > index a26bccc8b957..a3226f40779c 100644
> > --- a/include/dt-bindings/reset/mt8195-resets.h
> > +++ b/include/dt-bindings/reset/mt8195-resets.h
> > @@ -7,6 +7,7 @@
> >  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
> >  #define _DT_BINDINGS_RESET_CONTROLLER_MT8195
> >  
> > +/* TOPRGU resets */
> >  #define MT8195_TOPRGU_CONN_MCU_SW_RST          0
> >  #define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
> >  #define MT8195_TOPRGU_APU_SW_RST               2
> > @@ -26,4 +27,9 @@
> >  
> >  #define MT8195_TOPRGU_SW_RST_NUM               16
> >  
> > +/* INFRA resets */
> > +#define MT8195_INFRA_THERMAL_AP_RST            0
> > +#define MT8195_INFRA_PTP_RST                   101
> > +#define MT8195_INFRA_THERMAL_MCU_RST           138
> 
> Same issue.
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Thanks for your review.
As mentioned in prvious mail, I will add all reset bits in MT8192 and
MT8195.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
