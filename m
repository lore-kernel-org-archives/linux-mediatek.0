Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCDEC8B4E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 12:41:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B89520578
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 12:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="08XAsqOz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Lwy7VfzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B89520578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k5X7c0OaFroh2MXn4fmD46zBTIrRJz5bH1IudTwW+hg=; b=08XAsqOzV5Je8V48LWwuRVvgS
	TJfoSz3Vf038wNhdVlin15VGO9Az4R1dW3+C3w58JhLqZbvUb6LISvpNZ2xDkr9tHYwEA4RwqXg51
	1lDFXZHgPflQc1976qLpvjkMh1Hoog+Sqo3/YYEYh5mCiluUkGjUZfKq3zRHbD4hKmG/wOqwpdVpl
	S+Px8TS/qqPzw1pqqwgCLRGj95BGcC+3ZCpVgrZ13g4LHaf58XHo6tdGztQcCPcmTRAeHfchpglxX
	M736BaGobRXzihVfLx0rhdXIiu4yoHHkurwcPWXMg5JsSIfEzwR2Zl9u9UcWR1i+iSilMM3qTI2HJ
	O7uyQzr7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kedbP-0007Go-6k; Mon, 16 Nov 2020 12:27:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kedbL-0007Ek-IC; Mon, 16 Nov 2020 12:27:21 +0000
X-UUID: 7892dfc876354aada4b72e30217e55ad-20201116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=syQ+udVPv5T4CZsRsJsAvtDXozry+wZ/L2ZNpQPdplU=; 
 b=Lwy7VfzVpIOg5v0cB93yWRX1IebJ++V3sVQNBH8VYwOSGMFm7aU9l2FSL+rBP1QgBZLU31Eyt+FILRm2tY6ey0aOlKhoNr1wL8tP2HrpKUYJkgDSKgQjpbU+MZHlpRMC/BczNMz1o9xYkABBj5Qhwo+kRm9ohHwjfvIz6jXRZVo=;
X-UUID: 7892dfc876354aada4b72e30217e55ad-20201116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 731444992; Mon, 16 Nov 2020 04:27:15 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 04:27:13 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Nov 2020 20:27:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Nov 2020 20:27:10 +0800
Message-ID: <1605529631.14806.57.camel@mhfsdcap03>
Subject: Re: [v6,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
From: Crystal Guo <crystal.guo@mediatek.com>
To: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net"
 <linux@roeck-us.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Date: Mon, 16 Nov 2020 20:27:11 +0800
In-Reply-To: <20201014131936.20584-3-crystal.guo@mediatek.com>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
 <20201014131936.20584-3-crystal.guo@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_072720_350228_316A416F 
X-CRM114-Status: GOOD (  13.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Maintainers,

Gentle pin for this patch.

Thanks

On Wed, 2020-10-14 at 21:19 +0800, Crystal Guo wrote:
> update mtk-wdt document for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 45eedc2c3141..e36ba60de829 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -12,6 +12,7 @@ Required properties:
>  	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>  	"mediatek,mt8183-wdt": for MT8183
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> +	"mediatek,mt8192-wdt": for MT8192
>  
>  - reg : Specifies base physical address and size of the registers.
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
