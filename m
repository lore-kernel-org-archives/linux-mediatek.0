Return-Path: <SRS0=V4X5=CW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22262C43461
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 15:16:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D9A208DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 15:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="inlrrvFs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jGrWJuUP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D9A208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nk6z/9N10GhCNZZq/g6gmDvgZ3DuF6Wz1dFbnINekS8=; b=inlrrvFs2yLnoQTZqRyObsyzj
	HMJhf6E/cdSa+1DdIz4C4HPaZzdsPo8w2ifSaLkWKzRxAhUpLEzorf0GjxEz4nQe49LrMq0BgMhcN
	KU4FV5lEu8ZX50z6WeMT2fXWAmvOOcMZ+mhDcBDbhgvJdwbBpRsCeeiUz0wcf+Yxb7IGyPJrdKqly
	tAwtKJeRF8yRgOSgFcvNbMnFJpBhZmnvXgcg5jDHopL60fqbuyIAIy9Ke0HaKl3fX7h0sp+U8jK5J
	dIWRmjQ1sYy3mMMW0UzsBOEq1E1oUYCOv64HhXfQpDf5uiM5hm0X/k1iCWMSezmK/JhdLOHAuZVuM
	bX8nIsrmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHTjj-00011D-Ia; Sun, 13 Sep 2020 15:16:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHTjf-00010O-JC; Sun, 13 Sep 2020 15:16:14 +0000
X-UUID: a26f4d72687047498c0f3f0a8fec7d98-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tLwz3eUexrO8VmtKUD5bwX6LfX6CNIxcQtdRTSWer2M=; 
 b=jGrWJuUPURVjpcGq8PB1gpwmZGtRNXYjTMzpcIaEfwE9PUn7D38dAWaaLdGYJxc62mSMl7SdFTplv0fO7TxyKp+DvJf/ptD0ygQUzbAGL4SKOxfF/2D4nxOb9w1IN15S4rhiZAgCdmkbd5ZKbdJYYvNhb4eCsJoc6tYDaVnELUE=;
X-UUID: a26f4d72687047498c0f3f0a8fec7d98-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1799732497; Sun, 13 Sep 2020 07:15:59 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 08:15:56 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 23:15:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Sep 2020 23:15:54 +0800
Message-ID: <1600010156.3039.5.camel@mtksdaap41>
Subject: Re: [PATCH] i2c: mediatek: Fix generic definitions for bus frequencies
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: <qii.wang@mediatek.com>
Date: Sun, 13 Sep 2020 23:15:56 +0800
In-Reply-To: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
References: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_111613_429544_F70142E1 
X-CRM114-Status: GOOD (  17.11  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, wsa@the-dreams.de,
 leilk.liu@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-09-12 at 13:57 +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
> 
> The master code needs to being sent when the speed is more than
> I2C_MAX_FAST_MODE_PLUS_FREQ instead of
> I2C_MAX_HIGH_SPEED_MODE_FREQ. Fix it.

This was introduced by "i2c: drivers: Use generic definitions for bus
frequencies". You should have
Fixes: 90224e6468e1 ("i2c: drivers: Use generic definitions for bus
frequencies")

You can have my reviewed by after you add fixes.
Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Joe.C

> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index efc1404..0cbdfbe 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -681,8 +681,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
>  	unsigned int cnt_mul;
>  	int ret = -EINVAL;
>  
> -	if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
> -		target_speed = I2C_MAX_FAST_MODE_PLUS_FREQ;
> +	if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
> +		target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;
>  
>  	max_step_cnt = mtk_i2c_max_step_cnt(target_speed);
>  	base_step_cnt = max_step_cnt;
> @@ -759,7 +759,7 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>  	for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
>  		clk_src = parent_clk / clk_div;
>  
> -		if (target_speed > I2C_MAX_FAST_MODE_FREQ) {
> +		if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
>  			/* Set master code speed register */
>  			ret = mtk_i2c_calculate_speed(i2c, clk_src,
>  						      I2C_MAX_FAST_MODE_FREQ,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
