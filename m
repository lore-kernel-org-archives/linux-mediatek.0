Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B930C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=doegG2eobUcjmy7z92zRtG28NO6xLLYMwsXzDzTGzsY=; b=AdXfYP0dJBwtUO
	A36kEltQtEtz9a8+FY1Ev6gu9R0QfwLzqN66YHUqYZXmQ75QjmVSmO2mQcaHaGmtfpy98qDRahtiJ
	EUp6vx1mbPyafEOnLWN6M6jbDcMv6KY4DSgsEMxhwYUroCetHHr8UQY4OTGnyEzvC5Zc7x7RZpC2I
	8xHJZo0n9a/wopkjFsEwFyOeT82kRUFvWgsaeWkcQppYK8LVVZNpN+qs3yPuD/rqar/EyVLJGN3c1
	SE8eCSng4E829wNQsEzSibgUidvj/RjADOybHdjj0q9kaOqyZuwvn9WDkEdiUAruWWmrebBgzjt/M
	DrQayaFE0L/e1X0rLUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpUbM-0020uw-HP; Tue, 23 Nov 2021 12:08:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpUb7-0020sL-Vq; Tue, 23 Nov 2021 12:08:31 +0000
Received: by mail-ed1-x536.google.com with SMTP id y13so91003160edd.13;
 Tue, 23 Nov 2021 04:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8NMLon2KasEKp2lUjnWpGI4F8VN4RtWFqQEMLQYjQZo=;
 b=bfuKNE9AOEAHdjdlF0qKAYow2qAgAV8ALn8OPC44PYB6ntJHj2/Loetarzsmb5IYw6
 bB8moCtSG7NlRTc4D3MDKTK4QofqPDt2rN1SL5ateKQY3+2pQGfwrrOZRIxZL4fFcvX9
 uTxMX8LxUXe1aogGAa626jsNdyNyrT7//WKgBGO45K3vmP5ncyhbm2R7U1Mvk5rOXpe8
 imG2Fp4VlZ5KBn+eMh+CAxi/2VcZKVoPT4hokI62K7K1OI1F8GrEAywgAnICUUY9cypI
 Qb4y1LwlT2BsMUxteePlISzbtSH+zunIswa9Is40kEtOr1IKR4S6exd5yU6WdpipH3zJ
 FjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8NMLon2KasEKp2lUjnWpGI4F8VN4RtWFqQEMLQYjQZo=;
 b=DqhQFzt69aSFveIXvNnEw4x/27NBFuLcbhzz5l99QLThmB9gJ5+22zL1SVlSj/eB3h
 wz7rNBGn+elm8H8O4MB+XDHDbOGI9S2kAGaqXO/OkXSsJ11IYAi3X8B5GtvUGFS4HXb9
 qSOKS4yOOc7WsiD2QxIB9Qn5JbBX5ZWjIL32ZwJOCcp1kxfgxGa0ftj9owNLLXNAx9hp
 60uagK7Tw+pdlWEo0+/DWtyL6XtiHdl/tNbAXYl2Xqu4PfZuaaAhfRFQCcymkSlGfNeT
 +D7zmcGEJNxDyiQWhp9EFDQF0FwBPj2JwgGqDztLHz5zlMsDdbN3pCNN5k0cnSBCVjbN
 rCKw==
X-Gm-Message-State: AOAM5306PrngEdu/gYz1smA77fofoSXUOZWhgdMqJ+9AndKpRIC/ytSI
 VZu/eSWVDqZe1ojy72Q8YRA0DLXwLek=
X-Google-Smtp-Source: ABdhPJxKXF5oNywtBw4/+rXqCu9WU20aDcML5wwXMeaN8k3e2yGHu+Zjh/6C0H4cxrr9YIKtaPwSpg==
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr8806194edd.286.1637669307935; 
 Tue, 23 Nov 2021 04:08:27 -0800 (PST)
Received: from skbuf ([188.25.163.189])
 by smtp.gmail.com with ESMTPSA id gs15sm5081843ejc.42.2021.11.23.04.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 04:08:27 -0800 (PST)
Date: Tue, 23 Nov 2021 14:08:25 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC net-next 8/8] net: phylink: allow PCS to be removed
Message-ID: <20211123120825.jvuh7444wdxzugbo@skbuf>
References: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
 <E1mpSba-00BXp6-9e@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1mpSba-00BXp6-9e@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_040830_088630_D51F14D0 
X-CRM114-Status: GOOD (  26.90  )
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

On Tue, Nov 23, 2021 at 10:00:50AM +0000, Russell King (Oracle) wrote:
> Allow phylink_set_pcs() to be called with a NULL pcs argument to remove
> the PCS from phylink. This is only supported on non-legacy drivers
> where doing so will have no effect on the mac_config() calling
> behaviour.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a935655c39c0..9f0f0e0aad55 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1196,15 +1196,25 @@ EXPORT_SYMBOL_GPL(phylink_create);
>   * in mac_prepare() or mac_config() methods if it is desired to dynamically
>   * change the PCS.
>   *
> - * Please note that there are behavioural changes with the mac_config()
> - * callback if a PCS is present (denoting a newer setup) so removing a PCS
> - * is not supported, and if a PCS is going to be used, it must be registered
> - * by calling phylink_set_pcs() at the latest in the first mac_config() call.
> + * Please note that for legacy phylink users, there are behavioural changes
> + * with the mac_config() callback if a PCS is present (denoting a newer setup)
> + * so removing a PCS is not supported. If a PCS is going to be used, it must
> + * be registered by calling phylink_set_pcs() at the latest in the first
> + * mac_config() call.
> + *
> + * For modern drivers, this may be called with a NULL pcs argument to
> + * disconnect the PCS from phylink.
>   */
>  void phylink_set_pcs(struct phylink *pl, struct phylink_pcs *pcs)
>  {
> +	if (pl->config->legacy_pre_march2020 && pl->pcs && !pcs) {
> +		phylink_warn(pl,
> +			     "Removing PCS is not supported in a legacy driver");
> +		return;
> +	}
> +
>  	pl->pcs = pcs;
> -	pl->pcs_ops = pcs->ops;
> +	pl->pcs_ops = pcs ? pcs->ops : NULL;
>  }
>  EXPORT_SYMBOL_GPL(phylink_set_pcs);
>  
> -- 
> 2.30.2
> 

I've read the discussion at
https://lore.kernel.org/netdev/cfcb368f-a785-9ea5-c446-1906eacd8c03@seco.com/
and I still am not sure that I understand what is the use case behind
removing a PCS?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
