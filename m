Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66ED5C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 15:27:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37F8A23444
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 15:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u7d6OwHu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKpmuevW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37F8A23444
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JchWHcOA+B5jPSUKgghWzgAIwZxILYCXfaPoKH+cy/A=; b=u7d6OwHuxOM3n4Mdov4GfXHhd
	4nOAkATlEYEJXqUAsjENr7BbN1FO5QdclrcmVQsrZmrIu3A35Ru7URpEh+E5m6CG5UKcy7tDIG76P
	+FJvqb7Nf1Gh/gPJyrz+Uw85mR0iGiS+mFRPdPYrQkVcs52VGzX8Bt5TiinCkDIGRDCjrlGhQBgTI
	/I/WeMjBqcbNf2Z4nf9iihmBtohI3T+69xzZp6JpCWL5Hcg9ZfMMvfmTRf4KzZKWKy7D29UOz7/Pq
	Jy0psev73ZRTnPFyL7Wxa+3uVKpTsngAGHjjtmUcxIibcdsoVi2VciFyQjLsO3ta+zS5FIwpZbEM3
	1vzfnCUqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7h2X-0005iN-0r; Mon, 17 Aug 2020 15:27:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7h2R-0005gg-UL; Mon, 17 Aug 2020 15:27:08 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DC5323B31;
 Mon, 17 Aug 2020 15:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597678027;
 bh=Pzsot6q3dgWfHBZvvoYCwTxZohnjcMafvwd+AYasv8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TKpmuevWf/H7VG7jRpvc30/GfAIYWsNtzFm4xo4LUrsczSuZmUNbu5EuHyt+jDmci
 sTHooQocRBBliQwj0h6zf9EnJXpTgx95e0xl08MFqeUwrFx5XC7hyfQhi+QDPOggUM
 vCvK6JyHwgPBhk6JlesuA645jbqAsvDaYcM2GkKo=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k7h2P-003bML-ME; Mon, 17 Aug 2020 16:27:05 +0100
MIME-Version: 1.0
Date: Mon, 17 Aug 2020 16:27:05 +0100
From: Marc Zyngier <maz@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
In-Reply-To: <20200817145738.986999-1-linux@fw-web.de>
References: <20200817145738.986999-1-linux@fw-web.de>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <7b9c3ee73faeaf8d2e64c228047438f1@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: linux@fw-web.de, linux-mediatek@lists.infradead.org,
 frank-w@public-files.de, tglx@linutronix.de, jason@lakedaemon.net,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_112708_101701_7E4D38BC 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Frank Wunderlich <frank-w@public-files.de>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-17 15:57, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This reverts commit f97dbf48ca43009e8b8bcdf07f47fc9f06149b36 which
> breaks bootup of arm/arm64 devices like bananapi-r2/mt7623 and
> bananapi-r64/mt7622
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/irqchip/irq-mtk-sysirq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-mtk-sysirq.c 
> b/drivers/irqchip/irq-mtk-sysirq.c
> index 7299c5ab4d10..6ff98b87e5c0 100644
> --- a/drivers/irqchip/irq-mtk-sysirq.c
> +++ b/drivers/irqchip/irq-mtk-sysirq.c
> @@ -231,6 +231,4 @@ static int __init mtk_sysirq_of_init(struct
> device_node *node,
>  	kfree(chip_data);
>  	return ret;
>  }
> -IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_sysirq)
> -IRQCHIP_MATCH("mediatek,mt6577-sysirq", mtk_sysirq_of_init)
> -IRQCHIP_PLATFORM_DRIVER_END(mtk_sysirq)
> +IRQCHIP_DECLARE(mtk_sysirq, "mediatek,mt6577-sysirq", 
> mtk_sysirq_of_init);

There is already a fix queued for this.

        M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
