Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14196C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 12:03:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E22207F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 12:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z0ws7jGx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E22207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aXdRhj2Im81lCfobifN10nOpKApuLTCtPPHt5kUIYoE=; b=Z0ws7jGxXo6uwt+ISY1LGP3Fi
	vJ0dny2UjUduUedolD1j0K9oC7zYS65TNaND8Z9c3Wp4KznbYcfGDRlR/yRsiCHzOppOoGMo+OTjD
	R50yjw4/uUJ3QZ8bpKCTpYXejRE6Q1YJDQRcsPcbpiL9wfLYoTB8qt/GvxiOShHvuFNimwvHbpjmP
	/fdxbwd8tNVl3J9dq+nPFtddEbwAD68BqLlbs31RD4u7/FXdNa7rvy3/m+gTDBdpm7VkLgxV0sGbp
	+6DkU3BQkO0OpoHn40+Rpbh4eB2lcwQ1h9t/WFyciu5lMBtDbTHDg/q6gc8Jwas9G8UewVV9sABgS
	7vg5qT34Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5pTP-0006bX-6C; Wed, 12 Aug 2020 12:03:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5pTL-0006a5-CI
 for linux-mediatek@lists.infradead.org; Wed, 12 Aug 2020 12:03:11 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k5pTG-0006el-Oc; Wed, 12 Aug 2020 14:03:06 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k5pTE-0007Dr-MD; Wed, 12 Aug 2020 14:03:04 +0200
Message-ID: <6e667ff6f5a1aae51b89d00e9ec5bba29852f683.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] mmc: dt-bindings: Add resets/reset-names for
 Mediatek MMC bindings
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Rob Herring <robh+dt@kernel.org>
Date: Wed, 12 Aug 2020 14:03:04 +0200
In-Reply-To: <20200812093726.10123-2-wenbin.mei@mediatek.com>
References: <20200812093726.10123-1-wenbin.mei@mediatek.com>
 <20200812093726.10123-2-wenbin.mei@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_080311_434209_D8613871 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-12 at 17:37 +0800, Wenbin Mei wrote:
> Add description for resets/reset-names.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> index 8a532f4453f2..35da72de7aac 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> @@ -49,6 +49,8 @@ Optional properties:
>  		     error caused by stop clock(fifo full)
>  		     Valid range = [0:0x7]. if not present, default value is 0.
>  		     applied to compatible "mediatek,mt2701-mmc".
> +- resets: Phandle and reset specifier pair to softreset line of MSDC IP.
> +- reset-names: Reset names for MSDC.

I think the reset-names documentation should mention the actual value
the driver should look for, "hrst".

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
