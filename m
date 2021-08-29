Return-Path: <SRS0=zmqO=NU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF69C432BE
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Aug 2021 04:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ECB360F25
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Aug 2021 04:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ECB360F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUStnOxgdI/tjJMo+XXwCiH4k7QAcS4ErOM42ir7DDM=; b=U+xQuceO9ZEZfg
	PZ0H8ttT/2aFc9QUG+oi2Yf/oHieKJbucsPzTtqobl6NQq9Tg72Itq4aJE2b9t5rV6BcIn9Q1j/ik
	DGqtXKU2SZvdMZYwyHiLpMgzBNjPrqmX8/6UAte3BcLPoKD6l/2p9W/odgds9OSEWIgpsJxWHzZKl
	Z84MUIocL2pjqPMNuNeegoThnsDA0yJxIrggnlReIxkD4Ne8zw/AUJO9ofF09HRm1Qiod82aYLV1n
	PF9C9wCNrZGyseOyDDZjWOEtmI2SheMknt4ij2ljs4BvZM9MVuuW+P0XHf0h+Wgjv1k4yyyqNVSyl
	tkm77bbkElB8b4ZAe2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKCDw-00EzuF-3p; Sun, 29 Aug 2021 04:15:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKCDi-00Ezt5-VT; Sun, 29 Aug 2021 04:15:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E981060E08;
 Sun, 29 Aug 2021 04:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630210498;
 bh=Qg4wsLXlDpD1zwmlBbHXRGxiCepR2RCY/C5RXovTJYE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=F79Es4jWcaSofx0PWWTDpkY2/fviRSgxhnhtqTkbECFjzGoClSTyA+a9oEQ577Fp8
 fZNx0nYTVEKngO+QSmLnLseUouai/6IK4LPYpnqaXUwsHtm5SiknPrQTeTGYpd3uLd
 Ua2pJArM3EZn/jtl3OnrA91tQsO1RWYQSE4fDa8xfeHx7Mehi7PyK4ioiqzLcRf0Zw
 yY8emlBZKjUfgAekSdJlix2KEC8hoV5kW9M3GskpDUGiqbNRYtfuVz7jZS/Z//EQ9Q
 09fpczCiJOVZ8/G745i57GM4Jp7POE8mXodFz4zLXlWYspBhBeJVJR8s2tnxOuT+YB
 aHCsx0S1WSJhw==
MIME-Version: 1.0
In-Reply-To: <20210813032429.14715-4-miles.chen@mediatek.com>
References: <20210813032429.14715-1-miles.chen@mediatek.com>
 <20210813032429.14715-4-miles.chen@mediatek.com>
Subject: Re: [RESEND PATCH 3/4] clk: mediatek: support COMMON_CLK_MT6779
 module build
From: Stephen Boyd <sboyd@kernel.org>
Cc: Wendell Lin <wendell.lin@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Miles Chen <miles.chen@mediatek.com>, Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Sat, 28 Aug 2021 21:14:56 -0700
Message-ID: <163021049667.2676726.10138202396240942833@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_211459_075651_BF59ADD9 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

Quoting Miles Chen (2021-08-12 20:24:28)
> diff --git a/drivers/clk/mediatek/clk-mt6779-aud.c b/drivers/clk/mediatek/clk-mt6779-aud.c
> index 11b209f95e25..439c0bc94b73 100644
> --- a/drivers/clk/mediatek/clk-mt6779-aud.c
> +++ b/drivers/clk/mediatek/clk-mt6779-aud.c
> @@ -4,6 +4,7 @@
>   * Author: Wendell Lin <wendell.lin@mediatek.com>
>   */
>  
> +#include <linux/module.h>
>  #include <linux/clk-provider.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -115,3 +116,4 @@ static struct platform_driver clk_mt6779_aud_drv = {
>  };
>  
>  builtin_platform_driver(clk_mt6779_aud_drv);
> +MODULE_LICENSE("GPL");

How does this work? builtin_platform_driver() means that it's not
modular code. Shouldn't that be module_platform_driver()? Have you tried
loading and unloading the module?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
