Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDFFC19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orX+YD+2Tvqn6+Tuj+MFgYJbcYh0B7itt3I1h7rJ9U0=; b=4BgoaQMydkX4UaspTk3E1dKl2Y
	Y62idY8l5FAA2FSVV5VKEtHCcz/LoCHP1R2vAMb9sC4/mNCVXnEw5qRmqrOdvhba/TNGt5LE1iW3c
	YVespufNZrhPA7tgDvpbEFQ95TwKROnA6aSfHXXdzHakIaKwpb5TjnIUqvm2GpceN4L5qOzi0I/PW
	k7Kc38vFB6qicaghlHPv5iWhTrIz95TBrypO2xr/0n0YOjaE17URHtsvNJZRPXVKuLYQtrrlmTtEc
	7i79F4xq6pl/oNbEPy69/4bPbSk8Qg5z+mtgZS46IwYWyDb+2f/JI7RPcqctQGlKlHpnoPMomsD6Q
	vUd/rbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5GK-00B8MK-OC; Thu, 11 Aug 2022 10:18:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5Fa-00B8HZ-RV; Thu, 11 Aug 2022 10:17:16 +0000
X-UUID: df268fde98aa4e39982a81f0ce5bdfe3-20220811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:e2e41046-54de-44d5-8115-465cae1025f8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:95e806fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: df268fde98aa4e39982a81f0ce5bdfe3-20220811
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 590580240; Thu, 11 Aug 2022 03:17:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 11 Aug 2022 17:56:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Aug 2022 17:56:35 +0800
Message-ID: <14d0e1be2fbd7bbacb7553a2e2e5b9d941403c4f.camel@mediatek.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: mediatek: watchdog: Fix compatible
 fallbacks and example
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "=?ISO-8859-1?Q?N=EDcolas?= F.	R.
 A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, "Guenter
 Roeck" <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 11 Aug 2022 17:56:35 +0800
In-Reply-To: <815b03aa-ab39-ec8b-294b-68dff36e2d54@kernel.org>
References: <20220721014845.19044-1-allen-kh.cheng@mediatek.com>
	 <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
	 <CAGXv+5HXwVpaJPV-4Z6qw14xZzEkx_E7dVks6-GBa7bQyN8hCg@mail.gmail.com>
	 <5dac39d1-3b42-40e9-5693-0c127e8c689a@gmail.com>
	 <0fadcd9f50d49ecbb329e76a9ceb6ee689648955.camel@mediatek.com>
	 <20220808170355.c2ih3xwqxlddsal7@notapiano>
	 <6271732eb27824c5b841760243738ceb062f4c4a.camel@mediatek.com>
	 <815b03aa-ab39-ec8b-294b-68dff36e2d54@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_031714_927535_5A240B37 
X-CRM114-Status: GOOD (  24.52  )
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

he SoC-specific compatibles Hi Krzysztof,

On Wed, 2022-08-10 at 19:50 +0300, Krzysztof Kozlowski wrote:
> On 10/08/2022 15:58, Allen-KH Cheng wrote:
> > I agree the advantage of patch is aesthetic. Since I also want to
> > send
> > another "watchdog: Convert binding to YAML" PATCH, it's better let
> > all
> > wdt compatibles in the binding match the contents of mtk_wdt_dt_ids
> > in
> > drivers/watchdog/mtk_wdt.c
> > 
> > static const struct of_device_id mtk_wdt_dt_ids[] = {
> > 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> > 	{ .compatible = "mediatek,mt6589-wdt" },
> > 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
> > 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> > 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
> > 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
> > 	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
> > 	{ /* sentinel */ }
> > };
> > 
> > We have "mediatek,mt8186-wdt" "mediatek,mt8195-wdt" and
> > "mediatek,mt7986-wdt" now and they have their DT data for the reset
> > control.
> > 
> > It's weird and unuseful to add "mediatek,mt6589-wdt" as fallback. 
> > 
> > 
> > Please kindly let me know if I missed anything
> 
> How the driver arranges it should not be a reason to use or not to
> use
> specific fallback. Although Rob acked it, but I still think you did
> not
> provide valid reason for the change.
> 
> Valid reason is usually the actual hardware (so they are actually not
> compatible with mt6589), not exactly how once someone did it in the
> driver.
> 
> Best regards,
> Krzysztof

Thank you for your detailed and clear explanation.

"mediatek,mt6589-wdt" provides the mtk watchdog support and the SoC-
specific compatibles is for reset controls to standard wdt.

"mediatek,mt6589-wdt" is compatible with mt8186, mt8195 and mt7986 and
just not support the reset controls. 

Based on the discussion of email thread, please drop my series.


Thanks to everyone for your comments.

Best regards,
Allen




