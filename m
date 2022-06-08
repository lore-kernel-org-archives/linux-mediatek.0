Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwC5FMMyq5ouyY9S38ssx6e5yqcaJtBw0df8JM6xIbQ=; b=w9cRQCDPexsYyf
	YfCCfda71tX9UVoCXRMVNfJtJQ0QI/Ws2eyh1APYfyCBCVCMXDKLmeWa1BkNMKh34PvjFhh6ap3qg
	JxKQdDQslaPcCx/P+2FaqsyzoHlFyBUTUrw/qf1TXccFfG+w/b+1qMInJSOrj64FxxZhBlB36o0YW
	GMTIWGQ+S1m/74ik2HyDROHIaeXgLKbh3wEEAd6fpGXZSn+pQ1RGGaxJCOngRWnk0Gc4US1j5j9zV
	C3//VdnKkTuDzxLEMcaMCEr3nJJBpyLrl7iseWPiKDVmuDDQVMyxj7k+sfmkaNwi922xiWpAzaU1u
	quO5Zs61Oh12WFPFWfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrYB-00CAp6-2g; Wed, 08 Jun 2022 09:00:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrKL-00C4bK-8P; Wed, 08 Jun 2022 08:46:10 +0000
X-UUID: 97e47547641d43a6adb2f322e5b73c6e-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:508215b0-0358-4d44-a996-10c88cc2e106,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:ecad15e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 97e47547641d43a6adb2f322e5b73c6e-20220608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 302064904; Wed, 08 Jun 2022 01:46:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 01:45:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Jun 2022 16:45:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 8 Jun 2022 16:45:14 +0800
Message-ID: <8bd5136b1404e16ba5085c3151b31ec9a1715e54.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Guillaume Ranquet
	<granquet@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>
Date: Wed, 8 Jun 2022 16:45:14 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-19-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_014609_362020_5B9688FD 
X-CRM114-Status: GOOD (  23.66  )
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

Hi, Rex:

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports the mt8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so
> that
> both can work with the same register range. The phy driver sets
> device
> data that is read by the parent to get the phy device that can be
> used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---

[snip]

> +
> +static bool mtk_dp_set_swing_pre_emphasis(struct mtk_dp *mtk_dp, int
> lane_num,
> +					  int swing_val, int
> preemphasis)

The return value is never processed, so let this function to be void.

Regards,
CK

> +{
> +	int ret;
> +
> +	u32 lane_shift = lane_num * DP_TX1_VOLT_SWING_SHIFT;
> +
> +	if (lane_num < 0 || lane_num > 3)

lane_num < 0 would not happen. lane_num > 3 only if device tree max
lane is wrong. So I would like to checkout max lane when parsing device
tree instead of checking here.

> +		return false;
> +
> +	dev_dbg(mtk_dp->dev,
> +		"link training swing_val= 0x%x, preemphasis = 0x%x\n",
> +		swing_val, preemphasis);
> +
> +	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
> +				 swing_val << (DP_TX0_VOLT_SWING_SHIFT
> + lane_shift),
> +				 DP_TX0_VOLT_SWING_MASK << lane_shift);
> +	if (ret)
> +		return ret;
> +	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
> +				 preemphasis << (DP_TX0_PRE_EMPH_SHIFT
> + lane_shift),
> +				 DP_TX0_PRE_EMPH_MASK << lane_shift);
> +
> +	return !ret;
> +}
> +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
