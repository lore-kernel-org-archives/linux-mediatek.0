Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DDAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 07:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmsjyS3731upqGEqQ7ucqbKLNJqI0BFwwd95Y7PVbK0=; b=l7dqwCPFRISXrjoRY4OXRAtYz8
	CFr0XPPOt03UvXEA0hQ6SSvBGoHZllD3e9l2tbMVwb8/ZyYyCZ2RBmhgT18XyNNLAVWjEHaa2LwbW
	M9Ihplu3YaijovWYUkCEclgAfe+QGHxZpMZafZyW3nDy4I7GQ+AgzvQpQfRaWK/oInoFaf1uF093F
	Pzs16RFjTv2rS4h2VbUrcxELKOQf/yF4Znqodp6fFIbVqDWKEhDld7wJlTGSEnIQ6hZgOKvwAEQ+n
	2u24TsHhktExS6FUk9ANJ02d3RzfpIf6boZgg2ZdfFReFs86ysGYk4cmhBKXbmuMYLvLeFOrXk+J5
	0c+c0srQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jUc-000v9c-4L; Thu, 16 Jun 2022 07:00:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jUW-000v5o-SR; Thu, 16 Jun 2022 07:00:34 +0000
X-UUID: d3ba7d5a2dea41d5b019f855b9f60429-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:e14f78fe-a139-4b72-88a4-8b958a7ebf6c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:84bf72f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d3ba7d5a2dea41d5b019f855b9f60429-20220616
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1144537445; Thu, 16 Jun 2022 00:00:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 00:00:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 15:00:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 15:00:12 +0800
Message-ID: <f6d8ad7cade15c2b0388d64f31bef47d73b7bec7.camel@mediatek.com>
Subject: Re: [PATCH v11 1/1] phy: phy-mtk-dp: Add driver for DP phy
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
	<chunfeng.yun@mediatek.com>, <kishon@ti.com>, <vkoul@kernel.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <ck.hu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 16 Jun 2022 15:00:12 +0800
In-Reply-To: <8a87d094-1c9e-d899-6671-ebf8c80ffbe6@collabora.com>
References: <20220613072648.11081-1-rex-bc.chen@mediatek.com>
	 <20220613072648.11081-2-rex-bc.chen@mediatek.com>
	 <8a87d094-1c9e-d899-6671-ebf8c80ffbe6@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_000033_002547_E4D34FB1 
X-CRM114-Status: GOOD (  23.25  )
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

On Mon, 2022-06-13 at 12:39 +0200, AngeloGioacchino Del Regno wrote:
> Il 13/06/22 09:26, Bo-Chen Chen ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This is a new driver that supports the integrated DisplayPort phy
> > for
> > mediatek SoCs, especially the mt8195. The phy is integrated into
> > the
> > DisplayPort controller and will be created by the mtk-dp driver.
> > This
> > driver expects a struct regmap to be able to work on the same
> > registers
> > as the DisplayPort controller. It sets the device data to be the
> > struct
> > phy so that the DisplayPort controller can easily work with it.
> > 
> > The driver does not have any devicetree bindings because the
> > datasheet
> > does not list the controller and the phy as distinct units.
> > 
> > The interaction with the controller can be covered by the configure
> > callback of the phy framework and its displayport parameters.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Modify reviewers' comments.]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> 
> There's no power_on()/power_off() callbacks and looks a bit weird,
> but it's
> also right... the only thing that's missing, IMO, is a comment in the
> actual
> file explaining that power for this PHY is always on when the DP
> block is on
> and that no PHY specific power sequence has to be carried on (being
> managed
> elsewhere and strongly tied to the specific DP IP).
> 
> Besides that,
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Hello Angelo,

there is no power-on/off setting register for dp-phy because of the
hardware design.

Therefore, we power-on/off using enable/disable power domain.
You can see the function mtk_dp_suspend/mtk_dp_resume in mtk-dp.c
"pm_runtime_get_sync/pm_runtime_put_sync".

When the power domain is disable, the phy is also diabled.

BRs,
Bo-Chen


