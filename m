Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 03:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBKvcipHj6awW8l0htKqJ6ibXrAolg6duN869C/nrlk=; b=kfl7IWgz5udcGp
	heQ1qWKzHvuNVuOjCk7zM7vmG4nuIrQtLJFYDDgtSOIVUi8uiI6gz0bLXntHLTkbZkeaQdOYCg5b1
	V/+BXqS9peeAfQY7i76VddWBlg+Io7boBl/CEx6uU7blb4hFFJ3QZFufQSGKS+dxjMkHqmHfGnEjq
	er9LYLhvUPOCG7gQ1sQ263f6GjzIWfJfdeCr8F0AhxfHZbs/pgyOoLcdKDAsiIM7LCzCLTBfZufkt
	8sZKsA1LSOM+UHhV+Ak6CuvbsyK8O2Vw4y4svZUYo7KQW3tgx60jyCz6u3CXiw5xfy5oOyjpMSjZc
	rbFnmI+OlWsBAgWc3ocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noGfp-00HMJy-Gf; Tue, 10 May 2022 03:36:33 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noGff-00HMI8-1U; Tue, 10 May 2022 03:36:24 +0000
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-ed9a75c453so16875346fac.11; 
 Mon, 09 May 2022 20:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O5Zna85Vq8b8w5dS9maW5sjIe37UVYxBLIqtZ95PN3Y=;
 b=dCuWjV5mbmgA3Q2CNvAf2Xy5gjFs/KqhYBFyu5gMWB+vkyjE845Hpn3fseCLSHcYhZ
 xahV8FsrJXqWzjmPbdX2TzotT5XGds5iKOM8iXLIaJxj2uf5PgwA9Wd3jrRWwp3WBmYu
 yUJZ2M5BHx3RobC+qvbBSpxx+QByD0kJL1CWpk0/0JzUXOIsiyRdYa2N68dLJagVIMnb
 eR1f0aG6bPJrxm502fEmwv8Mpu/qteu8i/0tZJaSGi+8ah3o9M+Mq+Fb2Da462YixTpU
 muTsViJ9Xaw8uAmDB4R2zBU6uz3I3c21Ah5iLlFUoXpdqbnUmeM28VTN1W6IEpzjRHrA
 s5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O5Zna85Vq8b8w5dS9maW5sjIe37UVYxBLIqtZ95PN3Y=;
 b=Wr8+AK7jpy705r4629oZkHOI9fymaKJxyzHnArLEPWCvgifZgM9yJkhmdhJ+hddYL/
 15eteil5uqVo/CUr9BfcB0O/sWYEhTaSOXqqoDfgFaxXBO/WIKGqYomviWaqbScz/pqP
 SmuZ1qaD2JkOOOEUCEioBvEK+bn/KcaHCc3v8PuRlOyd81PNacVFHiHlv1glzVA9XK1D
 NA+LrscqKPoJ8aNutP9VL5+j0CEb6OpwYKtBxioOuRYk4PMFbfRa+kJ8L8vx96BLBVPI
 V8SDqzNXxhwFRiPY8ungHk0LkOjE7U4mx+0wD+DdLCxYzZB3ElJfnxxvUYpwe3gaegFW
 MLkA==
X-Gm-Message-State: AOAM530mY4GK1vTwnAeHvPhsnwAZrBqrfRGRzq3MFwbdOiDRmmyOXkxC
 JBMb1LJWQcXIypIuzlsX7iI=
X-Google-Smtp-Source: ABdhPJwLuC+HUAjgP+D9wIF1ftz0XxqbsHdsTkk2ngkkLpSv1crtEWzsMvopu0qSPAu+5F3yStYq3A==
X-Received: by 2002:a05:6871:887:b0:ed:4b3b:2bc4 with SMTP id
 r7-20020a056871088700b000ed4b3b2bc4mr12066047oaq.278.1652153781845; 
 Mon, 09 May 2022 20:36:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m33-20020a056870562100b000edf80be4ecsm4885091oao.58.2022.05.09.20.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 20:36:21 -0700 (PDT)
Message-ID: <514da5d6-9044-181f-bdd1-84b5b9abd346@roeck-us.net>
Date: Mon, 9 May 2022 20:36:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] usb: typec: tcpci_mt6360: Update for BMC PHY setting
Content-Language: en-US
To: cy_huang <u0084500@gmail.com>, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, matthias.bgg@gmail.com
Cc: cy_huang@richtek.com, bryan_huang@richtek.com, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
References: <1652147092-19255-1-git-send-email-u0084500@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <1652147092-19255-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_203623_135297_CF8791E4 
X-CRM114-Status: GOOD (  19.16  )
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

On 5/9/22 18:44, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Update MT6360 BMC PHY Tx/Rx setting for the compatibility.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Hi,
> 
> Recently, there's some USBPD MT6360 IOP issue from the user.
>>From our RD's comment, BMC PHY Tx/Rx setting need to be updated for
> the compatibility issue.

I think this needs to be a bit more detailed. What compatibility issue ?
Compatibility with what ?

Thanks,
Guenter

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
