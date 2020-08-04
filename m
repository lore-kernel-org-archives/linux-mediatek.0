Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D71C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 08:15:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ED9B2076E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 08:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xlp+Nkyu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ED9B2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VRV0qbaJnTNae7PRoNvHnJJr3Cpli3LZjEBiIJiIQqw=; b=Xlp+NkyuZ+3JIc77yDmYCttB7
	A5UQoWWL2EKPCCGINzXlrcO63S5gHuNWiW9mzuvExn4h7dM0uiAejk92q/HuGg1GewxJWXcM2wfht
	ZoPdBlm0yU3855Ug8HeVXR7dzrMgeWHgw4q+J89VH92i6NFT4O/+anYO4EvuIVvSrSONxF+5wlkhu
	hBUsE2uqNuXWhSJyAihntNDJYUCplN2b9Gm54vIy0ItKOVxQAlpbYw9DTrnCj9RiMLk/TniayDyxU
	CoCAYCm1rX6aAcnku3PavlVuuPm3A3rrM0Zl70cm14Jht4iNSYIJa9gjjgFH0ovWcGN/YA/hP3lqa
	NHlyRsoFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2s6P-0003Pt-Jp; Tue, 04 Aug 2020 08:15:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2s6N-0003NT-D4
 for linux-mediatek@lists.infradead.org; Tue, 04 Aug 2020 08:15:16 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k2s6M-0003dI-1b; Tue, 04 Aug 2020 10:15:14 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k2s6L-00031T-0C; Tue, 04 Aug 2020 10:15:13 +0200
Message-ID: <053da16ed682cc016b0a66a834fb58d4d9410dc2.camel@pengutronix.de>
Subject: Re: [v2,3/6] dt-binding: reset-controller: ti: add generic-reset to
 compatible
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Crystal Guo <crystal.guo@mediatek.com>, robh+dt@kernel.org, 
 matthias.bgg@gmail.com
Date: Tue, 04 Aug 2020 10:15:12 +0200
In-Reply-To: <20200803061511.29555-4-crystal.guo@mediatek.com>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
 <20200803061511.29555-4-crystal.guo@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_041515_489865_765A5D6C 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, stanley.chu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-03 at 14:15 +0800, Crystal Guo wrote:
> The TI syscon reset controller provides a common reset management,
> and should be suitable for other SOCs. Add compatible "generic-reset",
> which denotes to use a common reset-controller driver.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> index d551161ae785..e36d3631eab2 100644
> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> @@ -25,6 +25,7 @@ Required properties:
>  			    "ti,k2l-pscrst"
>  			    "ti,k2hk-pscrst"
>  			    "ti,syscon-reset"
> +			    "generic-reset", "ti,syscon-reset"
>   - #reset-cells		: Should be 1. Please see the reset consumer node below
>  			  for usage details
>   - ti,reset-bits	: Contains the reset control register information
> -- 
> 2.18.0

My understanding is that it would be better to add a mtk specific
compatible instead of adding this "generic-reset", especially since we
can't guarantee this binding will be considered generic in the future.
I think there is nothing wrong with specifying
	compatible = "mtk,your-compatible", "ti,syscon-reset";
in your device tree if your hardware is indeed compatible with the
specified "ti,syscon-reset" binding, but I may be wrong: Therefore,
please add devicetree@vger.kernel.org to Cc: for binding changes.

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
