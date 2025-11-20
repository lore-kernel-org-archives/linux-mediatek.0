Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9905CF885C
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RFWFftAzDHWnw+Z+hitcu313UCuMoXyrlJUegc6J+U=; b=wlFDdaU6yxGidhfh/VmVXnt/4z
	2vgwwN3nORz8HHzi+PppKup9G0yl8f1n+wmTh7GQTs8hc2d7yhQUXHhirkX7kJZwuxdVqu8Hj97nU
	VKVH+ncBtu65MhVBPVQJD8nekr7voRjy8NHkD2f7hrmyrleB+Urx6gmcvKsApYrpGvA1ahADEukTI
	8reRgkJ/D5/WgO+iXrP1G1IUfsFf45JuUrGnGLt8zL1I7mBqLNcUs+5xdJDEYOr/m1ImfPNzTQHQL
	S3w3Hdh46x0dZiqc+urY7whcmOA9lsW1LKTCs30EapMbJcU6gn26YJPLw3b/vRXxxcSeEhLngdcJI
	vBPnbMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5CD-00000006mei-1Mhl;
	Thu, 20 Nov 2025 13:59:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5C8-00000006mct-1TlT;
	Thu, 20 Nov 2025 13:59:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 56C1E1A1C45;
	Thu, 20 Nov 2025 13:59:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2896F6068C;
	Thu, 20 Nov 2025 13:59:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71FD910371C4D;
	Thu, 20 Nov 2025 14:59:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763647166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=+RFWFftAzDHWnw+Z+hitcu313UCuMoXyrlJUegc6J+U=;
	b=h58aRXaIUEhQHztbSUQ9G5QXd6HneKsqBpdqwK2apQY8NzSBZQ7hcSYp39u/g+t1e3rgNR
	ladPfOIlvHj+eVCWuJh+gXQtSdRz0TlhW1gr5Rm4GQGcIoAjuxaBqqD2jX/gfU88155+1X
	j25nTt/+SgmT304me5EPfEami95SgB9h6DM0dTNSgJFi3jfadO9QFaX1kzg0XTkwuxwvzA
	scuCg0jXDxIFz0/nj+UrUnkCz5WTAYyH0MBaHcFQ2NIBl4dlV+h1lziO4QLT7RCdc3InsC
	bTVFkzIKAEdttHp6pwmLLpauZGjr11+4ijYHQRouhm5y/hSlbZf3AfmCfqL8gw==
Date: Thu, 20 Nov 2025 14:59:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ot_shunxi.zhang@mediatek.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
	Vince-WL.Liu@mediatek.com, sirius.wang@mediatek.com,
	Jh.Hsu@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/5] rtc: mt6397: Fix formatting of platform driver
 structure
Message-ID: <20251120135920cfea853d@mail.local>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
 <20251120121805.6775-4-ot_shunxi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120121805.6775-4-ot_shunxi.zhang@mediatek.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_055932_873563_9332B71B 
X-CRM114-Status: GOOD (  19.00  )
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

On 20/11/2025 20:17:59+0800, ot_shunxi.zhang@mediatek.com wrote:
> From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> 
> This is a cosmetic change to improve code consistency.
> 

But, is it?

> Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 692c00ff544b..b8f44a00de5d 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -345,7 +345,7 @@ static struct platform_driver mtk_rtc_driver = {
>  		.of_match_table = mt6397_rtc_of_match,
>  		.pm = &mt6397_pm_ops,
>  	},
> -	.probe	= mtk_rtc_probe,

I guess the original author wanted to align with the members of the
.drivers struct above. I won't take a patch to change just that as the
next guys wanting to improve his KPIs will do the exact opposite.


> +	.probe = mtk_rtc_probe,
>  };
>  
>  module_platform_driver(mtk_rtc_driver);
> -- 
> 2.45.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

