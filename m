Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C231C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiVXk2XwzFDt8yLn3peMfVkSM9+eJCJ3bq5pHTyqyjs=; b=tfcCMuyZ57WdpIWHYCILnYpLlq
	2RgI9ISgYDYriuhteFlmTOTYi2KwqXr0EU4Hus1GDU70DGYpiFhcS9OfPAujoHp4KHAQxUvVOlvWv
	fxAG9oxMAnzo/JyuLI+lSGVZDFMS42MpXd85F1MELki/Bq9DdeCknT4yPhs18gDoliGBMiwtmdAA7
	XnW3WL138sFL72IwVVAimwvSI6+ivTwCejm9S8ZfrJUAxm7iCu6pwwJ+885d5IV5cX38bvPgOODz9
	Yf3ImvZDocqt3nLWzvov/7O+bdvKT0k27/vZy2wHp3Gls6PYCDz12+iv53+VwM4Pf6emxYrRYzRhZ
	oGV6CmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4Kv-00Agj0-JL; Thu, 11 Aug 2022 09:18:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4Ks-00Agi2-VT; Thu, 11 Aug 2022 09:18:40 +0000
X-UUID: e1f65cf1cfc146c6b97a88b5f1548654-20220811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:8fd13316-cc64-4d66-b653-7ebd03d08e41,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:8652609c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e1f65cf1cfc146c6b97a88b5f1548654-20220811
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 351796902; Thu, 11 Aug 2022 02:18:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 11 Aug 2022 16:47:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 11 Aug 2022 16:47:58 +0800
Message-ID: <a06b9ef2126980724219b488113881f726c7b434.camel@mediatek.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: mediatek: watchdog: Fix compatible
 fallbacks and example
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 11 Aug 2022 16:47:58 +0800
In-Reply-To: <5a6545cc-97a2-7aa8-7b67-6488154e9db3@linaro.org>
References: <20220721014845.19044-1-allen-kh.cheng@mediatek.com>
	 <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
	 <5a6545cc-97a2-7aa8-7b67-6488154e9db3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_021839_044262_FE17CA66 
X-CRM114-Status: GOOD (  13.04  )
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

Hi Krzysztof,

On Wed, 2022-08-10 at 19:49 +0300, Krzysztof Kozlowski wrote:
> On 21/07/2022 04:48, Allen-KH Cheng wrote:
> > The watchdog timer of mt8186. mt8195 and mt7986 have their DT data.
> > We should not use 'mediatek,mt6589-wdt' as fallback.
> > 
> > For mediatek,wdt example of mt8183, We remove mediatek,mt6589-wdt
> > fallback.
> > 
> > Fixes:a45b408a020b("dt-bindings: watchdog: Add compatible for
> > MediaTek MT8186")
> > Fixes:b326f2c85f3d("dt-bindings: watchdog: Add compatible for
> > Mediatek MT8195")
> > Fixes:41e73feb1024("dt-bindings: watchdog: Add compatible for
> > Mediatek MT7986")
> > Fixes:f43f97a0fc0e("dt-bindings: mediatek: mt8183: Add #reset-
> > cells")
> 
> Missing spaces around SHA.
> 
> Best regards,
> Krzysztof

Thanks for your friendly reminder.

I'll pay more attention in the next time.

Thanks,
Allen


