Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC19FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 06:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtu1cOLR5bOHLkuYYGsBHhgnLOrRaMFpltq2NqiS1Es=; b=UO/woqrfeEgzDL
	v/KOq1Muod+DbeiENdCPHGl/1q1aHBCKeiaBdjacyEMtmnNXQ0p+NirWg3JzB908I0W2W0T11LOMZ
	lGGgNWfrLtGzmnc3+8U7zw4K0bXIRBm+JNPjxe5gDVyJX9NPpQ0FIcFSFCnphjcu+F3YvfdTqLrMN
	GG7u+hs80qHw5NRXSVVL6ZAl6s4B09Dx8ONK4F9C/6XnvpGQv/59imjnAOX7zkgii/KU1B3bGoGjD
	loTsMal2JFPvOO+Pux/xWpZBKl/h0BMzYPLbRi2LrP5OTenheOOVEwr3qZx7x6Yf5YRSTho6aPJah
	DhOuK4QXnb1YCISsaeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMl13-00Cx0h-1J; Wed, 23 Feb 2022 06:20:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMl0y-00CwyP-PI; Wed, 23 Feb 2022 06:20:42 +0000
X-UUID: b070328f13c74b3fa496ba55732c8d64-20220222
X-UUID: b070328f13c74b3fa496ba55732c8d64-20220222
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1336997519; Tue, 22 Feb 2022 23:20:33 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 22:20:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 14:20:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 14:20:30 +0800
Message-ID: <7040a340321a8845b785fe81010d2e5bce0708ab.camel@mediatek.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: watchdog: Add compatible for
 Mediatek MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: allen-kh.cheng <allen-kh.cheng@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
CC: <hsinyi@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>
Date: Wed, 23 Feb 2022 14:20:29 +0800
In-Reply-To: <20220128062050.23978-4-allen-kh.cheng@mediatek.com>
References: <20220128062050.23978-1-allen-kh.cheng@mediatek.com>
 <20220128062050.23978-4-allen-kh.cheng@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_222040_854862_0BDF0398 
X-CRM114-Status: GOOD (  16.23  )
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

Hello Allen,

Thanks for your patch.
For dt-binding of 8186 wdt, I sent the 8186 wdt series([1]) which is
including this change.

I think you can drop this patch in next version.

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=614760

Thanks.

BRs,
Rex

On Fri, 2022-01-28 at 14:20 +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This commit adds dt-binding documentation of watchdog for Mediatek
> MT8186 SoC Platform.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 0114871f887a..74db01e3658b 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -15,6 +15,7 @@ Required properties:
>  	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>  	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
>  	"mediatek,mt8183-wdt": for MT8183
> +	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>  	"mediatek,mt8192-wdt": for MT8192
>  	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
