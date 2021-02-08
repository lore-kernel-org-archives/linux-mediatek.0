Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6EAC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 13:55:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB8364E60
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 13:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB8364E60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:From:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Go0C+hwvsEynESlP+qKYHF00r8J31OBcRRwJDgyE5ns=; b=a+BBtJvxn4tdlCSmJB5z6ELre
	X2dk5l6y/DT6f9YIYNnptUn7rxUvUdJAKrkWwes53cjVannycaicJvkLbK43OCpHAVEq3RIDlly7p
	TXS1V1CTQNieKJsGYZG2+6rEH8z0SX0TJ5hAk/WjW/AO8b0F27SlcZQsaC9RfFHkf3fC53Z4VG9dk
	5LwYNdukLHdXu8v6I/yQFit/4xFKZYYaUxkB16R7hizujK/QoFmAgdqDsJvCKyynfaeWS5H5HfCEG
	EG62yYJd57U/yvMJM7bopkhZ3hR7nmUHPVR8HNbqTNLPTTnl+fbnFy+ZK86Ji/D25tmwwJZZGHXvo
	T7uZdVOmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l970w-0001jv-6K; Mon, 08 Feb 2021 13:55:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l970s-0001j2-VH
 for linux-mediatek@lists.infradead.org; Mon, 08 Feb 2021 13:55:39 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l970m-0007Jz-9m; Mon, 08 Feb 2021 14:55:32 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l970l-0004Si-6c; Mon, 08 Feb 2021 14:55:31 +0100
Date: Mon, 8 Feb 2021 14:55:31 +0100
To: Youling Tang <tangyouling@loongson.cn>
Subject: Re: [PATCH] staging: fix ignoring return value warning
Message-ID: <20210208135531.GH8233@pengutronix.de>
References: <1612689808-30985-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612689808-30985-1-git-send-email-tangyouling@loongson.cn>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:53:49 up 68 days,  2:20, 102 users,  load average: 0.01, 0.06,
 0.08
User-Agent: Mutt/1.10.1 (2018-07-13)
From: Sascha Hauer <sha@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_085539_038339_62EE1631 
X-CRM114-Status: GOOD (  18.95  )
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
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Feb 07, 2021 at 05:23:28PM +0800, Youling Tang wrote:
> Fix the below ignoring return value warning for device_reset.
> 
> drivers/staging/mt7621-dma/mtk-hsdma.c:685:2: warning: ignoring return value
> of function declared with 'warn_unused_result' attribute [-Wunused-result]
>         device_reset(&pdev->dev);
>         ^~~~~~~~~~~~ ~~~~~~~~~~
> drivers/staging/ralink-gdma/ralink-gdma.c:836:2: warning: ignoring return value
> of function declared with 'warn_unused_result' attribute [-Wunused-result]
>         device_reset(&pdev->dev);
>         ^~~~~~~~~~~~ ~~~~~~~~~~
> 
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  drivers/staging/mt7621-dma/mtk-hsdma.c    | 6 +++++-
>  drivers/staging/ralink-gdma/ralink-gdma.c | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
> index bc4bb43..d4ffa52 100644
> --- a/drivers/staging/mt7621-dma/mtk-hsdma.c
> +++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
> @@ -682,7 +682,11 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	device_reset(&pdev->dev);
> +	ret = device_reset(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to reset device\n");
> +		return ret;
> +	}

Normally you don't want to see this error message when -EPROBE_DEFER is
returned because that would mean the reset controller is not yet
available and the driver should probe later again. There is
dev_err_probe() now for exactly this usecase.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
