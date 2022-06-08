Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574ECC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 09:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dijl5NalSarpX9mQY5rKzaGRmxvvB+UK7exVklNzOZk=; b=ECwukkYL94iI0x
	O2pwim3Br5gaqDOS2tP+cAVp7FvP1ehJoFoOasS5KSCAbWwg+7U7vs+m9WNJiVVAlVAemkXA0my9v
	6z8lGlUgouIOIoBcJVGL7wd88dDJTSYBAgukJC5+vckiK8lqjqDGnZhEm8tRHP0D58+kg9YcXbK/u
	9P+wdQxypogcbvzxfFtkbhwFWYmrLNCsD6Tv/VxbpOmQPboHCEgENryzqhi/yjBx+EQDUNapxZ9TB
	Vv/CK0MPquTRYRBOjShE/eLKiiJ6uy92aUHAHAL9LXSY2bWQvDEE1wceyXtFZpoKVzJvR40bHOMXB
	fQ3eIiC8LfK7+HgpHkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrbz-00CCzz-OA; Wed, 08 Jun 2022 09:04:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrSS-00C856-J5; Wed, 08 Jun 2022 08:54:34 +0000
X-UUID: 42c636efb54649ffa0100c35bc98bfd7-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:41a75c29-04aa-4572-bbde-6ddc410b0d49,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:806aa07e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 42c636efb54649ffa0100c35bc98bfd7-20220608
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1460355915; Wed, 08 Jun 2022 01:54:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 01:54:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Jun 2022 16:54:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 8 Jun 2022 16:54:27 +0800
Message-ID: <cff4c093407fc60b4ae88f6bd847faba9c62fb3b.camel@mediatek.com>
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
Date: Wed, 8 Jun 2022 16:54:27 +0800
In-Reply-To: <8bd5136b1404e16ba5085c3151b31ec9a1715e54.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
	 <8bd5136b1404e16ba5085c3151b31ec9a1715e54.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_015432_704755_0CF5C71D 
X-CRM114-Status: GOOD (  28.82  )
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

On Wed, 2022-06-08 at 16:45 +0800, CK Hu wrote:
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
> > +static bool mtk_dp_set_swing_pre_emphasis(struct mtk_dp *mtk_dp,
> > int
> > lane_num,
> > +					  int swing_val, int
> > preemphasis)
> 
> The return value is never processed, so let this function to be void.
> 
> Regards,
> CK
> 

Hello CK,

ok, I will drop this.
Actually, I change "mtk_dp_write", "mtk_dp_update_bits" and
"mtk_dp_bulk_16bit_write" to return void. I don't think we need to
handle the issue that we failed to set registers. If we failed to set
register, it's because hw is not enable.

Therefore, I drop this and we can reduce many lines of codes.

BRs,
Bo-Chen
> > +{
> > +	int ret;
> > +
> > +	u32 lane_shift = lane_num * DP_TX1_VOLT_SWING_SHIFT;
> > +
> > +	if (lane_num < 0 || lane_num > 3)
> 
> lane_num < 0 would not happen. lane_num > 3 only if device tree max
> lane is wrong. So I would like to checkout max lane when parsing
> device
> tree instead of checking here.
> > +		return false;
> > +
> > +	dev_dbg(mtk_dp->dev,
> > +		"link training swing_val= 0x%x, preemphasis = 0x%x\n",
> > +		swing_val, preemphasis);
> > +
> > +	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
> > +				 swing_val << (DP_TX0_VOLT_SWING_SHIFT
> > + lane_shift),
> > +				 DP_TX0_VOLT_SWING_MASK << lane_shift);
> > +	if (ret)
> > +		return ret;
> > +	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
> > +				 preemphasis << (DP_TX0_PRE_EMPH_SHIFT
> > + lane_shift),
> > +				 DP_TX0_PRE_EMPH_MASK << lane_shift);
> > +
> > +	return !ret;
> > +}
> > +
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
