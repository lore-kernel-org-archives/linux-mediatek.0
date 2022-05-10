Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B25EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 10:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCUEKeAXFq99AnfTQezIqOw8fNuYVLd0KQm6mbz1+KQ=; b=TZ0+w/CQKb4FCv
	RE7irriKpAfm5MLIFytf21L/guZ/ubGLKts5uz7rqXGETcNGr2dB/KYwbXRKLnnazKcO43I5dNmYg
	sDmpl4WYUT9XyWn/bCVWZJJFFUkH4lB6A4npJluFhbC88RkQQUn893ti63KbRz/ndd8BTwPoxs9bI
	NjWcIbPHGvEYNJKrnQyD0YvD25dRg7yBySdZnxyX3HW5S3hcOSAN71fSOpvdGBMpxWPUL5sswbkPC
	GzdlbB3CaRIL230QCHwml+fbIqSAWWeL0h5eiP/JNxzNBEUsEy+arH1jT/3QbnV0e+d0RyQ7LfGu1
	KL1isBsA9NdnJhlcEKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noMtq-0017PN-4c; Tue, 10 May 2022 10:15:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noMtd-0017Kb-7d; Tue, 10 May 2022 10:15:15 +0000
X-UUID: 65915e6ec1dd4c3d82d3b06ac176c4e0-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:cf2b5249-c2a6-46f3-ad1b-9e4d72e307f6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:b7b345b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 65915e6ec1dd4c3d82d3b06ac176c4e0-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 373396902; Tue, 10 May 2022 03:15:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 03:05:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 18:05:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 May 2022 18:05:02 +0800
Message-ID: <2f88f72b957e73787686dfd131dac3a11a4c4341.camel@mediatek.com>
Subject: Re: [PATCH v2] usb: typec: tcpci_mt6360: Update for BMC PHY setting
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: cy_huang <u0084500@gmail.com>, <linux@roeck-us.net>,
 <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
 <matthias.bgg@gmail.com>
CC: <cy_huang@richtek.com>, <bryan_huang@richtek.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Fabien
 Parent" <fparent@baylibre.com>, stable <stable@vger.kernel.org>, Bear Wang
 <bear.wang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, Pablo Sun
 <pablo.sun@mediatek.com>
Date: Tue, 10 May 2022 18:05:02 +0800
In-Reply-To: <1652159580-30959-1-git-send-email-u0084500@gmail.com>
References: <1652159580-30959-1-git-send-email-u0084500@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_031513_328695_F0BE8B78 
X-CRM114-Status: GOOD (  19.35  )
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

On Tue, 2022-05-10 at 13:13 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Update MT6360 BMC PHY Tx/Rx setting for the compatibility.
> 
> Macpaul reported this CtoDP cable attention message cannot be
> received from
> MT6360 TCPC. But actually, attention message really sent from UFP_D
> device.
> 
> After RD's comment, there may be BMC PHY Tx/Rx setting causes this
> issue.
> 
> Below's the detailed TCPM log and DP attention message didn't
> received from 6360
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
> Fixes: e1aefcdd394fd ("usb typec: mt6360: Add support for mt6360
> Type-C driver")
> Reported-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Cc: stable <stable@vger.kernel.org>
> ---
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 26
> ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> b/drivers/usb/typec/tcpm/tcpci_mt6360.c
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
> @@ -106,6 +111,27 @@ static int mt6360_tcpc_init(struct tcpci *tcpci,
> struct tcpci_data *tdata)
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
> +	ret = mt6360_tcpc_write16(regmap, MT6360_REG_PHYCTRL11,
> 0x3C60);
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

Thanks for helping me to fix this issue.

Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>

Regards,
Macpaul Lin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
