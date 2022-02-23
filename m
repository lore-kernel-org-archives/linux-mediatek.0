Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42223C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lw119D5AK5YDwFx8CY7MhZHCjVDAIA/UlyEH4E6FpvA=; b=ghOPRI1GJnw3PZ
	YCBjGIHqyaevQ36ed5TwT8jIElMoNKial42nWFnr4RKTeXg7tGkxPwPYJuzz17vNHlM+J76GWTu2D
	k/tQm4sXsuK7HLrv8t4SjMOhmlIBzsYDjwYNtIwmxt5WoqTjC210KIpNZSTf0V6KGU7vhzL0Uy4zU
	uFGRuudVF7QE17H7ym0N5Vmdfa7QLoiy8mt4pcbjlERI940mXY8XLF+uB7SCzikT4/MzbE+k2sMcB
	eve81JJXIS3w3/nS6YEw/7rDH5odUIaGoLx95BxztNmvJ/+zzDOzz12ExQVGAGD54sYaZaR3izXbW
	UsweUT8OlrYCNLvTEuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrW5-00EQG7-GS; Wed, 23 Feb 2022 13:17:13 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrR6-00EO5m-9W; Wed, 23 Feb 2022 13:12:05 +0000
Received: by mail-ed1-x531.google.com with SMTP id q17so44355077edd.4;
 Wed, 23 Feb 2022 05:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bx50SKy78RP4R1YROr6Jpdecx5Dy3lu/VCxM9FDLuOs=;
 b=ZGZAT2izzV7UgSv7VLT794mAoOKvFrijXgG5lxiTKy4zqG3gES+hEGrTmiAO4suUjy
 laZrJn7BYK6443ENbTnf+/PdL/AFcMYJ1F9ZfP97aGm9eQgnLNc40z54TtxVWuvZSvjf
 MlWMtJGoc15qdY8MuuasJHjKB0bLG2DntMiKZPPuUZNhqPSdxnYtHanT+AR1q8ygTVSu
 hl1VrsX54lxaDvIsHNMdh/3VXthzrNP0H4181NCr9CZZarbFB9mPsVmQCGR3T6raTaSB
 Y/Ui58yYVWFjesp050oqB5LVBWD7IWbQK9cytXGEF6BgI/7yo1xRJsAfnLBHVHxNr5l+
 eeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bx50SKy78RP4R1YROr6Jpdecx5Dy3lu/VCxM9FDLuOs=;
 b=KI8z3NshzHLt36++XA5lTaDJ3pSRd7qGCdO3StUCpXT+vnf7CmsBRcoORdRk6O7u4B
 iYrVXgwbiR0hDkk+XenyQ8GLkalbtntMrLnZOsgaTjwKTPzNZKZV5YdF9evSbF81/e5I
 L9u/hyN11HwP0Fe9AJ35K8FS78tc9fDldXkaWchSoeZrjDh8qvcNgQ+btDWwjKAL3XNQ
 zX+IuJqO1kwNXxtNk/DZXi0ih6bhUh5fLzcH2BgRHs75Pfh6Cu4AJlt6uCUfv5AFrHB4
 Df4YjovnyIZs1mWaQU0hVrTdi5velJLubo29eef5q3ld1Q1IWGV3qcgp7SSdoSAjIpPX
 amhA==
X-Gm-Message-State: AOAM531IQbMYLAH1Te44PlFbcDUy7toImZ4ApR/QkrdnQ2K+bZhfLThu
 qEtWHzmuoG9p7Bxik1dFyTE=
X-Google-Smtp-Source: ABdhPJwO2m0wpqW6G+xKOFGVgVXeld2qoX5ryAz3Z3SO0nMKxlBmN9gwvJqMjo3gYP9EKa/BqylWeQ==
X-Received: by 2002:a50:a68b:0:b0:413:3b43:ae02 with SMTP id
 e11-20020a50a68b000000b004133b43ae02mr2333951edc.11.1645621922293; 
 Wed, 23 Feb 2022 05:12:02 -0800 (PST)
Received: from skbuf ([188.25.231.156])
 by smtp.gmail.com with ESMTPSA id j20sm8352979edt.67.2022.02.23.05.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 05:12:01 -0800 (PST)
Date: Wed, 23 Feb 2022 15:12:00 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next v2 01/10] net: dsa: mt7530: fix incorrect
 test in mt753x_phylink_validate()
Message-ID: <20220223131200.673xmc6euwkyphzy@skbuf>
References: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
 <E1nMpuT-00AJoW-Dq@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1nMpuT-00AJoW-Dq@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_051204_400114_DCA0E079 
X-CRM114-Status: GOOD (  17.91  )
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

Hello,

On Wed, Feb 23, 2022 at 11:34:17AM +0000, Russell King (Oracle) wrote:
> Discussing one of the tests in mt753x_phylink_validate() with Landen
> Chao confirms that the "||" should be "&&". Fix this.
> 
> Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/dsa/mt7530.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index f74f25f479ed..69abca77ea1a 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2936,7 +2936,7 @@ mt753x_phylink_validate(struct dsa_switch *ds, int port,
>  
>  	phylink_set_port_modes(mask);
>  
> -	if (state->interface != PHY_INTERFACE_MODE_TRGMII ||
> +	if (state->interface != PHY_INTERFACE_MODE_TRGMII &&
>  	    !phy_interface_mode_is_8023z(state->interface)) {
>  		phylink_set(mask, 10baseT_Half);
>  		phylink_set(mask, 10baseT_Full);
> -- 
> 2.30.2
> 

Since the "net" pull request for this week is scheduled to happen rather
soon, I think you should split this and send it to "net", so that you
won't have to wait when you resend as non-RFC.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
