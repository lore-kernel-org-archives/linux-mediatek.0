Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 06:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBBDl7CDMyF0MkwRoVq6xuqlg0jnefwgQifegZOxGdo=; b=eyvunyShxZ9tvegAhwma9O6jBA
	+ppybjjscUJSBDWvPk1Oy9QG7yQ1jHg2isOnm+i5gLJFI1xFQQqNAxXmpZ+puphet45y8EAuYkBsf
	eypEk3ASe7gfGi5kTRiwZxtIvWU2Xw4uvz+Dkx8QaXXsveeHgHBU0xxs5jZ+sy0aPG1hButDzJ1h3
	dHlBL4WUflyirayoCkpvvgS8XORBWJYtYLZvMfvcj+v6ypjvO0HJvp8pc8uLcBdttJbhpc1ruKNin
	rf937OqP5igi0nStJG82I3V4Z2ivoAN+g3hd9yBc/wcCc+RNHEexJgCFqPXrkpXk9Vgn5ZeAryiGo
	6Otmcagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6R8l-009lRI-Iz; Wed, 29 Jun 2022 06:25:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6R8i-009lQi-TM; Wed, 29 Jun 2022 06:25:30 +0000
X-UUID: 9eeee0e4125f4e10b332b7800f099a33-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:461cd217-6008-4ba0-af17-27125bb2a4b2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:71401086-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9eeee0e4125f4e10b332b7800f099a33-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 362532372; Tue, 28 Jun 2022 23:24:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 13:34:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jun 2022 13:34:10 +0800
Message-ID: <78d71a052d214e0c11cab5c2f4dee39c4f67c0bc.camel@mediatek.com>
Subject: Re: [PATCH v12 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 29 Jun 2022 13:34:10 +0800
In-Reply-To: <20220627080341.5087-6-rex-bc.chen@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
	 <20220627080341.5087-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_232528_985149_5BAE08E9 
X-CRM114-Status: GOOD (  22.44  )
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

Hi, Bo-Chen:

On Mon, 2022-06-27 at 16:03 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195
> SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
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
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> +
> +static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
> +			   0, SW_RST_B_PHYD);
> +
> +	/* Wait for power enable */
> +	usleep_range(10, 200);
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
> +			   SW_RST_B_PHYD, SW_RST_B_PHYD);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			   DP_PWR_STATE_BANDGAP_TPLL,
> DP_PWR_STATE_MASK);
> +}
> +
> +static void mtk_dp_power_disable(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
> +
> +	mtk_dp_write(mtk_dp, MTK_DP_0034,
> +		     DA_CKM_CKTX0_EN_FORCE_EN |
> +		     DA_CKM_BIAS_LPF_EN_FORCE_VAL |
> +		     DA_CKM_BIAS_EN_FORCE_VAL |
> +		     DA_XTP_GLB_LDO_EN_FORCE_VAL |
> +		     DA_XTP_GLB_AVD10_ON_FORCE_VAL);
> +
> +	/* Disable RX */
> +	mtk_dp_write(mtk_dp, MTK_DP_1040, 0);

MTK_DP_1040 is set to 0 in mtk_dp_power_disable(), but it is not set to
other value in mtk_dp_power_enable(). Does any thing would be wrong
when mtk_dp_power_disable() and mtk_dp_power_enable()?

Regards,
CK

> +	mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
> +		     0x550 | BIT(FUSE_SEL_SHIFT) |
> BIT(MEM_ISO_EN_SHIFT));
> +}
> +


