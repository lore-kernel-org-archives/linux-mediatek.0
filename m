Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB4CC7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REExVQcWcE2QjJuxENKUcGpJCKWSMyccL07DCITDofY=; b=StsoqS5wk+m/AyGfrmlU59/Rgk
	TpObWOI4ly6Q6E5Tgmd2JlWD5QD4Fkc9hSLMOr5e16Ol78diowQd5NqPbQApCwsHndX+8g+lrWTRM
	cytSoTQUr+lBQPM/PhqtBXgQ1/exerNOtYnoQNx+9N5bdEhgravan65tt7v/YCUHxP/akTGRaWyAb
	0h8fdkQ91zHfQrOKyw+4yVYo0LDly8G+socVjowv9AmCzS4p60qncKI7yTFcR1T8+6aMQeQEEl1L3
	jL45TSVRNG6+BVMnqEmI36rU9AkoEFN45cnivO3QObTTJ/JpHuerb0scu7lOMA8Io7Vi5zK6JyEDi
	vTEAjuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XRX-002dMO-0I;
	Fri, 26 May 2023 13:25:19 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XRT-002dLH-2C;
	Fri, 26 May 2023 13:25:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5147f7d045bso306134a12.2;
        Fri, 26 May 2023 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685107512; x=1687699512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=REExVQcWcE2QjJuxENKUcGpJCKWSMyccL07DCITDofY=;
        b=qAyvFDmhsukPnn4WvAmi10pKd4n2FqmPW1UufHxkYNGGWR1dx/1llwEa2WCcXAF303
         iZSKlaO95+NI673tZOCG378LltKAUkLJ43xWBX7PpV6ldciulJYU3G9VtFCQuIY3DzyQ
         DIYkf63t3HV5ykQ5j3MzC+JC891jSE78LK9v+3J5+RUpfMUPue4tp0FVpG3njoUjYxGw
         pWj12qVyTRMGMzVjmi0c9p6E0VbZFqWuW+aaLw8IfmRFgKyEt7+D8H9TJvhinsq6O0og
         rYOf7VV/1stJPN98PqhwrStnYYw0Nha+46hA6GksIdoqlqVNlrQ8/4IDICYuTZV+dNjl
         OiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685107512; x=1687699512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REExVQcWcE2QjJuxENKUcGpJCKWSMyccL07DCITDofY=;
        b=ZcguAUpTbp5Bzhogf+Y6cX00X3qUT4Ea6xOZoQFlYgA0swYxbJQl/AHlJVDKmv0QF1
         1BGvdfZeUUXkMjEKLMBWY84AgQIcOAZmWAqdP8stUIandevuLboY0egK+Y5cWZMkut9N
         PUAViDCUeRYWujEwevh+ptysNByVYt0dWAby3vS6WQmYcITWxhH44rY9m8QE6+9Tv3aP
         K0soA5cV0icer3YRIf/6Qpd5fTWBVC1W5hndtutJbvinSRNONvb48lkRpiGH0UGVYfij
         cPht7KBVwl+vRaz+Dd4JQGZt932snT2vk5Cxrw5GFUpWJ3S0rXl7HiCbJoEegENRf6fg
         KnYg==
X-Gm-Message-State: AC+VfDwf3CM0mu3aY/GrAeusotDKj+Qq88Cc88z4FwgTH0YMflXv1bBu
	s/0zZyQqO1f4tBky+HAoMfo=
X-Google-Smtp-Source: ACHHUZ7q1MafXAsr6kPnoxH9sRKukcbZuU+ag0QnY9abimtOnkEmvW+csQfASzKbX2SjUCLFmdg0kQ==
X-Received: by 2002:a17:907:9345:b0:973:9857:b98a with SMTP id bv5-20020a170907934500b009739857b98amr2330770ejc.55.1685107511683;
        Fri, 26 May 2023 06:25:11 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906715100b0094e597f0e4dsm2123613ejj.121.2023.05.26.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:25:11 -0700 (PDT)
Date: Fri, 26 May 2023 16:25:08 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 19/30] net: dsa: mt7530: set interrupt register
 only for MT7530
Message-ID: <20230526132508.fxgljrpozuuzelal@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-20-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-20-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_062515_743455_73B5D7CA 
X-CRM114-Status: GOOD (  17.99  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:21PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Setting this register related to interrupts is only needed for the MT7530
> switch. Make an exclusive check to ensure this.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> ---

Why does it matter? What prompted you to make this change? I guess it's
not needed for MT7988? Or the register is not present? Or?...

>  drivers/net/dsa/mt7530.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 99f5da8b27be..0c261ef87bee 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2029,7 +2029,7 @@ mt7530_setup_irq(struct mt7530_priv *priv)
>  	}
>  
>  	/* This register must be set for MT7530 to properly fire interrupts */
> -	if (priv->id != ID_MT7531)
> +	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
>  		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
>  
>  	ret = request_threaded_irq(priv->irq, NULL, mt7530_irq_thread_fn,
> -- 
> 2.39.2
> 

