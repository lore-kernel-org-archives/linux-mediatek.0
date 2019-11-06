Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907C3C5DF62
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 04:03:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49B2F20717
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 04:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3WaG8/j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsxgj50a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49B2F20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dCy6EUbwOtg8cGsar0BRXXRF+C4SxOpjFOv3Q4qnTe4=; b=b3WaG8/jw0xHb+4lwu+L/ixWO
	9GsYxXMkfBe7e1t8EkjOx9oaV1npdGJsXEEijtoBqkcrRuzbYVwUdhYfbE+tiaIpwGYVPVEqnu8Kx
	ZOP1rcq9zmLcipTFbFNpHlTrEOPhCE8Uswt2h1CJRVKfgsMjLUu0nZt8IhMqY5yacLClIbJBoZBiC
	SdPUTjpId20ttPPkxbcVKsDL5HJ6LDKwxdMqiUNyZ6tvP/VreNC8J2mxUX1cK4kcGQjreZIQzkBtz
	WuzT4C+11Feh9B4a8l69JBVU2dObEmNyOjggTYjt06Q7gs9NsaXqc4jrSspLcwwRrRRIq/7NjDwuP
	PiJfVrPig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSCXk-0001tP-H6; Wed, 06 Nov 2019 04:03:40 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSCXh-0001t1-UK; Wed, 06 Nov 2019 04:03:39 +0000
Received: by mail-pf1-x444.google.com with SMTP id r4so17807290pfl.7;
 Tue, 05 Nov 2019 20:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lRx6oEuy0J3u/YIqqbsBU2RMuvEYDTL/3a6lkxy8U8A=;
 b=hsxgj50anwE+IER4FoRLr7QvCbqzRkZTN9blbV/rEt8jCunFuydrdVfzBEfsz/w/Ug
 kxzSVv0KzEB+ATwPZzgqUrVoLIBwR2BxIdRjf6/HxnXsLm//Ih7q4yBDVQqz5D/hWgxK
 d3Aq0E0cpPDg3VJC2WRAEiOwHpOMZaix3S5J7pYhzg4YeAK/bm1Y20a2eEDx5osq3fZP
 lYSr68Sy71TiQruRT02Ile17Ldk1wCbCqKDKhSRBkB239PQW/LCWETgwSTTec7UsxJSS
 Y+K8MHb/FtJX10+sx99acfJ11w4f2uJW8PuqFHi/AxF0l1hpqQ66nYuo5nWEu57e43iJ
 04FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lRx6oEuy0J3u/YIqqbsBU2RMuvEYDTL/3a6lkxy8U8A=;
 b=o6ZmwbnL4JnToguWCRLwG6QNZLcgdnU2qT8gL3FRGrHOQinmGBEyzwg+ZDCI/Pmweg
 fF+JDzXuc3uDE+qf0a5j1tRk4CFENEA3FkIv9o4LibmmKDLQp8iL/d0uezWvHYqh/Km2
 dGZoVnhi4yNun1aBDSdjGxYS4PVr+EmEOs5PsPgSnVj+za9uURMyqB1XxGOWnXw99WJh
 Ou6DLtHZtq/bVfLcE2korZiytkEcx+9hrUz16qUd4kfDPLyWqOSXh3HP6GsURMZzd2yK
 4c9XAx+rdZ0a0U02WhBqnLrBmXafl+Eq34rJLDSdLhZcgQ9YctBSTh7TPcY85YxhKpJG
 GZ5g==
X-Gm-Message-State: APjAAAUAWuPE5X5w8/fRzqIByvqtrB6BX+4XvgkySZt+wY0G5E6v2yi+
 O63DHnqbKbQiWoFEF4KNMsnrsZ4M3Jw=
X-Google-Smtp-Source: APXvYqxL17JSYzqg5/NsEoXDKKYjLoUWKgDK8wpr1xW+HXClCkn6UQW3EReC/xGonjDswaR9AJJDBw==
X-Received: by 2002:a17:90a:244a:: with SMTP id
 h68mr847336pje.79.1573013016896; 
 Tue, 05 Nov 2019 20:03:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 z62sm27465197pfz.135.2019.11.05.20.03.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Nov 2019 20:03:35 -0800 (PST)
Subject: Re: [PATCH 01/28] usb: common: change usb_debug_root as static
 variable
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>
References: <8cb137d5376b4e317dc22dcb9e81a1125b781f8f.1573008519.git.chunfeng.yun@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <79fd2ebd-b8c6-ee00-c71e-782475a20de6@roeck-us.net>
Date: Tue, 5 Nov 2019 20:03:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8cb137d5376b4e317dc22dcb9e81a1125b781f8f.1573008519.git.chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_200338_003089_69DE1CD4 
X-CRM114-Status: GOOD (  20.60  )
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
Cc: Peter Chen <Peter.Chen@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Wolfram Sang <wsa@the-dreams.de>, Yangtao Li <tiny.windzz@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Mans Rullgard <mans@mansr.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kevin Cernekee <cernekee@gmail.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
 bcm-kernel-feedback-list@broadcom.com,
 David Kershner <david.kershner@unisys.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Cristian Birsan <cristian.birsan@microchip.com>, linux-media@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Mathias Payer <mathias.payer@nebelwelt.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-mediatek@lists.infradead.org, Minas Harutyunyan <hminas@synopsys.com>,
 Simon Horman <horms+renesas@verge.net.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Dmitry Torokhov <dtor@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/5/19 7:15 PM, Chunfeng Yun wrote:
> Try to avoid using extern global variable, and provide two
> functions for the usage cases
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/common/common.c | 16 ++++++++++++++--
>   include/linux/usb.h         |  5 ++++-
>   2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> index 1433260d99b4..639ee6d243a2 100644
> --- a/drivers/usb/common/common.c
> +++ b/drivers/usb/common/common.c
> @@ -293,8 +293,20 @@ struct device *usb_of_get_companion_dev(struct device *dev)
>   EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
>   #endif
>   
> -struct dentry *usb_debug_root;
> -EXPORT_SYMBOL_GPL(usb_debug_root);
> +static struct dentry *usb_debug_root;
> +

I don't think it is a good idea to declare this variable static
before all its uses are removed. This patch will leave the system
in a non-compileable state until all patches of the series have
been applied.

I am curious. What is the rationale for this change ?
Did exported variables run out of favor ? Sorry if there was a
patch 0 of the series explaining the rationale and I missed it.

Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
