Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60939C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eU1GKIUi20JaVgtCEhYz3Hg6hANi2xvCfClev65gYM=; b=J2TEIT//KMzhgW
	JLqSRtmUYPzVgATwPcsJUm82bU1/obE9JXHUrN9RG3yDXJUF9Xt/xKajybLyl4a0AZtEKuuE4DZYy
	npyfWC5gyDPuqsxOdKXGc7Yr0U9y9DrKrhPuP77b/uv/uAIbrWqksVbYIJwkcjK/oIFeCtgZnxmJ0
	N9dym9Gp9tEFUL0C7sf6B6E3uZr0apt1wX7Sk/lSJCwAK9X8arpkR5iSB4ihfZ8y3BT/qbUqW8Yym
	EndZih2D04ZNYkjmm/i0e/pZ/XSI01nlZ1DkvU9YrqlKcxE8aLoHyE3WyDf3K5RIia1V8l5KiGq1D
	BtjGS2Lg9X+jDL+T4JbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noQVF-002PzV-QU; Tue, 10 May 2022 14:06:17 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noQV3-002PtL-3E; Tue, 10 May 2022 14:06:06 +0000
Received: by mail-oi1-x231.google.com with SMTP id w123so8073605oiw.5;
 Tue, 10 May 2022 07:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eleg/nqVC9IPDcWOxwJF+He5L8eoNl0EU11xDJq3nMY=;
 b=Me0pcmytSTmx9JKHcssC0LoS4jX0maBApI3q98Nwb17mf3CsAAsntl2Yq17iZ/hHME
 uRySjErlNqr/tBaIqyi26AGhyQalfYvxbRvZyQaxOdv3im/3UAtuB4CYzLBwQXXnl0za
 CKe6lkXCnuIM4O0Pt0kCzaJM12D+hakE7SkqGAc1Oq8y13IOc1OafoHNIa8//0J+DdRF
 FdJLFnOfh8UFWSKBJsvrE4Ob0ixj8r/L60NaHUqUnSweVI6PG1ic3/tdqLihy+L8IQ1I
 DIXktpq5PXzcL8G6X9NziNdMO7Xkq1hKgqO7ci2EOUPo7iDfZHAe7iEsxHY6Q2JNK3VG
 wKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eleg/nqVC9IPDcWOxwJF+He5L8eoNl0EU11xDJq3nMY=;
 b=HzZVlNHjwqtn7sGe3TLrjMhMBl93som/rOyW3x5jzm1XmDqekcSGV4nibUZTRkzwoX
 10gqd+ZMMGdnbaS3/k2LPnBdubM5LCi/kLW7UmVp3IOiV5OOdWjUL4vti3g/9qkX6gXD
 6RBc3HGbo2PG03Cb4tojjT2UhQ6bvDXRX1RzsvvzdTbolaAa+So4UuSRTH3mVu4XFxeS
 m55O9APm9WfCAJKiAaG2IGCQQYVYYPh2ZJBEzEZ2pdlKB8dP03GDBc4kaYC6r+gDxUqg
 rel4qzh96WFTAwEPctAYwe0Yz265/wKztoMHqEzcngruN8jEWpAVJ6XnPnP0x8gKU9KG
 G+7A==
X-Gm-Message-State: AOAM5320Bfo29qN76OIikWrDevysAITSGMZMbWJVDSyV/FbfkJtDFJOP
 ke0BW7bSPqrlVAQsUXcg4aM=
X-Google-Smtp-Source: ABdhPJzXO2Z4zuueOlA/MUKFIwHtpuMgulmTw5+sB2m3ynIkNIKcY19lzmqqizXjIYboTMpC9r92lg==
X-Received: by 2002:a05:6808:2214:b0:326:4f5b:2f3c with SMTP id
 bd20-20020a056808221400b003264f5b2f3cmr93107oib.229.1652191562004; 
 Tue, 10 May 2022 07:06:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a4ab80f000000b0035eb4e5a6cdsm6038190oop.35.2022.05.10.07.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 07:06:01 -0700 (PDT)
Message-ID: <8bc3bc2b-28ac-4302-a07a-6aee173108dd@roeck-us.net>
Date: Tue, 10 May 2022 07:05:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] usb: typec: tcpci_mt6360: Update for BMC PHY setting
Content-Language: en-US
To: cy_huang <u0084500@gmail.com>, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, matthias.bgg@gmail.com
Cc: cy_huang@richtek.com, bryan_huang@richtek.com, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
References: <1652159580-30959-1-git-send-email-u0084500@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <1652159580-30959-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_070605_187466_1819DC3F 
X-CRM114-Status: GOOD (  18.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/9/22 22:13, cy_huang wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/tcpci_mt6360.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index f1bd9e0..8a952ea 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -15,6 +15,9 @@
>   
>   #include "tcpci.h"
>   
> +#define MT6360_REG_PHYCTRL1	0x80
> +#define MT6360_REG_PHYCTRL3	0x82
> +#define MT6360_REG_PHYCTRL7	0x86
>   #define MT6360_REG_VCONNCTRL1	0x8C
>   #define MT6360_REG_MODECTRL2	0x8F
>   #define MT6360_REG_SWRESET	0xA0
> @@ -22,6 +25,8 @@
>   #define MT6360_REG_DRPCTRL1	0xA2
>   #define MT6360_REG_DRPCTRL2	0xA3
>   #define MT6360_REG_I2CTORST	0xBF
> +#define MT6360_REG_PHYCTRL11	0xCA
> +#define MT6360_REG_RXCTRL1	0xCE
>   #define MT6360_REG_RXCTRL2	0xCF
>   #define MT6360_REG_CTDCTRL2	0xEC
>   
> @@ -106,6 +111,27 @@ static int mt6360_tcpc_init(struct tcpci *tcpci, struct tcpci_data *tdata)
>   	if (ret)
>   		return ret;
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
>   	/* Set shipping mode off, AUTOIDLE on */
>   	return regmap_write(regmap, MT6360_REG_MODECTRL2, 0x7A);
>   }


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
