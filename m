Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 06:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EV+w7PXZuzMvg5gfRlBEjZh9TKW2bm43uV2KpX6NWRU=; b=u4vxyD49RRUGRR
	BWpBZf5pKrJKAGyRgL8n5LsFnVzdelQ/i2LkNAYNfS59Q6Wz8ZQHcoG9jln7iw/lgaeEBsUOpsmTw
	npVYwIlj48M9z75QoiTYim8d1eGoWpuYruNqAakbg+ViF6nYBDCl6bzyetqDrnCcRQiMjXhc0zHsd
	DIgjP67aVwrbeaRjckyHvMKWZQbRZ8ZP23MTntNFm1uGqxpCxU2Z5T0B5/jLSSOoxBAJczoWZses2
	+UNunrlFMBkM/+XM3airl2p168mSnBwtJyCdio5FuHXrkJ34i00agE+Xnw8P0FxRtfrlVchB6y07V
	c+zqsImEnbGkIVjEcFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noftD-005Rmc-H9; Wed, 11 May 2022 06:32:03 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nofsl-005RRo-Hz; Wed, 11 May 2022 06:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652250695; x=1683786695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CGqCtaqi57In086U06rBSjn2KI5H866E/cXUj0HmPpA=;
 b=J7wTq/LynL7VKQH5uhT+JJk2ElnMCr5AdD1ENoaAsQftDWomctc0OW8U
 R6wqqVdnJyOthxfuTP+SSkuqsQThlimeUhA6zapZdSKZQnS3nuW4YPvdv
 xQSxx3P0UEER/7i96BcdH+4C13COpqS3Pis4oADCuG5X80Z356IRm/i02
 v2Cj1V6wzVgobPi+yx9W/U7nUvftEx3UxSIDS0dBkow+xVRM722BX8Ipu
 zoLyA8LjBT3roqGWJ5pZMoenal07hgnnRroxhfmH36z/ERFetZ6tco7zR
 bIwTz76p1sVqKdPsJOvGqETVadZG58Dj9OtSDzLg14Z1KcyhwbyGr+5/B w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269735717"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="269735717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="711356810"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 10 May 2022 23:31:26 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 11 May 2022 09:31:25 +0300
Date: Wed, 11 May 2022 09:31:25 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: cy_huang <u0084500@gmail.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
 cy_huang@richtek.com, bryan_huang@richtek.com,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, stable <stable@vger.kernel.org>
Subject: Re: [PATCH v2] usb: typec: tcpci_mt6360: Update for BMC PHY setting
Message-ID: <YntYPbHGkz08k47d@kuha.fi.intel.com>
References: <1652159580-30959-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1652159580-30959-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_233135_663671_CA3BE810 
X-CRM114-Status: GOOD (  21.00  )
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

On Tue, May 10, 2022 at 01:13:00PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Update MT6360 BMC PHY Tx/Rx setting for the compatibility.
> 
> Macpaul reported this CtoDP cable attention message cannot be received from
> MT6360 TCPC. But actually, attention message really sent from UFP_D
> device.
> 
> After RD's comment, there may be BMC PHY Tx/Rx setting causes this issue.
> 
> Below's the detailed TCPM log and DP attention message didn't received from 6360
> TCPCI.
> [ 1206.367775] Identity: 0000:0000.0000
> [ 1206.416570] Alternate mode 0: SVID 0xff01, VDO 1: 0x00000405
> [ 1206.447378] AMS DFP_TO_UFP_ENTER_MODE start
> [ 1206.447383] PD TX, header: 0x1d6f
> [ 1206.449393] PD TX complete, status: 0
> [ 1206.454110] PD RX, header: 0x184f [1]
> [ 1206.456867] Rx VDM cmd 0xff018144 type 1 cmd 4 len 1
> [ 1206.456872] AMS DFP_TO_UFP_ENTER_MODE finished
> [ 1206.456873] cc:=4
> [ 1206.473100] AMS STRUCTURED_VDMS start
> [ 1206.473103] PD TX, header: 0x2f6f
> [ 1206.475397] PD TX complete, status: 0
> [ 1206.480442] PD RX, header: 0x2a4f [1]
> [ 1206.483145] Rx VDM cmd 0xff018150 type 1 cmd 16 len 2
> [ 1206.483150] AMS STRUCTURED_VDMS finished
> [ 1206.483151] cc:=4
> [ 1206.505643] AMS STRUCTURED_VDMS start
> [ 1206.505646] PD TX, header: 0x216f
> [ 1206.507933] PD TX complete, status: 0
> [ 1206.512664] PD RX, header: 0x1c4f [1]
> [ 1206.515456] Rx VDM cmd 0xff018151 type 1 cmd 17 len 1
> [ 1206.515460] AMS STRUCTURED_VDMS finished
> [ 1206.515461] cc:=4
> 
> Fixes: e1aefcdd394fd ("usb typec: mt6360: Add support for mt6360 Type-C driver")
> Reported-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Cc: stable <stable@vger.kernel.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index f1bd9e0..8a952ea 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -15,6 +15,9 @@
>  
>  #include "tcpci.h"
>  
> +#define MT6360_REG_PHYCTRL1	0x80
> +#define MT6360_REG_PHYCTRL3	0x82
> +#define MT6360_REG_PHYCTRL7	0x86
>  #define MT6360_REG_VCONNCTRL1	0x8C
>  #define MT6360_REG_MODECTRL2	0x8F
>  #define MT6360_REG_SWRESET	0xA0
> @@ -22,6 +25,8 @@
>  #define MT6360_REG_DRPCTRL1	0xA2
>  #define MT6360_REG_DRPCTRL2	0xA3
>  #define MT6360_REG_I2CTORST	0xBF
> +#define MT6360_REG_PHYCTRL11	0xCA
> +#define MT6360_REG_RXCTRL1	0xCE
>  #define MT6360_REG_RXCTRL2	0xCF
>  #define MT6360_REG_CTDCTRL2	0xEC
>  
> @@ -106,6 +111,27 @@ static int mt6360_tcpc_init(struct tcpci *tcpci, struct tcpci_data *tdata)
>  	if (ret)
>  		return ret;
>  
> +	/* BMC PHY */
> +	ret = mt6360_tcpc_write16(regmap, MT6360_REG_PHYCTRL1, 0x3A70);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(regmap, MT6360_REG_PHYCTRL3,  0x82);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(regmap, MT6360_REG_PHYCTRL7, 0x36);
> +	if (ret)
> +		return ret;
> +
> +	ret = mt6360_tcpc_write16(regmap, MT6360_REG_PHYCTRL11, 0x3C60);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(regmap, MT6360_REG_RXCTRL1, 0xE8);
> +	if (ret)
> +		return ret;
> +
>  	/* Set shipping mode off, AUTOIDLE on */
>  	return regmap_write(regmap, MT6360_REG_MODECTRL2, 0x7A);
>  }
> -- 
> 2.7.4

-- 
heikki

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
