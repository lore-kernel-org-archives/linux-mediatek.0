Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05C8C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 02:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2CMgXIQQHKwxgeIoHrSnjmQ8adzEgnxQJTSuobpeZY=; b=HGxdFox2ZqEJY9
	c1lAdJTrGY+gY6Kv1Lpf83nGFNCYRqqEkNqEoY/M0VS+bMI9OYi0nhM20PhfJBusRyNSXOgRYfZQW
	0adZeP4pFKtq+q0hC9N1dlOwgVuySvk+GqIB/q5su6Y8FXRp9dGyC2qJElmVnF4vnmo8rPAe4uJJ1
	Hci9LwdodxjTjE9yGc0kvail6R/18WFpF+Qnb2T9dn1blAVTpJYtseRhU+rEdnQoNYLbi7Vv3yuXI
	MYg1o/XsTrAQtCqlBLGFQLulMJz/VXib6Pnrp53Uo3KR18QiVGDiPfaNniNZFL8Eerm6kyXbS5I7v
	buI8UYfSev4XQ07Oy4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzU7O-005BHo-GU; Fri, 10 Jun 2022 02:11:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzU76-005B9m-Go; Fri, 10 Jun 2022 02:11:06 +0000
X-UUID: 34feaacd251a4f259a90dcb80d8405b3-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:ed81d1a9-476b-4296-9c63-1dc573811b2b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:d7eb52e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 34feaacd251a4f259a90dcb80d8405b3-20220609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1181242574; Thu, 09 Jun 2022 19:10:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 19:10:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 10 Jun 2022 10:10:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 10 Jun 2022 10:10:48 +0800
Message-ID: <3ced724e0067e105c11889a5d1bf3247ed57e520.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Guillaume Ranquet <granquet@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun
 =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?= <Chunfeng.Yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>
Date: Fri, 10 Jun 2022 10:10:40 +0800
In-Reply-To: <d86e62ab8613f32a50e905f6ac14173b25d36006.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
	 <d86e62ab8613f32a50e905f6ac14173b25d36006.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_191104_619091_00AE78AF 
X-CRM114-Status: GOOD (  27.67  )
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

On Thu, 2022-06-09 at 17:37 +0800, CK Hu wrote:
> Hi, Rex:
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > 
> > It supports the mt8195, the embedded DisplayPort units. It offers
> > DisplayPort 1.4 with up to 4 lanes.
> > 
> > The driver creates a child device for the phy. The child device
> > will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so
> > that
> > both can work with the same register range. The phy driver sets
> > device
> > data that is read by the parent to get the phy device that can be
> > used
> > to control the phy properties.
> > 
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> 
> [snip]
> 
> > +
> > +static int mtk_dp_power_disable(struct mtk_dp *mtk_dp)
> > +{
> > +	int ret;
> > +
> > +	ret = mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = mtk_dp_write(mtk_dp, MTK_DP_0034,
> 
> MTK_DP_0034 is defined as:
> 
> +#define MTK_DP_0034		      (BIT(2) | BIT(4) | BIT(5))
> 
> I think this a weird address.
> 
> > +			   DA_CKM_CKTX0_EN_FORCE_EN |
> > DA_CKM_BIAS_LPF_EN_FORCE_VAL |
> > +		     DA_CKM_BIAS_EN_FORCE_VAL |
> > +		     DA_XTP_GLB_LDO_EN_FORCE_VAL |
> > +		     DA_XTP_GLB_AVD10_ON_FORCE_VAL);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Disable RX */
> > +	ret = mtk_dp_write(mtk_dp, MTK_DP_1040, 0);
> 
> 
> MTK_DP_1040 is defined as:
> 
> +#define MTK_DP_1040		      (BIT(6) | BIT(12))
> 
> I think this a weird address.
> 
> Regards,
> CK
> 

Hello CK,

I will change them to 0x34 and 0x1040.

BRs,
Rex

> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
> > +			   0x550 | BIT(FUSE_SEL_SHIFT) |
> > BIT(MEM_ISO_EN_SHIFT));
> > +
> > +	return ret;
> > +}
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
