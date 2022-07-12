Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 07:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAlV9XD2Zjr58QRYoyejD4dW/OTRqViFspjEhF3s/uU=; b=Npoq5MxYpotiG0XYz8AIqvWLrX
	3XXe0Ey2pUbkt5PLAzHdWfSP96lo0yXKbfzYuqkUToCsIJmC88JH+32vpktllv+rcjErFWCd8Ig2G
	AS3cJLxZ9E2NkrqoSdZyeuXhndABnPnBe+tH3gi9i9R88504xqw/1m0opQ+q8VTfkPavnLTNj/BUX
	j/3gKgAShkdjGpWD1bL38RV9uIruzjA8oZZauweyLcojBOrIn6raPIWLI1QUhsjQEemgEGtyFPz93
	1U1F6BferDoy6WL0qy03aSmL8EAWDJlaWqhcIZfAOH+9NTv2Ugg2XD8pi/1jtQmu0l76DR5yLTwHE
	+SOS8H+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBALk-008LHj-Q8; Tue, 12 Jul 2022 07:30:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBALg-008LEe-Vx; Tue, 12 Jul 2022 07:30:27 +0000
X-UUID: b5d43c12f0484983a21d26dab41b5e5c-20220712
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ee48cd13-d554-4430-bec6-a7c57a37c926,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:90f3bc32-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b5d43c12f0484983a21d26dab41b5e5c-20220712
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 683022188; Tue, 12 Jul 2022 00:30:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 12 Jul 2022 14:49:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jul 2022 14:49:35 +0800
Message-ID: <e8c2a181926fcbd72ac7b625e2289d91132c37be.camel@mediatek.com>
Subject: Re: [PATCH v13 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
	<deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
CC: "msp@baylibre.com" <msp@baylibre.com>, "granquet@baylibre.com"
	<granquet@baylibre.com>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, LiangXu Xu
 =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?= <LiangXu.Xu@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 12 Jul 2022 14:49:35 +0800
In-Reply-To: <7af5710c5a9c0c30e38ca81a72fe30c1c7749bbb.camel@mediatek.com>
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
	 <20220701062808.18596-6-rex-bc.chen@mediatek.com>
	 <7af5710c5a9c0c30e38ca81a72fe30c1c7749bbb.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_003025_040612_ABC11799 
X-CRM114-Status: GOOD (  25.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-07-07 at 16:00 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Fri, 2022-07-01 at 14:28 +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a embedded displayport driver for the MediaTek
> > mt8195
> > SoC.
> > 
> > It supports the MT8195, the embedded DisplayPort units. It offers
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
> > Jitao shi <jitao.shi@mediatek.com>
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
> > +				   enum dp_pixelformat color_format)
> > +{
> > +	u32 val;
> > +
> > +	/* update MISC0 */
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> > +			   color_format << DP_TEST_COLOR_FORMAT_SHIFT,
> > +			   DP_TEST_COLOR_FORMAT_MASK);
> > +
> > +	switch (color_format) {
> > +	case DP_PIXELFORMAT_YUV422:
> > +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
> > +		break;
> > +	case DP_PIXELFORMAT_RGB:
> > +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
> > +		break;
> > +	default:
> 
> The default case would never happen, remove it.
> 
> Regards,
> CK
> 

Hello CK,

after removing default, it will build error because we do not handle
other 5 enum in enum dp_pixelformat.

"error: 5 enumeration values not handled in switch"

Therefore, I will keep this.

BRs,
Bo-Chen

> > +		drm_warn(mtk_dp->drm_dev, "Unsupported color format:
> > %d\n",
> > +			 color_format);
> > +		return -EINVAL;
> > +	}
> > +
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
> > +			   val, PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
> > +	return 0;
> > +}
> > +
> 
> 


