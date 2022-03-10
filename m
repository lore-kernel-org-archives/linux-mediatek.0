Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EalUeCMsbQYhUGHly9gR3c/f+61cADL77gkAnuLuJEk=; b=zreAHNJYnoXz6W
	jXsMeDl0/yFCqu5JBtvVzopLwbUgcmrA9CouPMYUTYRGmLlKGC0Gt0SHL1W1elvVI3R3cfCgjmBVf
	2h48MKEjZUIxEbXifr0+vzhmgp3vOXWoV3fC/2q3wT2D/Emc+eK8BrFhf1qEdiXegJKtwCW3UaC8q
	AtBCt+E5uyu2GhRELgJgIW5GiBkcuMK10BMWua3RlpJIuedn4o6QLyWAOumJtGY2CroAlgYWshD1V
	u4iNq3SoQVZThrZVsHPbCzUt9U8Lw4EWZL+JIFePPrBOm7E5PEbEQNVyj2cX29IR4OyedXqWSB1u2
	yGTl53n0OLQ1W4YNKhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSEQo-00BzKp-1g; Thu, 10 Mar 2022 08:45:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSEPq-00Bz2Y-AP; Thu, 10 Mar 2022 08:45:01 +0000
X-UUID: 066e7db7da964ebab57c31cc8f5d63c6-20220310
X-UUID: 066e7db7da964ebab57c31cc8f5d63c6-20220310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1370397812; Thu, 10 Mar 2022 01:44:25 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 00:34:23 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 16:34:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Mar 2022 16:34:22 +0800
Message-ID: <b2195d5a5d9e7c18eb5e2269a04cb9b8ce431d90.camel@mediatek.com>
Subject: Re: [RESEND V2 0/3] Add watchdog support for MT8186 SoC
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <matthias.bgg@gmail.com>, 
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>
CC: <runyang.chen@mediatek.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 10 Mar 2022 16:34:21 +0800
In-Reply-To: <20220301054405.25021-1-rex-bc.chen@mediatek.com>
References: <20220301054405.25021-1-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_004458_384268_069170BA 
X-CRM114-Status: GOOD (  12.66  )
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

On Tue, 2022-03-01 at 13:44 +0800, Rex-BC Chen wrote:
> resend v2:
> 1. Fix topic to V2.
> 
> v2:
> 1. Squash [1] into [2] in v1.
> 2. Add tags of acked-by and reviewed-by.
> 
> [1]: [3/4] dt-bindings: reset: mt8186: add DSI reset bit for MMSYS
> [2]: [2/4] dt-bindings: reset: mt8186: add toprgu reset-controller
> header file
> 
> v1:
> 1. Add mt8186-resets.h to define definition of reset bits.
> 2. Add wdt compatible for MT8186.
> 
> Rex-BC Chen (1):
>   dt-bindings: watchdog: Add compatible for MediaTek MT8186
> 
> Runyang Chen (2):
>   dt-bindings: reset: mt8186: add reset-controller header file
>   watchdog: mediatek: mt8186: add wdt support
> 
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  |  1 +
>  drivers/watchdog/mtk_wdt.c                    |  6 ++++
>  include/dt-bindings/reset/mt8186-resets.h     | 36
> +++++++++++++++++++
>  3 files changed, 43 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt8186-resets.h
> 

Hello Guenter,

All patches are reviewed-by and acked-by.
Do you have any suggestion for this series?

Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
