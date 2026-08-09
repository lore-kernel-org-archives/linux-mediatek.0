Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006DEC5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xMkbVk8Vq9ADk/FsQY03JHzIZEPQoL7wUy/e23YhPc=; b=40Gg8eSVXQUr+TZVyJuKerOlm2
	Y2k5jVr9eehLPVMByhCWQRNlr1Yd7Gd51pniY/Si4My4qigXLlUl9FKX/AVQgjpDg+soB7CUi7IH7
	TcXwkB8WJ9h3E18+bSB0VF07eePuHQl7jJkAF/Leb/RF+yNY1EAUCA3qBSosaU019CRdJmN1rUmOQ
	6a35dalFJywq15QBcyrdD9l8JCg7og46IwNVZEDfstOjJd+nKNCN896Pnt1a1nBqpt+gWgv6rR4K2
	SFtZCrHwve8Q1LAtSnF121KW2mw6RcpTxJNSx+L8AoOVg5YjEevnYlHfnuBSo9FfQDEPpo9t5i37E
	a/Z+ASCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt565-0000000AQOC-1eyI;
	Sun, 09 Aug 2026 15:05:57 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt560-0000000AQNX-3QcN
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 15:05:55 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1460022b3a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287951; x=1786892751; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0xMkbVk8Vq9ADk/FsQY03JHzIZEPQoL7wUy/e23YhPc=;
        b=q87gZuGiqN1iED0i1eqP8sQgquXjnw15rF8lbk5WClUQlNP4JY0mJJJvEJ6AGEwU9Z
         TbFK1OXYBuu9hFeC4rYBCN3J+UEGP2VycoztIxsVU5anEEwqS9E9sELVj8VRZ/zVkPaD
         JTdKHehGEERXz7Dq9djLOwKHUmvdKsJK7A/zZTX/0NaODf8KWuBfHr+d6yU1gAkNxysr
         7QfSXpfLagEFRCw3qPFICepsysPBT2zl2yP1bJZxKNvEBa26Hl4W5e62BtUurdj2/jov
         tNlHwmND7UjA9CRUuwVswc32M1scH5v4K2Ubpoj3GhzhWDohHwG85mwn/eNMJQ1XHXa5
         5Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287951; x=1786892751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xMkbVk8Vq9ADk/FsQY03JHzIZEPQoL7wUy/e23YhPc=;
        b=eSz1nPpUftdty3/+sNK899JmYQC3MEb04liT0DJFJo0Se1v+AS6AKQqPgT8zu6UXtf
         Fdwtq2G1tbbK3D+Y/UQmhP1DhUdqe2C8X3M38ddzr6nFucR0jTzlklDnl/KOdnkMBiPZ
         xv6BUgm3ApcQFWkbdbWA/QeDHU9AOLBYwYE5LI6W8g6pEIOA9pGTHliRNmA/dCrC2M3Z
         /aqEkic6kpHp2PW0dDzFwACqxOR+iM/leCfJTcAULSNHUvHctsWBWut1pkLkuAQkPZ09
         +6zB9mRT7YRas3ZcGu7KSQs3F2JAYfTgvHC1n0acCsl7kKUHLgY7pjyy3y1hGaWQfcwr
         Q6Yw==
X-Forwarded-Encrypted: i=1; AHgh+Rpc1YF46Jy74jskOAR+QVLw4sOmqDZsR9EzYfL6qmWylXeQFFHje32UN9i2GJVhyje3hkRFvx+2QCMWZNT8Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNcrn6nnn46PDC0lxMbi+XqI3A/kXS3Sn2xj3jHMgoWSdlG4RS
	zW9As7d5sv92U0otocrUwGIvPq1wYhRzsAOqVu0SoUki5rbN+UCgRbNC
X-Gm-Gg: AR+sD10bHN+pgFou04ieCMoFKEwWaITtp0dxho686JL3LWpkrQ5CQ4w5gk30TR20KpE
	FOYCSU32gG1SAmfskfF6bbAdiEEbVBkR50SE9giWFGjg/VT5ABLUAH/0AZdWmoqwTLyW/rjXq+G
	tX8/F6mw+P1BDgeXWCv876t2++i5dyEyH8qAwN8U79usZH17Kjd+T+jLnTB/eqPJeIyLBMUPwJm
	t/JKkU6UViqz8W2H7yJ9w7ePCg/XHUq+9pnqnTR10GkUNW7WMMFjux+QGoIYMAmTM5qhny3jjgy
	64uphZ6KxPxhZbfyHFySgLfYn8jU+nv3FUQ+C7zsJ7fmPee5SfIg38vtNt33g0NbkB+JiL0Z2UK
	Gcm7cD31rFbgooYh6zTob1JHwypgSjQozk7PuCysy+2cbQDDWSq8DZPj4OiTdd5O+Z3KmlM918a
	uaYS8nTJ5rO06ZPvUX60+H3EDsFcKC2prh3+CqSZIams+w3sRdeJ6w/y7PMBM4J/Y8zVynKzE4Z
	w==
X-Received: by 2002:a05:6a20:9f09:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3cbc04eb981mr20974725637.36.1786287951463;
        Sun, 09 Aug 2026 08:05:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm54797483eec.18.2026.08.09.08.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:05:50 -0700 (PDT)
Date: Sun, 9 Aug 2026 08:05:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ
 lookup
Message-ID: <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-4-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-4-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_080552_854149_F71BE792 
X-CRM114-Status: GOOD (  18.56  )
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

On Fri, Aug 07, 2026 at 03:16:52PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index c9e79851504c..48454ac86074 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -429,6 +429,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (wdt->cfg->irq_mask) {
>  		int irq = platform_get_irq_optional(pdev, 0);
>  
> +		if (irq < 0 && irq != -ENXIO)
> +			return irq;
>  		if (irq > 0) {

This if () is no longer needed.

Thanks,
Guenter

>  			ret = devm_request_irq(dev, irq, aspeed_wdt_irq,
>  					       IRQF_SHARED, dev_name(dev),

