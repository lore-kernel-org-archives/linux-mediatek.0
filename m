Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5A1C5DF62
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 08:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3445721882
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 08:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o94vZ+jr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLgLur1w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3445721882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZ51wfTYAuRnB+C5af1iw+7h1gNCNVc9M10WMGHQh1U=; b=o94vZ+jr9sYncl
	8cDp69Q0sj1ZkIM0RahHpAnsSOTskoyvyid09Pv2QQ8t+4NacMd+yi1eMC8qrCxcgDL0MVmaWDDfv
	BpH7mJPbhH/WnXIQXS1yv48W9fYS75/3e65pN3TdX+SLFWP4/tNcvR81o/Bi4iBgmAmozqSKiCb3s
	jGeqaHMVTqsAtGT4/2oB14apl/2+cuCGTXnqIScw4HSezSrr+gd9s1Vltn27UupODHsiirdvE6eFS
	EitwkVmDHbeonGfdrYyKIHfvjJMZzr/IEGLZEYfsvrcWsCHZBOoa80b+wdW/iNpatRR4f56IPpYJZ
	g+pNThy2Sjlp5shEnw8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSH2Z-0006qg-RB; Wed, 06 Nov 2019 08:51:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSH2W-0006pM-K0; Wed, 06 Nov 2019 08:51:45 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D7922187F;
 Wed,  6 Nov 2019 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573030304;
 bh=0qRP5sEKALx1y/0Ma1sFV2hdQpXidYhuxzQoWrPnw+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pLgLur1w6tm4rgK5BS6Jqv75Jc1vUCMzbroFrWt9um2o8lcNseY+yCwkCh5/btZB/
 HpPUDDZmWVSuC0s6FcsJjIqCORojBS2NB4CRT5oASRWdyoJgUtGyS7WjK3riTXJPYo
 jCzpD3Bg2RwtIIl8dVzumflQ+osX/iJ0ho2iu6Og=
Date: Wed, 6 Nov 2019 09:51:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 01/28] usb: common: change usb_debug_root as static
 variable
Message-ID: <20191106085141.GC2971560@kroah.com>
References: <8cb137d5376b4e317dc22dcb9e81a1125b781f8f.1573008519.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cb137d5376b4e317dc22dcb9e81a1125b781f8f.1573008519.git.chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_005144_697951_ECE532BD 
X-CRM114-Status: GOOD (  16.83  )
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
 Felipe Balbi <balbi@kernel.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Dmitry Torokhov <dtor@chromium.org>, Guenter Roeck <linux@roeck-us.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 06, 2019 at 11:15:02AM +0800, Chunfeng Yun wrote:
> Try to avoid using extern global variable, and provide two
> functions for the usage cases
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/common/common.c | 16 ++++++++++++++--
>  include/linux/usb.h         |  5 ++++-
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> index 1433260d99b4..639ee6d243a2 100644
> --- a/drivers/usb/common/common.c
> +++ b/drivers/usb/common/common.c
> @@ -293,8 +293,20 @@ struct device *usb_of_get_companion_dev(struct device *dev)
>  EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
>  #endif
>  
> -struct dentry *usb_debug_root;
> -EXPORT_SYMBOL_GPL(usb_debug_root);
> +static struct dentry *usb_debug_root;

You just broke the kernel build, which is not acceptable at all :(

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
