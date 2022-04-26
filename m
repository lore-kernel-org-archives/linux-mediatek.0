Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6089C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 23:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6t3HvPlHUa5+JGNTyWlWl4IIrjTPNpRae3LlcebanD4=; b=tS1ZKGhdysSN9m
	thuFZj23LsHrAsw4UiTF/tAH3XXoIFEyP/mreR1JdeWp4ht6jWjS/gV0JO4LtoKsfWvw+51tt0g3F
	IaVyDOPZNKqDADGRb0JyWrP3aQ/8JQ+eKfKvx+/YFNyO4j60ofRucI/6fgs6EhJ/2rsNDfpFKeAxI
	AEtUWNp+QkiiHAsazQMZ608F0+4fHPciX3Eup3ACxVPsJKqCh8dG+0bsPYQapwqfIAnOKBHh3a++x
	QqxHR6g9Hv++isv3cOmv/6/JRBGkSIx3TwoZ8cjyW9ya/XJE835tjM6KUpSUA0/nX7/UTdWMH27ud
	Fe6j5+bn/v/sKZKEmsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njV3Z-00GiUu-QP; Tue, 26 Apr 2022 23:57:21 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njV3X-00GiU8-0X; Tue, 26 Apr 2022 23:57:20 +0000
Received: by mail-ej1-x636.google.com with SMTP id i27so160787ejd.9;
 Tue, 26 Apr 2022 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=226dFbtrPQIoFHWbTajhuZZyDWbBc2bREA3l7+aGRpU=;
 b=Jyzw4HuxsKM7Hu+oPvA2i5DvNqRk3iJheUk8PsqA2PIrvnvNCRSR1hzW0XzAc4d3Le
 r086uigB4IgWOAazr7oCU9tIV0vsFl06lDNlg18LnTCGFDA852D5XoskoSHo8ejGhIWC
 xi2CzU6rAlrTnAzIs7Zd2LqyjaSpLSL3McpZMconGThl3h091s0deH9lAok66IdeNwmE
 VbyNguKPd5AiQxpyicpPG5HbyJn2NqXd7lgVhrW/yaDlv4e2kocDGkfPzhMO7McgROyK
 wyn/6fOfCWxVtCtS/1yoy3m3RTFFc3tFxTZkbbr18tQ4wQCGzNorRBFZQ+qXcWDvgwqr
 3bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=226dFbtrPQIoFHWbTajhuZZyDWbBc2bREA3l7+aGRpU=;
 b=5E5x+ThiwlJfu8YzDbkE2DO+0firIZa5NMFDV/1ei1gawli/DaZRRsz8G3TE25l2zS
 PlABR1fZzqO6H8GjwMATt26FwwJ6K4KXO7S4p5+18h0sWAKbc8+9buS58R+F1QEJq6Zy
 07dGR73LG+zTxmg8DdjrJtKKaTW74hzyC2nju/9qKCLeRFMajW8pLj8WBr9qlPvDxpW8
 32CzJD8Npa/Sj7rSZV23yjGL/nDxEiMMqkYmYMrv/oRXLc2F80QTbhz0mspcNP/ti5ol
 KT7VPf2Jb+C5xrMjJ9kNjh8g7E7ab2ygYZyaDTfmyV8q/nmijBzczezTwrZLPdqfKAM9
 ZgBg==
X-Gm-Message-State: AOAM533gh7XnZCLzo409sJ7PNr0Qku6FMfecq9gr/raFZu8fjr5Q5+Jj
 YMW8OtRpFsBflXn/758Q4Vw=
X-Google-Smtp-Source: ABdhPJyMFeRbcOlg0p93A4LH81VJTxOaIx6gVJpFUK3HMs+pAGtQLor2HZVvCnGiP8TcxEb+T95y8Q==
X-Received: by 2002:a17:906:7c96:b0:6f3:b6c4:7b2 with SMTP id
 w22-20020a1709067c9600b006f3b6c407b2mr4497132ejo.676.1651017436376; 
 Tue, 26 Apr 2022 16:57:16 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 r13-20020a508d8d000000b00425d3555fc6sm5934416edh.30.2022.04.26.16.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:57:15 -0700 (PDT)
Date: Wed, 27 Apr 2022 02:57:13 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [RFC v1 1/3] net: dsa: mt753x: make reset optional
Message-ID: <20220426235713.engzue7ujwqjdyjc@skbuf>
References: <20220426134924.30372-1-linux@fw-web.de>
 <20220426134924.30372-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426134924.30372-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_165719_094908_7D275FBB 
X-CRM114-Status: GOOD (  21.34  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 26, 2022 at 03:49:22PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Currently a reset line is required, but on BPI-R2-Pro board
> this reset is shared with the gmac and prevents the switch to
> be initialized because mdio is not ready fast enough after
> the reset.
> 
> So make the reset optional to allow shared reset lines.

What does it mean "to allow shared reset lines"? Allow as in "allow them
to sit there, unused"?

> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/net/dsa/mt7530.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 19f0035d4410..ccf4cb944167 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2134,7 +2134,7 @@ mt7530_setup(struct dsa_switch *ds)
>  		reset_control_assert(priv->rstc);
>  		usleep_range(1000, 1100);
>  		reset_control_deassert(priv->rstc);
> -	} else {
> +	} else if (priv->reset) {

I don't really understand this patch. gpiod_set_value_cansleep() can
tolerate NULL GPIO descriptors.

>  		gpiod_set_value_cansleep(priv->reset, 0);
>  		usleep_range(1000, 1100);
>  		gpiod_set_value_cansleep(priv->reset, 1);
> @@ -2276,7 +2276,7 @@ mt7531_setup(struct dsa_switch *ds)
>  		reset_control_assert(priv->rstc);
>  		usleep_range(1000, 1100);
>  		reset_control_deassert(priv->rstc);
> -	} else {
> +	} else if (priv->reset) {
>  		gpiod_set_value_cansleep(priv->reset, 0);
>  		usleep_range(1000, 1100);
>  		gpiod_set_value_cansleep(priv->reset, 1);
> @@ -3272,8 +3272,7 @@ mt7530_probe(struct mdio_device *mdiodev)
>  		priv->reset = devm_gpiod_get_optional(&mdiodev->dev, "reset",
>  						      GPIOD_OUT_LOW);
>  		if (IS_ERR(priv->reset)) {
> -			dev_err(&mdiodev->dev, "Couldn't get our reset line\n");
> -			return PTR_ERR(priv->reset);
> +			dev_warn(&mdiodev->dev, "Couldn't get our reset line\n");

I certainly don't understand why you're suppressing the pointer-encoded
errors here. The function used is devm_gpiod_get_optional(), which
returns NULL for a missing reset-gpios, not IS_ERR(something). The
IS_ERR(something) is actually important to not ignore, maybe it's
IS_ERR(-EPROBE_DEFER). And this change breaks waiting for the descriptor
to become available.

>  		}
>  	}
>  
> -- 
> 2.25.1
> 

So what doesn't work without this patch, exactly?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
